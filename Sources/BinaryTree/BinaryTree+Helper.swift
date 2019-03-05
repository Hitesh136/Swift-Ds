

import Foundation

extension BinaryNode where Element: Comparable {
    
    /*
     Check for BST
     https://practice.geeksforgeeks.org/problems/check-for-bst/1
     */
    func isBst() -> Bool {
        if let leftValue = leftChild?.value,
            leftValue > value {
            return false
        }
        
        if let rightValue = rightChild?.value,
            rightValue < value {
            return false
        }
        
        if !(leftChild?.isBst() ?? true), !(rightChild?.isBst() ??  true) {
            return false
        }
        return true
    }
}
