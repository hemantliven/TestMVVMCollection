//
//  CollectionCell.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation
import MVVM

class CollectionCell: UICollectionViewCell, MVVM.View {
    var viewModel: CollectionCellViewModel = CollectionCellViewModel() {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateView()
    }
    
    func updateView() {
        self.backgroundColor = UIColor(hue: ((CGFloat(viewModel.indexPath.row) * CGFloat(viewModel.parentSection + 1)) / 40.0), saturation: 0.68, brightness: 0.98, alpha: 1)
    }
    
}
