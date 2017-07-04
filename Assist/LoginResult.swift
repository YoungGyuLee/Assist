//
//  LoginResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import ObjectMapper
import Foundation
class LoginResult : Mappable{
    
    var status : Int?
    var response : LoginResponse?
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        response <- map["response"]
        
    }
}
