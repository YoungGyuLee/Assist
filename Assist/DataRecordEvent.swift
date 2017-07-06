//
//  DataRecordEvent.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper


class DataRecordEvent : Mappable{
    
    var type : String?
    var player_id : Int?
    var player_id2 : Int?
    
    
    required init?(map: Map) {
        
        
    }
    func mapping(map: Map) {
        type <- map["type"]
        player_id <- map["player_id"]
        player_id2 <- map["player_id2"]
        
    }
    
    
    
}
