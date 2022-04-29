//
//  HomeViewController.swift
//  Gercep
//
//  Created by Nabilla Azarine on 27/04/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var menuTable: UITableView!
    
    var index:Int = 0
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
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return section == 0 ? 20 : 18
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        index = indexPath.row
        
        if indexPath.section == 0 {
            performSegue(withIdentifier: "homeToCloset", sender: self)
        }
        else {
            performSegue(withIdentifier: "homeToGallery", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "homeToCloset") {
            let dest = segue.destination as! ClosetViewController
            dest.title = menus[index]
            dest.type = menus[index]
        }
        else if (segue.identifier == "homeToGallery") {
            let dest = segue.destination as! GalleryViewController
            dest.title = "My Gallery"
        }
    }
}
