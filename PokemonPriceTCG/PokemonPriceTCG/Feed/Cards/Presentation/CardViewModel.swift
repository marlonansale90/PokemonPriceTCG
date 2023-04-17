//
//  CardViewModel.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import Foundation

public struct CardViewModel: Identifiable {
    public let id: String
    public let name: String
    public let cardSet: String
    public let number: String
   
    public init(id:String, name: String, cardSet: String, number: String) {
        self.id = id
        self.name = name
        self.cardSet = cardSet
        self.number = number
    }
}
