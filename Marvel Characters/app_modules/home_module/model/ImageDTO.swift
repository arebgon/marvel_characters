//
//  ImageDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct ImageDTO: Codable {

    //MARK: Properties
    public var path: String?
    public var `extension`: String?
    
    //MARK: Constructors
    init(){}
    
    public init(path: String, extension: String) {
        self.path = path
        self.`extension` = `extension`
    }
}
