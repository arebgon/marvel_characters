//
//  AppUtils.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import UIKit

//MARK: DecodeAnyObjectDTO
//Parameter send: Data(response) & Object Type
//Parameter return: Object (Object Type entry)
func decode<T>(data: Data?, modelType: T.Type) -> T where T: Decodable {
    let myStruct = try! JSONDecoder().decode(modelType, from: data!)
    return myStruct
}
