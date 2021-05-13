//
//  CollectionViewCell.swift
//  task5MADtry2
//
//  Created by KriDan on 13.05.2021.
//

import UIKit
import Kingfisher

class CollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var cellImageView: UIImageView!
    

    
    @IBOutlet weak var labelTitle: UILabel!
    
    var data: Data! {
        didSet{

            cellImageView.kf.setImage(with: URL(string: data.image ?? "no url("))
            
            labelTitle.text = data.title
            
        }
    }
}
