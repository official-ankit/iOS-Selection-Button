//
//  ViewController.swift
//  SingleSelectionRadioBtn
//
//  Created by osx on 10/03/23.
//

import UIKit

class ListViewController: UIViewController {

    
    @IBOutlet weak var segmentedController: UISegmentedControl!
    
    @IBOutlet weak var listCollectionView: UICollectionView!
    var arrPic = ["Pic1","Pic2","Pic3","Pic4","Pic5","Pic6","Pic7","Pic8",]
    var radio = "a"
    var btnSelect = [String]()
    
    var cheak:switchBtn = .singleSelection
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        listCollectionView.register(UINib(nibName: "ListCollectionCell", bundle: .main), forCellWithReuseIdentifier: "listCollectionCell")
        listCollectionView.collectionViewLayout = createCompositionalLayout()
    }
  

    @IBAction func segmentedBtnPressed(_ sender: UISegmentedControl) {
        if segmentedController.selectedSegmentIndex == 0{
            self.cheak = .singleSelection
        }else if segmentedController.selectedSegmentIndex == 1 {
            self.cheak = .multipleSelection
        }
        self.listCollectionView.reloadData()
        btnSelect.removeAll()
        radio.removeAll()
    }
    
    
}

extension ListViewController:UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func createCompositionalLayout() -> UICollectionViewLayout {
               let layout = UICollectionViewCompositionalLayout { sectionIndex, layoutEnvironment in
                   return self.generateChatModule()
               }
               let config = UICollectionViewCompositionalLayoutConfiguration()
               layout.configuration = config
               return layout
           }
           func generateChatModule() -> NSCollectionLayoutSection {
               let item = NSCollectionLayoutItem(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .estimated(20)))
               let group = NSCollectionLayoutGroup.vertical(layoutSize: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .estimated(20)), subitems: [item])
               let section = NSCollectionLayoutSection(group: group)
               return section
           }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "listCollectionCell", for: indexPath) as! ListCollectionCell
        cell.imgProfile.image = UIImage(named: arrPic[indexPath.row])
        if cheak == .singleSelection{
            if radio == "\(indexPath.row)" {
                cell.btnRadio.setImage(UIImage(named: "SelectRadioBtn"), for: .normal)
            }else{
                cell.btnRadio.setImage(UIImage(named: "RadioBtn"), for: .normal)
            }
        } else if cheak == .multipleSelection{
            if btnSelect.contains(arrPic[indexPath.row]){
                cell.btnRadio.setImage(UIImage(named: "SelectRadioBtn"), for: .normal)
            }else{
                cell.btnRadio.setImage(UIImage(named: "RadioBtn"), for: .normal)
            }
        }
     
        return cell
}
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
                if cheak == .singleSelection {
              radio = "\(indexPath.row)"
         
            listCollectionView.reloadData()
        }else if cheak == .multipleSelection{
            if let index = btnSelect.firstIndex(where: {$0 == arrPic[indexPath.row]}){
                btnSelect.remove(at: index)
            }else{
                btnSelect.append(arrPic[indexPath.row])
            }
            listCollectionView.reloadData()
        }
    }
}
   

enum switchBtn{
    case singleSelection
    case multipleSelection
    
}
