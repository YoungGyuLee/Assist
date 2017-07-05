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
                
//                
//                if let results = dataSchedule.response?.ATK {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
//                    self.view.networkResult(resultData: results, code: "참가조회공격")
//                }
//                if let results = dataSchedule.response?.DF {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
//                    self.view.networkResult(resultData: results, code: "참가조회수비")
//                }
//                if let results = dataSchedule.response?.GK {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
//                    self.view.networkResult(resultData: results, code: "참가조회골키")
//                }
//                if let results = dataSchedule.response?.MF {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
//                    self.view.networkResult(resultData: results, code: "참가조회미드")
//                }
//                if let results = dataSchedule.response?.SUB {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
//                    self.view.networkResult(resultData: results, code: "참가조회서브")
//                }
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
    
    
}
