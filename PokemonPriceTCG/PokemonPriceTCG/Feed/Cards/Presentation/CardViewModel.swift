//
//  CardViewModel.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import Foundation

public struct CardViewModel {
    public let name: String
    public let cardSet: String
    public let number: String
    
    public init(name: String, cardSet: String, number: String) {
        self.name = name
        self.cardSet = cardSet
        self.number = number
    }
}
