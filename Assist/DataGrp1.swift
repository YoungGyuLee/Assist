//
//  DataGrp1.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataGrp1 : UIViewController{
    
    @IBOutlet var graph1: UIView!
    
    override func viewDidLoad(){
    
        let graphView = ScrollableGraphView(frame: graph1.frame)
      
        let data: [Double] = [4, 8, 15, 16, 23, 42]
        let labels = ["one", "two", "three", "four", "five", "six"]
        graphView.set(data: data, withLabels: labels)
        //graphView.
        //graphView
       // graphView.backgroundColor = nil
       
        
        self.graph1.addSubview(graphView)
    
    }
    
    
}
