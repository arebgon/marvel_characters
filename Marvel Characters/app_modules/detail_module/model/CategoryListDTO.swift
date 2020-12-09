//
//  CategoryListDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct CategoryListDTO: Codable {

    //MARK: Properties
    public var name: String?
    public var items: [ItemDTO]?
    
    //MARK: Constructors
    init(){}
    
    public init(name: String, items: [ItemDTO]) {
        self.name = name
        self.items = items
    }
    
}
