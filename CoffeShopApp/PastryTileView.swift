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
            .background(RoundedRectangle.init(cornerRadius: 16))
            .foregroundColor(.sirenRed)
            .frame(width: 225, height: 300)
        }
        //            .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1)
    }


#Preview {
    PastryTileView(pastry: Pastry(name: "Muffin", assetName: "Muffin", prices: 5.55, description: ""))
}
