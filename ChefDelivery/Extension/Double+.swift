//
//  Double+.swift
//  ChefDelivery
//
//  Created by Guilherme Andre de Souza on 19/08/23.
//

import Foundation

extension Double {
    func formatPrice() -> String {
        let formattedString = String(format: "%.2f", self)
        return formattedString.replacingOccurrences(of: ".", with: ",")
    }
    
}
