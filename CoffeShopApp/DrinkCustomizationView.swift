//
//  CustimizationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/14/25.
//

import SwiftUI


    

struct DrinkCustomizationView: View {
    
    @State var item: Item
    @State var customerName: String = ""
    @State private var showingSheet: Bool = false
    @State private var specialRequest: String = ""
    @State private var showingDrinkDetailSheet: Bool = false
    @State var toGo: Bool = false
    @State private var orderNumber: String = ""
    @State private var isCelebrating = false
    var coldFoam: Bool = false
    @Binding var orderedDrink: [Item]


    
    
    
    var body: some View {
        
        ZStack {
            Color.sirenBeige
                .ignoresSafeArea()
            ScrollView {
                
                Button {
                    showingDrinkDetailSheet.toggle()
                } label: {
                    itemTileView(item: item)
                        .padding()
                }
                .sheet(isPresented: $showingDrinkDetailSheet) {
                    ShowingDrinkDetailSheet(item: item)

                }
                
                .accessibilityLabel("More information regarding the selected drink.")
                .accessibilityHint("Clicking the image will explain the selected drink in more detail.")
                
                
                VStack(alignment: .leading){
                    
                    
                    Text("Size")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    
                    Picker("Sizes", selection: $item.sizes) {
                        ForEach(Sizes.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    
                    Text("Milk Type")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    
                    
                    Picker("Milks", selection: $item.milks) {
                        ForEach(Milks.allCases, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                    .padding()
                    
                    
                    Stepper("Shots : \(item.shots)", value: $item.shots, in: 1...3)
                        .fontWeight(.bold)
                        .padding()
                    
//                    Toggle("Cold Foam?", isOn: $item.coldFoam)
//                        .fontWeight(.bold)
//                        .padding()
//                    
                    
                    Toggle("Iced", isOn: $item.iced)
                        .fontWeight(.bold)
                        .padding()
                    
                    Toggle("To Go", isOn: $item.toGo)
                        .fontWeight(.bold)
                        .padding()
                    
                    //                    var inStore =  item.toGo ? "To Go " : " For here"
                    //                    Toggle("\(inStore)", isOn: $item.toGo)
                    //                        .fontWeight(.bold)
                    //                        .padding()
                    //
                    TextField("Special Requests", text: $specialRequest)
                        .fontWeight(.bold)
                        .padding()
                    
                    TextField("Name", text: $customerName)
                        .fontWeight(.bold)
                        .padding()
                }
                Button("Review Your Drink") {
                    updateOrder()
                    showingSheet.toggle()
                }
                .sheet(isPresented: $showingSheet) {
                    itemOrderConfirmationView(item: item,
                    customerName: customerName,
                                              toGo: item.toGo, orderedDrink: $orderedDrink
                    /*orderNumber: orderNumber*/)
                        .onAppear {
                            
                            orderNumber = Self.generateOrderNumber()
                        }
                        .presentationDetents([.medium])
                    
                }
            }
        }
    }
    
    
    
        func updateOrder() {
            if specialRequest != "" {
                item.specialRequests = specialRequest
            }
        }
    static func generateOrderNumber() -> String {
        let prefix = "ORD"
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        let datePart = dateFormatter.string(from: Date())
        let random = Int.random(in: 100...999)
        return "\(prefix)-\(datePart)-\(random)"
    }
}



#Preview {
   
    ItemCustomizationView(orderedDrink: .constant([Item(name: "Latte", assetName: "Latte", prices: 4.5, description: "", itemType: .drink, basePrice: 4.50)]), orderedPastry: .constant([Item(name: "Muffin", assetName: "Muffin", prices: 2.50, description: "", itemType: .pastry, basePrice: 2.50)]), selectedItem: Item(name: "Latte", assetName: "Latte", prices: 4.50, description: "", itemType: .drink, basePrice: 4.50))
}

