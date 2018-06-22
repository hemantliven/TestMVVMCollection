//
//  CollectionCell.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation
import UIKit

class CollectionCell: UICollectionViewCell {
    var viewModel = CollectionCellViewModel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    func updateView() {
    }
    
}
