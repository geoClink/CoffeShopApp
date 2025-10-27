//
//  ShowingPastryDetailSheet.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/23/25.
//

import SwiftUI

struct ShowingPastryDetailSheet: View {
    
    var pastry: Pastry
    
    var body: some View {
        
        ZStack {
            
            Color.sirenBeige
                .ignoresSafeArea()
            
            VStack {
                
                Text(pastry.name)
                    .font(.title)
                
                Image(pastry.assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text(pastry.description)
                    .padding()
            }
            .foregroundStyle(.sirenRed)
        }
    }
}

#Preview {
    ShowingPastryDetailSheet(pastry: Pastry(name: "Muffin", assetName: "Muffin", prices: 4.50, description: "A muffin is a small, individual-sized baked good with a soft, tender crumb and a slightly domed top. Typically made from a quick-bread batter of flour, eggs, milk, sugar, and butter or oil, muffins are mixed just until combined, which keeps them moist and pleasantly dense. They come in a wide range of flavors and add-ins—like blueberries, chocolate chips, nuts, or warm spices such as cinnamon. The exterior is lightly golden with a gentle crust, while the inside remains fluffy and moist. Muffins are often enjoyed warm, sometimes split and buttered, and are a popular choice for breakfast, snacks, or casual desserts. They can be baked in paper liners or directly in a muffin tin, and their versatility makes them easy to adapt to dietary preferences and seasonal ingredients."))
}
