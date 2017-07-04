//
//  TeamMonthResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 4..
//  Copyright © 2017년 YG. All rights reserved.
//
import Foundation
import ObjectMapper

class TeamMonthResponse : Mappable{
    
    
//    'id': 1,
//    'game_dt': "2017-06-26T00:00:00.000Z",
//    'place': '서울시 성북구 고려대학교 화정체육관',
//    'against_team': 'FC 공돌이',
//    'message': '이기면 치킨사준다 -by 김자현'
    
    var id : Int?
    var game_dt : String?
    var place : String?
    var against_team : String?
    var message : String?
    
    required init?(map: Map) {
        
        
    }
    
    
    func mapping(map: Map) {
        id <- map["id"]
        game_dt <- map["game_dt"]
        place <- map["place"]
        against_team <- map["against_team"]
        message <- map["message"]
    }
}
