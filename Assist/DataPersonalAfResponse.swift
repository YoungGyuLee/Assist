//
//  DataPersonalAfResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataPersonalAfResponse : Mappable{
    var attend : DataPersonalAttendAf?
    var noattend : DataPersonalNoattendAf?
    
    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        attend <- map["attend"]
        noattend <- map["noattend"]
        
    }
    //imageview.layer.masktobounds
    
}
