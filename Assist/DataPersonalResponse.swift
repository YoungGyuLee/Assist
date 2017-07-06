//
//  DataPersonalResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 6..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import ObjectMapper

class DataPersonalResponse : Mappable{
    var username : String?
    var email : String?
    var password : String?
    var age : Int?
    var height : Float?
    var weight : Float?
    var foot : String?
    var position : String?
    var position_detail : String?
    var backnumber : Int?
    var score : Int?
    var assist : Int?
    var score_aginst : Int?
    var token : String?
    var team_id : Int?
    var profile_pic_url : String?
    var card_total : Int?
    var card_ATK : Int?
    var card_PAC : Int?
    var card_TEC : Int?
    var card_DEF : Int?
    var card_STA : Int?
    var card_PHY : Int?

    
    required init?(map: Map) {
        
        
    }
    
    func mapping(map: Map) {
        username <- map["username"]
        email <- map["email"]
        password <- map["password"]
        age <- map["age"]
        height <- map["height"]
        weight <- map["weight"]
        foot <- map["foot"]
        position <- map["position"]
        position_detail <- map["position_detail"]
        score <- map["score"]
        assist <- map["assist"]
        score_aginst <- map["score_aginst"]
        token <- map["token"]
        team_id <- map["team_id"]
        profile_pic_url <- map["profile_pic_url"]
        card_total <- map["card_total"]
        card_ATK <- map["card_ATK"]
        card_PAC <- map["card_PAC"]
        card_TEC <- map["card_TEC"]
        card_DEF <- map["card_DEF"]
        card_STA <- map["card_STA"]
        card_PHY <- map["card_PHY"]
    }
}
