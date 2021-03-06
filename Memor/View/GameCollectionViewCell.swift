//
//  GameCollectionViewCell.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class GameCollectionViewCell: UICollectionViewCell {
    var colors: [GameCellType:UIColor] = [
        .hidden : #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1),
        .show : #colorLiteral(red: 0.8631474743, green: 0.5246582687, blue: 0.006769784112, alpha: 1),
        .success : #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1),
        .error: #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    ]
    var type: GameCellType = .hidden {
        didSet {
            contentView.backgroundColor = colors[type]
            contentView.layoutIfNeeded()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        contentView.backgroundColor = colors[type]
    }
}
enum GameCellType {
    case hidden, show, success, error
}
