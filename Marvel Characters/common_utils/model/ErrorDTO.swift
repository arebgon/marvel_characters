//
//  ErrorDTO.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

public struct ErrorDTO: Codable {

    //MARK: Properties
    public var code: Int?
    public var status: String?
    
    //MARK: Constructors
    init(){}
    
    public init(code: Int, status: String) {
        self.code = code
        self.status = status
    }
}
