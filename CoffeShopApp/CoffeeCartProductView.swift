//
//  CartProductView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/25/25.
//

import SwiftUI

struct CartProductView: View {
    
    var item: item
    
    var body: some View {
        HStack ( spacing: 20) {
            Image(item.assetName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)
            VStack(alignment: .leading,  spacing: 5) {
                Text(item.name)
                    .bold()
                Text("$ \(item.prices, specifier: "%.2f")")
                    .bold()
            }
            .padding()
            
            Spacer()
            
            Image(systemName: "trash")
                .foregroundColor(.red)
                .onTapGesture {
//                    cartManager.removeFromCart(product: product)
                }
        }
        .padding(.horizontal)
        .background(Color(.sirenBeige))
        .cornerRadius(12)
        .frame(width: .infinity, alignment: .leading)
        .padding()
    }
}

  
#Preview {
    CartProductView(item: item(name: "Latte", assetName: "Latte", prices: 5.50, description: "", basePrice: 5.50))
}
