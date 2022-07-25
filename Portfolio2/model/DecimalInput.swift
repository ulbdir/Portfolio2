//
//  DecimalInput.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 17.07.22.
//

import SwiftUI
import Combine

struct DecimalInput: View {
    
    @Binding var value: Double
    
    var body: some View {
        TextField(value: $value, format: .number) {
            Text("0")
        }
        .keyboardType(.numbersAndPunctuation)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
    }
}

struct DecimalInput_Previews: PreviewProvider {
    @State static var num: Double = 1.04
    static var previews: some View {
        DecimalInput(value: $num)
    }
}
