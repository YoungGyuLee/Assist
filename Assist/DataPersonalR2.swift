//
//  DataPersonalR2.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataPersonalR2 : UIViewController{
    var firstPoint2 = CGPoint()
    var secondPoint2 = CGPoint()
    var thirdPoint2 = CGPoint()
    var forthPotin2 = CGPoint()
    @IBOutlet var graphBase: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        firstPoint2.x = 150
        firstPoint2.y = 150
        
        secondPoint2.x = 200
        secondPoint2.y = 200
        
        thirdPoint2.x = 300
        thirdPoint2.y = 300
        
        forthPotin2.x = 170
        forthPotin2.y = 110
        
        
        addLine(fromPoint: firstPoint2, toPoint: secondPoint2)
        addLine(fromPoint: secondPoint2, toPoint: thirdPoint2)
        
        addLine2(fromPoint: secondPoint2, toPoint: forthPotin2)
    }
    func draw(_ rect: CGRect) {
        //        let aPath = UIBezierPath()
        //
        //        aPath.move(to: CGPoint(x:100, y:50))
        //
        //        aPath.addLine(to: CGPoint(x:300, y:50))
        //
        //        //Keep using the method addLineToPoint until you get to the one where about to close the path
        //
        //        aPath.close()
        //
        //        //If you want to stroke it with a red color
        //        UIColor.red.set()
        //        aPath.stroke()
        //        //If you want to fill it as well
        //        aPath.fill()
        
        
        
    }
    
    func addLine(fromPoint start: CGPoint, toPoint end:CGPoint) {
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
    
    func addLine2(fromPoint start: CGPoint, toPoint end:CGPoint) {
        let line = CAShapeLayer()
        let linePath = UIBezierPath()
        linePath.move(to: start)
        linePath.addLine(to: end)
        line.path = linePath.cgPath
        line.strokeColor = UIColor.yellow.cgColor
        line.lineWidth = 1
        line.lineJoin = kCALineJoinRound
        self.graphBase.layer.addSublayer(line)
    }
    
    
}
