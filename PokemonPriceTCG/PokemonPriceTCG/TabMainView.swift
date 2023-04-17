//
//  ContentView.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import SwiftUI

struct TabMainView: View {
    
    let homeView: HomeView
    let searchView: SearchView
    
    var body: some View {
        TabView {
            homeView .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }
                .tag(1)
            searchView.tabItem {
                Image(systemName: "magnifyingglass")
                Text("Search")
            }
            .tag(0)
        }
    }
}

struct TabMainView_Previews: PreviewProvider {
    static var previews: some View {
        TabMainView(
            homeView:
                HomeView(),
            searchView:
                SearchView(viewModel: SearchViewModel())
        )
                
    }
}
