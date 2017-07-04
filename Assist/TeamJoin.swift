//
//  TeamJoin.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class TeamJoin : Mappable{
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
