//
//  SearchViewModel.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import Foundation
import Combine

class SearchViewModel: ObservableObject {
    
    @Published
    var searchTerm: String = ""
    var cancellables: [AnyCancellable] = []
    
    enum StateSearch {
        case loading
        case loaded(items: [CardViewModel])
    }
    
    var searchCallBack: ((String) -> Void)? = nil
    
    init () {
        $searchTerm
            .debounce(for: .seconds(3), scheduler: DispatchQueue.main)
            .sink { [searchCallBack] search in
                searchCallBack?(search)
            }.store(in: &cancellables)
    }
    

//
//    @Published
//    private(set) var cards: [CardViewModel] = []
//
//    var cancellables: [AnyCancellable] = []
//
//    init(searchCardLoader: @escaping (String) -> AnyPublisher<[Card], Error>) {
//        $searchTerm
//            .debounce(for: .seconds(3), scheduler: DispatchQueue.main)
//            .sink { [searchCardLoader] search in
//
//                searchCardLoader(search).map { [self] cards in
//                    self.cards = cards.map({ card in
//
//                    })
//                }
//
//            }.store(in: &cancellables)
//    }
}
