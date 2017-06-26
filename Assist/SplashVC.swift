//
//  SplashVC.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 26..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class SplashVC : UIViewController{
    var delayInSeconds = 2.0
    //let ud = UserDefaults.standard
    override func viewDidLoad() {
        // let accountSequence = self.ud.value(forKey: "accountSequence") as! Int
        //인트는 위와 같이 알아오던가. 아니면
        
//        let accountSequence = self.ud.integer(forKey: "accountSequence")
//        //이렇게. 이렇게 알아오는 방법은 값을 알고 있을 때
//        print("어카운트 시퀀스")
//        print(accountSequence)
        
        //만일 네트워킹을 한다면 아ㄹ와 같이 될 듯.
        
        //        let model = UserModel(self)
        //        model.getUserInfo()
        
        
        
        
       // print("여기도 들어왔쪙")
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delayInSeconds) {
            //디스패치 구문 안에 들어와서 분기를 나눠줘야 함.
            //안 그러면 2초 후의 동작을 잡는 스레드가 계속 실행.
            
            
            
//            if accountSequence == 150621{
//                //일반적으로는 서버에서 가져온 값을 비교 연산을 통해 비교
//                print("들어왔졍")
//                let main_storyboard = UIStoryboard(name : "Main", bundle : nil)
//                print("들어왔졍1")
//                guard let main = main_storyboard.instantiateViewController(withIdentifier: "MainVC") as? MainVC else{return}
//                print("들어왔졍2")
//                self.present(main, animated: true)
//                print("들어왔졍3")
//                //값을 가지고 있으면 바로 메인으로 넘어가게끔.
//            }
//            else{
            
                
                
                guard let loginVC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC else{return}
                
                
                self.present(loginVC, animated: true, completion: nil)
          //  }
            
            
            
        }
        //2초 후에 이 구문 안에 함수 실행.
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
                let objVC: LoginVC? = storyboard?.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        //let objVC: SecondViewController? = SecondViewController()
        print("얘도 들어오오오오옴")

        let aObjNavi = UINavigationController(rootViewController: objVC!)
        //let aObjNavi = UINavigationController(rootViewController: objVC!)
        let appDelegate: AppDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        // appDelegate = (UIApplication.shared.delegate as? AppDelegate)!
        appDelegate.window?.rootViewController = aObjNavi
    }

    
    
    
    
    
    
}
