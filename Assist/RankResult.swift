//
//  RankResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class RankResult : Mappable{
    var status : Int?
    var response : [RankVO]?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        status <- map["status"]
        response <- map["response"]
        
    }
    
    
    
}
