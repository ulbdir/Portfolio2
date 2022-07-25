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
        VStack {
            HStack {
                Text(model.transactions[idx].date.formatted()).font(.callout)
                Spacer()
                Text(model.transactions[idx].source).font(.callout)
            }
            HStack {
                Spacer()
                Text(model.transactions[idx].type.rawValue).font(.callout)
                    .background(
                        model.transactions[idx].type == .Sell ? Color(UIColor(red: 1, green: 0, blue: 0, alpha: 0.2)) :
                            model.transactions[idx].type == .Buy ? Color(UIColor(red: 0, green: 1, blue: 0, alpha: 0.2)) :
                            Color(UIColor(red: 0, green: 0, blue: 1, alpha: 0.2))
                        , in: RoundedRectangle(cornerRadius: 4))
                Text(model.transactions[idx].amount.formatted()).font(.callout).bold()
                Text(model.transactions[idx].asset.name).font(.callout)
                Text("@").font(.callout)
                Text(model.transactions[idx].pricePerAsset.formatted()).font(.callout).bold()
                Text(model.transactions[idx].currency.name).font(.callout)
            }
            HStack {
                Spacer()
                Text("Cost").font(.callout)
                Text((model.transactions[idx].amount*model.transactions[idx].pricePerAsset).formatted()).font(.callout)
                Text(model.transactions[idx].currency.name).font(.callout)
                Text("+12.04").font(.callout)
                Text("+3.54%").font(.callout)
            }
        }
        
    }
}


struct TransactionList_Previews: PreviewProvider {
    
    @StateObject static var model: Model = PreviewModel.get()
    
    static var previews: some View {
        TransactionCardView(idx: 0)
    }
}
