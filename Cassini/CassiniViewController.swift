//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Sezer Tunca on 28/05/2016.
//  Copyright © 2016 Sezer Tunca. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController
{
    
    private struct Storyboard
    {
        static let ShowImageSegue = "Show Image"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        if segue.identifier == Storyboard.ShowImageSegue
        {
            if let ivc = segue.destinationViewController as? ImageViewController
            {
                let imageName = (sender as? UIButton)?.currentTitle
                ivc.imageURL = DemoURL.NASAImageNamed(imageName)
                ivc.title = imageName
            }
        }
    }
}
