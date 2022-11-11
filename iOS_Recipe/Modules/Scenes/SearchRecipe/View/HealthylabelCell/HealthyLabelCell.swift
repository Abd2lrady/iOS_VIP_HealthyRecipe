//
//  HealthyLabelCell.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady on 11/12/2021.
//

import UIKit

class HealthyLabelCell: UICollectionViewCell {
    static let reuseID = "HealthyLabelCell"
    
    @IBOutlet private weak var _containerView: UIView!
    @IBOutlet private weak var _healthyLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configUI()
    }

}

extension HealthyLabelCell {
    var healthyLabel: UILabel {
        get {
            return _healthyLabel
        } set {
            _healthyLabel = newValue
        }
    }
    
    var containerView: UIView {
        get {
            return _containerView
        } set {
            _containerView = newValue
        }
    }
    
    private func configUI() {
        _healthyLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 12)
        _healthyLabel.textColor = Colors.cellText.color
        
        _containerView.shapeAllCorners(radius: _containerView.bounds.height / 2)
        _containerView.backgroundColor = Colors.unselectedFilter.color.withAlphaComponent(0.8)
        _containerView.setBorders(with: 2, color: Colors.cellText.color)
    }
    
}
