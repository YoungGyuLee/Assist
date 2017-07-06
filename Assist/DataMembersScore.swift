//
//  DataMembersScore.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper


class DataMembersScore : Mappable{
    var id : Int?
    var backnumber : Int?
    var username : String?
    var age : Int?
    var position : String?
    var score : Int?
    var assist : Int?
    var profile_pic_url : String?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        id <- map["id"]
        backnumber <- map["backnumber"]
        username <- map["username"]
        age <- map["age"]
        position <- map["position"]
        score <- map["score"]
        assist <- map["assist"]
        profile_pic_url <- map["profile_pic_url"]
    }
    
    
}
