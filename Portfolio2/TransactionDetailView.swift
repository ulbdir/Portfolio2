//
//  TransactionView.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 16.07.22.
//

import SwiftUI

struct TransactionDetailView: View {
    
    @EnvironmentObject var model: Model
    @Binding var tx: Transaction
       
    var body: some View {
        VStack {
            Grid {
                GridRow {
                    Picker("Transaction Type", selection: $tx.type) {
                        ForEach(TransactionType.allCases, id: \.self) { value in
                            Text(value.rawValue).tag(value)
                        }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .gridCellColumns(3)
                    .gridColumnAlignment(.trailing)
                }
                GridRow {
                    Text("Asset")
                        .gridColumnAlignment(.trailing)
                    Text("Bitcoin")
                        .gridColumnAlignment(.trailing)
                }
                GridRow {
                    Text("Amount")
                    DecimalInput(value: $tx.amount)
                }
                GridRow {
                    Text("Price")
                    DecimalInput(value: $tx.pricePerAsset)
                        .disabled(tx.type == .Deposit || tx.type == .Withdraw)
                    CurrencyPicker(currency: $tx.currency, model: model)
                        .gridColumnAlignment(.trailing)
                }
                GridRow {
                    Text("Fee")
                    DecimalInput(value: $tx.fee)
                    CurrencyPicker(currency: $tx.feeCurrency, model: model)
                }
                GridRow {
                    Text("Total cost").foregroundColor(.gray)
                    Text("500").foregroundColor(.gray)
                    CurrencyPicker(currency: $tx.currency, model: model)
                        .disabled(true)
                    
                }
                Divider()
                GridRow {
                    Text("Date")
                    DatePicker(selection: $tx.date, in: ...Date(), displayedComponents: [.date, .hourAndMinute]) {
                    }
                    .gridCellColumns(2)
                }
                Divider()
                GridRow {
                    Text("Source")
                    TextField("", text: $tx.source)
                        .multilineTextAlignment(.trailing)
                        .textFieldStyle(.roundedBorder)
                        .gridCellColumns(2)
                }
                
            }
            Spacer()
            .padding()
        }
    }
}

struct TransactionView_Previews: PreviewProvider {
    
    @StateObject static var model: Model = Model()
    @State static var tx: Transaction = Transaction()
    
    static var previews: some View {

        TransactionDetailView(tx: $tx).environmentObject(model)
    }
}

