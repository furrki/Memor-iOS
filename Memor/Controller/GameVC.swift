//
//  GameVC.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

class GameVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, GameDelegate {
    

    @IBOutlet weak var GameCV: GameCollectionView!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var timeSlider: GameTimerSlider!
    @IBOutlet weak var timeParent: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        GameCV.delegate = self
        Game.shared.delegate = self
        
        timeParent.layer.cornerRadius = 10
        GameCV.layer.cornerRadius = 3
        
        GameCV.set(size: Game.shared.level.size)
        Game.shared.initialize()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Game.shared.contents.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameCell", for: indexPath) as! GameCollectionViewCell
        switch Game.shared.situation {
        case .show:
            if Game.shared.contents[indexPath.row] {
                cell.type = .show
            } else {
                cell.type = .hidden
            }
            break
        case .hide:
            
            break
        case .final:
            
            break
        }
       
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if Game.shared.situation == .hide {
            let success = Game.shared.click(on: indexPath.row)
        }
    }
    
    func game(contents: [Bool]) {
        GameCV.reloadData()
    }
    
    func game(situation: GameSituation) {
        switch situation {
        case .show:
            break
        case .hide:
            break
        case .final:
            break
            
        }
    }
    func initializeLevel(){
        
    }
}
