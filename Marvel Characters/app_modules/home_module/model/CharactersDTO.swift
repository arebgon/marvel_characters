//
//  CharactersDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct CharactersDTO: Codable {

    //MARK: Properties
    public var offset: Int?
    public var limit: Int?
    public var total: Int?
    public var count: Int?
    public var results: [CharacterDTO]?
    
    //MARK: Constructors
    init(){}
    
    public init(results: [CharacterDTO]) {
        self.results = results
    }
}
