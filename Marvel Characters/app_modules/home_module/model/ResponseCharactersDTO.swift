//
//  ResponseCharactersDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct ResponseCharactersDTO: Codable {

    //MARK: Properties
    public var code: Int?
    public var status: String?
    public var data: CharactersDTO
        
    //MARK: Constructors
    public init(code: Int, status: String, data: CharactersDTO) {
        self.code = code
        self.status = status
        self.data = data
    }
}
