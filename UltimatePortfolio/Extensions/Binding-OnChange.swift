//
//  Binding-OnChange.swift
//  UltimatePortfolio
//
//  Created by Zachary Farnes on 10/05/2022.
//

import SwiftUI

extension Binding {
    func onChange(_ handler: @escaping () -> Void) -> Binding<Value> {
        Binding(
            get: { self.wrappedValue },
            set: { newValue in
                self.wrappedValue = newValue
                handler()
            }
        )
    }
}
