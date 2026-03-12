//
//  PopularItemsView.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/25/25.
//

import SwiftUI

struct PopularItemsView: View {
    @State private var showingSheet: Bool = false
    @Binding var orderedDrink: [Item]
    
    
    var items: [Item] = [
        Item(name: "Cortado", assetName: "Cortado", prices: 4.50, description: "A balanced, no-frills espresso drink made by “cutting” a double shot of espresso with an equal amount of warm, lightly textured milk. The cortado softens espresso’s intensity without masking its character, delivering a smooth, focused flavor with gentle sweetness and minimal foam. It’s small, straightforward, and ideal for those who want the clarity of espresso with just enough milk to round the edges.", itemType: .drink, basePrice: 4.50),
        Item(name: "Espresso", assetName: "Espresso", prices: 2.50, description: "A concentrated item brewed by forcing hot water through finely ground beans under high pressure. Espresso delivers an intense, full-bodied shot with rich crema on top, showcasing the item’s purest flavors—bittersweet chocolate, caramel, fruit, or nutty notes depending on the roast. It’s small but powerful, meant to be sipped and savored, and serves as the foundation for many café classics like lattes, cappuccinos, macchiatos, and americanos. Perfect for a quick, flavorful boost with a lingering, satisfying finish.", itemType: .drink, basePrice: 2.50),
        Item(name: "Latte", assetName: "Latte", prices: 5.50, description: "A smooth and creamy espresso-based beverage made with freshly pulled espresso and steamed milk, finished with a thin layer of silky microfoam. The latte balances bold item notes with a mellow, velvety texture, making it comforting and approachable. Enjoy it plain to appreciate the espresso’s character, or customize with flavors like vanilla, caramel, or hazelnut. Perfect for a gentle caffeine lift and a luxurious, everyday sip.", itemType: .drink, basePrice: 5.50),
        Item(name: "Black Coffee", assetName: "Blackitem", prices: 2.50, description: "A pure, unadorned brew made from freshly ground item and hot water—no milk, no sugar, just the item itself. Black Coffee highlights the bean’s true character: from bright, citrusy and floral in lighter roasts to rich, chocolaty, and nutty in darker roasts. Clean and straightforward, it offers a crisp mouthfeel and a lingering finish. Ideal for those who appreciate clarity of flavor and the nuances of origin, roast, and brew method.", itemType: .drink, basePrice: 2.50),
        Item(name: "Frappe", assetName: "Frappe", prices: 6.50, description: "A frosty, blended item drink that’s all about creamy refreshment. Traditionally made with instant item, cold water, and sugar shaken to a thick foam, modern frappes often blend brewed item or espresso with milk, ice, and sweeteners, then finish with whipped cream or flavored drizzles. Expect a smooth, milkshake-like texture with a cool item kick—perfect for hot days and customizable with flavors like mocha, caramel, or vanilla.", itemType: .drink, basePrice: 6.50),
        Item(name: "Matcha", assetName: "Matcha", prices: 5.50, description: "A vibrant, finely ground green tea powder whisked into hot water (or milk) for a smooth, creamy cup with a naturally sweet, grassy flavor and a subtle umami finish. Unlike steeped tea, matcha uses the whole leaf, delivering a richer body and a gentle, sustained energy from its blend of caffeine and calming L‑theanine. Expect a velvety texture, bright jade color, and aromas of fresh greens and light nuttiness. Enjoy it traditionally as usucha (thin, frothy) or koicha (thick, luxurious), or try a modern twist as a matcha latte over steamed milk—dairy or plant-based—for a silky, soothing sip.", itemType: .drink, basePrice: 5.50),
        Item(name: "Macchiato", assetName: "Macchiato", prices: 4.50, description: "An espresso-forward classic “marked” with a small dollop of velvety milk foam. The macchiato preserves the intensity and aroma of a freshly pulled shot while softening its edges with just a touch of sweetness and creaminess. Expect a concentrated, bold flavor, a light, silky cap of foam, and a quick, satisfying finish. Ideal for those who love the clarity of espresso but want a hint of texture—perfect as a mid-morning pick‑me‑up.", itemType: .drink, basePrice: 4.50),
        Item(name: "Green Tea", assetName: "GreenTea", prices: 4.50, description: "A delicate, refreshing infusion made from minimally oxidized tea leaves that preserve fresh, verdant flavors and a gentle lift of caffeine. Depending on origin and style, green tea can range from grassy and sweet (Japanese sencha), to nutty and toasty (Chinese longjing), to floral and subtly fruity (jasmine‑scented). Expect a light body, clean finish, and aromas reminiscent of fresh herbs, steamed greens, or spring blossoms. Best brewed with cooler water to avoid bitterness, green tea is a calming, everyday cup that showcases clarity and nuance.", itemType: .drink, basePrice: 4.50),
        Item(name: "Black Tea", assetName: "BlackTea", prices: 4.50, description: "A robust, fully oxidized tea known for its deep color, brisk body, and comforting warmth. Black tea spans a wide flavor spectrum: malty and rich (Assam), bright and citrusy (Ceylon), honeyed and floral (Darjeeling), or smoky and bold (Lapsang Souchong). Expect a medium‑to‑full body with tannic structure, a lingering finish, and aromas that range from dried fruit and cocoa to toasted grain. Delicious plain, with lemon, or enriched with milk and sugar, black tea is a versatile daily staple and the backbone of classics like English Breakfast, Earl Grey, and Masala Chai.", itemType: .drink, basePrice: 4.50),
        Item(name: "Chai Latte", assetName: "Chai", prices: 4.50, description: "A cozy, aromatic blend of spiced black tea and steamed milk, finished with a light cap of foam. The chai base—typically infused with warming spices like cinnamon, cardamom, ginger, clove, and black pepper—delivers a fragrant sweetness and gentle heat, while the milk adds a silky, comforting texture. Expect a balanced cup that’s both invigorating and soothing, with layered spice notes and a creamy finish. Delicious on its own or sweetened with honey or vanilla, and equally inviting iced for a refreshing, spiced treat.", itemType: .drink, basePrice: 4.50),
        Item(name: "Americano", assetName: "Americano", prices: 3.50, description: "A smooth, café-classic made by diluting a shot (or two) of espresso with hot water. The Americano softens espresso’s intensity while preserving its aromatic complexity, yielding a clean, approachable cup with a light crema and a longer, sippable finish. Flavor ranges from chocolaty and nutty to bright and fruity, depending on the beans and roast. Enjoy it black for clarity, or add a splash of milk for extra softness; try it iced for a crisp, refreshing take with the same espresso backbone.", itemType: .drink, basePrice: 3.50),
        Item(name: "Cappuccino", assetName: "Cappuccino", prices: 4.50, description: "A classic espresso drink with equal parts bold espresso, steamed milk, and airy milk foam. The cappuccino delivers a harmonious balance: rich item flavor at the base, silky sweetness from the milk, and a light, velvety foam cap that adds texture and aroma. Expect a medium body, a lingering crema-like finish, and a touch of natural sweetness without overwhelming the espresso’s character. Enjoy it plain for clarity or dusted with cocoa or cinnamon for a cozy, aromatic accent. Ideal for a morning pick‑me‑up with a refined, café-style feel.", itemType: .drink, basePrice: 4.50),
    ]

    var body: some View {
    
        NavigationStack {
            ZStack {
                
                Color.sirenBeige
                    .ignoresSafeArea()
                
                VStack() {
//                    NavigationLink {
//                        InfoPage()
//                    } label : {
//                            Image(.sirenCafe)
//                                .resizable()
//                                .scaledToFit()
//                                .cornerRadius(16)
//                                .padding()
//                                .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1.0)
//                        }
//                    .accessibilityLabel("The Siren Cafe Info Page")
//                    .accessibilityHint("This button will take you to a page giving details about the cafe like address, phone number and opening date.")
                    
                    
                    Text("Popular Items")
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                        .foregroundColor(.sirenRed)
                        .offset(x: -80, y: -10)
                    
                    ScrollView(.horizontal) {
                        
                        HStack {
                            ForEach(items, id:\.self) { item in
                                NavigationLink {
                                    DrinkCustomizationView(item: item, orderedDrink: $orderedDrink)
                                } label : {
                                    itemTileView(item: item)
                                }
                            }
                        }
                    }
                    //                HStack {
                    //                    ForEach(popularItems, id:\.self) { item in
                    //                        NavigationLink {
                    //                            itemCustomizationView(item: item)
                    //                        } label : {
                    //                            itemTileView(item: item)
                    //                        }
                    //                    }
                    //                }
                    Image(.sirenCafe)
                        .resizable()
                        .scaledToFit()
                        .padding()
                }
            }
        }
    }
}

#Preview {
    PopularItemsView(orderedDrink: .constant([Item(name: "Latte", assetName: "Latte", prices: 4.5, description: "", itemType: .drink, basePrice: 4.50)]))
}
