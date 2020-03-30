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
        return [self.newVc(viewController: "wtaRank"),
            self.newVc(viewController: "atpRank")]
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
                print("no ranks...")
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
        
        print("RankingPageViewController - Before")
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
        pageControl = UIPageControl(frame: CGRect(x: 0,
                                                  y: UIScreen.main.bounds.maxY - 100,
                                                  width: UIScreen.main.bounds.width,
                                                  height: 70))
        pageControl.numberOfPages = orderedViewControllers.count
        pageControl.currentPage = 0
        pageControl.tintColor = UIColor.white
        pageControl.defersCurrentPageDisplay = true
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPageIndicatorTintColor = UIColor.black
        self.view.addSubview(pageControl)
    }
    
    func newVc(viewController: String) -> RankingViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: viewController) as! RankingViewController
    }
}
