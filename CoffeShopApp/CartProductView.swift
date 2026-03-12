//
//  CartProductView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/25/25.
//

import SwiftUI

struct CartProductView: View {
    
    var item: Item
    @Binding var cartItems: [Item]
    
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
            
            Button {
                if let index = cartItems.firstIndex(where: { $0.name == item.name && $0.assetName == item.assetName }) {
                    cartItems.remove(at: index)
                }
            } label: {
                Image(systemName: "trash")
                    .foregroundColor(.red)
            }
        }
        .padding(.horizontal)
        .background(Color(.sirenBeige))
        .cornerRadius(12)
        .frame(width: .infinity, alignment: .leading)
        .overlay(
                    RoundedRectangle(cornerRadius: 12)
                        .stroke(Color.sirenRed, lineWidth: 1)
                )
        .padding(.horizontal)
    }
}

  
#Preview {
    CartProductView(
        item: Item(name: "Latte", assetName: "Latte", prices: 5.50, description: "", itemType: .drink, basePrice: 5.50),
        cartItems: .constant([
            Item(name: "Latte", assetName: "Latte", prices: 5.50, description: "", itemType: .drink, basePrice: 5.50),
            Item(name: "Espresso", assetName: "Espresso", prices: 3.00, description: "", itemType: .drink, basePrice: 3.00)
        ])
    )
}
