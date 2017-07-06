//
//  AppDelegate.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 25..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit
import DropDown

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        DropDown.startListeningToKeyboard()
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
    
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    var userId : Int?
    
    
    //여기는 회원 가입//
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
    //var team_id : Int?
    var profile_pic : Any?
    
    
    //여기는 날짜 넘기기
    var date : Date?
    
    
    //스케줄 아이디
    var scheduleId : Int?
    
    
    var myTeamId : Int?
    

    var memList : [Int]?
    var curStg : String?
    //경기 리스트
    
    var setRecord : Bool = false
    //경기 기록 입력하는 부분
    
    var nowSelect : Int?
    //내가 지금 선택한 선수 등번호.
    var previousSelect : Int?
    //이전에 선택한 선수 등번호.
    
    
    
    //전술 등록 때 쓰는 스케줄.
    var scheduleIdForStg : Int?
    
    
    //개인기록 조회
    var myScore : Int?
    var myAssist : Int?
    
    
}

