//
//  popDrink.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/27/25.
//

import SwiftUI

struct popDrink: Hashable {
 
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
}
