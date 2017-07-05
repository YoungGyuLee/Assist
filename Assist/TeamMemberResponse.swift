//
//  TeamMemberResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation

import ObjectMapper

class TeamMemberResponse : Mappable{
//    'id': 1,
//    'backnumber': 14,
//    'username': 'Jahyun Kim',
//    'age': 23,
//    'position: 'AT',
//    'total_game': 60,
//    'score': 23,
//    'assist': 12
    
    var id : Int?
    var backnumber : Int?
    var username : String?
    var age : Int?
    var position : String?
    var total_game : Int?
    var score : Int?
    var assist : Int?
    
    required init?(map: Map) {
        
        
    }
    func mapping(map: Map) {
        id <- map["id"]
        backnumber <- map["backnumber"]
        username <- map["username"]
        age <- map["age"]
        position <- map["position"]
        total_game <- map["total_game"]
        score <- map["score"]
        assist <- map["assist"]
    }
    
}
