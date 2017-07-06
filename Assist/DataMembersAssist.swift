//
//  DataMembersAssist.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataMembersAssist : Mappable{
//    'id': 1,
//    'backnumber': 14,
//    'username': 'Jahyun Kim',
//    'age': 23,
//    'position: 'AT',
//    'total_game': 60,
//    'score': 23,
//    'assist': 12,
//    'profile_pic_url': 'dshyun0226_1@gmail.com_profile.jpg'
    
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

//'id': 1,
//'backnumber': 14,
//'username': 'Jahyun Kim',
//'age': 23,
//'position: 'AT',
//'total_game': 60,
//'score': 23,
//'assist': 12,
//'profile_pic_url': 'dshyun0226_1@gmail.com_profile.jpg'
