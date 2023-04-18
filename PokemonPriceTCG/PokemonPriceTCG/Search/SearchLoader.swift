//
//  SearchLoader.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 18/04/2023.
//

import Foundation
import Combine

protocol SearchLoader {
    func searchCard(search: String) -> AnyPublisher<[Card], Error>
}

class SearchUseCase: SearchLoader {
    let httpClient: HTTPClient
    let baseURL: URL
    let scheduler: DispatchQueue
    
    init (httpClient: HTTPClient, baseURL: URL, scheduler: DispatchQueue){
        self.httpClient = httpClient
        self.baseURL = baseURL
        self.scheduler = scheduler
    }
    
    func searchCard(search: String) -> AnyPublisher<[Card], Error> {
        let url = CardEndPoint.search(search).url(baseURL: baseURL)
        
        return httpClient
            .getPublisher(url: url)
            .tryMap(CardMapper.map)
            .subscribe(on: scheduler)
            .eraseToAnyPublisher()
    }
}
