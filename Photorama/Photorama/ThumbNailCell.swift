//
//  ThumbNailCell.swift
//  Photorama
//
//  Created by Cody Mudrack on 11/14/19.
//  Copyright © 2019 Cody Mudrack. All rights reserved.
//

import Foundation
import UIKit



class ThumbNailCell: UICollectionViewCell {
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    
    override func awakeFromNib() {
        updateImage(nil)
    }
    
    override func prepareForReuse() {
        updateImage(nil)
    }
    
    func updateImage(_ image: UIImage?) {
        imageView.image = image
        if image != nil {
            spinner.stopAnimating()
        } else {
            spinner.startAnimating()
        }
    }
}
