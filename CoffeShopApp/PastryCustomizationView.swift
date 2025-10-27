//
//  CustimizationView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/14/25.
//

import SwiftUI

struct PastryCustomizationView: View {
    
    @State var pastry: Pastry
    @State var customerName: String = ""
    @State private var showingSheet: Bool = false
    @State private var showingPastryDetailSheet: Bool = false
    
    var body: some View {
        
        ZStack {
            Color.sirenBeige
                .ignoresSafeArea()
            
            VStack() {
                
                
//                Button {
//                    showingDrinkDetailSheet.toggle()
//                } label: {
//                    CoffeeTileView(coffee: coffee)
//                        .padding()
//                }
//                .sheet(isPresented: $showingDrinkDetailSheet) {
//                   ShowingDrinkDetailSheet(coffee: coffee)
//                }
//
//                .accessibilityLabel("The Siren Cafe Info Page")
//                .accessibilityHint("This button will take you to a page giving details about the cafe like address, phone number and openig date.")
                
                
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
                
                Button("Review Order") {
                    showingSheet.toggle()
                }
            }
            .padding()
            .sheet(isPresented: $showingSheet) {
                PastryConfirmationView(pastry: pastry, customerName: customerName)
            }
        }
    }
}

#Preview {
   
    PastryCustomizationView(pastry: Pastry(name: "Muffin", assetName: "Muffin", prices: 5.55, toasted: false, description: ""))
}

