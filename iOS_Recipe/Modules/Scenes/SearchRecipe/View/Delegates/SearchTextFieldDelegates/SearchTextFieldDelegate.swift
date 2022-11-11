//
//  SearchTextFieldDelegate.swift
//  iOS_HealthyRecipe
//
//  Created by Ahmad Abdulrady
//

import Foundation
import UIKit

class SearchTextFieldDelegate: NSObject {
    var endTypingCallBack: ((String) -> Void)?
    var beginTypingCallBack: (() -> Void)?
}

extension SearchTextFieldDelegate: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        beginTypingCallBack?()
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        endTypingCallBack?(textField.text ?? "")
        return true
    }
}
