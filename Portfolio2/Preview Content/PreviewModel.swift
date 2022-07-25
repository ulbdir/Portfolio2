//
//  PreviewModel.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 20.07.22.
//

import Foundation

struct PreviewModel {
    static func get() -> Model {
        let model: Model = Model()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd HH:mm"
        
        var tx: Transaction = Transaction()
        tx.asset = Asset(name: "Bitcoin")
        tx.pricePerAsset = 19861
        tx.amount = 0.0025
        tx.source = "FTX"
        tx.date = formatter.date(from: "2022/07/12 00:00")!
                
        model.transactions.append(tx)

        tx = Transaction()
        tx.pricePerAsset = 21601
        tx.amount = 0.0023
        tx.date = formatter.date(from: "2022/07/07 00:00")!
        tx.source = "Binance"

        model.transactions.append(tx)
        
        tx = Transaction()
        tx.type = .Sell
        tx.pricePerAsset = 23892
        tx.amount = 0.004
        tx.date = formatter.date(from: "2022/07/20 00:00")!
        tx.source = "Kraken"

        model.transactions.append(tx)
        
        return model
    }
}
