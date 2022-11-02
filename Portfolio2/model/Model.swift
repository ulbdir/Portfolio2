//
//  Model.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 15.07.22.
//

import Foundation
import SwiftUI

class Model: ObservableObject {
    @Published var settings: Settings = Settings()
    @Published var availableCurrencies: [Currency] = [Currency(name: "USD", symbol: "$"), Currency(name: "EUR", symbol: "€")]
    @Published var transactions: [Transaction] = [] {
        didSet {
            print("Transactions changed")
            
            for tx in transactions {
                print(tx.type.rawValue)
            }
            
            self.positions = Position.computeFromTransactions(transactions: self.transactions)
            
            self.transactionGroups = TransactionGroup.computeTransactionGroups(transactions: self.transactions, groupBy: .Week)
        }
    }
    
    @Published var transactionGroups: [TransactionGroup] = []
    @Published var positions: [Position] = []
}

