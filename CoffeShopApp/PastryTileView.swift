//
//  PastryTileView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/16/25.
//

import SwiftUI

struct PastryTileView: View {
    
    var pastry: Pastry
    
    var body: some View {
        
        ZStack{
   
            RoundedRectangle(cornerRadius: 16)
//                .shadow(color: Color(.black), radius: 5, x: 5, y: 5)
                .foregroundColor(.sirenRed)
                .frame(width: 225, height: 300)
    
            VStack{
            Image(pastry.assetName)
                .resizable()
                .scaledToFit()
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            Text(pastry.name)
                .foregroundColor(Color.white)
                .font(.title)
                .fontWeight(.bold)
            
                Text("$\(pastry.prices,specifier: "%.2f")")
                    .foregroundColor(Color.white)
                    .padding(.bottom)
    
                }
                .foregroundColor(.sirenRed)
                .frame(width: 225, height: 300)
        }
        .padding(4)
    }
}


#Preview {
    PastryTileView(pastry: Pastry(name: "Muffin", assetName: "Muffin", prices: 5.55, description: ""))
}
