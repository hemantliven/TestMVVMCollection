//
//  CollectionTableCell.swift
//  TestMVVMCollection
//
//  Created by liven on 6/22/18.
//  Copyright © 2018 liven. All rights reserved.
//

import Foundation
import MVVM

class CollectionTableCell: UITableViewCell, MVVM.View {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var viewModel: CollectionTableCellViewModel = CollectionTableCellViewModel() {
        didSet {
            updateView()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollection()
        updateView()
    }
    
    func updateView() {
        self.collectionView.reloadData()
    }
}

extension CollectionTableCell: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return viewModel.numberOfSections()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfItems(inSection: section)
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionCell", for: indexPath) as? CollectionCell
            else { fatalError() }
        cell.viewModel = viewModel.viewModelForItem(at: indexPath)
        return cell
    }
}

extension CollectionTableCell: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 120, height: 119)
        return size
    }
}

extension CollectionTableCell {
    fileprivate func configureCollection() {
        collectionView.register(CollectionCell.self, forCellWithReuseIdentifier: "CollectionCell")
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
