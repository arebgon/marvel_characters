//
//  ItemDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct ItemDTO: Codable {

    //MARK: Properties
    public var resourceURI: String?
    public var name: String?
    public var type: String?
    
    //MARK: Constructors
    init(){}
    
    public init(resourceURI: String, name: String, type: String) {
        self.resourceURI = resourceURI
        self.name = name
        self.type = type
    }
}
