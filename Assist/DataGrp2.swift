//
//  DataGrp2.swift
//  Assist
//
//  Created by 이영규 on 2017. 7. 1..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit

class DataGrp2 : UIViewController{
    
    @IBOutlet var graph: UIView!
    override func viewDidLoad(){
        let graphView = ScrollableGraphView(frame: graph.frame)
        let data: [Double] = [1, 5, 23, 9, 10, 11]
        let labels = ["one", "two", "three", "four", "five", "six"]
        graphView.set(data: data, withLabels: labels)
       // graphView.
        graphView.alpha = 0.0
       // graphView.backgroundColor = nil
        self.graph.addSubview(graphView)
    
    }
    
}
