//
//  DataReportDEF.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//


import Foundation
import ObjectMapper

class DataReportDEF : Mappable{
    
    var player_id : Int?
    var position : String?
    var username : String?
    var backnumber : Int?
    //player_id":19,"position":"ATK","username":"김자형
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        player_id <- map["player_id"]
        position <- map["position"]
        username <- map["username"]
        backnumber <- map["backnumber"]
    }
}
