//
//  DataReportTemp.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataReportTemp : Mappable{
    
    var ATK : [DataReportATK]?
    var DF : [DataReportDEF]?
    var MF : [DataReportMID]?
    var GK : [DataReportGK]?
    var SUB : [DataReportSUB]?
    
    
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
