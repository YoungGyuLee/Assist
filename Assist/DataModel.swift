//
//  DataModel.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 5..
//  Copyright © 2017년 YG. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON


class DataModel : NetworkModel{
    
    func getTeamDateRecord(team_id : Int){
        //team/[team_id]/schedule
        let URL : String = "\(baseURL)/team/\(team_id)/schedule"
        
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<DataScheduleResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                //response.result.value.re
                guard let dataSchedule = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                if let results = dataSchedule.response {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    self.view.networkResult(resultData: results, code: "기록조회")
                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    func getDataFromStatus(schedule_id : Int, status : String){
        //team/[team_id]/schedule
        
        //        let body1 : [String: Any] = [
        //            "tatic":tatic,
        //            "player":player,
        //            "event":event
        //        ]
        //
        //        let player:[String:Any] = [
        //            "ATK":ATk,
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
        
        
        
        
        
        let URL : String = "\(baseURL)/schedule/\(schedule_id)/attendee/tactic/\(status)"
        
        //schedule/[schedule_id]/attendee/tactic/4-5-1
        
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<DataDSResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                //response.result.value.re
                guard let dataSchedule = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                
                print("참가 조회 들어감")
               
                if let results = dataSchedule.response{
                    self.view.networkResult(resultData: results, code: "참가조회")
                     //print(dataSchedule.response?.ATK?[0].backnumber)
                }
            
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    func getReport(schedule_id : Int){
        //team/[team_id]/schedule
        let URL : String = "\(baseURL)/schedule/\(schedule_id)/report"
        
        //schedule/[schedule_id]/attendee/tactic/4-5-1
        
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<DataReportResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                //response.result.value.re
                guard let dataReport = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                
                print("리포트 들어감")
                
                if let results = dataReport.response?.player?.ATK {
                    self.view.networkResult(resultData: results, code: "리포트플레이어공격")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
                if let results = dataReport.response?.player?.DF {
                    self.view.networkResult(resultData: results, code: "리포트플레이어수비")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
                if let results = dataReport.response?.player?.MF {
                    self.view.networkResult(resultData: results, code: "리포트플레이어미드")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
                if let results = dataReport.response?.player?.GK {
                    self.view.networkResult(resultData: results, code: "리포트플레이어골키")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
                if let results = dataReport.response?.player?.SUB {
                    self.view.networkResult(resultData: results, code: "리포트플레이어서브")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
                if let results = dataReport.response?.event {
                    self.view.networkResult(resultData: results, code: "리포트이벤트")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
                if let results = dataReport.response?.tactic {
                    self.view.networkResult(resultData: results, code: "전술")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    
    func addReport(schedule_id : Int, tactic : String, player_id : [Int], eventTemp : [DataRecordPostVO]){
        
        let URL : String = "\(baseURL)/schedule/\(schedule_id)/report"

        
        let seperate = tactic.components(separatedBy: "-")
        //4.3.3
        print("등록3")
        var GK : [Any] = []
        for i in 0...(Int(seperate[0])!-1){
            let gk : [String:Int] = ["player_id":gino(player_id[i])]
            GK.append(gk)
            print("등록4")
        }
        
        
        var DF : [Any] = []
        for i in 0...(Int(seperate[0])!-1){
            let def : [String:Int] = ["player_id":gino(player_id[i+1])]
            DF.append(def)
            print("등록5")
        }
        
        var MF:[Any] = []
        for i in 0...(Int(seperate[1])!-1){
            let mf : [String:Int] = ["player_id":gino(player_id[Int(seperate[0])!+i]+1)]
            MF.append(mf)
            print("등록6")
        }
        
        var ATK:[Any] = []
        for i in 0...(Int(seperate[2])!-1){
            let atk : [String:Int] = ["player_id":gino(player_id[Int(seperate[1])!+i]+1)]
            MF.append(atk)
            print("등록7")
        }
        
        var SUB:[Any] = []
        for i in 0...player_id.count-12 {
            let sub : [String:Int] = ["player_id":gino(player_id[i+11])]
            SUB.append(sub)
            print("등록8")
        }
        //여기까지 player
        
        var Event : [Any] = []
        for i in 0...(eventTemp.count-1){
            print("등록9")
            let event : [String:Any] = ["type":gsno(eventTemp[i].type), "player_id":gino(eventTemp[i].player_id), "player_id2":gino(eventTemp[i].player_id2)]
            Event.append(event)
            
        }
        
        let player : [String:Any] = [
            "ATK" : ATK,
            "MF" : MF,
            "DF" : DF,
            "GK" : GK,
            "SUB" : SUB
        ]
        
        let body : [String:Any]=[
            "tactic" : tactic,
            "player" : player,
            "event" : Event
            
        ]
        Alamofire.request(URL, method: .post, parameters:body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response:DataResponse<DataRecordPostResponse>) in
            
            print("경기등록")
            switch response.result{
            case .success:
                
                guard let Message = response.result.value else{
                    
                    self.view.networkFailed()
                    return
                }
                print(Message.message)
                print(Message.status)
                if (Message.message?.contains("success"))! {
                    print("경기등록")
                    self.view.networkResult(resultData: "", code: "경기등록")
                }
                    
                else{
                    print("경기등록실패")
                    self.view.networkResult(resultData: "", code: "경기등록실패")
                }
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    
    
    func getTacticReport(team_id : Int){
        //team/[team_id]/schedule
        let URL : String = "\(baseURL)/tema/\(team_id)/report/tactic"
        ///team/[team_id]/report/tactic
        //schedule/[schedule_id]/attendee/tactic/4-5-1
        
        print(URL)
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<DataTeamResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
            case .success:
                //response.result.value
                //response.result.value.re
                guard let dataTeam = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                
                print("팀 기록 들어감")
                
                if let results = dataTeam.response {
                    self.view.networkResult(resultData: results, code: "팀기록일반")
                    //print(dataSchedule.response?.ATK?[0].backnumber)
                }

            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    
}
