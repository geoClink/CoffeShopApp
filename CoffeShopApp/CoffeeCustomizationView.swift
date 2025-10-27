//
//  CustimizationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/14/25.
//

import SwiftUI

struct CoffeeCustomizationView: View {
    
    @State var coffee: Coffee
    @State var customerName: String = ""
    @State private var showingSheet: Bool = false
    @State private var specialRequest: String = ""
    @State private var showingDrinkDetailSheet: Bool = false
    @State var toGo: Bool = false
    

    
    var body: some View {
        
        ZStack {
            Color.sirenBeige
                .ignoresSafeArea()
            ScrollView {
                
                Button {
                    showingDrinkDetailSheet.toggle()
                } label: {
                    CoffeeTileView(coffee: coffee)
                        .padding()
                }
                .sheet(isPresented: $showingDrinkDetailSheet) {
                   ShowingDrinkDetailSheet(coffee: coffee)
                }

                .accessibilityLabel("More information regarding the selected drink.")
                .accessibilityHint("Clicking the image will explain the selected drink in more detail.")
//                            .accessibilityLabel("")
//                            .accessibilityHint("")

                
                
                
                
                VStack(alignment: .leading){
                    
                    
                    Text("Size")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    
                    Picker("Sizes", selection: $coffee.sizes) {
                        ForEach(Sizes.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    
                    Text("Milk Type")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    
                    Picker("Milks", selection: $coffee.milks) {
                        ForEach(Milks.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    Stepper("Shots : \(coffee.shots)", value: $coffee.shots, in: 1...3)
                        .fontWeight(.bold)
                        .padding()
                    
                    
                    Toggle("Iced?", isOn: $coffee.iced)
                        .fontWeight(.bold)
                        .padding()
                    
                    Toggle("To Go?", isOn: $coffee.toGo)
                        .fontWeight(.bold)
                        .padding()
                        
//                    var inStore =  coffee.toGo ? "To Go " : " For here"
//                    Toggle("\(inStore)", isOn: $coffee.toGo)
//                        .fontWeight(.bold)
//                        .padding()
                    
                    TextField("Special Requests", text: $specialRequest)
                        .fontWeight(.bold)
                        .padding()
                    
                    TextField("Name", text: $customerName)
                        .fontWeight(.bold)
                        .padding()
                }
                Button("Review Order") {
                    updateOrder()
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    CoffeeOrderConfirmationView(coffee: coffee, customerName: customerName, toGo: coffee.toGo)
                }
            }
        }
    }
    func updateOrder() {
        if specialRequest != "" {
            coffee.specialRequests = specialRequest
        }
    }
    
    }


#Preview {
   
    CoffeeCustomizationView(coffee: Coffee(name: "Latte", assetName: "Latte", prices: 4.50, description: ""))
}

