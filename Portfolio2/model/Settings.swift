//
//  Settings.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 15.07.22.
//

import Foundation

enum AccountingMethod: String, CaseIterable {
    case LIFO = "LIFO"
    case FIFO = "FIFO"
    case HighCostFirst = "Highest cost first"
    case LowCostFirst = "Lowest cost first"
}

class Settings: ObservableObject, Hashable {
    @Published var accountCurrency: Currency = Currency(name: "USD", symbol: "$")
    @Published var accountingMethod: AccountingMethod = .LowCostFirst

    static func == (lhs: Settings, rhs: Settings) -> Bool {
        lhs.accountCurrency == rhs.accountCurrency
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(accountCurrency)
    }
}
