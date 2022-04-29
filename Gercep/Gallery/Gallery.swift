//
//  Gallery.swift
//  Gercep
//
//  Created by Nabilla Azarine on 28/04/22.
//

import Foundation
import UIKit

struct Gallery {
    var image:UIImage?
    
    init(image:String) {
        self.image = UIImage(named: image)
    }
}
