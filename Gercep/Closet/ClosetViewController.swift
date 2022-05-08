//
//  ClosetViewController.swift
//  Gercep
//
//  Created by Nabilla Azarine on 27/04/22.
//

import UIKit
import MobileCoreServices

class ClosetViewController: UIViewController {

    @IBOutlet weak var typeControl: UISegmentedControl!
    @IBOutlet weak var closetCollection: UICollectionView!
    
    var closetItem = [Closet]()
    var closetNeutral = [Closet]()
    var closetVibrant = [Closet]()
    var menus:[String] = ["Tops", "Bottoms", "One-piece", "Shoes"]
    var index:Int = 0
    var stepper:Int = 0
    var type:String?
    var valueSelected: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavbar()
        closetCollection.delegate = self
        closetCollection.dataSource = self
        
        if stepper == 0 {
            stepper = stepper + 1
            dataFeeder()
        }
        
        closetCollection.reloadData()
    }
    
    func dataFeeder() {
        let closet1 = Closet(image: "closet_demo_top", type: "Tops", color: "Neutral")
        let closet2 = Closet(image: "closet_demov_pants", type: "Bottoms", color: "Vibrant")
        let closet3 = Closet(image: "closet_demov_skirt", type: "Bottoms", color: "Vibrant")
        let closet4 = Closet(image: "closet_demov_dress", type: "One-piece", color: "Vibrant")
        let closet5 = Closet(image: "closet_demo_top2", type: "Tops", color: "Neutral")
        let closet6 = Closet(image: "closet_demo_top3", type: "Tops", color: "Neutral")
        let closet7 = Closet(image: "closet_demo_skirt", type: "Bottoms", color: "Neutral")
        let closet8 = Closet(image: "closet_demo_shoes", type: "Shoes", color: "Neutral")
        let closet9 = Closet(image: "closet_demo_shoes2", type: "Shoes", color: "Neutral")
        let closet10 = Closet(image: "closet_demov_shoes", type: "Shoes", color: "Vibrant")
        let closet11 = Closet(image: "closet_demov_shoes2", type: "Shoes", color: "Vibrant")
        
        if (type == "All") {
            closetNeutral.append(closet1)
            closetVibrant.append(closet2)
            closetVibrant.append(closet3)
            closetVibrant.append(closet4)
            closetNeutral.append(closet5)
            closetNeutral.append(closet6)
            closetNeutral.append(closet7)
            closetNeutral.append(closet8)
            closetNeutral.append(closet9)
            closetVibrant.append(closet10)
            closetVibrant.append(closet11)
        }
        else if (type == "Tops") {
            closetNeutral.append(closet1)
            closetNeutral.append(closet5)
            closetNeutral.append(closet6)
        }
        else if (type == "Bottoms") {
            closetVibrant.append(closet2)
            closetVibrant.append(closet3)
            closetNeutral.append(closet7)
        }
        else if (type == "One-piece") {
            closetVibrant.append(closet4)
        }
        else if (type == "Shoes") {
            closetNeutral.append(closet8)
            closetNeutral.append(closet9)
            closetVibrant.append(closet10)
            closetVibrant.append(closet11)
        }
        
        closetItem = closetNeutral
        stepper = 1
    }
    
    func configureNavbar() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addTapped))
    }
    
    @objc func addTapped() {
        let alert = UIAlertController(title: "Add New Clothing", message: "Pick a method!", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "Open Camera", style: UIAlertAction.Style.default, handler: { action in
//            let picker = UIImagePickerController()
//            picker.sourceType = .camera
            let alertView = UIAlertController(title: "Select category", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)

            let pickerView = UIPickerView(frame:CGRect(x: 0, y: 50, width: 260, height: 162))
            pickerView.dataSource = self
            pickerView.delegate = self
            pickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)

            alertView.view.addSubview(pickerView)

            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                let closetAdd = Closet(image: "dummy_add", type: self.valueSelected, color: "Neutral")
                self.closetNeutral.append(closetAdd)
                self.closetCollection.reloadData()
            })

            alertView.addAction(action)
            
            self.present(alertView, animated: true, completion: {  pickerView.frame.size.width = alertView.view.frame.size.width
            })
        }))
        
        alert.addAction(UIAlertAction(title: "From Existing Photo", style: UIAlertAction.Style.default, handler: { action in
            let alertView = UIAlertController(title: "Select category", message: "\n\n\n\n\n\n\n\n\n", preferredStyle: .alert)

            let pickerView = UIPickerView(frame:CGRect(x: 0, y: 50, width: 260, height: 162))
            pickerView.dataSource = self
            pickerView.delegate = self
            pickerView.backgroundColor = UIColor.lightGray.withAlphaComponent(0.2)

            alertView.view.addSubview(pickerView)

            let action = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: { action in
                let closetAdd = Closet(image: "dummy_add", type: self.valueSelected, color: "Neutral")
                self.closetNeutral.append(closetAdd)
                self.closetCollection.reloadData()
            })

            alertView.addAction(action)
            
            self.present(alertView, animated: true, completion: {  pickerView.frame.size.width = alertView.view.frame.size.width
            })
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
        closetCollection.reloadData()
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        if (typeControl.selectedSegmentIndex == 0) {
            closetItem = closetNeutral
            closetCollection.reloadData()
        }
        else if (typeControl.selectedSegmentIndex == 1) {
            closetItem = closetVibrant
            closetCollection.reloadData()
        }
        closetCollection.reloadData()
    }

}

extension ClosetViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        closetCollection.deselectItem(at: indexPath, animated: true)
        
        // alert action sheet
        let alert = UIAlertController(title: "Alert", message: "Choose an action for this item:", preferredStyle: .actionSheet)
        
        if (typeControl.selectedSegmentIndex == 0) {
            alert.addAction(UIAlertAction(title: "Switch to Vibrant", style: .default , handler:{ (UIAlertAction)in
                let temp = self.closetNeutral[indexPath.row]
                self.closetVibrant.append(temp)
                print("switch")
                self.closetItem.remove(at: indexPath.row)
//                self.closetVibrant.remove(at: indexPath.row)
                self.closetCollection.reloadData()
            }))
        }
        else {
            alert.addAction(UIAlertAction(title: "Switch to Neutral", style: .default , handler:{ (UIAlertAction)in
                let temp = self.closetVibrant[indexPath.row]
                self.closetNeutral.append(temp)
                print("switch")
                self.closetItem.remove(at: indexPath.row)
//                self.closetVibrant.remove(at: indexPath.row)
                self.closetCollection.reloadData()
            }))
        }
        

        alert.addAction(UIAlertAction(title: "Delete", style: .destructive , handler:{ (UIAlertAction) in
            self.closetItem.remove(at: indexPath.row)
            
            if (self.typeControl.selectedSegmentIndex == 0) {
                self.closetNeutral.remove(at: indexPath.row)
            }
            else {
                self.closetVibrant.remove(at: indexPath.row)
            }
            print("deleted")
            self.closetCollection.reloadData()
        }))
            
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:{ (UIAlertAction)in
            print("cancel")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return closetItem.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = closetCollection.dequeueReusableCell(withReuseIdentifier: "closetCell", for: indexPath) as! ClosetCollectionViewCell
        
        let closet = closetItem[indexPath.row]
        index = indexPath.row
        
        cell.closetImg.image = closet.image
        
        return cell
    }
}

extension ClosetViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return menus.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return menus[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        valueSelected = menus[row] as String
     }
    
}
