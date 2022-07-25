//
//  Asset.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 15.07.22.
//

import Foundation

class Asset: Hashable {

    @Published var name: String = "empty"
    
    init(name: String) {
        self.name = name
    }
    
    convenience init() {
        self.init(name: "Bitcoin")
    }
    
    static func == (lhs: Asset, rhs: Asset) -> Bool {
        lhs.name == rhs.name
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(name)
    }

}
