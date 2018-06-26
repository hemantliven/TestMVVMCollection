//
//  CollectionTableCellViewModel.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation
import MVVM

class CollectionTableCellViewModel: MVVM.ViewModel {
    var indexPath: IndexPath = IndexPath(row: 0, section: 0)
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return 5
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> CollectionCellViewModel {
        let collectionCellViewModel = CollectionCellViewModel()
        collectionCellViewModel.indexPath = indexPath
        collectionCellViewModel.parentSection = self.indexPath.section
        return collectionCellViewModel
    }
    
}
