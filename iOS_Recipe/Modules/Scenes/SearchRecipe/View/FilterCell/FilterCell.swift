//
//  FilterCVCell.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady on 05/12/2021.
//

import UIKit

class FilterCell: UICollectionViewCell {
    static let reuseID = "FilterCell"
    @IBOutlet private weak var _filterLabel: UILabel!
    @IBOutlet private weak var _containerView: UIView!
    
    var filter: Filter? {
        didSet {
            setLabel()
        }
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configUI()
    }

}

extension FilterCell {
    var filterLabel: UILabel {
        get {
            return _filterLabel
        } set {
            _filterLabel = newValue
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
        _filterLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 8)
        _filterLabel.textColor = Colors.cellText.color
        
        _containerView.shapeAllCorners(radius: 10)
        _containerView.backgroundColor = Colors.unselectedFilter.color
        _containerView.setBorders(with: 2, color: Colors.cellText.color)
    }
    
    private func setLabel() {
        switch filter {
        case .lowSugar:
            filterLabel.text = Strings.lowSugar
        case .vegan:
            filterLabel.text = Strings.vegan
        case .keto:
            filterLabel.text = Strings.keto
        case nil:
            filterLabel.text = Strings.all
        }
    }

}
