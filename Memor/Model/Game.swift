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
    let finalShowTime = 1.5
    
    
    var score = 0 {
        didSet {
            delegate?.game(score: score, level: level.val, lives: lives)
        }
    }
    var lives = 5 {
        didSet {
            delegate?.game(score: score, level: level.val, lives: lives)
        }
    }
    var level: Level = Level(val: 1) {
        didSet {
            delegate?.game(score: score, level: level.val, lives: lives)
        }
    }
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
    
    func initLevel(){
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
        delegate?.game(score: score, level: level.val, lives: lives)
        let _ = setTimeout(delay: level.showSeconds) {
            self.startLevel()
        }
    }
    
    func startLevel(){
        self.situation = .hide
        timer = Timer.scheduledTimer(timeInterval: RESOLUTION, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        delegate?.game(time: timeLeft)
    }
    
    func finishLevel(){
        self.situation = .final
        timer?.invalidate()
        let _ = setTimeout(delay: finalShowTime) {
            self.level = self.level.next()
            self.initLevel()
        }
    }
    
    @objc func updateTimer(){
        if timeLeft > 0.0 {
            timeLeft -= RESOLUTION
            delegate?.game(time: timeLeft)
        } else {
            lives -= 1
            if checkDead() {
                endGame()
            } else {
                finishLevel()
            }
        }
    }
    
    func click(on: Int) -> Bool{
        if situation == .hide && !toucheds.contains(on){
            toucheds.append(on)
            let success = contents[on]
            if success {
                score += 5
                if checkFinished() {
                    finishLevel()
                }
            } else {
                lives -= 1
                if checkDead() {
                  endGame()
                }
            }
            return success
        }
        return false
    }
    
    func checkFinished() -> Bool{
        for (i, c) in contents.enumerated() {
            if c && !toucheds.contains(i) {
                return false
            }
        }
        return true
    }
    
    func checkDead() -> Bool{
        if lives < 0 {
            return true
        }
        return false
    }
    
    func endGame() {
        finishLevel()
        self.delegate?.gameDead(shown: false)
        let _ = setTimeout(delay: finalShowTime) {
            self.delegate?.gameDead(shown: true)
        }
    }
}

enum GameSituation {
    case show, hide, final
}

protocol GameDelegate {
    func game(contents: [Bool])
    func game(situation: GameSituation)
    func game(time: Double)
    func game(score: Int, level: Int, lives: Int)
    func gameDead(shown: Bool)
}
