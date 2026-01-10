//
//  CartManager.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 1/6/26.
//

import Foundation
import SwiftUI
internal import Combine

class CartModel: ObservableObject {
    @Published var cartItems: [Product] = [] // Stores all added products

    func addProduct(_ product: Product) {
        cartItems.append(product)
        // You may want to add logic here to handle quantities of the same product
    }

    func removeProduct(_ product: Product) {
        if let index = cartItems.firstIndex(where: { $0.id == product.id }) {
            cartItems.remove(at: index) // Removes the first instance found
        }
    }

    var total: Double {
        return cartItems.reduce(0.0) { $0 + $1.price } // Calculate the total price
    }
    
    func calculateTotal() -> Double {
        let total = cartItems.reduce(into: 0) { (totalSum, cartItem) in
               // Multiply each item's price by its quantity and add it to the running total
               totalSum + (cartItem.price * Double(cartItem.quantity))
           }
           return total
       }
}
