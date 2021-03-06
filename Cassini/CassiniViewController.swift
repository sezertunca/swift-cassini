//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Sezer Tunca on 28/05/2016.
//  Copyright © 2016 Sezer Tunca. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController, UISplitViewControllerDelegate
{
    
    private struct Storyboard
    {
        static let ShowImageSegue = "Show Image"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Storyboard.ShowImageSegue
        {
            if let ivc = segue.destinationViewController.contentViewController as? ImageViewController
            {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.NASAImageNamed(imageName)
                ivc.title = imageName
            }
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        splitViewController?.delegate = self
    }
    
    func splitViewController(splitViewController: UISplitViewController, collapseSecondaryViewController secondaryViewController: UIViewController, ontoPrimaryViewController primaryViewController: UIViewController) -> Bool {
        
        if primaryViewController.contentViewController == self
        {
            if let ivc = secondaryViewController.contentViewController as? ImageViewController where ivc.imageURL == nil
            {
                return true
            }
        }
        return false 
        
    }
}

extension UIViewController
{
    var contentViewController: UIViewController
    {
        if let navcon = self as? UINavigationController
        {
            return navcon.visibleViewController ?? self
        }
        else
        {
            return self
        }
    }
}