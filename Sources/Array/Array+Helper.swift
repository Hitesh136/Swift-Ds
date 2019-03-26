
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
    
    func findMaxSumOfSubSequence() -> Int {
        var sumArray = self
        var posArray = Array(0..<sumArray.count)
        
        for i in 1..<sumArray.count {
            for j in 0..<i {
                if self[j] < self[i] {
                    sumArray[i] = Swift.max(sumArray[j], (self[i] + sumArray[j]))
                    posArray[i] = j
                }
            }
        }
        
        if let maxValue = sumArray.max() {
            return maxValue
        }
        return 0
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
    
    /*
     https://www.geeksforgeeks.org/sort-an-array-of-0s-1s-and-2s/
     Sort an array of 0s, 1s and 2s
     */
    
    func sort012(arr: [Element]) -> [Element] {
        var arr = arr
        var low = 0
        var mid = 0
        var high = arr.count - 1
        while mid <= high {
            switch arr[mid] {
            case 0:
                arr.swapAt(low, mid)
                low += 1
                mid += 1
            case 1:
                mid += 1
            case 2:
                arr.swapAt(high, mid)
                high -= 1
            default:
                break
            }
        }
        return arr
    }
    
    /*
     Maximum of all subarrays of size k
     https://practice.geeksforgeeks.org/problems/maximum-of-all-subarrays-of-size-k/0
     */
    func slidingWindowMaximum(_ k: Int) -> [Element] {
        var max: Element = 0
        var j = 0
        var results = [Element]()
        for i in 0..<k {
            if self[i] > max {
                max = self[i]
            }
        }
        
        results.append(max)
        
        for inde in k..<self.count {
            
            //Check if max value is not in the window
            max = self[inde] > max ? self[inde] : max
            if self[j] == max {
                for i in (j + 1)...inde {
                    if self[i] > max {
                        max = self[i]
                    }
                }
            }
            
            j += 1
            results.append(max)
        }
        
        return results
    }
    
    
}
