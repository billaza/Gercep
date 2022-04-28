//
//  Closet.swift
//  Gercep
//
//  Created by Nabilla Azarine on 28/04/22.
//

import Foundation
import UIKit

struct Closet {
    var image:UIImage?
    var type:String?
    var color:String?
    
    init(image:String, type:String, color:String) {
        self.image = UIImage(named: image)
        self.type = type
        self.color = color
    }
}
