//
//  ComicDTO.swift
//  Marvel Characters
//
//  Created by Alfredo Rebolloso on 03/12/2020.
//

import Foundation

public struct CategoryDTO: Codable {

    public var available: String?
    public var collectionURI: String?
    public var items: [ItemDTO]?
    
    public init(available: String, collectionURI: String, items: [ItemDTO]) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
    }
}
