//
//  Extensions.swift
//  ShopifyOrders
//
//  Created by PM on 14/05/19.
//  Copyright © 2019 Hanumant Shegade. All rights reserved.
//

import Foundation
import UIKit


extension UIImageView {
    
    public func imageFromURL(urlString: String) {
        let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        activityIndicator.color = .blue
        
        if self.image == nil {
            self.addSubview(activityIndicator)
        }
        
        guard let imgURL = URL(string: urlString) else {
            debugPrint("Invalid Image URL")
            return
        }
        
        URLSession.shared.dataTask(with: imgURL, completionHandler: { (data, response, error) -> Void in
            if error != nil {
                print(error ?? "No Error")
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                guard let imgData = data else {
                    debugPrint("Invalid image data")
                    return
                }
                let image = UIImage(data: imgData)
                activityIndicator.removeFromSuperview()
                self.image = image
            })
            
        }).resume()
    }
}

