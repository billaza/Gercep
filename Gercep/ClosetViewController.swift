//
//  ClosetViewController.swift
//  Gercep
//
//  Created by Nabilla Azarine on 27/04/22.
//

import UIKit

class ClosetViewController: UIViewController {

    @IBOutlet weak var typeControl: UISegmentedControl!
    @IBOutlet weak var closetCollection: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        closetCollection.delegate = self
        closetCollection.dataSource = self
        configureNavbar()
        closetCollection.reloadData()
    }
    
    func configureNavbar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: nil)
    }

}

extension ClosetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        closetCollection.deselectItem(at: indexPath, animated: true)
    }
    
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        let cell = closetCollection.dequeueReusableCell(withReuseIdentifier: <#T##String#>, for: <#T##IndexPath#>)
//
//        return
//    }
//
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//
//    }
}
