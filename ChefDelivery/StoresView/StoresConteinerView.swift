//
//  StoresConteinerView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct StoresConteinerView: View {
    let title = "Lojas"
    var body: some View {
        VStack(alignment: .leading){
            Text(title)
                .font(.headline)
            LazyVStack(alignment: .leading, spacing: 30){
            ForEach(storesMock){mock in
                StoreItemView(order: OrderType(id: mock.id, name: mock.name, image: mock.image))
                }
            }
        }
        .padding(.horizontal, 20)
    }
}

struct StoresConteinerView_Previews: PreviewProvider {
    static var previews: some View {
        StoresConteinerView()
            .previewLayout(.sizeThatFits)
    }
}
