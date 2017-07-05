//
//  SignSplashModel.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 3..
//  Copyright © 2017년 YG. All rights reserved.
//

import Alamofire
import ObjectMapper
import AlamofireObjectMapper
import SwiftyJSON

class SignSplashModel : NetworkModel{
    
    func getTeamList(){
        
        let URL : String = "\(baseURL)/team"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<SearchResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
                
            case .success:
              //  response.result.value
                
                guard let teamList = response.result.value else{
                    return//데이터를 받아올 때는 result를 통해서.
                }
                
                if let results = teamList.response {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    print("!@#!@#")
                    self.view.networkResult(resultData: results, code: "팀조회")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    
    func getTeamProfile(team_id : Int){
        
        let URL : String = "\(baseURL)/team/\(team_id)"
        
        Alamofire.request(URL, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response : DataResponse<TeamProfileResult>) in
            //DataResponse 괄호 안에 데이터를 받을 객체를 넣으면 됨.
            switch response.result{
                
            case .success:
                //  response.result.value
                
                guard let teamProfile = response.result.value else{
                    self.view.networkFailed()
                    return//데이터를 받아올 때는 result를 통해서.
                }
                //teamProfile.status
                //teamProfile.response
                //teamProfile.re
                if let results = teamProfile.response {//받아 온 데이터를 통해서 쓸 값을 여기서 정함.
                    print("!@#!@#")
                    self.view.networkResult(resultData: results, code: "팀프로필")
                }
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
        
    }
    
//    func writeBoard(title:String, content:String, writer:String){
//        
//        let URL : String = "\(baseURL)/lists"
//        
//        let body : [String:String] = [
//            
//            
//            "title":title,
//            "content":content,
//            "writer":writer
//            
//        ]
//        
//        Alamofire.request(URL, method: .post, parameters:body, encoding: JSONEncoding.default, headers: nil).responseObject{
//            
//            (response:DataResponse<MessageVO>) in
//            
//            
//            switch response.result{
//                
//            case .success:
//                
//                guard let Message = response.result.value else{
//                    
//                    self.view.networkFailed()
//                    return
//                }
//                
//                if Message.message == "ok"{
//                    self.view.networkResult(resultData: "", code: "1-3")
//                }
//                    
//                else if Message.message == "selecting post error : [에러원인]"{
//                    self.view.networkResult(resultData: "", code: "1-3-selecting post error")
//                }
//                
//                
//            case .failure(let err):
//                print(err)
//                self.view.networkFailed()
//            }
//            
//        }
//    }
//    
    //멀티파트 이용
    //문법설명 따로
    func signUp(username:String, email:String, password:String,age:Int, height : Float, weight : Float, foot : String,position : String,position_detail : String,backnumber : Int, team_id : Int, profile_pic:Data?){
        
        let URL : String = "\(baseURL)/signup"
        
        let username = username.data(using: .utf8)
        let email = email.data(using: .utf8)
        let password = password.data(using: .utf8)
        let age = age
        let height = height
        let weight = weight
        let foot = foot.data(using: .utf8)
        let position = position.data(using: .utf8)
        let position_detail = position_detail.data(using: .utf8)
        let backnumber = backnumber
        let team_id = team_id
        
        print("이미지 업로드1")
        
        //이미지, 백넘버, 팀 아이디
        if profile_pic == nil{
            
        }else{
            
            Alamofire.upload(multipartFormData : { multipartFormData in
                
                //멀티파트를 이용해 데이터를 담습니다

                multipartFormData.append(username!, withName: "username")
                multipartFormData.append(email!, withName: "email")
                multipartFormData.append(password!, withName: "password")
                multipartFormData.append("\(age)".data(using: .utf8)!, withName: "age")
                multipartFormData.append("\(height)".data(using: .utf8)!, withName: "height")
                multipartFormData.append("\(weight)".data(using: .utf8)!, withName: "weight")
                multipartFormData.append(foot!, withName: "foot")
                multipartFormData.append(position!, withName: "position")
                multipartFormData.append(position_detail!, withName: "position_detail")
                multipartFormData.append("\(backnumber)".data(using: .utf8)!, withName: "backnumber")
                multipartFormData.append("\(team_id)".data(using: .utf8)!, withName: "team_id")
                multipartFormData.append(profile_pic!, withName: "profile_pic", fileName: "image.jpg", mimeType: "image/png")
            },
                             
                             to: URL,
                             encodingCompletion: { encodingResult in
                                
                                switch encodingResult{
                                case .success(let upload, _, _):
                                    upload.responseData { res in
                                        switch res.result {
                                        case .success:
                                            
                                            print(JSON(res.result.value))
                                            if let value = res.result.value {
                                                let data = JSON(value)
                                                let msg = data["status"].intValue
                                                let resultData = data["response"]
                                                let valueInt = resultData["id"].intValue
                                                let valueInt2 = resultData["team_id"].intValue
                                                
                                                    print(valueInt)
                                                    print(valueInt2)
                                                    print(msg)
                                                    print(resultData)
                                                    print("회원가입 들어옴")
                                                    DispatchQueue.main.async(execute: {
                                                        print("dispatc Queue")
                                                        self.view.networkResult(resultData: SignVO(id: valueInt,team_id: valueInt2), code: "회원가입")
                                                    })
                                                    print(msg)
                                                //if msg == "ok
                                        }//if let value
                                        case .failure(let err):
                                            print("upload Error : \(err)")
                                            DispatchQueue.main.async(execute: {
                                                self.view.networkFailed()
                                            })
                                        }
                                    }
                                case .failure(let err):
                                    print("network Error : \(err)")
                                    self.view.networkFailed()
                                }//switch
            }
                
            )   //Alamofire.upload
            
        }
    }
    
    func login(email : String, password : String){
        
        let URL : String = "\(baseURL)/login"
    
        let body : [String:String] = [
            "email":email,
            "password":password
        ]
        
        
        Alamofire.request(URL, method: .post, parameters:body, encoding: JSONEncoding.default, headers: nil).responseObject{
            
            (response:DataResponse<LoginResult>) in
            
        
            print("일정일정")
            switch response.result{
            case .success:
                print("로긴로긴")
                
                
                guard let Message = response.result.value else{
                    
                    self.view.networkFailed()
                    return
                }
                
                //let resultData = data["response"]
                let valueInt = response.result.value?.response?.id
                let valueInt2 = response.result.value?.response?.team_id
                    //response.result.value?.response
                    self.view.networkResult(resultData: LoginVO(id: valueInt,team_id: valueInt2), code: "로그인")
                
      
                
                
            case .failure(let err):
                print(err)
                self.view.networkFailed()
            }
            
        }
    }
    
    
    
    func teamCreate(teamname:String, region:String, manager:String, found_dt : String, message : String,  profile_pic:Data?){
        
        
        let URL : String = "\(baseURL)/team"
        
        let teamname = teamname.data(using: .utf8)
        let region = region.data(using: .utf8)
        let manager = manager.data(using: .utf8)
        let found_dt = found_dt.data(using: .utf8)
        let message = message.data(using: .utf8)

        print("이미지 업로드1")
        
        //이미지, 백넘버, 팀 아이디
        if profile_pic == nil{
            
        }else{
            
            Alamofire.upload(multipartFormData : { multipartFormData in
                
                //멀티파트를 이용해 데이터를 담습니다
                
                multipartFormData.append(teamname!, withName: "teamname")
                multipartFormData.append(region!, withName: "region")
                multipartFormData.append(manager!, withName: "manager")
                multipartFormData.append(found_dt!, withName: "found_dt")
                multipartFormData.append(message!, withName: "message")
                multipartFormData.append(profile_pic!, withName: "profile_pic", fileName: "image.jpg", mimeType: "image/png")
            },
                             
                             to: URL,
                             encodingCompletion: { encodingResult in
                                
                                switch encodingResult{
                                case .success(let upload, _, _):
                                    upload.responseData { res in
                                        switch res.result {
                                        case .success:
                                            print("팀창단1")
                                            
                                            print(JSON(res.result.value))
                                            if let value = res.result.value {
                                                let data = JSON(value)
                                                print(data)
                                                
                                                let msg = data["status"].intValue
                                                
                                                let resultData = data["team_id"].intValue
                                                    print("팀창단2")
                                                    print(msg)
                                                    print(resultData)
                                                    DispatchQueue.main.async(execute: {
                                                        print("dispatc Queue")
                                                        self.view.networkResult(resultData: resultData, code: "팀창단")
                                                    })
                                                    print(msg)
                                                //if msg == "ok
                                        }//if let value
                                        case .failure(let err):
                                            print("upload Error : \(err)")
                                            DispatchQueue.main.async(execute: {
                                                self.view.networkFailed()
                                            })
                                        }
                                    }
                                case .failure(let err):
                                    print("network Error : \(err)")
                                    self.view.networkFailed()
                                }//switch
            }
                
            )   //Alamofire.upload
            
        }
    }

    
    
    
    
}
