//
//  PortfolioView.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 22.07.22.
//

import SwiftUI

struct PortfolioView: View {
    var body: some View {
        NavigationStack {
            PositionList()
                .navigationTitle("Portfolio")
        }
    }
}

struct PortfolioView_Previews: PreviewProvider {
    @State static var model: Model = PreviewModel.get()
    
    static var previews: some View {
        PortfolioView().environmentObject(model)
    }
}
