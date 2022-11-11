//
//  FilterCVDelegate.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady 
//

import Foundation
import UIKit

class FilterListCVDelegate: NSObject, UICollectionViewDelegate {
    var selectedFilter: Filter?
    var filter: ((Filter?) -> Void)?
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCell
        else { return }
        selectedFilter = cell.filter
        filter?(selectedFilter)
        cell.containerView.backgroundColor = Colors.selectedFilter.color
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? FilterCell
        else { return }
        cell.containerView.backgroundColor = Colors.unselectedFilter.color.withAlphaComponent(0.8)
        }
    
}
