//
//  SearchRecipeVC.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import UIKit

class SearchRecipeVC: UIViewController, UITextFieldDelegate {
   
    @IBOutlet weak var query: UITextField!
    @IBOutlet weak var suggestionList: UITableView!
    @IBOutlet weak var recipeListTV: UITableView!
    @IBOutlet weak var filterCV: UICollectionView!
    @IBOutlet weak var suggestionListHeightConstrain: NSLayoutConstraint!
    @IBOutlet weak var filterTitleLabel: UILabel!
    lazy var noResultView = noResultLabel()
    let maxSuggestListHeight = CGFloat(180)
    
    var interactor: SearchRecipeInteractorProtocol?
    var router: SearchRecipeRouterProtocol?
    // MARK: Delegates
    let searchTextFieldDelegate = SearchTextFieldDelegate()
    
    let suggestionListDelegate = SuggestionListDelegate()
    let suggestionListDataSource = SuggestionListDataSource()
    
    let filterListDelegate = FilterListCVDelegate()
    let filterListDataSource = FilterListCVDataSource()
    
    let recipeListDelegate = RecipeListTVDelegate()
    let recipeListDataSource = RecipeListTVDataSource()
    
    // MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        interactor?.interact(request: .viewLoaded)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.barStyle = .black
    }
// MARK: Configure UI
    private func configUI() {
        configSuggestionList()
        configSearchTextField()
        configRecipeList()
        configFilterList()
        hideNavBar()
    }
    
    private func hideNavBar() {
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.isTranslucent = true
    }
}

// MARK: configure SuggestionList
extension SearchRecipeVC {
    private func configSuggestionList() {
        suggestionList.backgroundColor = .clear
        let cellNib = UINib(nibName: "\(LastSearchListTVCell.self)",
                            bundle: .main)
        suggestionList.register(cellNib,
                                forCellReuseIdentifier: LastSearchListTVCell.reuseID)
        
        suggestionList.setBorders(with: 2, color: Colors.borders.color)
        suggestionList.backgroundColor = Colors.search.color
        suggestionList.alpha = 0.8
        suggestionList.shapeAllCorners(radius: 5)

        suggestionList.dataSource = suggestionListDataSource
        suggestionList.delegate = suggestionListDelegate
        suggestionListDelegate.selectedSuggest = {
            self.query.text = $0
        }
    }
    
    var suggestListHeight: CGFloat {
        get {
            return suggestionListHeightConstrain.constant
        } set {
            if newValue > suggestionList.contentSize.height {
                suggestionListHeightConstrain.constant = suggestionList.contentSize.height
            } else {
                suggestionListHeightConstrain.constant = newValue
            }
        }
    }
    
    func showList() {
        suggestionList.reloadData()
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
            self.suggestListHeight = self.maxSuggestListHeight
            self.view.layoutSubviews()
        }
    }
    
    func hideList(query: String) {
        suggestionListDataSource.addSuggestion(query: query)
        interactor?.interact(request: .addSearchSuggestion(search: query))
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveLinear) {
            self.suggestListHeight = 0
            self.view.layoutSubviews()
        }
    }

}

// MARK: configure SearchField
extension SearchRecipeVC {
    func configSearchTextField() {
        query.delegate = searchTextFieldDelegate
        
        query.returnKeyType = .search
        query.backgroundColor = Colors.search.color
        query.alpha = 0.8
        query.shapeAllCorners(radius: 10)
        query.setBorders(with: 2, color: Colors.borders.color)
        
        searchTextFieldDelegate.beginTypingCallBack = beginTyping
        searchTextFieldDelegate.endTypingCallBack = {
            self.endTyping(query: $0)
        }
    }
    
    func beginTyping() {
        showList()
    }
    
    func endTyping(query: String) {
        hideList(query: query)
        let filter = filterListDelegate.selectedFilter
        guard !query.isEmpty else { return }
        view.showActivityIndicator()
        interactor?.interact(request: .getRecipes(query: query,
                                                  filter: filter))
    }
}

// MARK: configure RecipeList
extension SearchRecipeVC {
    func configRecipeList() {
        recipeListTV.delegate = recipeListDelegate
        recipeListTV.dataSource = recipeListDataSource
        let cellNib = UINib(nibName: "\(RecipeListTVCell.self)", bundle: .main)
        recipeListTV.register(cellNib,
                              forCellReuseIdentifier: RecipeListTVCell.reuseID)
        recipeListTV.alpha = 0.8
        recipeListTV.shapeAllCorners(radius: 10)
        recipeListTV.setBorders(with: 2, color: Colors.borders.color)
        recipeListTV.isHidden = true
        recipeListDelegate.selectedRecipe = {
            print("recipe is \($0)")
         }
    }
}

// MARK: configure FilterList
extension SearchRecipeVC {
    func configFilterList() {
        filterCV.dataSource = filterListDataSource
        filterCV.delegate = filterListDelegate
        let cellNib = UINib(nibName: "\(FilterCell.self)", bundle: .main)
        filterCV.register(cellNib, forCellWithReuseIdentifier: FilterCell.reuseID)
        filterCV.backgroundColor = .clear
        filterCV.shapeAllCorners(radius: 10)
        filterCV.setBorders(with: 2, color: Colors.cellText.color)
        filterCV.allowsMultipleSelection = false
        
        filterListDelegate.filter = { [weak self] in
            guard let query = self?.query.text, !query.isEmpty else { return }
            self?.interactor?.interact(request: .getRecipes(query: query, filter: $0))
        }
    }
            
}

// MARK: configure No Result
extension SearchRecipeVC {
    func noResultLabel() -> UILabel {
        let label = UILabel()
        label.text = Strings.noResult
        label.font = UIFont(font: Fonts.JosefinSans.bold, size: 14)
        label.textColor = Colors.cellText.color
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([label.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                                     label.topAnchor.constraint(equalTo: filterCV.bottomAnchor, constant: 20)])
        label.isHidden = true
        
        return label
    }
}
