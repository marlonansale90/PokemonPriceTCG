//
//  HTTPURLResponse+StatusCode.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import Foundation

public extension HTTPURLResponse {
    private static var OK_200: Int { return 200 }

    var isOK: Bool {
        return statusCode == HTTPURLResponse.OK_200
    }
}
