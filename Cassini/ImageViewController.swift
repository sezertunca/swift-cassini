//
//  ImageViewController.swift
//  Cassini
//
//  Created by Sezer Tunca on 28/05/2016.
//  Copyright © 2016 Sezer Tunca. All rights reserved.
//

import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
{
    
    var imageURL: NSURL?
    {
        didSet
        {
            image = nil
            fetchImage()
        }
    }
    
    private func fetchImage()
    {
        if let url = imageURL
        {
            if let imageData = NSData(contentsOfURL: url)
            {
                image = UIImage(data: imageData)
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView!
    {
        didSet
        {
            scrollView?.contentSize = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 2.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView?
    {
        return imageView
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage?
    {
        get
        {
            return imageView.image
        }
        set
        {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize = imageView.frame.size
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        scrollView.addSubview(imageView)
    }


}
