//
//  AuthService.swift
//  br2-ios-base
//
//  Created by Breno R R on 20/05/2024.
//

import FirebaseAuth
import Combine

enum AuthType {
    case EmailPassword
    case Google
    case Apple
}

@MainActor
class AuthViewModel: ObservableObject {
    var appState: AppState
    
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var isLoginButtonDisabled: Bool = true
    
    private var cancellables = Set<AnyCancellable>()
    private var authStateHandler: AuthStateDidChangeListenerHandle?
    
    init(appState: AppState) {
        self.appState = appState
        registerAuthStateHandler()
        setupBindings()
    }
    
    func registerAuthStateHandler() {
        if(authStateHandler == nil) {
            authStateHandler = Auth.auth().addStateDidChangeListener({ auth, user in
                if user != nil {
                    self.appState.user = user
                    self.appState.isLoggedIn = true
                }
            })
        }
    }

    func login(type: AuthType) {
        print("Login called")
        appState.isLoading = true
    
        if(type == AuthType.EmailPassword) {
            AuthService.shared.loginWithEmailAndPassword(email: email, password: password)
                .receive(on: DispatchQueue.main)
                .sink { [weak self] completion in
                    switch completion {
                    case .finished:
                        break
                    case .failure(let error):
                        self?.appState.isLoading = false
                        // Handle error
                        print("Login failed: \(error.localizedDescription)")
                    }
                } receiveValue: { [weak self] user in
                    self?.appState.user = user
                    self?.appState.isLoggedIn = true
                    self?.appState.isLoading = false
                }
                .store(in: &cancellables)
        }
    }
    
    func register(type: AuthType, email: String?, password: String?) {
        appState.isLoading = true
    }
        
    private func setupBindings() {
        Publishers.CombineLatest($email, $password)
            .map { [weak self] email, password in
                return !(self?.isValidEmail(email) ?? false) || password.isEmpty
            }
            .assign(to: \.isLoginButtonDisabled, on: self)
            .store(in: &cancellables)
    }

    private func isValidEmail(_ email: String) -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPredicate = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPredicate.evaluate(with: email)
    }
}

