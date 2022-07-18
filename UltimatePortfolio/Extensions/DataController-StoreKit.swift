//
//  DataController-StoreKit.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 18/07/2022.
//

import StoreKit
import Foundation

extension DataController {
    func appLaunched() {
        guard count(for: Project.fetchRequest()) >= 5 else { return }

        let allScenes = UIApplication.shared.connectedScenes
        let scene = allScenes.first { $0.activationState == .foregroundActive }

        if let windowScene = scene as? UIWindowScene {
            SKStoreReviewController.requestReview(in: windowScene)
        }
    }
}
