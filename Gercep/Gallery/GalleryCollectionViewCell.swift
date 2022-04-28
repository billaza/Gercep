//
//  GalleryCollectionViewCell.swift
//  Gercep
//
//  Created by Nabilla Azarine on 28/04/22.
//

import UIKit

class GalleryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var galleryImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        galleryImg.layer.cornerRadius = 8
        galleryImg.clipsToBounds = true
    }
}
