
import Foundation


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

extension Array where Element: Numeric, Element: Comparable {
    
    /*
     Subarray with given sum
     https://practice.geeksforgeeks.org/problems/subarray-with-given-sum/0
     */
    
    func subArray(withSum sum: Element) -> [Element] {
        guard !self.isEmpty else {
            return []
        }
        var total = self.first!
        var lastIndex = 0
        for i in 1..<self.count {
            let ele = self[i]
            total += ele
            if total > sum {
                total -= self[lastIndex]
                lastIndex += 1
            }
            if total == sum {
                return Array(self[lastIndex...i])
            } 
        }
        return []
    }
}
