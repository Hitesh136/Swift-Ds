//
//  Josephus.swift
//  Algorithms
//
//  Created by Hitesh Agarwal on 10/04/21.
//

import Foundation

extension Array where Element == Int {
    
    mutating public func execute(atIndex index: Int, rotation: Int) -> Int {
        var _count = count
        if _count == 1 {
            return self[index]
        }
        self.remove(at: index)
        _count = count
        var nextExecutionIndex = ((index + rotation) % _count) - 1
        if nextExecutionIndex == -1 {
            nextExecutionIndex = _count - 1
        }
        return execute(atIndex: nextExecutionIndex, rotation: rotation)
    }
}

public class JosephusProblem {
    func slove(forPersonsCount personsCount: Int, rotation: Int) -> Int {
        
        var persons = [Int]()
        for i in 1...personsCount {
            persons.append(i)
        }
        let executionIndex = (rotation % personsCount) - 1
        return persons.execute(atIndex: executionIndex, rotation: rotation)
    }
}
