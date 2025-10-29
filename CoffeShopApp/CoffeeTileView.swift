//
//  CoffeeTileView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/13/25.
//

import SwiftUI

struct CoffeeTileView: View {
    
    var coffee: Coffee
    
    var body: some View {
        
        ZStack{
                VStack{
                    
                    Image(coffee.assetName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    Text(coffee.name)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("$\(coffee.calculatePrice(), specifier: "%.2f")")
                        .foregroundColor(Color.white)
                        .padding(.bottom)
                    
                    
                }
                .background(RoundedRectangle.init(cornerRadius: 16))
                .foregroundColor(.sirenRed)
                .frame(width: 225, height: 300)
    
            VStack{
            Image(coffee.assetName)
                .resizable()
                .scaledToFit()
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Text(coffee.name)
                .foregroundColor(Color.white)
                .font(.title)
                .fontWeight(.bold)
            
                Text("$\(coffee.calculatePrice(), specifier: "%.2f")")
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
        CoffeeTileView(coffee: Coffee(name: "Latte", assetName: "Latte", prices: 4.50, description: "", basePrice: 4.50))
    }
}
