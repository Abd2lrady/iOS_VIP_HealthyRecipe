//
//  FilterCVDataSource.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady on 09/12/2021.
//

import Foundation
import UIKit

class FilterListCVDataSource: NSObject {
    let filters: [Filter?] = [nil,
                              Filter.keto,
                              Filter.vegan,
                              Filter.lowSugar]
}

extension FilterListCVDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return filters.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterCell.reuseID,
                                                            for: indexPath) as? FilterCell
        else { fatalError("can not dequeue filter cell") }
        cell.filter = filters[indexPath.row]
        return cell
    }
}
