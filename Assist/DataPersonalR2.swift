//
//  DataPersonalR2.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataPersonalR2 : UIViewController, NetworkCallback{
    let ad = UIApplication.shared.delegate as? AppDelegate
    var firstPoint2 = CGPoint()
    var secondPoint2 = CGPoint()
    var thirdPoint2 = CGPoint()
    var forthPotin2 = CGPoint()
    var personalMonthResponse : [DataMonthPersonalResponse]?
    
    var scoreForMonth : [Int:Int] = [:]
    //var lostForMonth : [Int:Int] = [:]
    var assistForMonth : [Int:Int] = [:]
    
    @IBOutlet var graphBase: UIView!
    
    
    
    //1월 시작 좌표 : 35, 233//날짜 좌표 간격 : 대략 20
    //1점 시작 좌표 : 0, 169// 점수간격 : -40
    
    //점수 간격 : -40
    //1시작 좌표 : 168
    func networkResult(resultData resultata: Any, code: String) {
        if code == "개인월별기록"{
            
            
            personalMonthResponse = resultata as! [DataMonthPersonalResponse]
            print(personalMonthResponse)
            var scoreMonth : [Int]?
            var assistMonth : [Int]?
            for i in 0...((personalMonthResponse?.count)!-1){
                print("그래프1")
                print((personalMonthResponse?.count)!)
                scoreMonth?[i] = gino((personalMonthResponse?[i].month))
                scoreForMonth[gino(scoreMonth?[i])] = gino(personalMonthResponse?[i].score)
                assistMonth?[i] = gino(personalMonthResponse?[i].month)
                assistForMonth[gino(assistMonth?[i])] = gino(personalMonthResponse?[i].assist)
            }
            for i in 0...(scoreForMonth.count-1){
                print("그래프3")
                if i != (scoreForMonth.count-1){
                    print("그래프2")
                    firstPoint2.x = CGFloat((scoreMonth![i]-1)*20+35)
                    firstPoint2.y = CGFloat((scoreForMonth[scoreMonth![i]]!-1)*(-40)+169)
                    
                    secondPoint2.x = CGFloat((scoreMonth![i+1]-1)*20+35)
                    secondPoint2.y = CGFloat((scoreForMonth[scoreMonth![i+1]]!-1)*(-40)+169)
                    
                    drawScoreGraph(fromPoint: firstPoint2, toPoint: secondPoint2)
                }
                
            }
        }
    }
    
    override func viewDidLoad(){
        let model = DataModel(self)
        model.getUserMonthData(player_id: gino(ad?.userId))
        print(gino(ad?.myTeamId))
    }
    
    func drawScoreGraph(fromPoint start: CGPoint, toPoint end:CGPoint){
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        //start.customPlaygroundQuickLook.
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        self.graphBase.layer.addSublayer(line)
    }
    
    func drawLostGraph(fromPoint start: CGPoint, toPoint end:CGPoint){
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.red.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        self.graphBase.layer.addSublayer(line)
    }
    
}
