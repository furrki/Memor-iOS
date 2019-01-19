//
//  Game.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation

class Game {
    static var shared = Game()
    var delegate: GameDelegate?
    
    var score = 0
    var level: Level = Level(val: 3)
    var contents: [Bool] = []
    var situation: GameSituation = .show
    
    
    init(){
        setContents()
    }
    
    func setContents(){
        contents = (0..<level.size * level.size).map({ _ in false })
        
        for _ in 0..<level.askCount {
            var rand = (0..<contents.count).randomElement()!
            while contents[rand] {
                rand = (0..<contents.count).randomElement()!
            }
            contents[rand] = true
        }
        delegate?.game(contents: contents)
        situation = .show
        delegate?.game(situation: situation)
    }
    
}

enum GameSituation {
    case show, hide, final
}

protocol GameDelegate {
    func game(contents: [Bool])
    func game(situation: GameSituation)
}
