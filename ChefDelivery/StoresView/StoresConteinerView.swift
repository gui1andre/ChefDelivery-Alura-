//
//  StoresConteinerView.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 18/08/23.
//

import SwiftUI

struct StoresConteinerView: View {
    let title = "Lojas"
    @State private var starsFilter = 0
    var filteredStores: [StoreType] {
        return storesMock.filter { store in
            store.stars >= starsFilter
        }
    }
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                Text(title)
                    .font(.headline)
                Spacer()
                Menu("Filtrar"){
                    Button {
                        starsFilter = 0
                    } label: {
                        Text("Limpar filtro")
                    }
                    Divider()

                    ForEach(1...6, id: \.self){stars in
                        Button{
                            starsFilter = stars
                        }label:{
                            if(stars == 1){
                                Text("\(stars) estrela ou mais")
                            } else{
                                Text("\(stars) estrelas ou mais")
                            }
                        }
                    }
                }
                .foregroundColor(.black)
            }
            LazyVStack(alignment: .leading, spacing: 30){
                if filteredStores.isEmpty{
                    Text("Nenhum resultado encontrado.")
                        .font(.title2)
                        .bold()
                        .foregroundColor(Color("ColorRed"))
                        .padding(.vertical, 32)
                        .frame(maxWidth: .infinity)
                }else{
                    ForEach(filteredStores){mock in
                        NavigationLink {
                            StoreDetailView(store: mock)
                        } label: {
                            StoreItemView(order: mock)
                            }
                        }
                    .foregroundColor(.black)
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
