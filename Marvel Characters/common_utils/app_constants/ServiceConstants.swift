//
//  ServiceConstants.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation

class ServiceContants {
    static let shared = ServiceContants()
        
    let url_base : String = "https://gateway.marvel.com:443/"
    let version_api : String = "v1/public/"
    
    let marvel_public_key : String = "03a2feddd585f3b057aa196b7e010600"
    let marvel_private_key : String = "58eb02024580febc81e208a0f9203a540650c485"
    
    let url_api_getCharacters : String = "characters"
    let url_api_getCharacterById : String = "characters/"
}
