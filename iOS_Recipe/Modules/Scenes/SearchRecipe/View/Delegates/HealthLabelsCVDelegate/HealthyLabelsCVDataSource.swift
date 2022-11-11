//
//  HealthLabelsCVDelegate.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class HealthyLabelsCVDataSource: NSObject {
    var healthyLabels = [String]()
}

extension HealthyLabelsCVDataSource: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        return healthyLabels.count
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HealthyLabelCell.reuseID,
                                                            for: indexPath) as? HealthyLabelCell
        else { fatalError("can`t dequeue recipe cell") }
        cell.healthyLabel.text = healthyLabels[indexPath.row]
        return cell
    }
    
}
