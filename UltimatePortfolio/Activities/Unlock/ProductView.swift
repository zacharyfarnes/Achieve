//
//  ProductView.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 14/07/2022.
//

import StoreKit
import SwiftUI

struct ProductView: View {
    @EnvironmentObject var unlockManager: UnlockManager
    let product: SKProduct

    var body: some View {
        ScrollView {
            VStack(spacing: 25) {
                Label("Get Unlimited Projects", systemImage: "lock")
                    .font(.headline)
                    .padding(.top, 10)

                VStack(alignment: .leading, spacing: 10) {
                    // swiftlint:disable:next line_length
                    Text("You can add three projects for free, or pay \(product.localizedPrice) to add unlimited projects.")
                    Text("If you already bought the unlock on another device, press Restore Purchases.")
                        .font(.caption)
                        .foregroundColor(.secondary)
                }

                VStack(spacing: 10) {
                    Button("Buy: \(product.localizedPrice)", action: unlock)
                        .buttonStyle(PurchaseButton())
                    Button("Restore Purchases", action: unlockManager.restore)
                        .buttonStyle(PurchaseButton())
                }
            }
        }
    }

    func unlock() {
        unlockManager.buy(product: product)
    }
}
