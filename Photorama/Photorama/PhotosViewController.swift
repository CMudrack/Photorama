//
//  PhotosViewController.swift
//  Photorama
//
//  Created by Cody Mudrack on 11/14/19.
//  Copyright © 2019 Cody Mudrack. All rights reserved.
//

import UIKit
import SDWebImage

class PhotosViewController: UIViewController, UICollectionViewDelegate {
    
    @IBOutlet var collectionView: UICollectionView!
    
    var photosDataSource = PhotosDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.dataSource = photosDataSource
        collectionView.delegate = self
        
        FlickrAPI.fetchInterestingPhotos(page: 1, perPage: 30, completion: { (photosResult) in
            switch photosResult {
            case .success(let photos):
                self.photosDataSource.photos = photos
            case .failure( _):
                self.photosDataSource.photos = []
            }
            self.collectionView.reloadData()
        })
    }
    
   func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
    
         guard indexPath.item < photosDataSource.photos.count else {
             return
         }
         
         let photo = photosDataSource.photos[indexPath.item]
         
         guard let urlString = photo.url_h,
             let url = URL(string: urlString) else {
             return
         }
         
         guard let thumbnailCell = cell as? ThumbNailCell else {
             return
         }
    
    SDWebImageManager.shared.loadImage(with: url,
                                       options: SDWebImageOptions(rawValue: 0),
                                       progress: nil) { (image, data, error, cacheType, finished, loadedURL) in
        thumbnailCell.updateImage(image)
    }
         
//         FlickrAPI.fetchImage(fromURL: url) { (imageResult) in
//             switch imageResult {
//             case .success(let image):
//                 thumbnailCell.updateImage(image)
//             default:
//                 break
//             }
//         }
     }
    
    
    
}
