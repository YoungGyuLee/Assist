//
//  DataPeronalRoot.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit


class DataPeronalRoot : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    var totalIndex = 4
    var pageControl: UIPageControl?
    var currentIndex = 1
    
    var pageIndex = [0,1,2]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self;
        dataSource = self
       // self.transitionStyle
        
        
        self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: .forward, animated: true, completion: nil)
        set_pageControl()
    }
    
    func set_pageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 170, y: view.frame.height/2-36, width: 13, height: 13))
        pageControl?.numberOfPages = pageIndex.count
        pageControl?.pageIndicatorTintColor = UIColor.gray
        pageControl?.currentPageIndicatorTintColor = UIColor.red;
        view.addSubview(pageControl!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: DataPersonalRootC = viewController as! DataPersonalRootC
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: DataPersonalRootC = viewController as! DataPersonalRootC
        
        
        var index = pageContent.pageIndex
        if (index == NSNotFound)
        {
            return nil;
        }
        index += 1;
        if (index == pageIndex.count)
        {
            return nil;
        }
        return getViewControllerAtIndex(index)
        
        //여기서 보낼 곳 걸러야 함
        
        
        
    }
    
    func getViewControllerAtIndex(_ index: Int) -> DataPersonalRootC {
        
        let wvc = self.storyboard?.instantiateViewController(withIdentifier: "DataPersonalRootC") as! DataPersonalRootC
        
        wvc.pageIndex = index
        return wvc
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContent: DataPersonalRootC = viewControllers?.first as! DataPersonalRootC
        
        pageControl?.currentPage = pageContent.pageIndex
    }
    
    
    
}
