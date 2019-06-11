//
//  UIView+Extension.swift
//  ParalaxCollectionView
//
//  Created by Alexandr Lobanov on 5/29/19.
//  Copyright © 2019 Alexandr Lobanov. All rights reserved.
//

import UIKit

@IBDesignable
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
        set {
            clipsToBounds = newValue > 0
            layer.cornerRadius = newValue
        } get {
            return layer.cornerRadius
        }
    }
}
