//
//  PastryConfirmationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/16/25.
//

import SwiftUI

struct PastryConfirmationView: View {
    @Environment(\.dismiss) var dismiss
    let item: Item
    let customerName: String
    @Binding var orderedPastry: [Item]
    let orderNumber: String
    
    
    var body: some View {
        
        
        NavigationStack {
            ZStack {
                
                Color.sirenBeige
                    .ignoresSafeArea()
                
                VStack(spacing: 12){
                    
//                    Image(.sirenLogo)
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 200, height: 200)
//                        .offset(y: 0)
//                        .padding()
//                    
                    VStack {
//                        Text("Review Your Pastry")
//                            .font(.title)
//                            .underline()
                        
                        Text("\(customerName)You ordered a \(item.name) \(item.toGo ? "To Go" : "For Here").")
                            .font(.title)
                            .padding()
                        
                        Text("The price is $\(item.prices, specifier: "%.2f").")
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
                .navigationTitle("Confirmation")
    }
    
    func addToOrder() {
        orderedPastry.append(item)
        
    }
}


#Preview {
    PastryConfirmationView(item: Item(name: "Muffin", assetName: "Latte", prices: 2.50, description: "", itemType: .pastry, basePrice: 4.0), customerName: "", orderedPastry: .constant([Item(name: "Muffin", assetName: "Muffin", prices: 2.50, description: "", itemType: .pastry, basePrice: 2.50)]), orderNumber: "")
}


