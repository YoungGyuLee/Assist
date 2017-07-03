//
//  TeamProfileResponse.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 3..
//  Copyright © 2017년 YG. All rights reserved.
//


import ObjectMapper

//특정 팀 프로필 조회 중 상세 내용.

class TeamProfileResponse : Mappable{
    
//    'profile_pic_url': 'kucic_profile.png',
//    'teamname': 'KUCIC',
//    'rank': 1,
//    'total_game': 100,
//    'win_game': 60,
//    'draw_game': 10,
//    'lose_game': 30,
//    'total_score': 120,
//    'total_score_against': 80,
//    'region': 'seoul',
//    'manager': 'Jahyun Kim',
//    'found_dt': '2017-06-26',
//    'message': '고려대학교 컴퓨터학과 축구 동아리'
    
    var profile_pic_url : String?
    var teamname : String?
    var rank : Int?
    var total_game : Int?
    var win_game : Int?
    var draw_game : Int?
    var lose_game : Int?
    var total_score : Int?
    var total_score_against : Int?
    var manager : String?
    var found_dt : String?
    var message : String?
    var region : String?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        profile_pic_url<-map["profile_pic_url"]
        teamname<-map["teamname"]
        rank<-map["rank"]
        total_game<-map["total_game"]
        win_game<-map["win_game"]
        draw_game<-map["draw_game"]
        lose_game<-map["lose_game"]
        total_score<-map["total_score"]
        total_score_against<-map["total_score_against"]
        manager<-map["manager"]
        found_dt<-map["found_dt"]
        message<-map["message"]
        region<-map["region"]
        
    }
    
    
}
