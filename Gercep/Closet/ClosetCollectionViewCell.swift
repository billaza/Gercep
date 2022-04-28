//
//  ClosetCollectionViewCell.swift
//  Gercep
//
//  Created by Nabilla Azarine on 28/04/22.
//

import UIKit

class ClosetCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var closetImg: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        closetImg.layer.cornerRadius = 8
        closetImg.clipsToBounds = true
    }
}
