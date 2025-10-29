//
//  CartProductView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/25/25.
//

import SwiftUI

struct CartProductView: View {
    
    var coffee: Coffee
    
    var body: some View {
        HStack ( spacing: 20) {
            Image(coffee.assetName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70)
                .cornerRadius(9)
            VStack(alignment: .leading,  spacing: 5) {
                Text(coffee.name)
                    .bold()
                Text("$ \(coffee.prices, specifier: "%.2f")")
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
    CartProductView(coffee: Coffee(name: "Latte", assetName: "Latte", prices: 5.50, description: "", basePrice: 5.50))
}
