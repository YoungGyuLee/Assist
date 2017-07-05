//
//  TeamModel.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 4..
//  Copyright © 2017년 YG. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class TeamModel : NetworkModel{
    
    func addTeamSchedule(team_id : Int, game_dt : String, place : String, against_team : String, message : String){
        
        let URL : String = "\(baseURL)/team/\(team_id)/schedule"
        
        
//        "game_dt": "2017-06-27 10:00:00",
//        "place": "서울시 성북구 고려대학교 화정체육관",
//        "against_team": "FC공돌이",
//        "message": "이기면 치킨 쏜다 -by 김자현"
        
//        
//        
//        let body1 : [String: Any] = [
//            "tatic":tatic,
//            "player":player,
//            "event":event
//        ]
//        
//        let player:[String:Any] = [
//            "ATK":ATk,
//            
//        ]
//        
//        let ATK:[Any]
//        
//        for i in 0...10{
//            //UISplitViewController
//            let atk : [String:Int] = ["player_id":vlaue]
//            ATK.append(atk)
//        }
//        
//    //DEF, MID, GK, SUB -->//player
//        
//        let event : [Any]
//        for i in ~~~~{
//            let evnet : [String:Any] = ["type":"value", "player":player]
//            
//        }
//        
//        
        
        
        print("일정일정1")
        let body : [String:Any] = [
            "game_dt":game_dt,
            "place":place,
            "against_team":against_team,
            "message":message
        ]
        
        Alamofire.request(URL, method: .post, parameters:body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response:DataResponse<TeamScheduleResponse>) in
            
            print("일정일정")
            switch response.result{
            case .success:
                
                guard let Message = response.result.value else{
                    
                    self.view.networkFailed()
                    return
                }
                
                if Message.status == 200{
                    print("일정등록")
                    self.view.networkResult(resultData: "", code: "일정등록")
                }
                    
                else if Message.status == 400 {
                    print("일정등록실패")
                    self.view.networkResult(resultData: "", code: "일정등록실패")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    
    
    func getTeamSchedule(team_id : Int, year : Int, month : Int){
        print("통신 들어 왔었음1")
        let URL : String = "\(baseURL)/team/\(team_id)/schedule/year/\(year)/month/\(month)"

        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<TeamMonthResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //  response.result.value
                print("통신 들어 왔었음3")
                //response.result.value
                guard let teamProfile = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
     
                if let results = teamProfile.response {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    print("통신 들어. 왔었음")
                    self.view.networkResult(resultData: results, code: "팀일정조회")
                }
            case .failure(let err):
                print("통신 들어 왔었음4")
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }

    func getScheduleAttendee(schedule_id : Int){
        let URL : String = "\(baseURL)/schedule/\(schedule_id)/attendee"
        //schedule/[schedule_id]/attendee
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<TeamEntryResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                guard let teamEntry = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                
                if let results = teamEntry.response?.attend {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    self.view.networkResult(resultData: results, code: "팀참가명단조회")
                }
                
                if let results = teamEntry.response?.noattend {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    self.view.networkResult(resultData: results, code: "팀불참명단조회")
                }
                
            case .failure(let err):
                print("통신 들어 왔었음4")
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }

    
    func addEntry(schedule_id : Int, player_id : Int, attendance : String){
  

        let URL : String = "\(baseURL)/schedule/\(schedule_id)/attendee"
        
        
        //        "game_dt": "2017-06-27 10:00:00",
        //        "place": "서울시 성북구 고려대학교 화정체육관",
        //        "against_team": "FC공돌이",
        //        "message": "이기면 치킨 쏜다 -by 김자현"
        

        let body : [String:Any] = [
            "player_id":player_id,
            "attendance":attendance
            
        ]
        
        Alamofire.request(URL, method: .post, parameters:body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response:DataResponse<TeamJoin>) in
            
            switch response.result{
            case .success:
                
                guard let Message = response.result.value else{
                    
                    self.view.networkFailed()
                    return
                }
                
                if Message.status == 200{
                    print("참가등록")
                    self.view.networkResult(resultData: "", code: "참가등록")
                }
                    
                else if Message.status == 400 {
                    print("참가등록실패")
                    self.view.networkResult(resultData: "", code: "참가등록실패")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    
    
    func getTeamMember(team_id : Int){
        //team/[team_id]/members
        let URL : String = "\(baseURL)/team/\(team_id)/members"
        //schedule/[schedule_id]/attendee
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<TeamMemberResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                guard let teamMember = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                
                if let results = teamMember.response {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    self.view.networkResult(resultData: results, code: "팀멤버조회")
                }
                
//                if let results = teamEntry.response?.noattend {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
//                    self.view.networkResult(resultData: results, code: "팀불참명단조회")
//                }
                
            case .failure(let err):
                print("통신 들어 왔었음4")
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }

    
    
}
