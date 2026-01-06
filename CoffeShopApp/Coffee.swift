//
//  item.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/13/25.
//

import SwiftUI

struct item: Hashable {
    
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
    var coldFoam: Bool = false
    var basePrice: Double
    
    func calculatePrice() -> Double {
        var price = basePrice * sizes.basePrice
        let taxRate = 0.08
        
        switch milks {
        case .Whole:
            break
        case .Oat:
            price += 0.5
        case .Almond:
            price += 0.5
        case .Soy:
            price += 0.5
        case .Coconut:
            price += 0.5
        }
        
        if coldFoam {
            price += 0.5
        }
        
        if shots > 0 {
            price += Double(shots) * 0.75
        }
    
    //        if milks == .Almond {
    //            price += 0.5
    //        }
    //        if milks == .Oat {
    //            price += 0.5
    //        }
    //        if milks == .Soy {
    //            price += 0.5
    //        }
    //        if milks == .Coconut {
    //            price += 0.5
    //        }
    //        if coldFoam == true {
    //            price += 0.5
    //        }
    
    return price + (1.0 * taxRate)
    
    }
}

