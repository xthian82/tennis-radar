//
//  RankingPageViewController.swift
//  TennisRadar
//
//  Created by Cristhian Jesus Recalde  Franco on 3/29/20.
//  Copyright © 2020 Cristhian Recalde. All rights reserved.
//

import UIKit

class RankingPageViewController: UIPageViewController, UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    
    // MARK: - Properties
    lazy var orderedViewControllers: [RankingViewController] = {
        return [self.newVc(viewController: Constants.wtaRanking),
                self.newVc(viewController: Constants.atpRanking)]
    }()
    var pageControl = UIPageControl()
    
    // MARK: - Window Functions
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        if let firstViewController = orderedViewControllers.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        delegate = self
        TennisApi.getPlayerRankings { response in
            guard let rankings: PlayerRankings = response else {
                self.orderedViewControllers[0].stopAnimation()
                 ControllerUtil.presentAlert(self, title: "Error", message: "No ranking found")
                return
            }
            for (index, controller) in self.orderedViewControllers.enumerated() {
                controller.tourRanking = rankings.rankings[index]
            }
            self.orderedViewControllers[0].refresh()
        }
        
        self.configurePageControl()
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController as! RankingViewController) else {
            return nil
        }
        
        let previousIndex = viewControllerIndex - 1
        guard previousIndex >= 0 else {
            return nil
        }
        guard orderedViewControllers.count > previousIndex else {
            return nil
        }
        return orderedViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = orderedViewControllers.firstIndex(of: viewController as! RankingViewController) else {
            return nil
        }
        
        let nextIndex = viewControllerIndex + 1
        guard orderedViewControllers.count != nextIndex else {
            return nil
        }
        
        guard orderedViewControllers.count > nextIndex else {
            return nil
        }
        
        return orderedViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        let pageContextViewController = pageViewController.viewControllers![0]
        self.pageControl.currentPage = orderedViewControllers.firstIndex(of: pageContextViewController as! RankingViewController)!
    }
    
    // MARK: Helper Methods
    func configurePageControl() {
        let heightSize: CGFloat = 70
        let tabBarHeight = self.tabBarController?.tabBar.frame.size.height ?? heightSize
        pageControl = UIPageControl(frame: CGRect(x: 0,
                                                  y: UIScreen.main.bounds.maxY - tabBarHeight - heightSize,
                                                  width: UIScreen.main.bounds.width,
                                                  height: heightSize))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.green
        pageControl.defersCurrentPageDisplay = true
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func newVc(viewController: String) -> RankingViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController) as! RankingViewController
    }
}
