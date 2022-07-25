//
//  CurrencyPicker.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 17.07.22.
//

import SwiftUI

struct CurrencyPicker: View {
    
    @Binding var currency: Currency
    @ObservedObject var model: Model
    
    var body: some View {
        Picker(selection: $currency, label: Text("Currency")) {
            ForEach(model.availableCurrencies.indices, id: \.self) { index in
                Text(model.availableCurrencies[index].name).tag(model.availableCurrencies[index])
            }
        }
    }
}

struct CurrencyPicker_Previews: PreviewProvider {
    @State static var model: Model = Model()
    @State static var currency: Currency = Currency()
    
    static var previews: some View {
        CurrencyPicker( currency: $currency, model: model)
    }
}
