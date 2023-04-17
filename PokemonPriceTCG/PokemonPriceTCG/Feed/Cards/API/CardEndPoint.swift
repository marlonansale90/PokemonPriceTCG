//
//  CardEndPoint.swift
//  PokemonPriceTCG
//
//  Created by Marlon Von Bernales Ansale on 17/04/2023.
//

import Foundation

public enum CardEndPoint {
    case get(_ id:String)
    case search(_ search:String)
    
    public func url(baseURL: URL) -> URL {
        switch self {
        case let .get(id):
            return URL(string: "\(baseURL.absoluteString)/v2/cards?q=set.id:\(id)")!
            
        case let .search(search):
            return URL(string: "\(baseURL.absoluteString)/v2/cards?q=name:\(search)")!
        }
    }
}
