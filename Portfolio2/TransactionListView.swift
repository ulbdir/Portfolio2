//
//  TransactionListView.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 22.07.22.
//

import SwiftUI

struct TransactionListView: View {
    
    @EnvironmentObject var model: Model
    @State var showSheetView = false
    @State var newTx: Transaction = Transaction()
    
    private func backgroundColor(tx: Transaction) -> Color {
        switch (tx.type) {
        case .Buy:
            return Color.buyColor
        case .Sell:
            return Color.sellColor
        case .Deposit:
            return Color.depositColor
        case .Withdraw:
            return Color.withdrawColor
        }
    }
    
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(model.transactionGroups) { section in
                    Section(header: Text(section.title)) {
                        ForEach(section.transactions) { tx in
                            Button(action: {
                                    newTx = tx
                                    showSheetView = true
                                    
                            }, label: {
                                TransactionCardView(idx: model.transactions.firstIndex(of: tx)!)
                            })
                            .listRowBackground(backgroundColor(tx: tx))
                            .buttonStyle(.plain)
                        }
                    }
                }
            }.listStyle(.grouped)
            .navigationTitle("Transactions")
            .navigationBarItems(trailing: Button(action: {
                newTx = Transaction()
                showSheetView = true
            }) {
                Image(systemName: "plus")
            }
            )
            .sheet(isPresented: $showSheetView) {
                NavigationStack {
                    TransactionDetailView(tx: $newTx)
                    .navigationTitle("New Transaction")
                    .toolbar {
                        ToolbarItemGroup(placement: .confirmationAction) {
                            Button("Save") {
                                showSheetView = false
                                
                                let idx: Int? = model.transactions.firstIndex(where: { tx in tx.id == newTx.id })
                                if (idx != nil) {
                                    model.transactions[idx!] = newTx
                                } else {
                                    model.transactions.append(newTx)
                                }
                            }
                        }
                        ToolbarItemGroup(placement: .cancellationAction) {
                            Button("Cancel") {
                                showSheetView = false
                            }
                        }
                    }
                }
            }
        }
        
    }
    
    private func binding(for tx: Transaction) -> Binding<Transaction> {
        guard let idx = model.transactions.firstIndex(of: tx) else {
            fatalError("Can't find tx in array")
        }
        return $model.transactions[idx]
    }
}

struct TransactionListView_Previews: PreviewProvider {
    @StateObject static var model: Model = PreviewModel.get()
    static var previews: some View {
        TransactionListView().environmentObject(model)
    }
}
