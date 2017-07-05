//
//  TeamMemberResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class TeamMemberResult : Mappable{
    var response : [TeamMemberResponse]?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        response <- map["response"]
    }
    
}
