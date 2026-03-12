//
//  Items.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/27/25.
//

import SwiftUI
import Foundation

struct Item: Identifiable, Hashable {
    
    enum ItemType: String, CaseIterable {
        case drink, pastry
    }
    
    let id = UUID()
    var name: String
    var assetName: String
    var prices: Double
    var sizes: Sizes = .Small
    var milks: Milks = .Whole
    var shots: Int = 0
    var iced: Bool = false
    var toGo: Bool = false
    var specialRequests: String?
    var description: String
    var itemType: ItemType
    var basePrice: Double


    
    func calculatePrice() -> Double {
        var price = basePrice * sizes.basePrice
        let taxRate = 0.08
        
        if milks == .Almond { price += 0.5 }
        if milks == .Oat { price += 0.5 }
        if milks == .Soy { price += 0.5 }
        if milks == .Coconut { price += 0.5 }
        
        return price + (1 * taxRate)
    }
}



struct Product: Identifiable, Codable { 
    var id = UUID()
    var name: String
    var price: Double
    var quantity: Double
}
