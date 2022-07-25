//
//  SettingsView.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 14.07.22.
//

import SwiftUI

struct SettingsView: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Account")) {
                    Picker(selection: $model.settings.accountCurrency, label: Text("Account Currency")) {
                        ForEach(model.availableCurrencies.indices, id: \.self) { index in
                            Text(model.availableCurrencies[index].name).tag(model.availableCurrencies[index])
                        }
                    }
                    Picker(selection: $model.settings.accountingMethod, label: Text("Accounting Method")) {
                        ForEach(AccountingMethod.allCases, id: \.self) { value in
                            Text(value.rawValue).tag(value)
                        }
                    }
                    
                }
                Section(header: Text("Import from exchanges")) {
                    Button("FTX") {
                        
                    }
                    
                    Button("Add Account") {
                        
                    }
                    Button("Import now") {
                        
                    }
                }
            }
            .navigationTitle("Settings")
        }
    }
}

struct SettingsView_Previews: PreviewProvider {

    @StateObject static var model: Model = Model()
    
    static var previews: some View {
        SettingsView().environmentObject(model)
    }
}
