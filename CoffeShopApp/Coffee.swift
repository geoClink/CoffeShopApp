//
//  Coffee.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/13/25.
//

import SwiftUI

struct Coffee: Hashable {
    
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
    
    func calculatePrice() -> Double {
        var price = sizes.basePrice
        let taxRate = 0.08
        
        if milks == .Almond {
            price += 0.5
        }
        if milks == .Oat {
            price += 0.5
        }
        if milks == .Soy {
            price += 0.5
        }
        if milks == .Coconut {
            price += 0.5
        }
                
            return price + (price * taxRate)
        
    }
}

