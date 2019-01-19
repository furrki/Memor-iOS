//
//  MenuButton.swift
//  Memor
//
//  Created by Admin on 20.01.2019.
//  Copyright © 2019 furrki. All rights reserved.
//

import UIKit

@IBDesignable open class MenuButton: UIButton {

    override open func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        custom()
    }

    override open func awakeFromNib() {
        super.awakeFromNib()
        custom()
    }
    func custom(){
        layer.cornerRadius = 5.0
        backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.7254901961, blue: 0.231372549, alpha: 1) 
    }
   

}
