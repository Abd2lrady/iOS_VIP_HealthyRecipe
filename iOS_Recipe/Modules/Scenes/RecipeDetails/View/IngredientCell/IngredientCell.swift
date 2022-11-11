//
//  IngredientCell.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady on 12/12/2021.
//

import UIKit

class IngredientCell: UITableViewCell {
    static let reuseID = "IngredientCell"
    @IBOutlet private weak var _ingredientLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configUI()
    }
    
    private func configUI() {
        _ingredientLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 12)
        _ingredientLabel.textColor = Colors.cellText.color
        contentView.backgroundColor = .black
    }
    
}

extension IngredientCell {
    var ingredientLabel: UILabel {
        get {
            return _ingredientLabel
        } set {
            _ingredientLabel = newValue
        }
    }
}
