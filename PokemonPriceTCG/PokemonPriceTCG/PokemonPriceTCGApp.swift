//
//  PokemonPriceTCGApp.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import SwiftUI
import Combine

@main
struct PokemonPriceTCGApp: App {
    
    private lazy var baseURL = URL(string: "https://api.pokemontcg.io")!
    
    private lazy var scheduler: DispatchQueue = DispatchQueue(
        label: "com.pokemontcg.infra.queue",
        qos: .userInitiated,
        attributes: .concurrent
    )
    
    private lazy var httpClient: HTTPClient = {
        URLSessionHTTPClient(session: URLSession(configuration: .ephemeral))
    }()

    var body: some Scene {
        WindowGroup {
            TabMainView(homeView: makeHomeView(),
                        searchView: makeSearchView(searchCardLoader: self.makeRemoteSearchCardsLoader(search:)))
        }
    }
    
    private func makeHomeView() -> HomeView {
        return HomeView()
    }
    
    private mutating func makeSearchView() -> SearchView {
        
    }
    
    private mutating func makeRemoteSearchCardsLoader(search: String) -> AnyPublisher<[Card], Error> {
        let url = CardEndPoint.search(search).url(baseURL: baseURL)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(CardMapper.map)
            .subscribe(on: scheduler)
            .eraseToAnyPublisher()
        
    }
}

class SearchViewFactory {
    private init() {}
    
    @MainActor
    static func makeSearchView(searchLoader:  AnyPublisher<[Card], Error>) -> SearchView {
        
        let viewModel = SearchViewModel()
        
        
        viewModel.searchCallBack = { search in
            
        }
        
        let searchView = SearchView(viewModel: SearchViewModel())
        return searchView
    }
}

class SearchAdapter {
    
}
