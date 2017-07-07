//
//  DataTeamR2.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import Foundation
import UIKit

class DataTeamR2 : UIViewController, NetworkCallback{
    let ad = UIApplication.shared.delegate as? AppDelegate
    var firstPoint2 = CGPoint()
    var secondPoint2 = CGPoint()
    var thirdPoint2 = CGPoint()
    var forthPotin2 = CGPoint()
    var teamMonthResponse : [DataTeamMonthResponse]?
    
    @IBOutlet var markDraw: UIImageView!
    @IBOutlet var markVic: UIImageView!
    
    
    var scoreForMonth : [Int:Int] = [:]
    var lostForMonth : [Int:Int] = [:]
    
    @IBOutlet var graphBase: UIView!
        //1점 시작 좌표 : 35,233
        //월간 좌표 간격 :53
    
        //점수 간격 : -40
        //1시작 좌표 : 168
    
    
        func networkResult(resultData resultata: Any, code: String) {
            if code == "개인월별기록"{

                
                teamMonthResponse = resultata as! [DataTeamMonthResponse]
                print(teamMonthResponse)
                var scoreMonth : [Int]?
                var lostMonth : [Int]?
                for i in 0...((teamMonthResponse?.count)!-1){
                    print("그래프1")
                    print((teamMonthResponse?.count)!)
                    scoreMonth?[i] = gino((teamMonthResponse?[i].month))
                    scoreForMonth[gino(scoreMonth?[i])] = gino(teamMonthResponse?[i].avg_score)
                    lostMonth?[i] = gino(teamMonthResponse?[i].month)
                    lostForMonth[gino(lostMonth?[i])] = gino(teamMonthResponse?[i].avg_score_against)
                }
                for i in 0...(scoreForMonth.count-1){
                    print("그래프3")
                    if i != (scoreForMonth.count-1){
                        print("그래프2")
                        firstPoint2.x = CGFloat((scoreMonth![i]-1)*53+35)
                        firstPoint2.y = CGFloat((scoreForMonth[scoreMonth![i]]!-1)*(-40)+168)
                    
                        secondPoint2.x = CGFloat((scoreMonth![i+1]-1)*53+35)
                        secondPoint2.y = CGFloat((scoreForMonth[scoreMonth![i+1]]!-1)*(-40)+168)
                        
                        drawScoreGraph(fromPoint: firstPoint2, toPoint: secondPoint2)
                    }

                }
        }
    }
    
      override func viewDidLoad(){
        markDraw.layer.cornerRadius = markDraw.frame.height/2
        markVic.layer.cornerRadius = markVic.frame.height/2
        
        
        
        
        let model = DataModel(self)
        model.getMonthReport(team_id: gino(ad?.myTeamId))
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
