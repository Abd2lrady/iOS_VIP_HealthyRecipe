//
//  RecipeDetails.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady 
//

import UIKit

class RecipeDetailsVC: UIViewController {

    @IBOutlet weak var recipeWebsiteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeImg: UIImageView!
    
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weightToCalLabel: UILabel!
    @IBOutlet private weak var _ingredientListTV: UITableView!
    
    var interactor: RecipeDetailsInteractorProtocol?
    var router: RecipeDetailsRouterProtocol?
    
    let ingredientListTVDataSource = IngredientListTVDataSource()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        interactor?.interact(request: .viewLoaded)
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    private func configUI() {
        configNavBar()
        configIngredientList()
        configRecipeWebsiteButton()
        
    }
    
    func configRecipeWebsiteButton() {
        titleLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 16)
        titleLabel.textColor = Colors.cellText.color
        timeLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 16)
        timeLabel.textColor = Colors.cellText.color
        weightToCalLabel.font = UIFont(font: Fonts.JosefinSans.bold, size: 16)
        weightToCalLabel.textColor = Colors.cellText.color
        recipeWebsiteButton.layer.cornerRadius = 7
        recipeWebsiteButton.layer.borderColor = Colors.borders.color.cgColor
        recipeWebsiteButton.layer.borderWidth = 1

        recipeWebsiteButton.backgroundColor = Colors.recipeWebsiteButton.color
        let recipeWebsiteButtonTitle = Strings.recipeWebsiteButtonTitle
        let recipeWebsiteButtonTitleAtrributes = [NSAttributedString.Key.font:
                                                    Fonts.JosefinSans.regular.font(size: 16),
                                                  NSAttributedString.Key.foregroundColor:
                                                    Colors.recipeWebsiteButtonTitle.color]
        let recipeWebsiteButtonAttributedTitle = NSAttributedString(string: recipeWebsiteButtonTitle,
                                                                    attributes: recipeWebsiteButtonTitleAtrributes)
        recipeWebsiteButton.setAttributedTitle(recipeWebsiteButtonAttributedTitle,
                                               for: .normal)
        recipeWebsiteButton.addTarget(self,
                                      action: #selector(recipeWebsiteButtonTapped),
                                      for: .touchUpInside)
    }
    
    func configNavBar() {
        self.hideNavBar()
        let back = UIButton()
        back.setImage(Images.navBackIc.image, for: .normal)
        back.addTarget(self, action: #selector(backButtonAction), for: .touchUpInside)
        let backItem = UIBarButtonItem(customView: back)
        self.navigationItem.leftBarButtonItem = backItem
    }
    
    private func hideNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
    }
    
    @objc
    private func backButtonAction() {
        router?.backButtonPushed()
    }

    @objc
    private func recipeWebsiteButtonTapped() {
        router?.recipeWebsiteButtonTapped()
    }

}

extension RecipeDetailsVC {
    func configIngredientList() {
        _ingredientListTV.dataSource = ingredientListTVDataSource
        let cellNib = UINib(nibName: "\(IngredientCell.self)", bundle: .main)
        _ingredientListTV.register(cellNib,
                                   forCellReuseIdentifier: IngredientCell.reuseID)
        _ingredientListTV.alpha = 0.8
        _ingredientListTV.shapeAllCorners(radius: 10)
    }
    
}

extension RecipeDetailsVC {
   
    var ingredientListTV: UITableView {
        get {
            return _ingredientListTV
        } set {
            _ingredientListTV = newValue
        }
    }
}
