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
            return val / 4 + 2
    } // Will be squared
    
    var askCount: Int {
        return size + (val % 4) - 1
    } // Singular
    
    var seconds: Double {
        return Double(size)
    }

    var showSeconds: Double {
        return Double(size) / 3.0
    }
    
    init(val: Int){
        self.val = val
    }
    
    func next() -> Level{
        return Level.init(val: self.val + 1)
    }
}

