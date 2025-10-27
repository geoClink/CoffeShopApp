//
//  OrderConfirmationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/14/25.
//

import SwiftUI

struct CoffeeOrderConfirmationView: View {
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    let coffee: Coffee
    //    let pastry: Pastry?
    let customerName: String
    let toGo: Bool 
    
    var body: some View {
        
        let dynamicHStack = dynamicTypeSize <= .xxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        ZStack{
            //            dynamicHStack {
            
            Color.sirenBeige
                .ignoresSafeArea()
            VStack {
                Image(.sirenLogo)
                    .frame(width: 50, height: 50)
                    .offset(y: 390)
                    .padding()
                VStack(alignment: .leading){
                    var inStore =  toGo ? "to Go " : "for here"
                    
                    Text("Hi \(customerName)! You ordered a \(coffee.sizes) \(coffee.name) with \(coffee.milks) milk \(inStore).")
                        .font(.title)
                        .padding()
                    
                    if let specialRequest = coffee.specialRequests {
                        Text("You requested: \(specialRequest)")
                            .padding()
                    }
                    
                    Text("The price is $\(coffee.calculatePrice(), specifier: "%.2f")")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    
                }
                .foregroundColor(Color.white)
                //                .frame(width: 300, height: 400)
                .padding()
                .background(Color.sirenRed)
                .cornerRadius(16)
                .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1)
            }
        }
    }
}
//}
#Preview {
    CoffeeOrderConfirmationView(coffee: Coffee(name: "Latte", assetName: "Latte", prices: 4.50, description: ""), customerName: "", toGo: false)
}
