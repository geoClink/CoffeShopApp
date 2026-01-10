//
//  OrderConfirmationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/14/25.
//

import SwiftUI

struct itemOrderConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.dynamicTypeSize) var dynamicTypeSize
    
    var item: Item
    //    let pastry: Pastry?
    let customerName: String
    let toGo: Bool
    //let orderNumber: String
    @State private var isCelebrating = false
    @Binding var orderedDrink: [Item]
    
    var body: some View {
        
        let dynamicHStack = dynamicTypeSize <= .xxLarge ? AnyLayout(HStackLayout()) : AnyLayout(VStackLayout())
        
        
        NavigationStack {
            ZStack{
                
                Color.sirenBeige
                    .ignoresSafeArea()
                VStack {
//                    Image(.sirenLogo)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200)
//                        .offset(y: 0)
//                        .padding()
                    VStack(alignment: .leading){
//                        var inStore =  toGo ? "to Go " : "for here"
//                        
                        
//                        Text("Review Your Drink")
//                            .font(.title)
//                            .underline()
//                            .padding()
                        
                        
//                        Text("\(customerName) You ordered a \(item.sizes) \(item.name) \(item.toGo ? "To Go" : "For Here") with \(item.milks) milk .")
//                            .font(.title)
//                            .padding()
                        Text("\(customerName) Ordered:")
                            .font(.headline)
                        
                        if let specialRequest = item.specialRequests {
                            Text("You requested: \(specialRequest)")
                                .padding()
                        }
                        
                        
                        Text("Size: \(item.sizes)")
                        Text("Drink: \(item.name)")
                        Text("Milk: \(item.milks)")
                        Text("Shots: \(item.shots)")
                        Text("Iced?: \(item.iced)")

                        

                    
                        Text("Price:  $\(item.calculatePrice(), specifier: "%.2f")")
                            .font(.title)
                            .fontWeight(.bold)
                            .padding()
                        
               //         Text("Order Number:\(orderNumber)")
                            
                        
                        
                        
                    }
                    .foregroundColor(Color.white)
//                                    .frame(width: 300, height: 400)
                    .padding()
                    .background(Color.sirenRed)
                    .cornerRadius(16)
                    .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1)
                
//                Button("Add to order") {
//                    addToOrder()
//                    dismiss()
//                }
//                .offset(y: 325)
                    
                    
                    Button  ("Add to order") {
                        addToOrder()
                        dismiss()
                            
                        }
                    .padding()
                    .background(Color.sirenRed)
                    .foregroundColor(.sirenBeige)
                    .cornerRadius(8)
                }
            }
        }
    }
    
    func addToOrder() {
        orderedDrink.append(item)
        
    }
}
//}
#Preview {
    itemOrderConfirmationView(item: Item(name: "Latte", assetName: "Latte", prices: 4.50, description: "", itemType: .drink, basePrice: 4.50), customerName: "", toGo: false, /*orderNumber: "",*/ orderedDrink: .constant([Item(name: "Latte", assetName: "Latte", prices: 4.5, description: "", itemType: .drink, basePrice: 4.50)]))
}
