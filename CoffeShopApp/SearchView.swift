//
//  SearchView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/25/25.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        HStack {
            HStack {
                Image(systemName: "magnifyingglass")
                    .padding(.leading)
                    .foregroundColor(Color(.black))
                
               
                
                TextField("Search for Menu Items", text: $search)
                    .padding()
            
            }
        }
        .background(Color(.white))
        .border(.sirenRed, width: 2)
//        .cornerRadius(12)
        
    }
    }

#Preview {
    SearchView()
}
