//
//  DataPersonalResult.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataPersonalResult : Mappable{
    
    var response : DataPersonalResponse?
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        response <- map["response"]
        
    }
}
