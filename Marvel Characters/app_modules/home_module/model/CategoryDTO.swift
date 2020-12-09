//
//  CategoryDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct CategoryDTO: Codable {

    //MARK: Properties
    public var available: Int?
    public var collectionURI: String?
    public var items: [ItemDTO]?
    public var returned: Int?
    
    //MARK: Constructors
    init(){}
    
    public init(available: Int, collectionURI: String, items: [ItemDTO], returned: Int) {
        self.available = available
        self.collectionURI = collectionURI
        self.items = items
        self.returned = returned
    }
}
