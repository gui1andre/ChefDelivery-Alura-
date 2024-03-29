//
//  OrderTypeGridView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct OrderTypeGridView: View {
    
    var gridLayout: [GridItem]{
        return Array(repeating: GridItem(.flexible(), spacing: 10), count: 2)
    }
    
    var body: some View {
        LazyHGrid(rows: gridLayout, spacing: 15){
            ForEach(ordersMock){orderItem in
                OrderTypeView(orderType: OrderType(id: orderItem.id, name: orderItem.name, image: orderItem.image))
            }
        }
        .frame(height: 200)
        .padding(.horizontal, 15)
        .padding(.top, 15)
    }
}

struct OrderTypeGridView_Previews: PreviewProvider {
    static var previews: some View {
        OrderTypeGridView()
            .previewLayout(.sizeThatFits)
    }
}
