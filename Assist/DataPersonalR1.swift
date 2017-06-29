//
//  DataPersonalR1.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit
class DataPersonalR1 : UIViewController{
    
    @IBOutlet var graphview: UIView!
    
    @IBOutlet var graphview2: UIView!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        let graphView = ScrollableGraphView(frame: graphview.frame)
        let graphView1 = ScrollableGraphView(frame: graphview2.frame)
        let data: [Double] = [4, 8, 15, 16, 23, 42]
        let data1: [Double] = [10, 120, 20, 14, 17, 80]
        let labels = ["one", "two", "three", "four", "five", "six"]
        graphView.set(data: data, withLabels: labels)
       // graphView.set
        //graphview2.set(data: data, withLabels: labels)
        //graphView.set
        graphView1.set(data: data1, withLabels: labels)
        self.graphview.addSubview(graphView)
        self.graphview2.addSubview(graphView1)
    
    }
    
    
    
}
