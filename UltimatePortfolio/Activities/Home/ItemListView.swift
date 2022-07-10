//
//  ItemListView.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 24/06/2022.
//

import SwiftUI

struct ItemListView: View {
    let title: LocalizedStringKey
    let items: ArraySlice<Item>

    var body: some View {
        if items.isEmpty {
            EmptyView()
        } else {
            Text(title)
                .font(.headline)
                .foregroundColor(.secondary)
                .padding(.top)

            ForEach(items, content: ItemSummaryView.init)
        }
    }
}
