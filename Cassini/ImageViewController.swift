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
            if view.window != nil
            {
                fetchImage()
            }

        }
    }
    
    private func fetchImage()
    {
        if let url = imageURL
        {
            spinner?.startAnimating()
            dispatch_async(dispatch_get_global_queue(QOS_CLASS_USER_INITIATED, 0))
            {
                let contentsOfURL = NSData(contentsOfURL: url)
              
                dispatch_async(dispatch_get_main_queue())
                {
                    if url == self.imageURL
                    {
                        if let imageData = contentsOfURL
                        {
                            self.image = UIImage(data: imageData)
                        }
                        else
                        {
                            self.spinner?.stopAnimating()
                        }
                    }
                    else
                    {
                        print("Ignored data from URL: \(url)")
                    }
                }
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
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
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
            spinner?.stopAnimating()
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil
        {
            fetchImage()
        }
    }
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()

        scrollView.addSubview(imageView)
    }


}
