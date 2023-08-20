//
//  StoreDetailView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 19/08/23.
//

import SwiftUI

struct StoreDetailView: View {
    let store: StoreType
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading){
                StoreDetailHeaderView(store: store)
                StoreDetailProductsView(products: store.products)
            }
        }
        .navigationTitle(store.name)
        .navigationBarBackButtonHidden()
        .toolbar{
            ToolbarItem(placement: .navigationBarLeading){
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack(spacing: 8){
                        Image(systemName: "cart")
                        Text("Lojas")
                    }
                    .foregroundColor(Color("ColorRed"))
                }
                
            }
        }
    }
}

struct StoreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        StoreDetailView(store: storesMock[0])
            .previewLayout(.sizeThatFits)
    }
}
