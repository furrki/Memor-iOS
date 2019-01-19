//
//  GameCollectionView.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class GameCollectionView: UICollectionView {
    
    let SPACING = 2
    
    override func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    
    func custom(){
        
    }
    
    func set(size: Int){
        let w = Int(frame.size.width), h = Int(frame.size.height)
        
        let cellSize = CGSize(width: (w - size * SPACING) / size, height: (h - size * SPACING) / size)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 1, left: 1, bottom: 1, right: 1)
        layout.minimumLineSpacing = 1.0
        layout.minimumInteritemSpacing = 1.0
        self.setCollectionViewLayout(layout, animated: true)
        self.reloadData()
    }
}
