//
//  Legalities.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//


import Foundation

public struct Legalities: Hashable {
    public let isUnlimited: Bool
    public let isStandard: Bool
    public let isExpanded: Bool
    
    public init(isUnlimited: Bool, isStandard: Bool, isExpanded: Bool) {
        self.isUnlimited = isUnlimited
        self.isStandard = isStandard
        self.isExpanded = isExpanded
    }
    
    public static func checkLegality(legality:String?) -> Bool {
        guard let legality = legality else {
            return false
        }
        
        return legality == "Legal"
    }
}

