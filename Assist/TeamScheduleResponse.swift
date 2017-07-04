//
//  TeamScheduleResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 4..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class TeamScheduleResponse : Mappable{
    
//    "game_dt": "2017-06-27 10:00:00",
//    "place": "서울시 성북구 고려대학교 화정체육관",
//    "against_team": "FC공돌이",
//    "message": "이기면 치킨 쏜다 -by 김자현"
    
    var status : Int?
    var message : String?

    
    //Mappable 프로토콜을 구현할 때 반드시 구현되어야 하는 함수
    func mapping(map: Map) {
        status <- map["status"]
        message <- map["message"]
    }
    required init?(map: Map) {
        
    }
    
    
}
