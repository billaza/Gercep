//
//  HomeViewController.swift
//  Gercep
//
//  Created by Nabilla Azarine on 27/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuTable: UITableView!
    
    var menus:[String] = ["All", "Tops", "Bottoms", "One-piece", "Shoes"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        menuTable.delegate = self
        menuTable.dataSource = self
        menuTable.reloadData()
    }
    
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return menus.count
        }
        else {
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if (section == 0) {
            return "My Closet"
        } else {
            return nil
        }
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let menu = menus[indexPath.row]
        
        let cellA = tableView.dequeueReusableCell(withIdentifier: "closetCell", for: indexPath) as! ClosetTableViewCell
        let cellB = tableView.dequeueReusableCell(withIdentifier: "galleryCell", for: indexPath) as! GalleryTableViewCell
        
        if (indexPath.section == 0) {
            cellA.closetLbl.text = menus[indexPath.row]
            return cellA
        }
        else {
            cellB.galleryLbl.text = "My Gallery"
            return cellB
        }
    }
}
