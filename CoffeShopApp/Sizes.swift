//
//  Sizes.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/15/25.
//

import SwiftUI


        enum Sizes: String, CaseIterable {
            case Small
            case Medium
            case Large
            
            var basePrice: Double {
                switch self {
                case .Small:
                    return 4.50
                case .Medium:
                    return 5.0
                case .Large:
                    return 5.5
                }
            }
        }

    
