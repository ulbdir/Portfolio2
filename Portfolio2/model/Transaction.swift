//
//  Transaction.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 15.07.22.
//

import Foundation

enum TransactionType: String, CaseIterable {
    case Buy
    case Sell
    case Deposit
    case Withdraw
}

struct Transaction: Identifiable, Hashable, Equatable {
    var id: String = UUID().uuidString
    var type: TransactionType = .Buy
    
    var asset: Asset = Asset()
    var amount: Double = 0
    var currency: Currency = Currency()
    var pricePerAsset: Double = 0
    
    var fee: Double = 0
    var feeCurrency: Currency = Currency()
    
    var date: Date = Date()
    
    var source: String = ""
    
    init() {
        
    }
    
    init(src: Transaction) {
        id = src.id
        type = src.type
        asset = src.asset
        amount = src.amount
        currency = src.currency
        pricePerAsset = src.pricePerAsset
        fee = src.fee
        feeCurrency = src.feeCurrency
        date = src.date
        source = src.source
    }

    /*
    static func == (lhs: Transaction, rhs: Transaction) -> Bool {
        lhs.type == rhs.type &&
        lhs.asset == rhs.asset &&
        lhs.amount == rhs.amount &&
        lhs.currency == rhs.currency &&
        lhs.pricePerAsset == rhs.pricePerAsset &&
        lhs.fee == rhs.fee &&
        lhs.feeCurrency == rhs.feeCurrency &&
        lhs.date == rhs.date &&
        lhs.source == rhs.source
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(type)
        hasher.combine(asset)
        hasher.combine(amount)
        hasher.combine(currency)
        hasher.combine(pricePerAsset)
        hasher.combine(fee)
        hasher.combine(feeCurrency)
        hasher.combine(date)
        hasher.combine(source)
    }
*/
}
