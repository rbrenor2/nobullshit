import SwiftUI
import SwiftUISnackbar

struct CreateBlockoutView: View {
//    @StateObject private var observed: Observed = Observed()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var appState: AppState
    @StateObject var vm: CreateBlockoutViewModel
    
    var body: some View {
        VStack(alignment: .center, spacing: 5, content: {
            ScrollView {
                VStack(alignment: .center, spacing: 10, content: {
                    HStack(alignment: .center, spacing: 10, content: {
                        Text("Name")
                            .bold()
                        TextField("My Workout", text: $vm.name)
                        Button(action: {
                            vm.name = vm.generateRandomWorkoutName()
                        }, label: {
                            Image(systemName: "rectangle.and.pencil.and.ellipsis.rtl")
                                .foregroundColor(.white)
                        })
                    }).padding()
                        .overlay(RoundedRectangle(cornerRadius: 16).stroke(.red, lineWidth: 1))
                    VStack(alignment: .center, spacing: 20, content: {
                        if(vm.blocks.count == 0) {
                            Text("Tap the + button to add a block")
                                .foregroundColor(.gray)
                        } else {
                            ForEach($vm.blocks, id: \.id) { block in
                                ZStack(alignment: .center, content: {
                                    BlockEditCard(block: block, onClose: {
                                        vm.removeBlock(id: block.id!);
                                    })
                                })
                            }    
                        }
                        ScrollView(.horizontal, showsIndicators: false, content: {
                            HStack(alignment: .center, spacing: 3, content: {
                                AddBlockButton(type: .AMRAP) {
                                    vm.addBlock(.AMRAP)
                                }
                                AddBlockButton(type: .EMOM) {
                                    vm.addBlock(.EMOM)
                                }
                                AddBlockButton(type: .FORTIME) {
                                    vm.addBlock(.FORTIME)
                                }
                                AddBlockButton(type: .TABATA) {
                                    vm.addBlock(.TABATA)
                                }
                            })
                        })
                    }).padding(.all)
                    .cornerRadius(20, antialiased: true)
                }).navigationTitle("New Workout")
                    .padding(.all)
            }
        }).toolbar(content: {
            Button("Save") {
                vm.createBlockout()
                DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                    presentationMode.wrappedValue.dismiss()
                }
            }
        }).snackbar(isShowing: $vm.showSnackbar, title: vm.snackbarTitle, text: vm.snackbarText, style: .custom(.blue))
    }
}

#Preview {
    CreateBlockoutView(vm: CreateBlockoutViewModel())
}
