//
//  PhotosDataSource.swift
//  Photorama
//
//  Created by Cody Mudrack on 11/14/19.
//  Copyright © 2019 Cody Mudrack. All rights reserved.
//

import Foundation
import UIKit

class PhotosDataSource: NSObject, UICollectionViewDataSource {
    
    var photos: [Photo] = [Photo]()
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "photoCell", for: indexPath)
        return cell
    }
}
