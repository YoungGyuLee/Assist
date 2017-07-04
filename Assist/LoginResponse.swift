//
//  LoginResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import ObjectMapper
import Foundation

class LoginResponse : Mappable{
    
    var id : Int?
    var team_id : Int?
    
    required init?(map: Map) {
        
        
    }
        
    func mapping(map: Map) {
        id <- map["id"]
        team_id <- map["team_id"]

    }
}
