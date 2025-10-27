//
//  InfoPage.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/17/25.
//

import SwiftUI

struct InfoPage: View {
    
    let phoneNumber = "313-277-4736"
    
    var body: some View {
        
        VStack{
            
            Image(.sirenCafe)
                .resizable()
                .scaledToFit()
            
            Text("Welcome to the Siren Cafe About Page!")
                .font(.title)
                .padding()
            
            Text("We are located at in Downtown Detroit inside one of cities most historic buildings. The Wurlitzer, located at 1509 Broadway St inside the Siren Hotel.")
                .padding()
            
            Text("This coffe shop opened in March 2018. We are excited to see you!")
                .padding()
            
            Link("Call \(phoneNumber)", destination: URL(string: "tel:\(phoneNumber.cleaned)")!)
                .foregroundColor(.blue)
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .foregroundColor(Color.sirenRed)
        .padding()
        .background(Color.sirenBeige)
        .ignoresSafeArea()
        
        
    }
}

#Preview {
    InfoPage()
}
