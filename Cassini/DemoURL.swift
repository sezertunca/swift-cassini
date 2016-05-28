//
//  DemoURL.swift
//  Cassini
//
//  Created by Sezer Tunca on 28/05/2016.
//  Copyright © 2016 Sezer Tunca. All rights reserved.
//

import Foundation

struct DemoURL
{
    static let Stanford = "https://upload.wikimedia.org/wikipedia/commons/3/3b/Stanford_University_campus_from_above.jpg"
    
    static let NASA = [
        "Cassini": "https://upload.wikimedia.org/wikipedia/commons/b/b2/Cassini_Saturn_Orbit_Insertion.jpg",
        "Earth": "https://upload.wikimedia.org/wikipedia/commons/d/db/Nasa_blue_marble.jpg",
        "Saturn": "http://www.nasa.gov/sites/default/files/thumbnails/image/pia06193_0.jpg"
    ]
    
    static func NASAImageNamed(imageName: String?) -> NSURL?
    {
        if let urlstring = NASA[imageName ?? ""]
        {
            return NSURL(string: urlstring)
        }
        else
        {
            return nil
        }
    }
}