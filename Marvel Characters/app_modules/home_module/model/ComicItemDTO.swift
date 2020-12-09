//
//  ComicItemDTO.swift
//  Marvel Characters
//
//  Created by Alfredo Rebolloso on 03/12/2020.
//

import Foundation

public struct ItemDTO: Codable {

    public var resourceURI: String?
    public var name: String?
    public var type: String?
    
    
    public init(resourceURI: String, name: String, type: String) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}
