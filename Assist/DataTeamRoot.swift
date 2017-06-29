//
//  DataTeamRoot.swift
//  Assist
//
//  Created by 이영규 on 2017. 6. 29..
//  Copyright © 2017년 YG. All rights reserved.
//

import UIKit


class DataTeamRoot : UIPageViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate{
    
    var totalIndex = 4
    var pageControl: UIPageControl?
    var currentIndex = 1
    
    var pageIndex = [0,1,2,3]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegate = self;
        dataSource = self
        
        self.setViewControllers([getViewControllerAtIndex(0)] as [UIViewController], direction: .forward, animated: true, completion: nil)
        set_pageControl()
    }
    
    func set_pageControl(){
        pageControl = UIPageControl(frame: CGRect(x: 0, y: view.frame.height/2-20, width: view.frame.width, height: 20))
        pageControl?.numberOfPages = pageIndex.count
        pageControl?.pageIndicatorTintColor = UIColor.gray
        pageControl?.currentPageIndicatorTintColor = UIColor.red;
        view.addSubview(pageControl!)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let pageContent: DataTeamRootC = viewController as! DataTeamRootC
        var index = pageContent.pageIndex
        if ((index == 0) || (index == NSNotFound))
        {
            return nil
        }
        index -= 1;
        return getViewControllerAtIndex(index)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let pageContent: DataTeamRootC = viewController as! DataTeamRootC
        
        
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
    
    func getViewControllerAtIndex(_ index: Int) -> DataTeamRootC {
        
        let wvc = self.storyboard?.instantiateViewController(withIdentifier: "DataTeamRootC") as! DataTeamRootC
        
        wvc.pageIndex = index
        return wvc
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContent: DataTeamRootC = viewControllers?.first as! DataTeamRootC
        
        pageControl?.currentPage = pageContent.pageIndex
    }

}
