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
        ScrollView {
            VStack{
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Spacer()

                Image(.sirenCafe)
                    .resizable()
                    .scaledToFit()
                
                
                Text("Welcome to the Siren Cafe About Page!")
                    .font(.title)
                    .padding()
                Spacer()
                
                
                Text("We are located at in Downtown Detroit inside one of cities most historic buildings. The Wurlitzer, located at 1509 Broadway St inside the Siren Hotel.")
                    .padding()
                
                Text("This coffe shop opened in March 2018. We are excited to see you!")
                    .padding()
                
                Link("Call \(phoneNumber)", destination: URL(string: "tel:\(phoneNumber.cleaned)")!)
                    .foregroundColor(.blue)
                
                Image(.sirenHotel)
                    .resizable()
                    .frame(width: 350, height: 500)
                    .clipShape(RoundedRectangle(cornerRadius: 8))
                    .overlay(
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(Color.sirenRed, lineWidth: 5)
                            )
                
            }
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
