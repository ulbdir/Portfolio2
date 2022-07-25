//
//  Currency.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 15.07.22.
//

import Foundation

class Currency: ObservableObject, Hashable {
    var name: String = "USD"
    var symbol: String = "$"
    
    init(name: String, symbol: String) {
        self.name = name
        self.symbol = symbol
    }
    
    convenience init(src: Currency) {
        self.init(name: src.name, symbol: src.symbol)
    }
    
    convenience init() {
        self.init(name: "USD", symbol: "$")
    }
    
    static func == (lhs: Currency, rhs: Currency) -> Bool {
        lhs.name == rhs.name && lhs.symbol==rhs.symbol
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
        hasher.combine(symbol)
    }
}
