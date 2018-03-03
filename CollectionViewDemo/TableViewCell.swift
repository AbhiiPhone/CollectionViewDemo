//
//  TableViewCell.swift
//  CollectionViewDemo
//
//  Created by Abhishek Mitra on 27/02/18.
//  Copyright © 2018 Abhishek Mitra. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    @IBOutlet var collectionViewInTVCell: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

extension TableViewCell: UIScrollViewDelegate, UICollectionViewDelegateFlowLayout{
    
    func setCollectionViewDataSourceDelegate<D: UICollectionViewDataSource & UICollectionViewDelegate & UIScrollViewDelegate> (_ dataSourceDelegate: D, forRow row: Int) {
        
        
        collectionViewInTVCell.delegate = dataSourceDelegate
        collectionViewInTVCell.dataSource = dataSourceDelegate
        collectionViewInTVCell.delegate = dataSourceDelegate
        
        collectionViewInTVCell.tag = row
        collectionViewInTVCell.setContentOffset(collectionViewInTVCell.contentOffset, animated:false) // Stops collection view if it was scrolling.
        collectionViewInTVCell.reloadData()
        
        
        
    }
    
    var collectionViewOffset: CGFloat {
        
        set { collectionViewInTVCell.contentOffset.x = newValue }
        get { return collectionViewInTVCell.contentOffset.x }
    }
}
