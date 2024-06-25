//
//  OnboardingText.swift
//  br2-ios-base
//
//  Created by Breno R R on 28/05/2024.
//

import Foundation

enum OnboardingInfo: String {
    case title = "Welcome to"
    case appName = "Blockouts"
    // Feature 1
    case iconFeature1 = "feature-1"
    case titleFeature1 = "Your workout in Blocks"
    case descriptionFeature1 = "Different timers to guide your HIIT workout"
    
    // Feature 2
    case iconFeature2 = "feature-2"
    case titleFeature2 = "Create a Blockout"
    case descriptionFeature2 = "Mix different timers and create your own Blockout"
    
    // Feature 3
    case iconFeature3 = "feature-3"
    case titleFeature3 = "Share and compare results"
    case descriptionFeature3 = "Share and challenge your friends with your own Blockouts"
    
    // Setup notice
    case iconNotice = "onboarding-notice-icon"
    case textNotice = "Designed with Love"
    case linkTitleNotice = "Leave"
    case linkNotice = "3"
}
