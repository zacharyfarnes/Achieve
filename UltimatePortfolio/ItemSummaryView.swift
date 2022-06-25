//
//  ItemSummaryView.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 24/06/2022.
//

import SwiftUI

struct ItemSummaryView: View {
    @ObservedObject var item: Item
    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            HStack(spacing: 20) {
                Circle()
                    .stroke(Color(item.project?.projectColor ?? "Light Blue"), lineWidth: 3)
                    .frame(width: 44, height: 44)
                
                VStack(alignment: .leading) {
                    Text(item.itemTitle)
                        .font(.title2)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    if item.itemDetail.isEmpty == false {
                        Text(item.itemDetail)
                            .foregroundColor(.secondary)
                    }
                }
            }
            .padding()
            .background(Color.secondarySystemGroupedBackground)
            .cornerRadius(10)
            .shadow(color: Color.black.opacity(0.2), radius: 5)
        }
    }
}

struct ItemSummaryView_Previews: PreviewProvider {
    static var previews: some View {
        ItemSummaryView(item: Item.example)
    }
}
