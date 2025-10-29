//
//  ConfettiTestPage.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/29/25.
//

import SwiftUI

struct ConfettiTestPage: View {
    @State private var isCelebrating = false
    
    var body: some View {
        
        ZStack{
            ConfettiView(isAnimating:
                            $isCelebrating)
            Button(action : {
                isCelebrating = true
                
                DispatchQueue.main
                    .asyncAfter(deadline:
                            .now() + 3.5) {
                                isCelebrating = false
                            }
            }) {
                Text("Celebrate")
            }
            
        }
    }
}

#Preview {
    ConfettiTestPage()
}
