//
//  MainScreen.swift
//  CoffeShopApp
//
//  Created by George Clinkscales on 10/27/25.
//

import SwiftUI

struct MainScreen: View {
    @State private var showingSheet: Bool = false
    @State private var search = ""
//
//    private let allItems = [
//        "Bagel",
//        "Cookie",
//        "Cinnamon Roll",
//        "Cupcake",
//        "Croissant",
//        "Danish",
//        "Muffin",
//        "Cortado",
//        "Espresso",
//        "Latte",
//        "Black item",
//        "Frappe",
//        "Matcha",
//        "Macchiato",
//        "Green Tea",
//        "Black Tea",
//        "Chai Latte",
//        "Americano",
//        "Cappuccino",
//    ]
    
    var whenSearching: [Item] {
        if search.isEmpty {
            items
        } else {
            items.filter { $0.name.localizedStandardContains(search) }
        }
    }
    
//    private var filteredItems: [String] {
//        let trimmed = search.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !trimmed.isEmpty else {
//            return allItems
//        }
//        return .filter { $0.range(of: trimmed,
//                                          options: .caseInsensitive) != nil }
//    }
//    
//    var items: [Item] = [
//        Item(name: "Cortado", assetName: "Cortado", prices: 4.50, description: "A balanced, no-frills espresso drink made by “cutting” a double shot of espresso with an equal amount of warm, lightly textured milk. The cortado softens espresso’s intensity without masking its character, delivering a smooth, focused flavor with gentle sweetness and minimal foam. It’s small, straightforward, and ideal for those who want the clarity of espresso with just enough milk to round the edges.", basePrice: 4.50),
//        item(name: "Espresso", assetName: "Espresso", prices: 2.50, description: "A concentrated item brewed by forcing hot water through finely ground beans under high pressure. Espresso delivers an intense, full-bodied shot with rich crema on top, showcasing the item’s purest flavors—bittersweet chocolate, caramel, fruit, or nutty notes depending on the roast. It’s small but powerful, meant to be sipped and savored, and serves as the foundation for many café classics like lattes, cappuccinos, macchiatos, and americanos. Perfect for a quick, flavorful boost with a lingering, satisfying finish.", basePrice: 2.50),
//        item(name: "Latte", assetName: "Latte", prices: 5.50, description: "A smooth and creamy espresso-based beverage made with freshly pulled espresso and steamed milk, finished with a thin layer of silky microfoam. The latte balances bold item notes with a mellow, velvety texture, making it comforting and approachable. Enjoy it plain to appreciate the espresso’s character, or customize with flavors like vanilla, caramel, or hazelnut. Perfect for a gentle caffeine lift and a luxurious, everyday sip.", basePrice: 5.50),
//        item(name: "Black item", assetName: "Blackitem", prices: 2.50, description: "A pure, unadorned brew made from freshly ground item and hot water—no milk, no sugar, just the item itself. Black item highlights the bean’s true character: from bright, citrusy and floral in lighter roasts to rich, chocolaty, and nutty in darker roasts. Clean and straightforward, it offers a crisp mouthfeel and a lingering finish. Ideal for those who appreciate clarity of flavor and the nuances of origin, roast, and brew method.", basePrice: 2.50),
//        item(name: "Frappe", assetName: "Frappe", prices: 6.50, description: "A frosty, blended item drink that’s all about creamy refreshment. Traditionally made with instant item, cold water, and sugar shaken to a thick foam, modern frappes often blend brewed item or espresso with milk, ice, and sweeteners, then finish with whipped cream or flavored drizzles. Expect a smooth, milkshake-like texture with a cool item kick—perfect for hot days and customizable with flavors like mocha, caramel, or vanilla.", basePrice: 6.50),
//        item(name: "Matcha", assetName: "Matcha", prices: 5.50, description: "A vibrant, finely ground green tea powder whisked into hot water (or milk) for a smooth, creamy cup with a naturally sweet, grassy flavor and a subtle umami finish. Unlike steeped tea, matcha uses the whole leaf, delivering a richer body and a gentle, sustained energy from its blend of caffeine and calming L‑theanine. Expect a velvety texture, bright jade color, and aromas of fresh greens and light nuttiness. Enjoy it traditionally as usucha (thin, frothy) or koicha (thick, luxurious), or try a modern twist as a matcha latte over steamed milk—dairy or plant-based—for a silky, soothing sip.", basePrice: 5.50),
//        item(name: "Macchiato", assetName: "Macchiato", prices: 4.50, description: "An espresso-forward classic “marked” with a small dollop of velvety milk foam. The macchiato preserves the intensity and aroma of a freshly pulled shot while softening its edges with just a touch of sweetness and creaminess. Expect a concentrated, bold flavor, a light, silky cap of foam, and a quick, satisfying finish. Ideal for those who love the clarity of espresso but want a hint of texture—perfect as a mid-morning pick‑me‑up.", basePrice: 4.5),
//        item(name: "Green Tea", assetName: "GreenTea", prices: 4.50, description: "A delicate, refreshing infusion made from minimally oxidized tea leaves that preserve fresh, verdant flavors and a gentle lift of caffeine. Depending on origin and style, green tea can range from grassy and sweet (Japanese sencha), to nutty and toasty (Chinese longjing), to floral and subtly fruity (jasmine‑scented). Expect a light body, clean finish, and aromas reminiscent of fresh herbs, steamed greens, or spring blossoms. Best brewed with cooler water to avoid bitterness, green tea is a calming, everyday cup that showcases clarity and nuance.", basePrice: 4.50),
//        item(name: "Black Tea", assetName: "BlackTea", prices: 4.50, description: "A robust, fully oxidized tea known for its deep color, brisk body, and comforting warmth. Black tea spans a wide flavor spectrum: malty and rich (Assam), bright and citrusy (Ceylon), honeyed and floral (Darjeeling), or smoky and bold (Lapsang Souchong). Expect a medium‑to‑full body with tannic structure, a lingering finish, and aromas that range from dried fruit and cocoa to toasted grain. Delicious plain, with lemon, or enriched with milk and sugar, black tea is a versatile daily staple and the backbone of classics like English Breakfast, Earl Grey, and Masala Chai.", basePrice: 4.50),
//        item(name: "Chai Latte", assetName: "Chai", prices: 4.50, description: "A cozy, aromatic blend of spiced black tea and steamed milk, finished with a light cap of foam. The chai base—typically infused with warming spices like cinnamon, cardamom, ginger, clove, and black pepper—delivers a fragrant sweetness and gentle heat, while the milk adds a silky, comforting texture. Expect a balanced cup that’s both invigorating and soothing, with layered spice notes and a creamy finish. Delicious on its own or sweetened with honey or vanilla, and equally inviting iced for a refreshing, spiced treat.", basePrice: 4.50),
//        item(name: "Americano", assetName: "Americano", prices: 3.50, description: "A smooth, café-classic made by diluting a shot (or two) of espresso with hot water. The Americano softens espresso’s intensity while preserving its aromatic complexity, yielding a clean, approachable cup with a light crema and a longer, sippable finish. Flavor ranges from chocolaty and nutty to bright and fruity, depending on the beans and roast. Enjoy it black for clarity, or add a splash of milk for extra softness; try it iced for a crisp, refreshing take with the same espresso backbone.", basePrice: 3.50),
//        item(name: "Cappuccino", assetName: "Cappuccino", prices: 4.50, description: "A classic espresso drink with equal parts bold espresso, steamed milk, and airy milk foam. The cappuccino delivers a harmonious balance: rich item flavor at the base, silky sweetness from the milk, and a light, velvety foam cap that adds texture and aroma. Expect a medium body, a lingering crema-like finish, and a touch of natural sweetness without overwhelming the espresso’s character. Enjoy it plain for clarity or dusted with cocoa or cinnamon for a cozy, aromatic accent. Ideal for a morning pick‑me‑up with a refined, café-style feel.", basePrice: 4.50),
//        item(name: "Mocha", assetName: "Mocha", prices: 4.50, description: "A rich blend of velvety espresso and steamed milk infused with decadent dark chocolate, finished with a light cap of microfoam. Balanced and indulgent, with notes of cocoa, caramelized sugar, and a smooth, creamy body. Available hot or iced; customize with your choice of milk and an optional whipped cream topping.", basePrice: 4.50),
//    ]
    
    
    var pastries: [Pastry] = [
        Pastry(name: "Muffin", assetName: "Muffin", prices: 3.50, description: "A muffin is a small, individual-sized baked good with a soft, tender crumb and a slightly domed top. Typically made from a quick-bread batter of flour, eggs, milk, sugar, and butter or oil, muffins are mixed just until combined, which keeps them moist and pleasantly dense. They come in a wide range of flavors and add-ins—like blueberries, chocolate chips, nuts, or warm spices such as cinnamon. The exterior is lightly golden with a gentle crust, while the inside remains fluffy and moist. Muffins are often enjoyed warm, sometimes split and buttered, and are a popular choice for breakfast, snacks, or casual desserts. They can be baked in paper liners or directly in a muffin tin, and their versatility makes them easy to adapt to dietary preferences and seasonal ingredients."),
        Pastry(name: "Danish", assetName: "Danish", prices: 3.50, description: "A Danish is a flaky, buttery pastry known for its delicate layers and slightly crisp exterior that gives way to a tender, airy crumb. Made from laminated dough—similar to croissant dough—it’s enriched with butter and often lightly sweetened. During baking, the layers puff and separate, creating a light, melt-in-your-mouth texture."),
        Pastry(name: "Croissant", assetName: "Croissant", prices: 4.50, description: "A croissant is a classic French pastry celebrated for its crescent shape, flaky layers, and rich, buttery flavor. Made from laminated dough—where butter is folded into dough multiple times—the croissant develops ultra-thin layers that puff beautifully in the oven, creating a crisp, golden exterior and a tender, honeycombed interior."),
        Pastry(name: "Cupcake", assetName: "CupCake", prices: 2.50, description: "A cupcake is a small, individual cake baked in a paper or foil liner, known for its soft, tender crumb and charming presentation. Made from a simple batter of flour, sugar, eggs, butter (or oil), and leavening, cupcakes bake quickly and evenly, producing a moist interior with a lightly golden exterior. They’re often topped with swirls of frosting—like buttercream, cream cheese, or ganache—and decorated with sprinkles, fruit, or other garnishes."),
        Pastry(name: "Cinnamon Roll", assetName: "CinnamonRoll", prices: 4.50, description: "A cinnamon roll is a soft, spiraled pastry made from enriched dough that’s rolled thin, spread with a buttery cinnamon-sugar filling, then coiled into a signature swirl before baking. As it rises and bakes, the layers puff and fuse, creating a tender, pillowy interior with ribbons of caramelized cinnamon running through each bite. The exterior is lightly golden, often with a gentle crust that gives way to a warm, fragrant center."),
        Pastry(name: "Cookie", assetName: "Cookie", prices: 2.50, description: "A cookie is a small, sweet baked treat with a satisfying balance of texture and flavor, ranging from soft and chewy to crisp and crunchy. Typically made from a simple dough of flour, sugar, butter, and eggs—often enhanced with vanilla, chocolate, spices, or nuts—cookies are portioned into individual rounds or shapes and baked until just set. Their aroma is warm and inviting, with caramelized edges and a tender or snappy bite depending on the style."),
        Pastry(name: "Bagel", assetName: "Bagel", prices: 3.50, description: "A bagel is a dense, chewy round bread with a distinctive glossy crust and a hole in the center. Traditionally made from a simple yeasted dough, it’s shaped into rings, briefly boiled to set the exterior, then baked to achieve its signature chew and shine. The result is a satisfying contrast: a firm, slightly crisp outer shell and a tight, tender crumb inside."),
        Pastry(name: "Brownie", assetName: "Brownie", prices: 3.50, description: "A brownie is a rich, chocolatey baked square with a dense, fudgy or cakey texture depending on the recipe. Made from a simple batter of melted chocolate or cocoa, butter, sugar, eggs, and flour, brownies bake into a glossy-topped slab that’s cut into individual pieces. The edges tend to be slightly chewy with a deeper caramelized flavor, while the center remains soft and moist, often with a melt-in-your-mouth quality."),
    ]
    
    
    
    var items: [Item] = [
        Item(name: "Cortado", assetName: "Cortado", prices: 4.50, description: "A balanced, no-frills espresso drink made by “cutting” a double shot of espresso with an equal amount of warm, lightly textured milk. The cortado softens espresso’s intensity without masking its character, delivering a smooth, focused flavor with gentle sweetness and minimal foam. It’s small, straightforward, and ideal for those who want the clarity of espresso with just enough milk to round the edges.", itemType: .drink, basePrice: 4.50),
        Item(name: "Espresso", assetName: "Espresso", prices: 2.50, description: "A concentrated item brewed by forcing hot water through finely ground beans under high pressure. Espresso delivers an intense, full-bodied shot with rich crema on top, showcasing the item’s purest flavors—bittersweet chocolate, caramel, fruit, or nutty notes depending on the roast. It’s small but powerful, meant to be sipped and savored, and serves as the foundation for many café classics like lattes, cappuccinos, macchiatos, and americanos. Perfect for a quick, flavorful boost with a lingering, satisfying finish.", itemType: .drink, basePrice: 2.50),
        Item(name: "Latte", assetName: "Latte", prices: 5.50, description: "A smooth and creamy espresso-based beverage made with freshly pulled espresso and steamed milk, finished with a thin layer of silky microfoam. The latte balances bold item notes with a mellow, velvety texture, making it comforting and approachable. Enjoy it plain to appreciate the espresso’s character, or customize with flavors like vanilla, caramel, or hazelnut. Perfect for a gentle caffeine lift and a luxurious, everyday sip.", itemType: .drink, basePrice: 5.50),
        Item(name: "Black item", assetName: "Blackitem", prices: 2.50, description: "A pure, unadorned brew made from freshly ground item and hot water—no milk, no sugar, just the item itself. Black item highlights the bean’s true character: from bright, citrusy and floral in lighter roasts to rich, chocolaty, and nutty in darker roasts. Clean and straightforward, it offers a crisp mouthfeel and a lingering finish. Ideal for those who appreciate clarity of flavor and the nuances of origin, roast, and brew method.", itemType: .drink, basePrice: 2.50),
        Item(name: "Frappe", assetName: "Frappe", prices: 6.50, description: "A frosty, blended item drink that’s all about creamy refreshment. Traditionally made with instant item, cold water, and sugar shaken to a thick foam, modern frappes often blend brewed item or espresso with milk, ice, and sweeteners, then finish with whipped cream or flavored drizzles. Expect a smooth, milkshake-like texture with a cool item kick—perfect for hot days and customizable with flavors like mocha, caramel, or vanilla.", itemType: .drink, basePrice: 6.50),
        Item(name: "Matcha", assetName: "Matcha", prices: 5.50, description: "A vibrant, finely ground green tea powder whisked into hot water (or milk) for a smooth, creamy cup with a naturally sweet, grassy flavor and a subtle umami finish. Unlike steeped tea, matcha uses the whole leaf, delivering a richer body and a gentle, sustained energy from its blend of caffeine and calming L‑theanine. Expect a velvety texture, bright jade color, and aromas of fresh greens and light nuttiness. Enjoy it traditionally as usucha (thin, frothy) or koicha (thick, luxurious), or try a modern twist as a matcha latte over steamed milk—dairy or plant-based—for a silky, soothing sip.", itemType: .drink, basePrice: 5.50),
        Item(name: "Macchiato", assetName: "Macchiato", prices: 4.50, description: "An espresso-forward classic “marked” with a small dollop of velvety milk foam. The macchiato preserves the intensity and aroma of a freshly pulled shot while softening its edges with just a touch of sweetness and creaminess. Expect a concentrated, bold flavor, a light, silky cap of foam, and a quick, satisfying finish. Ideal for those who love the clarity of espresso but want a hint of texture—perfect as a mid-morning pick‑me‑up.", itemType: .drink, basePrice: 4.50),
        Item(name: "Green Tea", assetName: "GreenTea", prices: 4.50, description: "A delicate, refreshing infusion made from minimally oxidized tea leaves that preserve fresh, verdant flavors and a gentle lift of caffeine. Depending on origin and style, green tea can range from grassy and sweet (Japanese sencha), to nutty and toasty (Chinese longjing), to floral and subtly fruity (jasmine‑scented). Expect a light body, clean finish, and aromas reminiscent of fresh herbs, steamed greens, or spring blossoms. Best brewed with cooler water to avoid bitterness, green tea is a calming, everyday cup that showcases clarity and nuance.", itemType: .drink, basePrice: 4.50),
        Item(name: "Black Tea", assetName: "BlackTea", prices: 4.50, description: "A robust, fully oxidized tea known for its deep color, brisk body, and comforting warmth. Black tea spans a wide flavor spectrum: malty and rich (Assam), bright and citrusy (Ceylon), honeyed and floral (Darjeeling), or smoky and bold (Lapsang Souchong). Expect a medium‑to‑full body with tannic structure, a lingering finish, and aromas that range from dried fruit and cocoa to toasted grain. Delicious plain, with lemon, or enriched with milk and sugar, black tea is a versatile daily staple and the backbone of classics like English Breakfast, Earl Grey, and Masala Chai.", itemType: .drink, basePrice: 4.50),
        Item(name: "Chai Latte", assetName: "Chai", prices: 4.50, description: "A cozy, aromatic blend of spiced black tea and steamed milk, finished with a light cap of foam. The chai base—typically infused with warming spices like cinnamon, cardamom, ginger, clove, and black pepper—delivers a fragrant sweetness and gentle heat, while the milk adds a silky, comforting texture. Expect a balanced cup that’s both invigorating and soothing, with layered spice notes and a creamy finish. Delicious on its own or sweetened with honey or vanilla, and equally inviting iced for a refreshing, spiced treat.", itemType: .drink, basePrice: 4.50),
        Item(name: "Americano", assetName: "Americano", prices: 3.50, description: "A smooth, café-classic made by diluting a shot (or two) of espresso with hot water. The Americano softens espresso’s intensity while preserving its aromatic complexity, yielding a clean, approachable cup with a light crema and a longer, sippable finish. Flavor ranges from chocolaty and nutty to bright and fruity, depending on the beans and roast. Enjoy it black for clarity, or add a splash of milk for extra softness; try it iced for a crisp, refreshing take with the same espresso backbone.", itemType: .drink, basePrice: 3.50),
        Item(name: "Cappuccino", assetName: "Cappuccino", prices: 4.50, description: "A classic espresso drink with equal parts bold espresso, steamed milk, and airy milk foam. The cappuccino delivers a harmonious balance: rich item flavor at the base, silky sweetness from the milk, and a light, velvety foam cap that adds texture and aroma. Expect a medium body, a lingering crema-like finish, and a touch of natural sweetness without overwhelming the espresso’s character. Enjoy it plain for clarity or dusted with cocoa or cinnamon for a cozy, aromatic accent. Ideal for a morning pick‑me‑up with a refined, café-style feel.", itemType: .drink, basePrice: 4.50),
        Item(name: "Muffin", assetName: "Muffin", prices: 3.50, description: "A muffin is a small, individual-sized baked good with a soft, tender crumb and a slightly domed top. Typically made from a quick-bread batter of flour, eggs, milk, sugar, and butter or oil, muffins are mixed just until combined, which keeps them moist and pleasantly dense. They come in a wide range of flavors and add-ins—like blueberries, chocolate chips, nuts, or warm spices such as cinnamon. The exterior is lightly golden with a gentle crust, while the inside remains fluffy and moist. Muffins are often enjoyed warm, sometimes split and buttered, and are a popular choice for breakfast, snacks, or casual desserts. They can be baked in paper liners or directly in a muffin tin, and their versatility makes them easy to adapt to dietary preferences and seasonal ingredients.", itemType: .pastry, basePrice: 3.50),
        Item(name: "Danish", assetName: "Danish", prices: 3.50, description: "A Danish is a flaky, buttery pastry known for its delicate layers and slightly crisp exterior that gives way to a tender, airy crumb. Made from laminated dough—similar to croissant dough—it’s enriched with butter and often lightly sweetened. During baking, the layers puff and separate, creating a light, melt-in-your-mouth texture.", itemType: .pastry, basePrice: 3.50),
        Item(name: "Croissant", assetName: "Croissant", prices: 4.50, description: "A croissant is a classic French pastry celebrated for its crescent shape, flaky layers, and rich, buttery flavor. Made from laminated dough—where butter is folded into dough multiple times—the croissant develops ultra-thin layers that puff beautifully in the oven, creating a crisp, golden exterior and a tender, honeycombed interior.", itemType: .pastry, basePrice: 4.50),
        Item(name: "Cupcake", assetName: "CupCake", prices: 2.50, description: "A cupcake is a small, individual cake baked in a paper or foil liner, known for its soft, tender crumb and charming presentation. Made from a simple batter of flour, sugar, eggs, butter (or oil), and leavening, cupcakes bake quickly and evenly, producing a moist interior with a lightly golden exterior. They’re often topped with swirls of frosting—like buttercream, cream cheese, or ganache—and decorated with sprinkles, fruit, or other garnishes.", itemType: .pastry, basePrice: 2.50),
        Item(name: "Cinnamon Roll", assetName: "CinnamonRoll", prices: 4.50, description: "A cinnamon roll is a soft, spiraled pastry made from enriched dough that’s rolled thin, spread with a buttery cinnamon-sugar filling, then coiled into a signature swirl before baking. As it rises and bakes, the layers puff and fuse, creating a tender, pillowy interior with ribbons of caramelized cinnamon running through each bite. The exterior is lightly golden, often with a gentle crust that gives way to a warm, fragrant center.", itemType: .pastry, basePrice: 4.50),
        Item(name: "Cookie", assetName: "Cookie", prices: 2.50, description: "A cookie is a small, sweet baked treat with a satisfying balance of texture and flavor, ranging from soft and chewy to crisp and crunchy. Typically made from a simple dough of flour, sugar, butter, and eggs—often enhanced with vanilla, chocolate, spices, or nuts—cookies are portioned into individual rounds or shapes and baked until just set. Their aroma is warm and inviting, with caramelized edges and a tender or snappy bite depending on the style.", itemType: .pastry, basePrice: 2.50),
        Item(name: "Bagel", assetName: "Bagel", prices: 3.50, description: "A bagel is a dense, chewy round bread with a distinctive glossy crust and a hole in the center. Traditionally made from a simple yeasted dough, it’s shaped into rings, briefly boiled to set the exterior, then baked to achieve its signature chew and shine. The result is a satisfying contrast: a firm, slightly crisp outer shell and a tight, tender crumb inside.", itemType: .pastry, basePrice: 3.50),
        Item(name: "Brownie", assetName: "Brownie", prices: 3.50, description: "A brownie is a rich, chocolatey baked square with a dense, fudgy or cakey texture depending on the recipe. Made from a simple batter of melted chocolate or cocoa, butter, sugar, eggs, and flour, brownies bake into a glossy-topped slab that’s cut into individual pieces. The edges tend to be slightly chewy with a deeper caramelized flavor, while the center remains soft and moist, often with a melt-in-your-mouth quality.", itemType: .pastry, basePrice: 3.50),
    ]
    
    
    var popularDrinks: [popDrink] = [
        
        
        popDrink(name: "Latte", assetName: "Latte", prices: 5.50, description: "A smooth and creamy espresso-based beverage made with freshly pulled espresso and steamed milk, finished with a thin layer of silky microfoam. The latte balances bold item notes with a mellow, velvety texture, making it comforting and approachable. Enjoy it plain to appreciate the espresso’s character, or customize with flavors like vanilla, caramel, or hazelnut. Perfect for a gentle caffeine lift and a luxurious, everyday sip."),
        popDrink(name: "Cortado", assetName: "Mocha", prices: 4.50, description: "A balanced, no-frills espresso drink made by “cutting” a double shot of espresso with an equal amount of warm, lightly textured milk. The cortado softens espresso’s intensity without masking its character, delivering a smooth, focused flavor with gentle sweetness and minimal foam. It’s small, straightforward, and ideal for those who want the clarity of espresso with just enough milk to round the edges."),
        popDrink(name: "Frappe", assetName: "Frappe", prices: 6.50, description: "A frosty, blended item drink that’s all about creamy refreshment. Traditionally made with instant item, cold water, and sugar shaken to a thick foam, modern frappes often blend brewed item or espresso with milk, ice, and sweeteners, then finish with whipped cream or flavored drizzles. Expect a smooth, milkshake-like texture with a cool item kick—perfect for hot days and customizable with flavors like mocha, caramel, or vanilla."),
        popDrink(name: "Macchiato", assetName: "Macchiato", prices: 4.50, description: "An espresso-forward classic “marked” with a small dollop of velvety milk foam. The macchiato preserves the intensity and aroma of a freshly pulled shot while softening its edges with just a touch of sweetness and creaminess. Expect a concentrated, bold flavor, a light, silky cap of foam, and a quick, satisfying finish. Ideal for those who love the clarity of espresso but want a hint of texture—perfect as a mid-morning pick‑me‑up.")
    ]
    
    var body: some View {
        NavigationStack() {
            
            ZStack{
                Color.sirenBeige
                    .edgesIgnoringSafeArea(.all)
                ScrollView(.vertical) {
                    
                    
                    
                    
                    VStack {
                        
                        VStack (alignment: .leading) {
                            
                            Button(action: {
                                showingSheet.toggle()
                            }) {
                                
                                Image(.sirenCafe)
                                    .resizable()
                                    .scaledToFit()
                                
                                    .cornerRadius(16)
                                    .padding()
                                    .shadow(color: Color(.black), radius: 5, x: 1.0, y: 1.0)
                            }
                            .accessibilityLabel("The Siren Cafe Info Page")
                            .accessibilityHint("This button will take you to a page giving details about the cafe like address, phone number and opening date.")
                            
                            
                            
                            VStack(alignment: .leading){
                                
//                                SearchView()
//                                    .padding(.horizontal)
                                
                                NavigationLink {
                                    PopularItemsView()
                                } label: {
                                    ImageSliderView()
                                }
                                .accessibilityLabel("An image slider displaying popular drinks.")
                                .accessibilityHint("Clicking this image slider will take you to a page that diplays popular drinks.")
                                
                                
//                                VStack(alignment: .leading){
//                                    Text("All Menu Items")
//                                        .font(.title)
//                                        .fontWeight(.bold)
//                                        .padding(.horizontal)
//                                        .foregroundColor(.sirenRed)
//                                    
//                                    ScrollView(.horizontal) {
//                                        VStack(alignment: .leading) {
//                                            
//                                            HStack {
//                                                ForEach(items, id:\.self) { item in
//                                                    NavigationLink {
//                                                        // PastryCustomizationView(pastry: item)
//                                                    } label: {
//                                                        ItemTileView(item: item)
//                                                    }
//                                                }
//                                            }
//                                        }
//                                    }
//                                }
//                                .padding()
                                
                                
                                Text("Drinks")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.horizontal)
                                    .foregroundColor(.sirenRed)
                                
                                ScrollView(.horizontal) {
                                    
                                    HStack {
                                        ForEach(whenSearching.filter { $0.itemType == .drink }, id:\.self) { item in
                                            NavigationLink {
                                                itemCustomizationView(item: item)
                                            } label: {
                                                itemTileView(item: item)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 5)
                                }
                            }
                        }
                        .sheet(isPresented: $showingSheet) {
                            InfoPage()
                            
                        }
                        VStack(alignment: .leading){
                            Text("Pastries")
                                .font(.title)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                                .foregroundColor(.sirenRed)
                            
                            ScrollView(.horizontal) {
                                VStack(alignment: .leading) {
                                    
                                    HStack {
                                        ForEach(whenSearching.filter { $0.itemType == .pastry }, id:\.self) { item in
                                            NavigationLink {
                                                itemCustomizationView(item: item)
                                            } label: {
                                                itemTileView(item: item)
                                            }
                                        }
                                    }
                                    .padding(.horizontal, 5)
                                    
                                    
//                                    HStack {
//                                        ForEach(pastries, id:\.self) { pastry in
//                                            NavigationLink {
//                                                PastryCustomizationView(pastry: pastry)
//                                            } label: {
//                                                PastryTileView(pastry: pastry)
//                                            }
//                                        }
//                                    }
                                }
                            }
                        }
                        .padding(.horizontal, 5)
                        
    
                        
                        Image(.sirenCafe)
                            .resizable()
                            .scaledToFit()
                        
                        Link("Book A Room With Us At The Siren Hotel?", destination: URL(string: "https://ash.world/hotels/the-siren/rooms/")!)
                    }
                }
            }
        }
        .searchable(text: $search, placement: .toolbar)
    }
}

#Preview {
    MainScreen()
}
