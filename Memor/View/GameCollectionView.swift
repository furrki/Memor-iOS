//
//  GameCollectionView.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class GameCollectionView: UICollectionView {
    
    let SPACING = CGFloat(1.0)
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom(){
        
    }
    
    func set(size: Int){
        let w = Int(frame.size.width - SPACING * CGFloat(size)) , h = Int(frame.size.height - SPACING * CGFloat(size))
        
        let cellSize = CGSize(width: (w) / size, height: (h ) / size)
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: SPACING, left: SPACING, bottom: SPACING, right: SPACING)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 0.0
        self.setCollectionViewLayout(layout, animated: true)
        self.reloadData()
    }
}
