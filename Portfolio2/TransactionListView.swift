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
    
    var body: some View {
        NavigationStack {
            List(model.transactions.sorted(by: { a, b in
                a.date > b.date
            })) { tx in
                Button(action: {
                        newTx = tx
                        showSheetView = true
                        
                } ) {
                    TransactionCardView(idx: model.transactions.firstIndex(of: tx)!)
                }.buttonStyle(.plain)
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets(top: 3, leading: 0, bottom: 3, trailing: 0))
                    .listRowBackground(Color.clear)
            }
            
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
