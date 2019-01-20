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
    
    let RESOLUTION = 0.01
    let finalShowTime = 4.0
    
    
    var score = 0
    var life = 5
    var level: Level = Level(val: 1)
    var contents: [Bool] = []
    var toucheds: [Int] = []
    var timeLeft = 0.0
    var timer: Timer?
    
    var situation: GameSituation = .show {
        didSet {
            delegate?.game(situation: situation)
        }
    }
    
    
    init(){
        
    }
    
    func initialize(){
        
        contents = (0..<level.size * level.size).map({ _ in false })
        for _ in 0..<level.askCount {
            var rand = (0..<contents.count).randomElement()!
            while contents[rand] {
                rand = (0..<contents.count).randomElement()!
            }
            contents[rand] = true
        }
        delegate?.game(contents: contents)
        
        toucheds = []
        situation = .show
        timeLeft = level.seconds
        let _ = setTimeout(delay: level.showSeconds) {
            self.startLevel()
        }
    }
    
    func startLevel(){
        self.situation = .hide
        timer = Timer.scheduledTimer(timeInterval: RESOLUTION, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        delegate?.game(time: timeLeft)
    }
    
    @objc func updateTimer() {
        if timeLeft > 0.0 {
            timeLeft -= RESOLUTION
            delegate?.game(time: timeLeft)
        } else {
            self.situation = .final
            timer?.invalidate()
            let _ = setTimeout(delay: finalShowTime) {
                self.level = self.level.next()
                self.initialize()
            }
        }
    }
    
    func click(on: Int) -> Bool{
        if situation == .hide && !toucheds.contains(on){
            toucheds.append(on)
            let success = contents[on]
            return success
        }
        return false
    }
}

enum GameSituation {
    case show, hide, final
}

protocol GameDelegate {
    func game(contents: [Bool])
    func game(situation: GameSituation)
    func game(time: Double)
}
