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
            if Game.shared.toucheds.contains(indexPath.row) {
                if Game.shared.contents[indexPath.row] {
                    cell.type = .success
                } else {
                    cell.type = .error
                }
            } else {
                cell.type = .hidden
            }
            break
        case .final:
            if Game.shared.toucheds.contains(indexPath.row) {
                if Game.shared.contents[indexPath.row] {
                    cell.type = .success
                } else {
                    cell.type = .error
                }
            } else {
                if Game.shared.contents[indexPath.row] {
                    cell.type = .show
                } else {
                    cell.type = .hidden
                }
            }
            break
        }
       
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if Game.shared.situation == .hide {
            let _ = Game.shared.click(on: indexPath.row)
            GameCV.reloadData()
        }
    }
    
    func game(contents: [Bool]) {
        GameCV.reloadData()
    }
    
    func game(situation: GameSituation) {
        GameCV.reloadData()
        switch situation {
        case .show:
            timeSlider.maximumValue = Float(Game.shared.level.seconds)
            timeSlider.minimumValue = 0.0
            timeSlider.value = Float(Game.shared.level.seconds)
            GameCV.set(size: Game.shared.level.size)
            break
        case .hide:
            break
        case .final:
            break
            
        }
    }
    func game(time: Double) {
        timeSlider.value = Float(time)
    }
    func updateLabels(){
        roundLabel.text = String(Game.shared.level.val)
        scoreLabel.text = String(Game.shared.score)
    }
}
