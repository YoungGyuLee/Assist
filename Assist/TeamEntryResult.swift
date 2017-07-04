//
//  TeamEntryResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 4..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class TeamEntryResult : Mappable{
    var status : Int?
    var response : TeamEntryResponse?
    
    required init?(map: Map) {
        
        
    }
    
    
    func mapping(map: Map) {
        status <- map["status"]
        response <- map["response"]
    }
}
