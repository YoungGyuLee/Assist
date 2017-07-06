//
//  DataPersonalPositionResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataPersonalPositionResponse : Mappable{
    
    var ATK : DataPersonalATK?
    var DF : DataPersonalDF?
    var MF : DataPersonalMF?
    var GK : DataPersonalGK?
    var SUB : DataPersonalSub?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        ATK <- map["ATK"]
        DF <- map["DF"]
        MF <- map["MF"]
        GK <- map["GK"]
        SUB <- map["SUB"]
        
    }
}
