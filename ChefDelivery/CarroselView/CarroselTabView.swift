//
//  CarroselTabView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct CarroselTabView: View {
    
    let ordersMock: [OrderType] = [
    OrderType(id: 1, name: "barbecue", image: "barbecue-banner"),
    OrderType(id: 2, name: "brazilian", image: "brazilian-meal-banner"),
    OrderType(id: 3, name: "pokes", image: "pokes-banner")]
    var body: some View {
        TabView{
            ForEach(ordersMock){mock in
                CarroselItemView(order: mock)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
}

struct CarroselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarroselTabView()
            .previewLayout(.sizeThatFits)
    }
}
