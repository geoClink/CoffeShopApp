//
//  showingDrinkDetailSheet.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/23/25.
//

import SwiftUI

struct ShowingDrinkDetailSheet: View {
    
    var coffee: Coffee
    
    var body: some View {
        
        ZStack {
            Color.sirenBeige
                .ignoresSafeArea()
            VStack {
                
                Text(coffee.name)
                    .font(.title)
                
                Image(coffee.assetName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300, height: 300)
                
                Text(coffee.description)
                    .padding()
            }
            .foregroundColor(.sirenRed)

        }
    }
}

#Preview {
    ShowingDrinkDetailSheet(coffee: Coffee(name: "Latte", assetName: "Latte", prices: 4.55, description: "A smooth and creamy espresso-based beverage made with freshly pulled espresso and steamed milk, finished with a thin layer of silky microfoam. The latte balances bold coffee notes with a mellow, velvety texture, making it comforting and approachable. Enjoy it plain to appreciate the espresso’s character, or customize with flavors like vanilla, caramel, or hazelnut. Perfect for a gentle caffeine lift and a luxurious, everyday sip."))
}
