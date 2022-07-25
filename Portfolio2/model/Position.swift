//
//  Position.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 21.07.22.
//

import Foundation

class Position: Hashable {
    
    @Published var asset: Asset = Asset()
    @Published var amount: Double = 0
    
    @Published var transactions: [Transaction] = []
    
    static func == (lhs: Position, rhs: Position) -> Bool {
        lhs.asset == rhs.asset &&
        lhs.amount == rhs.amount
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(asset)
        hasher.combine(amount)
    }
    
    static func computeFromTransactions(transactions: [Transaction]) -> [Position] {
        var result: [Position] = []
        
        // loop through all transactions and aggregate positions
        for tx in transactions {
            
            if let pos = result.first(where: {$0.asset == tx.asset}) {
                // Add to existing asset
                pos.transactions.append(tx)
                switch (tx.type) {
                    case .Buy, .Deposit:
                        pos.amount += tx.amount
                    case .Sell, .Withdraw:
                        pos.amount -= tx.amount
                }
            } else {
                // Create a new asset
                let pos:Position = Position()
                pos.transactions.append(tx)
                result.append(pos)
                switch (tx.type) {
                    case .Buy, .Deposit:
                        pos.amount += tx.amount
                    case .Sell, .Withdraw:
                        pos.amount -= tx.amount
                }
            }
        }
        
        // Remove all assets that have no transactions
        result.removeAll(where: { $0.transactions.isEmpty })
       
        return result
    }
}
