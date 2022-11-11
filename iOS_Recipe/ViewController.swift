//
//  ViewController.swift
//  iOS_Recipe
//
//  Created by Ahmad Abdulrady on 11/11/2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .blue
        APIClient.shared.request(for: RecipeRouter.getRecipe(query: "chicken", filter: nil)) { result in
            switch result {
            case .failure(let error):
                switch error {
                case APIError.noInternet:
                    print("noInternet")
                default:
                    print(error.localizedDescription)
                }
            case .success(let data):
                print(data)
            }
        }
    }

}
