//
//  BinarySearch.swift
//  DS
//
//  Created by Hitesh  Agarwal on 3/1/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation
extension RandomAccessCollection where Element: Comparable  {
    func binarySearch(for value: Element,in range: Range<Index>? = nil) -> Index? {
        let range = range ?? startIndex..<endIndex
        guard range.lowerBound < range.upperBound else {
            return nil
        }
        let size = distance(from: range.lowerBound, to: range.upperBound)
        let middle = index(range.lowerBound, offsetBy: (size / 2))
        if self[middle] == value {
            return middle
        } else if self[middle] > value {
            return binarySearch(for: value, in: range.lowerBound..<middle)
        } else if self[middle] < value {
            return binarySearch(for: value, in: index(after: middle)..<endIndex)
        }
        return nil
    }
    
    func searchRange(for value: Element) -> ClosedRange<Index>? {
        if let index = self.binarySearch(for: value) {
            let lowerIndex = searchLowerIndex(for: value, indexValue: index)
            let upperIndex = searchUpperIndex(for: value, indexValue: index)
                
            return lowerIndex...upperIndex
        }
        return nil
    }
    
    func searchLowerIndex(for value: Element, indexValue: Index) -> Index {
        let lowerIndex = index(before: indexValue)
        if lowerIndex < startIndex {
            return indexValue
        }
        if self[lowerIndex] == value {
            return searchLowerIndex(for: value, indexValue: lowerIndex)
        }
        return indexValue
    }
    
    func searchUpperIndex(for value: Element, indexValue: Index) -> Index {
        let upperIndex = index(after: indexValue)
        if upperIndex >= endIndex {
            return indexValue
        }
        if self[upperIndex] == value {
            return searchUpperIndex(for: value, indexValue: upperIndex)
        }
        return indexValue
    }
}
