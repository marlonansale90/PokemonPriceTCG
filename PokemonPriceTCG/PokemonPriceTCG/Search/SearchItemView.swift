//
//  SearchItemView.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import SwiftUI

struct SearchItemView: View {
    let card: CardViewModel
    
    var body: some View {
        VStack {
            HStack {
                Text(card.name)
                Text(card.number)
            }
            
            Text(card.cardSet)
        }
    }
}
