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
                    Text(model.transactions[idx].date.formatted()).font(.caption)
                    Spacer()
                    Text(model.transactions[idx].source).font(.caption)
                }.padding(EdgeInsets(top: 0, leading: 0, bottom: 1, trailing: 0))
                HStack {
                    Text(model.transactions[idx].type.rawValue).font(.callout)
                    Text(model.transactions[idx].amount.formatted()).font(.callout)
                    Text(model.transactions[idx].asset.name).font(.callout)
                    Spacer()
                    Text(model.transactions[idx].pricePerAsset.formatted()).font(.callout)
                    Text(model.transactions[idx].currency.name).font(.callout)
                }
            }.padding(EdgeInsets(top: 5, leading: 10, bottom: 5, trailing: 10))
        }.background(model.transactions[idx].type == .Sell ? Color(UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)) :
                        model.transactions[idx].type == .Buy ? Color(UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)) :
                        Color(UIColor(red: 0, green: 0, blue: 1, alpha: 0.2)))
        .cornerRadius(15)
    }
}


struct TransactionList_Previews: PreviewProvider {
    
    @StateObject static var model: Model = PreviewModel.get()
    
    static var previews: some View {
        TransactionCardView(idx: 0).environmentObject(model)
    }
}
