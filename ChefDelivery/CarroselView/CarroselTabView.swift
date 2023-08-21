//
//  CarroselTabView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct CarroselTabView: View {
    
    @State private var currentIndex = 1
    
    let ordersMock: [OrderType] = [
        OrderType(id: 1, name: "barbecue", image: "barbecue-banner"),
        OrderType(id: 2, name: "brazilian", image: "brazilian-meal-banner"),
        OrderType(id: 3, name: "pokes", image: "pokes-banner")]
    var body: some View {
        TabView( selection: $currentIndex){
            ForEach(ordersMock){mock in
                CarroselItemView(order: mock)
                    .tag(mock.id)
            }
        }
        .frame(height: 180)
        .tabViewStyle(.page(indexDisplayMode: .always))
        .onAppear{
            Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { _ in
                withAnimation(.easeInOut(duration: 1)){
                    if currentIndex > ordersMock.count {
                        currentIndex = 1
                    }
                    currentIndex += 1
                }
            }
        }
    }
}

struct CarroselTabView_Previews: PreviewProvider {
    static var previews: some View {
        CarroselTabView()
            .previewLayout(.sizeThatFits)
    }
}
