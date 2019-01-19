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
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "gameCell", for: indexPath)
        switch Game.shared.situation {
        case .show:
            if Game.shared.contents[indexPath.row] {
                cell.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
            } else {
                cell.backgroundColor = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
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
        <#code#>
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
