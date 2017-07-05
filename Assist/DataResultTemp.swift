//
//  DataResultTemp.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataResultTemp : Mappable{
    
    var ATK : [DataDSAtk]?
    var DF : [DataDSDef]?
    var MF : [DataDSMid]?
    var GK : [DataDSGk]?
    var SUB : [DataDSSub]?
    
    
    required init?(map: Map) {

    }
    
    func mapping(map: Map) {
        ATK <- map["ATK"]
        MF <- map["MF"]
        DF <- map["DF"]
        GK <- map["GK"]
        SUB <- map["SUB"]
    }
}
