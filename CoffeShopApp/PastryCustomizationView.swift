//
//  CustimizationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/14/25.
//

import SwiftUI

struct PastryCustomizationView: View {
    @Binding var orderedPastry: [Item]
    let item: Item
    @State private var pastry: Pastry = Pastry(name: "", assetName: "", prices: 0, description: "")
    @State var customerName: String = ""
    @State private var showingSheet: Bool = false
    @State private var showingPastryDetailSheet: Bool = false
    @State private var orderNumber: String = ""
    
    var body: some View {
        
        ZStack {
            Color.sirenBeige
                .ignoresSafeArea()
            
            VStack() {
                
                Button {
                    showingPastryDetailSheet.toggle()
                } label: {
                    PastryTileView(pastry: pastry)
                        .padding()
                }
                .sheet(isPresented: $showingPastryDetailSheet) {
                    ShowingPastryDetailSheet(pastry: pastry)
                }
                
                Toggle("Toasted?", isOn: $pastry.toasted)
                    .fontWeight(.bold)
                
                Toggle("To Go?", isOn: $pastry.toGo)
                    .fontWeight(.bold)
                
                TextField("Name", text: $customerName)
                    .fontWeight(.bold)
                
                Button("Review Your Drink") {
                    orderNumber = Self.generateOrderNumber()
                    showingSheet.toggle()
                }
            }
            .padding()
            .onAppear {
                if pastry.name.isEmpty {
                    pastry = Pastry(
                        name: item.name,
                        assetName: item.assetName,
                        prices: item.prices,
                        description: item.description
                    )
                    
                }
            }
            .sheet(isPresented: $showingSheet) {
                PastryConfirmationView(item: item, customerName: customerName, orderedPastry: $orderedPastry, orderNumber: orderNumber)
                    .onAppear {
                        orderNumber = Self.generateOrderNumber()
                        if pastry.name.isEmpty {
                            pastry = Pastry(
                                name: item.name,
                                assetName: item.assetName,
                                prices: item.prices,
                                description: item.description
                            )
                        }
                    }
                    .presentationDetents([.medium])

            }
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
    PastryCustomizationView(orderedPastry: .constant([]), item: Item(name: "Muffin", assetName: "Muffin", prices: 3.50, description: "", itemType: .pastry, basePrice: 3.50)
    )
}
