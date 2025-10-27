//
//  CallView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/17/25.
//

import SwiftUI

struct CallView: View {
    let phoneNumber = "313-277-4736"
    
    var body: some View {
        
        Link("Call \(phoneNumber)", destination: URL(string: "tel:\(phoneNumber.cleaned)")!)

    }
}

extension String {
var cleaned: String {
return self.components(separatedBy: CharacterSet.decimalDigits.inverted).joined()
    }
}

#Preview {
    CallView()
}
