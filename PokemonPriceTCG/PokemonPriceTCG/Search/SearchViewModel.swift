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
    
    @Published
    var cards: [CardViewModel] = []

    var cancellables: [AnyCancellable] = []
    
    init() {
        $searchTerm
            .debounce(for: .seconds(3), scheduler: DispatchQueue.main)
            .sink { search in
            
        }.store(in: &cancellables)
    }
    
}
