//
//  ItemTileView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/27/25.
//

import SwiftUI

struct ItemTileView: View {
    
    var items: Items
    
    var body: some View {
       
        ZStack{
                VStack{
                    
                    Image(items.assetName)
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                    
                    Text(items.name)
                        .foregroundColor(Color.white)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    Text("$\(items.calculatePrice(), specifier: "%.2f")")
                        .foregroundColor(Color.white)
                        .padding(.bottom)

                    
                }
                .background(RoundedRectangle.init(cornerRadius: 16))
                .foregroundColor(.sirenRed)
                .frame(width: 225, height: 300)
//                .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1)
  
        }
    }
}
        


#Preview {
    ItemTileView(items: Items(name: "Latte", assetName: "Latte", prices: 5.50, description: ""))
}
