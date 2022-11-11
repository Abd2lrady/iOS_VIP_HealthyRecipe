//
//  UIView+ActivityIndicator.swift
//  iOS_ProductTask
//
//  Created by Ahmad Abdulrady
//

import UIKit

extension UIView {
    func showActivityIndicator() {
        
        let indicator = UIActivityIndicatorView()
        
        self.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([indicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
                                     indicator.centerXAnchor.constraint(equalTo: self.centerXAnchor)])
        
        indicator.color = .white
        indicator.style = .large
        self.isUserInteractionEnabled = false
        indicator.startAnimating()
    }
    
    func hideActivityIndicator() {
        var indicator: UIActivityIndicatorView?
        for  subView in subviews {
            if let view = subView as? UIActivityIndicatorView {
                indicator = view
                break
            }
        }
        self.isUserInteractionEnabled = true
        indicator?.stopAnimating()
        indicator?.removeFromSuperview()
    }
    
}
