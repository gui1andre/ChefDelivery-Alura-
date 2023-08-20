//
//  ProductType.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 19/08/23.
//

import Foundation

struct ProductType: Identifiable{
    let id: Int
    let name: String
    let description: String
    let image: String
    let price: Double
    var formatteedPrice: String {
        return "R$" + price.formatPrice()
    }
}
