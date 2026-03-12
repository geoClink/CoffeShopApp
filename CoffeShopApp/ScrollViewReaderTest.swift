//
//  ScrollViewReaderTest.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 1/6/26.
//

import SwiftUI

struct ScrollViewReaderTest: View {
    
    var body: some View {
        // 1. Wrap content in ScrollViewReader
        ScrollViewReader { proxy in
            // 2. Wrap content in ScrollView
            ScrollView {
                VStack(spacing: 20) {
                    // Button to scroll to the bottom section
                    Button("Go to Bottom") {
                        // 3. Call scrollTo with the target ID
                        withAnimation { // Optional: adds a smooth scrolling animation
                            proxy.scrollTo("bottomSectionId", anchor: .center) // You can adjust the anchor (.top, .center, .bottom)
                        }
                    }
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                    
                    // Top content
                    ForEach(0..<20) { i in
                        Text("Row \(i)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                    }
                    
                    // The target section
                    Text("You made it to the bottom!")
                        .padding(50)
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                    // Assign the unique identifier
                        .id("bottomSectionId")
                    
                    // More content below the target
                    ForEach(20..<40) { i in
                        Text("Row \(i)")
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.gray.opacity(0.2))
                    }
                }
            }
        }
    }
}
#Preview {
    ScrollViewReaderTest()
}
