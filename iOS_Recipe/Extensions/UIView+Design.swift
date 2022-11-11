//
//  UIViewExtension+Design.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension UIView {
    
    func setCorners(with radius: CGFloat,
                    corners: CACornerMask) {
        
        self.layer.cornerRadius = radius
        self.layer.maskedCorners = corners
        self.clipsToBounds = true
        
    }
    
    func shapeAllCorners(radius: CGFloat) {
        setCorners(with: radius,
                   corners: [.layerMaxXMaxYCorner,
                             .layerMaxXMinYCorner,
                             .layerMinXMinYCorner,
                             .layerMinXMaxYCorner])
    }

    func setBorders(with width: CGFloat,
                    color: UIColor) {
        self.layer.borderWidth = width
        self.layer.borderColor = color.cgColor
    }
}
