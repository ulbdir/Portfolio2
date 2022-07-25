//
//  ContentView.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 13.07.22.
//

import SwiftUI

struct ContentView: View {

    @StateObject var model = PreviewModel.get()
    
    var body: some View {
        TabView {
            PortfolioView()
                .badge(2)
                .tabItem {
                    Label("Portfolio", systemImage: "chart.pie.fill")
                }
            TransactionListView()
                .tabItem {
                    Label("Transactions", systemImage: "arrow.up.arrow.down.square.fill")
                }
            SettingsView()
                .tabItem {
                    Label("Settings", systemImage: "gearshape.fill")
                }
        }
        .environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
