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
    let orderNumber: String
    @State private var isCelebrating = false
    
    var body: some View {
        
        let dynamicHStack = dynamicTypeSize <= .xxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        
        NavigationStack {
            ZStack{
                
                Color.sirenBeige
                    .ignoresSafeArea()
                VStack {
                    Image(.sirenLogo)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .offset(y: 0)
                        .padding()
                    VStack(alignment: .leading){
//                        var inStore =  toGo ? "to Go " : "for here"
//                        
                        
                        Text("Review Your Order")
                            .font(.title)
                            .underline()
                            .padding()
                        
                        
//                        Text("\(customerName) You ordered a \(coffee.sizes) \(coffee.name) \(coffee.toGo ? "To Go" : "For Here") with \(coffee.milks) milk .")
//                            .font(.title)
//                            .padding()
                        Text("\(customerName) ordered:")
                            .font(.headline)
                        
                        if let specialRequest = coffee.specialRequests {
                            Text("You requested: \(specialRequest)")
                                .padding()
                        }
                        
                        
                        Text("Size: \(coffee.sizes)")
                        Text("Drink: \(coffee.name)")
                        Text("Milk: \(coffee.milks)")
                        Text("Shots: \(coffee.shots)")
                        Text("Iced?: \(coffee.iced)")

                        

                    
                        Text("Price:  $\(coffee.calculatePrice(), specifier: "%.2f")")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text("Order Number:\(orderNumber)")
                            
                        
                        
                        
                    }
                    .foregroundColor(Color.white)
                    //                .frame(width: 300, height: 400)
                    .padding()
                    .background(Color.sirenRed)
                    .cornerRadius(16)
                    .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1)
                }
                NavigationLink("Place New Order") {
                    MainScreen()
                }
                .offset(y: 360)
            }
        }
    }
}
//}
#Preview {
    CoffeeOrderConfirmationView(coffee: Coffee(name: "Latte", assetName: "Latte", prices: 4.50, description: "", basePrice: 4.50), customerName: "", toGo: false, orderNumber: "")
}
