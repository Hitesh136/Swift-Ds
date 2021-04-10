
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
    
    /*
        Reverse array in groups
        https://www.geeksforgeeks.org/reverse-an-array-in-groups-of-given-size/
    */
    func reverseArrayOfGroup(k: Int) -> [Element] {
        
        var i = Swift.min(k - 1, self.count - 1)
        var j = k
        var res = [Element]()
        for _ in 0..<self.count {
            res.append(self[i])
            j -= 1
            
            if j == 0 {
                j = k
                i += Swift.min((2 * k) - 1, self.count - 1)
            } else {
                i -= 1
            }
        }
        return res
    }
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
		
		//		var results: BinaryNode<Int>? = getPossibleStringsFromNumber(index + 1, resultString)
		
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
