//
//  NextLargerElement.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation


class NextLargerElement {
}
extension Array where Element == Int {
    
    /*
     Next larger element
     https://www.geeksforgeeks.org/next-greater-element/
     */
    func nextLargerElement() -> [Element]{
        var map = [Element: Element]()
        var stack = Stack<Element>()
        
        if let first = self.first {
            stack.push(first)
        }
        for i in 1..<self.count {
            let ele = self[i]
            while let peek = stack.peek(),
                ele > peek {
                    
                map[peek] = ele
                stack.pop()
            }
            stack.push(ele)
        }
        
        var arr = [Element]()
        for ele in self {
            if let value = map[ele] {
                arr.append(value)
            } else {
                arr.append(-1)
            }
        }
        
        return arr
    }
    
}
