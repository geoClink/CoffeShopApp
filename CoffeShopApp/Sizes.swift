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
                    return 1.0
                case .Medium:
                    return 1.2
                case .Large:
                    return 1.4
                }
            }
        }

    
