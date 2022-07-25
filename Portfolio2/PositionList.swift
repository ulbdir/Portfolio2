//
//  PositionList.swift
//  Portfolio2
//
//  Created by Dirk Ulbricht on 21.07.22.
//

import SwiftUI

struct PositionList: View {
    @EnvironmentObject var model: Model
    
    var body: some View {
        List(model.positions.sorted(by: { a, b in
            a.asset.name > b.asset.name
        }), id: \.self) { pos in
            VStack {
                HStack {
                    Text(pos.asset.name)
                    Spacer()
                    Text(pos.amount.formatted())
                }
            }
        }
    }
}

struct PositionList_Previews: PreviewProvider {

    @State static var model: Model = PreviewModel.get()

    static var previews: some View {
        PositionList().environmentObject(model)
    }
}
