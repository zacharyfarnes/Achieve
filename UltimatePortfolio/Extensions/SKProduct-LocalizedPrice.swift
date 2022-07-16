//
//  SKProduct-LocalizedPrice.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 14/07/2022.
//

import StoreKit

extension SKProduct {
    var localizedPrice: String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = priceLocale
        return formatter.string(from: price)!
    }
}
