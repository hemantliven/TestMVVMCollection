//
//  ListViewModel.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation

class ListViewModel {
    
    func numberOfSections() -> Int {
        return 1
    }
    
    func numberOfItems(inSection section: Int) -> Int {
        return 1
    }
    
    func viewModelForItem(at indexPath: IndexPath) -> CollectionTableCellViewModel {
        return CollectionTableCellViewModel()
    }
}
