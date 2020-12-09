//
//  StringExt.swift
//  Marvel Characters
//  Created by Alfredo Rebolloso
//

import Foundation
import CryptoKit

extension String {
    
    //Localized String text
    var localized: String {
        return NSLocalizedString(self, value: "**\(self)**", comment: "")
    }
    
    //Convert md5
    func md5() -> String {
        let r = Insecure.MD5.hash(data: self.data(using: .utf8)!)
        return r.map { String(format: "%02hhx", $0) }.joined()
    }
}
