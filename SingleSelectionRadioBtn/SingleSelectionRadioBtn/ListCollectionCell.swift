//
//  ListCollectionCell.swift
//  SingleSelectionRadioBtn
//
//  Created by osx on 10/03/23.
//

import UIKit

class ListCollectionCell: UICollectionViewCell {

    @IBOutlet weak var btnRadio: UIButton!
 
    @IBOutlet weak var imgProfile: UIImageView!
    var radioBtn:(()->Void)?
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    @IBAction func radioBtnPressed(_ sender: UIButton) {
        radioBtn?()
    }
}
