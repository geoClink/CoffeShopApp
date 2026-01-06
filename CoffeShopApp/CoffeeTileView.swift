//
//  itemTileView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/13/25.
//

import SwiftUI

struct itemTileView: View {
    
    var item: Item
    
    var body: some View {
        
        ZStack{
                VStack{
                    
                    Image(item.assetName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    Text(item.name)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("$\(item.calculatePrice(), specifier: "%.2f")")
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                    
                    
                }
                .background(RoundedRectangle.init(cornerRadius: 16))
                .foregroundColor(.sirenRed)
                .frame(width: 225, height: 300)
    
            VStack{
            Image(item.assetName)
                .resizable()
                .scaledToFit()
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Text(item.name)
                .foregroundColor(Color.white)
                .font(.title)
                .fontWeight(.bold)
            
                Text("$\(item.calculatePrice(), specifier: "%.2f")")
                    .foregroundColor(Color.white)
                    .padding(.bottom)
    
                }
                .foregroundColor(.sirenRed)
                .frame(width: 225, height: 300)
        }
        .padding(4)
    }
}

#Preview{
    
    
    ScrollView{
        itemTileView(item: Item(name: "Latte", assetName: "Latte", prices: 4.50, description: "", itemType: .drink, basePrice: 4.50))
    }
}
