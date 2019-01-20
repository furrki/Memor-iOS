//
//  Level.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import Foundation
struct Level {
    var val: Int
    var size: Int {
            return val + 2
    } // Will be squared
    
    var askCount: Int {
        return (val + 2) / 2 + 1
    } // Singular
    
    var seconds: Double {
        return Double(val + 2)
    }

    var showSeconds: Double {
        return Double(val)
    }
    
    init(val: Int){
        self.val = val
    }
    
    func next() -> Level{
        return Level.init(val: self.val + 1)
    }
}

