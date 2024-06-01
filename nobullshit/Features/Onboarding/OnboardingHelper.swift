//
//  OnboardingHelper.swift
//  br2-ios-base
//
//  Created by Breno R R on 28/05/2024.
//

import UIKit
import UIOnboarding

struct UIOnboardingHelper {
    static func setUpIcon() -> UIImage {
        return Bundle.main.appIcon ?? .init(named: "icon-final")!
    }
    
    // First Title Line
    // Welcome Text
    static func setUpFirstTitleLine() -> NSMutableAttributedString {
        .init(string: OnboardingInfo.title.rawValue, attributes: [.foregroundColor: UIColor.label])
    }
    
    // Second Title Line
    // App Name
    static func setUpSecondTitleLine() -> NSMutableAttributedString {
        .init(string: Bundle.main.displayName ?? OnboardingInfo.appName.rawValue, attributes: [
            .foregroundColor: UIColor.init(named: "camou") ?? UIColor.init(red: 0.654, green: 0.618, blue: 0.494, alpha: 1.0)
        ])
    }

    static func setUpFeatures() -> Array<UIOnboardingFeature> {
        return .init([
            .init(icon: .init(named: OnboardingInfo.iconFeature1.rawValue)!,
                  title: OnboardingInfo.titleFeature1.rawValue,
                  description: OnboardingInfo.descriptionFeature1.rawValue),
            .init(icon: .init(named: OnboardingInfo.iconFeature2.rawValue)!,
                  title: OnboardingInfo.titleFeature2.rawValue ,
                  description: OnboardingInfo.descriptionFeature2.rawValue),
            .init(icon: .init(named: OnboardingInfo.iconFeature3.rawValue)!,
                  title: OnboardingInfo.titleFeature3.rawValue,
                  description: OnboardingInfo.descriptionFeature3.rawValue)
        ])
    }
    
    static func setUpNotice() -> UIOnboardingTextViewConfiguration {
        return .init(icon: .init(named: OnboardingInfo.iconNotice.rawValue),
                     text: OnboardingInfo.textNotice.rawValue,
                     linkTitle: OnboardingInfo.linkTitleNotice.rawValue,
                     link: OnboardingInfo.linkNotice.rawValue,
                     tint: .init(named: "camou") ?? .init(red: 0.654, green: 0.618, blue: 0.494, alpha: 1.0))
    }
    
    static func setUpButton() -> UIOnboardingButtonConfiguration {
        return .init(title: "Continue",
                     backgroundColor: .init(named: "camou") ?? .init(red: 0.654, green: 0.618, blue: 0.494, alpha: 1-0))
    }
}

extension UIOnboardingViewConfiguration {
    static func setUp() -> UIOnboardingViewConfiguration {
        return .init(appIcon: UIOnboardingHelper.setUpIcon(),
                     firstTitleLine: UIOnboardingHelper.setUpFirstTitleLine(),
                     secondTitleLine: UIOnboardingHelper.setUpSecondTitleLine(),
                     features: UIOnboardingHelper.setUpFeatures(),
                     textViewConfiguration: UIOnboardingHelper.setUpNotice(),
                     buttonConfiguration: UIOnboardingHelper.setUpButton())
    }
}
