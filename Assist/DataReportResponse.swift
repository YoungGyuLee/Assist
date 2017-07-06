//
//  DataReportResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper


class DataReportResponse : Mappable{
    
    var tactic : String?
    var player : DataReportTemp?
    var event : [DataRecordEvent]?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        tactic <- map["tactic"]
        player <- map["player"]
        event <- map["event"]
        
    }
}
