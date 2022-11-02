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

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0027, price: 18361, fees: 0.031, txdate: "2022-10-13"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0025, price: 19434, fees: 0.031, txdate: "2022-10-10"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0025, price: 19256, fees: 0.03, txdate: "2022-09-26"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0027, price: 18432, fees: 0.031, txdate: "2022-09-19"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0052, price: 18991, fees: 0.062, txdate: "2022-09-06"))
        
        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0047, price: 21177, fees: 0.063, txdate: "2022-08-20"))
        
        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0042, price: 23716, fees: 0.063, txdate: "2022-07-31"))
        
        model.transactions.append(sellOrder(asset: Asset(), amount: 0.0121, price: 21486, fees: 0.164, txdate: "2022-07-18"))
        
        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0025, price: 19861, fees: 0.031, txdate: "2022-07-12"))
        
        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0023, price: 21601, fees: 00.031, txdate: "2022-07-07"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0026, price: 19056, fees: 0.031, txdate: "2022-07-03"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0026, price: 18940, fees: 0.031, txdate: "2022-06-19"))

        model.transactions.append(buyOrder(asset: Asset(), amount: 0.0021, price: 22770, fees: 0.03, txdate: "2022-06-14"))

        return model
    }

    static private func buyOrder(asset: Asset, amount: Double, price: Double, fees: Double, txdate: String) -> Transaction {

        let formatter = ISO8601DateFormatter()
        
        var tx = Transaction()
        tx.type = .Buy
        tx.asset = asset
        tx.amount = amount
        tx.pricePerAsset = price
        tx.fee = fees
        tx.date = formatter.date(from: txdate+"T10:44:00+0000")!
        tx.source = "FTX"
        return tx
    }

    static private func sellOrder(asset: Asset, amount: Double, price: Double, fees: Double, txdate: String) -> Transaction {

        let formatter = ISO8601DateFormatter()
        
        var tx = Transaction()
        tx.type = .Sell
        tx.asset = asset
        tx.amount = amount
        tx.pricePerAsset = price
        tx.fee = fees
        tx.date = formatter.date(from: txdate+"T10:44:00+0000")!
        tx.source = "FTX"
        return tx
    }
    
}
