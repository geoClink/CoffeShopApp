import SwiftUI

//struct Product: Identifiable {
//    var id: UUID = UUID()
//    var name: String
//    
//    var description: String {
//        "\(name)"
//    }
//    
//    static var examples: [Product] = [
//        Product(name: "Cortado"),
//        Product(name: "Espresso"),
//        Product(name: "Latte"),
//        Product(name: "Black Coffee"),
//        Product(name: "Frappe"),
//        Product(name: "Matcha"),
//        Product(name: "Macchiato"),
//        Product(name: "Green Tea"),
//        Product(name: "Black Tea"),
//        Product(name: "Chai Latte"),
//        Product(name: "Americano"),
//        Product(name: "Cappuccino"),
//        Product(name: "Muffin"),
//        Product(name: "Danish"),
//        Product(name: "Croissant"),
//        Product(name: "Cupcake"),
//        Product(name: "Cinnamon Roll"),
//        Product(name: "Cookie"),
//        Product(name: "Bagel"),
//        Product(name: "Brownie"),
//    ]
//}
//
//struct ProductListView: View {
//    @State private var products: [Product] = Product.examples
//    @State private var searchResults: [Product] = []
//    @State private var searchQuery: String = ""
//    
//    private var isSearching: Bool {
//        !searchQuery.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
//    }
//    
//    var body: some View {
//        NavigationStack {
//            List {
//                if isSearching {
//                    ForEach(searchResults) { product in
//                        Text(product.description)
//                    }
//                } else {
//                    ForEach(products) { product in
//                        Text(product.description)
//                    }
//                }
//            }
//            .navigationTitle("Products")
//            .searchable(text: $searchQuery,
//                        placement: .automatic,
//                        prompt: "Name of Product")
//            .textInputAutocapitalization(.never)
//            .onChange(of: searchQuery) { newValue in
//                fetchSearchResults(for: newValue)
//            }
//            .overlay {
//                if isSearching && searchResults.isEmpty {
//                    ContentUnavailableView(
//                        "Product not available",
//                        systemImage: "magnifyingglass",
//                        description: Text("No results for \(searchQuery)")
//                    )
//                }
//            }
//        }
//    }
//    
//    private func fetchSearchResults(for query: String) {
//        let trimmed = query.trimmingCharacters(in: .whitespacesAndNewlines)
//        guard !trimmed.isEmpty else {
//            searchResults = []
//            return
//        }
//        let lowercasedQuery = trimmed.lowercased()
//        searchResults = products.filter { product in
//            product.description.lowercased().contains(lowercasedQuery)
//        }
//    }
//}
