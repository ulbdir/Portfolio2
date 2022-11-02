//
//  TransactionList.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 20.07.22.
//

import SwiftUI

struct TransactionCardView: View {
    
    @EnvironmentObject var model: Model
    let idx: Int
    
    var body: some View {
        Group {
            VStack {
                HStack {
                    Text(model.transactions[idx].type.rawValue).font(.headline)
                    Text(model.transactions[idx].amount.formatted()).font(.headline)
                    Text(model.transactions[idx].asset.name).font(.headline)
                    Spacer()
                    Text((model.transactions[idx].pricePerAsset*model.transactions[idx].amount).formatted(.number.precision(.fractionLength(2)))).font(.headline)
                    Text(model.transactions[idx].currency.name).font(.headline)
                }
                HStack {
                    Text(model.transactions[idx].date.formatted(date: .abbreviated, time: .omitted)).font(.subheadline)
                    Spacer()
                    Text(model.transactions[idx].source).font(.subheadline)
                }
            }
        }
    }
}


struct TransactionList_Previews: PreviewProvider {
    
    @StateObject static var model: Model = PreviewModel.get()
    
    static var previews: some View {
        TransactionCardView(idx: 0).environmentObject(model)
    }
}
