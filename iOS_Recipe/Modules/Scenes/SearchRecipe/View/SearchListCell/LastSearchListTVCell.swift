//
//  LastSearchListCellTableViewCell.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import UIKit

class LastSearchListTVCell: UITableViewCell {
    static let reuseID = "LastSearchListTVCell"
    
    @IBOutlet private weak var _lastSearchLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        _lastSearchLabel.shapeAllCorners(radius: 10)
        _lastSearchLabel.backgroundColor = Colors.selectedFilter.color
        configLabel()
    }
    
    private func configLabel() {
        _lastSearchLabel.font = UIFont(font: Fonts.JosefinSans.regular, size: 14)
        _lastSearchLabel.textColor = Colors.cellText.color
    }
}

extension LastSearchListTVCell {
    var lastSearchLabel: UILabel {
        get {
            return _lastSearchLabel
        } set {
            _lastSearchLabel = newValue
        }
    }
}
