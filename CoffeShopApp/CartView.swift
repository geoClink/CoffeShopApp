//
//  CartView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/17/25.
//

import SwiftUI

struct CartView: View {
    //    @EnvironmentObject var cartModel: CartModel
    @Binding var orderedDrink: [Item]
    @Binding var orderedPastry: [Item]
    var total: Double
    
    var body: some View {
        
        ZStack{
            Color.sirenBeige
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                ForEach(orderedDrink, id: \.self) { drink in
                    CartProductView(item: Item(name: drink.name, assetName: drink.assetName, prices: drink.prices, description: drink.description, itemType: .drink, basePrice: drink.basePrice), cartItems: $orderedDrink)
                }
                
                ForEach(orderedPastry, id: \.self) { pastry in
                    CartProductView(item: Item(name: pastry.name, assetName: pastry.assetName, prices: pastry.prices, description: pastry.description, itemType: .pastry, basePrice: pastry.basePrice), cartItems: $orderedPastry)
                }
                
                
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()

                Spacer()

                VStack {
                    
                }
                Divider()
                Text("Subtotal: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.headline)
                    .bold()
                Divider()
                Text("Tax: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                    .font(.headline)
                    .bold()
                Divider()
                Text("Total: ")
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .font(.headline)
                    .bold()
                    .padding()
                    
                
                Spacer()
                
                Button {
                
                } label: {
                    VStack {
                                Button("Check Out") {
                                    print("Initiating checkout process...")
                                }
                                .padding()
                                .background(Color.sirenRed)
                                .foregroundColor(.sirenBeige)
                                .cornerRadius(8)
                            }
                        }
                }
                
            //        VStack {
            //            List(cartModel.cartItems) { product in
            //                HStack {
            //                    Text(product.name)
            //                    Spacer()
            //                    Text("$\(product.price, specifier: "%.2f")")
            //                }
            //            }
            //            Text("Total: $\(cartModel.total, specifier: "%.2f")")
            //                .font(.headline)
            //                .padding()
            //            // Add a "Proceed to Checkout" button here
            //        }
            //        .navigationTitle("My Cart")
        }
        
    }
}
#Preview {
    CartView(orderedDrink: .constant([Item(name: "Latte", assetName: "Latte", prices: 4.5, description: "", itemType: .drink, basePrice: 4.50)]), orderedPastry: .constant([Item(name: "Muffin", assetName: "Muffin", prices: 2.50, description: "", itemType: .pastry, basePrice: 2.50)]), total: 3)
}
