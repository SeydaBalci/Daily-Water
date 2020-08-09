//
//  CR.swift
//  Daily Water
//
//  Created by Şeyda Şeyma Balcı on 5/10/20.
//  Copyright © 2020 Şeyda Şeyma Balcı. All rights reserved.
//

import UIKit

extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
        }
    }
}
