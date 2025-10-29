//
//  Pastry.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/16/25.
//

import SwiftUI

struct Pastry: Identifiable, Hashable {
   let id = UUID()
    var name: String
    var assetName: String
    var prices: Double
    var toasted: Bool = false
    var toGo: Bool = false
    var description: String
    }


