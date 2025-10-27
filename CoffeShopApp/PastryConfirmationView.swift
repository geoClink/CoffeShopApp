//
//  PastryConfirmationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/16/25.
//

import SwiftUI

struct PastryConfirmationView: View {
    
    let pastry: Pastry
    let customerName: String
    
    var body: some View {
        
        ZStack {
                
                Color.sirenBeige
                    .ignoresSafeArea()
            
            VStack{
                
                Image(.sirenLogo)
                    .frame(width: 50, height: 50)
                    .offset(y: 350)
                    .padding()
                
                VStack {
                    
                    Text("Hi \(customerName)! You ordered a \(pastry.name).")
                        .font(.title)
                        .padding()
                    
                    Text("The price is $\(pastry.prices, specifier: "%.2f").")
                        .font(.title)
                        .fontWeight(.bold)
                    
                }
                .foregroundColor(Color.white)
                .padding()
                .background(Color.sirenRed)
                .cornerRadius(16)
                .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1)
                
            }
        }
    }
}

#Preview {
    PastryConfirmationView(pastry: Pastry(name: "Muffin", assetName: "Muffin", prices: 5.55, description: ""), customerName: "")
}


