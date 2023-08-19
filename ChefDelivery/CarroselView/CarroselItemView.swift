//
//  CarroselItemView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct CarroselItemView: View {
    
    let order: OrderType
    var body: some View {
        Image(order.image)
            .resizable()
            .scaledToFit()
    }
}

struct CarroselItemView_Previews: PreviewProvider {
    static var previews: some View {
        CarroselItemView(order: OrderType(id: 1, name: "brazilian-meal-banner", image: "brazilian-meal-banner"))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
