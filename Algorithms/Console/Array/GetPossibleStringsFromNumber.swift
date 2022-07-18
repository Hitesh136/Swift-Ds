//
//  GetPossibleStringsFromNumber.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
class GetPossibleStringsFromNumber {
    
}


//https://www.techiedelight.com/combinations-of-words-formed-replacing-given-numbers-corresponding-english-alphabet/
extension Array where Element == Int {
    func getPossibleStringsFromNumber(_ index: Index,_ node: BinaryNode<String>?) {
        
        guard let node = node, index < count else {
            return
        }
        var resultString = node.value
        
        let intValue = self[index]
        resultString.append(getString(fromASCIINumber: intValue))
        node.rightChild = BinaryNode(value: resultString)
        getPossibleStringsFromNumber(index + 1, node.rightChild)
        
        //        var results: BinaryNode<Int>? = getPossibleStringsFromNumber(index + 1, resultString)
        
        if index < count - 1 {
            let jointValue = intValue * 10 + (self[index +  1])
            if jointValue < 27 {
                var _resultString = node.value
                _resultString.append(getString(fromASCIINumber: jointValue))
                node.leftChild = BinaryNode(value: _resultString)
                getPossibleStringsFromNumber(index + 2, node.leftChild)
            }
        }
    }
    
    func getString(fromASCIINumber intValue: Int) -> String {
        if let unicodeValue = UnicodeScalar(intValue + 64)  {
            return String(unicodeValue)
        }
        return ""
    }
    
    
    func getPossibleStringsFromNumber(_ index: Index,_ resultStringArg: String) -> [String] {
        
        var resultString = resultStringArg
        guard index < count else {
            return [resultString]
        }
        
        let intValue = self[index]
        resultString.append(getString(fromASCIINumber: intValue))
        var results = getPossibleStringsFromNumber(index + 1, resultString)
        
        if index < count - 1 {
            let jointValue = intValue * 10 + (self[index +  1])
            if jointValue < 27 {
                var _resultString = resultStringArg
                _resultString.append(getString(fromASCIINumber: jointValue))
                let _results = getPossibleStringsFromNumber(index + 2, _resultString)
                results.append(contentsOf: _results)
            }
        }
        
        return results
    }
}
