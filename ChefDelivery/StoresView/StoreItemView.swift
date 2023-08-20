//
//  StoreItemView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct StoreItemView: View {
    
    let order: StoreType
    var body: some View {
        HStack{
            Image(order.logoImage)
                .resizable()
                .scaledToFit()
                .cornerRadius(25)
                .frame(width: 50, height: 50)
            Text(order.name)
                .font(.subheadline)
        }
    }
}

struct StoreItemView_Previews: PreviewProvider {
    static var previews: some View {
        StoreItemView(order: storesMock[0])
            .previewLayout(.sizeThatFits)
    }
}
