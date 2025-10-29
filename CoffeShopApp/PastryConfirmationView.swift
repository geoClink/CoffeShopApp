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
    let orderNumber: String
    
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                
                Color.sirenBeige
                    .ignoresSafeArea()
                
                VStack(spacing: 12){
                    
                    Image(.sirenLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(y: 0)
                        .padding()
                    
                    VStack {
                        Text("Review Your Order")
                            .font(.title)
                            .underline()
                        
                        Text("\(customerName)You ordered a \(pastry.name) \(pastry.toGo ? "To Go" : "For Here").")
                            .font(.title)
                            .padding()
                        
                        Text("The price is $\(pastry.prices, specifier: "%.2f").")
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Text("Order Number:\(orderNumber)")
                            .padding()
                        
                    }
                    .foregroundColor(Color.white)
                    .padding()
                    .background(Color.sirenRed)
                    .cornerRadius(16)
                    .shadow(color: Color(.black.opacity(3)), radius: 5, x: 1.0, y: 1)
                    
                }
                NavigationLink("Place New Order") {
                    MainScreen()
                }
                .offset(y: 325)
            }
        }
                .navigationTitle("Confirmation")
    }
}


#Preview {
    PastryConfirmationView(pastry: Pastry(name: "Muffin", assetName: "Muffin", prices: 5.55, description: ""), customerName: "", orderNumber: "")
}


