import SwiftUI

struct Item: Identifiable {
    let id = UUID()
    let name: String
}

struct SearchView: View {
    let items = [
        Item(name: "Apple"),
        Item(name: "Banana"),
        Item(name: "Cherry"),
        Item(name: "Durian"),
        Item(name: "Elderberry"),
        Item(name: "Fig"),
        Item(name: "Grape"),
        Item(name: "Honeydew"),
        Item(name: "Iced tea"),
        Item(name: "Jalapeno"),
        Item(name: "Kiwi"),
        Item(name: "Lemon"),
        Item(name: "Mango")
    ]
    
    @State private var searchTerm: String = ""
    @State private var viewModel: SearchViewModel

    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
    }
    
    var filteredItems: [Item] {
        if searchTerm.isEmpty {
            return items
        } else {
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchTerm) }
        }
    }
    
    var body: some View {
        NavigationView {
            List(filteredItems) { item in
                Text(item.name)
            }
            .searchable(text: $searchTerm)
        
            .navigationTitle("Fruit")
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(viewModel: SearchViewModel())
    }
}
