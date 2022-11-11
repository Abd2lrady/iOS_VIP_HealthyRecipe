//
//  RecipeTVCell.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady on 07/12/2021.
//

import UIKit

class RecipeListTVCell: UITableViewCell {
    static let reuseID = "RecipeListTVCell"
    
    @IBOutlet private weak var _recipeImg: UIImageView!
    @IBOutlet private weak var _titleLabel: UILabel!
    @IBOutlet private weak var _sourceLabel: UILabel!
    @IBOutlet private weak var _healthyLabelsCV: UICollectionView!
    @IBOutlet private weak var _healthyLabelsCVLayout: UICollectionViewFlowLayout!
    
    var heathyLabels = [String]() {
        didSet {
            healthLabelsListCVDataSource.healthyLabels = heathyLabels
            healthyLabelsCV?.reloadData()
        }
    }
        
    let healthLabelsListCVDataSource = HealthyLabelsCVDataSource()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        confighealthyLabelsCV()
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        configUI()
    }
}

extension RecipeListTVCell {
    var recipeImg: UIImageView? {
        get {
            return _recipeImg
        } set {
            _recipeImg = newValue
        }
    }
    
    var titleLabel: UILabel? {
        get {
            return _titleLabel
        } set {
            _titleLabel = newValue
        }
    }
    
    var sourceLabel: UILabel? {
        get {
            return _sourceLabel
        } set {
            _sourceLabel = newValue
        }
    }
    
    var healthyLabelsCV: UICollectionView? {
        get {
            return _healthyLabelsCV
        } set {
            _healthyLabelsCV = newValue
        }
    }
    
    func confighealthyLabelsCV() {
        healthyLabelsCV?.backgroundColor = .clear
        healthyLabelsCV?.dataSource = healthLabelsListCVDataSource
        let cellNib = UINib(nibName: "\(HealthyLabelCell.self)", bundle: .main)
        healthyLabelsCV?.register(cellNib,
                                  forCellWithReuseIdentifier: HealthyLabelCell.reuseID)
    }
    
    private func configUI() {
        _titleLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 12)
        _titleLabel.textColor = Colors.cellText.color
        
        _sourceLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 12)
        _sourceLabel.textColor = Colors.cellText.color
        
        recipeImg?.shapeAllCorners(radius: 20)
        contentView.backgroundColor = .black
    }
}
