//
//  GalleryViewController.swift
//  Gercep
//
//  Created by Nabilla Azarine on 27/04/22.
//

import UIKit

class GalleryViewController: UIViewController {

    @IBOutlet weak var galleryCollection: UICollectionView!
    
    var galleryItem = [Gallery]()
    var index:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        galleryCollection.delegate = self
        galleryCollection.dataSource = self
        dataFeeder2()
        galleryCollection.reloadData()
    }
    
    func dataFeeder2() {
        let gallery1 = Gallery(image: "gallery_demo")
        let gallery2 = Gallery(image: "gallery_demo2")
        let gallery3 = Gallery(image: "gallery_demo3")
        let gallery4 = Gallery(image: "gallery_demo4")
        let gallery5 = Gallery(image: "gallery_demo5")
        let gallery6 = Gallery(image: "gallery_demo6")
        
        galleryItem.append(gallery1)
        galleryItem.append(gallery2)
        galleryItem.append(gallery3)
        galleryItem.append(gallery4)
        galleryItem.append(gallery5)
        galleryItem.append(gallery6)
    }
    
    func configureNavbar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        let alert = UIAlertController(title: "Add New Clothing", message: "Pick a method!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Open Camera", style: UIAlertAction.Style.default, handler: { action in
            let picker = UIImagePickerController()
            picker.sourceType = .camera
        }))
        alert.addAction(UIAlertAction(title: "From Existing Photo", style: UIAlertAction.Style.default, handler: { action in
            
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
        // masukin datanya ke struct
        // display
        galleryCollection.reloadData()
    }
    
}

extension GalleryViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        galleryCollection.deselectItem(at: indexPath, animated: true)
        
        // alert action sheet
        let alert = UIAlertController(title: "Alert", message: "Choose an action for this item:", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction) in
            self.galleryItem.remove(at: indexPath.row)
            print("deleted")
            self.galleryCollection.reloadData()
        }))
            
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("cancel")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return galleryItem.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = galleryCollection.dequeueReusableCell(withReuseIdentifier: "galleryCell", for: indexPath) as! GalleryCollectionViewCell
        
        let gallery = galleryItem[indexPath.row]
        index = indexPath.row
        
        cell.galleryImg.image = gallery.image
        
        return cell
    }
}
