//
//  DataMonthPersonalResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataMonthPersonalResult : Mappable{

    //var response
    
    var response : [DataMonthPersonalResponse]?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        response <- map["response"]
        
    }
    
}
