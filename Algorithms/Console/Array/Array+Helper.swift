
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
    
    mutating func findSingleOne() -> Int {
        return self.reduce(0, { $0 ^ $1 })
    }
    
//    https://therahulgoel.medium.com/top-array-programs-for-interview-swift-5-0-part-8-63cdbdf3d2dc
    mutating func kadensAlgo() -> Int {
        // https://www.youtube.com/watch?v=HCL4_bOd3-4
        // https://leetcode.com/problems/maximum-subarray/
        var maxSoFar = 0
        var max = 0
        for ele in self {
            max += ele
            if max > maxSoFar {
                maxSoFar = max
            }
            
            if max < 0 {
                max = 0
            }
        }
        return maxSoFar
    }
    
    func missingNumber() -> Int {
//    https://leetcode.com/problems/missing-number/
        let sum = self.reduce(0, +)
        let _count = self.count
        let totalSum = (_count * (_count + 1)) / 2
        return totalSum - sum
    }
    
    func majorityNumber() -> Int {
//    https://leetcode.com/problems/majority-element/
        var num = self[1]
        var count = 1
        let half = count / 2
        for i in 0..<count {
            let ele = self[i]
            if ele == num {
                count += 1
                if count >= half {
                    return num
                }
            } else {
                num = ele
                count = 1
            }
        }
        return num
    }
    
    mutating func duplicateZeros() -> [Int] {
        // https://leetcode.com/problems/duplicate-zeros/
        var index = 0
        let _count = self.count
        while index < _count {
            
            if self[index] == 0 {
                self.insert(0, at: index)
                index += 2
            } else {
                index += 1
            }
        }
        
        let pre = self.prefix(_count)
        return Array(pre)
    }
    
    mutating func sortByParity() {
        var j = -1
        for (index, ele) in self.enumerated() {
            if ele % 2 == 0 {
                j += 1
                swapAt(j, index)
            }
        }
    }
    
    func getConsecutivOnes() -> Int {
//        https://leetcode.com/problems/max-consecutive-ones/
        var maxNow = 0
        var maxSoFar = 0
        for ele in self {
            if ele == 0 {
                maxNow = 0
            } else if ele == 1 {
                maxNow += 1
                maxSoFar = Swift.max(maxNow, maxSoFar)
            }
        }
        
        return maxSoFar
    }
    
    func validMountainArray(_ arr: [Int]) -> Bool {
        //    https://leetcode.com/problems/valid-mountain-array/submissions/
               
            var i = 0
            while i + 1 < arr.count && arr[i] < arr[i + 1] {
                i += 1
            }
            
            if i == 0 || (i + 1) == arr.count {
                return false
            }
            
            while i + 1 < arr.count {
                if arr[i] <= arr[i + 1] {
                    return false
                }
                i += 1
            }
            return true
        }
    
    func findLCIS() -> Int {
        //https://leetcode.com/problems/longest-continuous-increasing-subsequence/
        var maxCurr = 1
        var maxSoFar = 1
        for i in 1..<count {
            if self[i - 1] < self[i] {
                maxCurr += 1
                maxSoFar = Swift.max(maxCurr, maxSoFar)
            } else {
                maxCurr = 1
            }
        }
        return maxSoFar
    }
    
    mutating func merge(_ nums2: [Int], _ n: Int) {
//    https://leetcode.com/problems/merge-sorted-array/submissions/
//    https://www.geeksforgeeks.org/merge-two-sorted-arrays-o1-extra-space//
        let m = self.count
        var i = m
        var j = 0
        while i < (m + n) {
            self[i] = nums2[j]
            var k = i
            while k > 0 {
                if self[k - 1] > self[k] {
                    swapAt(k - 1, k)
                } else {
                    break
                }
                k -= 1
            }
            i += 1
            j += 1
        }
    }
    
    mutating func sortArrayByParityII() {
//    https://leetcode.com/problems/sort-array-by-parity-ii/submissions/
//    https://www.geeksforgeeks.org/even-numbers-even-index-odd-numbers-odd-index/
        var evenItr = 0
        var oddItr = 1
        let n = self.count
        while true {
            while evenItr < n && self[evenItr] % 2 == 0 {
                evenItr += 2
            }
            
            while oddItr < n && self[oddItr] % 2 != 0 {
                oddItr += 2
            }
            
            if evenItr < n && oddItr < n {
                swapAt(evenItr, oddItr)
            } else {
                return
            }
        }
    }
    
    mutating func smallerNumbersThanCurrent() {
//    https://leetcode.com/problems/how-many-numbers-are-smaller-than-the-current-number/
        var counts = Array(repeating: 0, count: 101)
        
        for ele in self {
            counts[ele] += 1
        }
        
        var sum = 0
        for i in 0..<counts.count {
            let temp = counts[i]
            counts[i] = sum
            sum += temp
        }
        
        for i in 0..<count {
            self[i] = counts[self[i]]
        }
    }
}

class Solution {
    func intersection(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var set = Set<Int>()
        for num in nums1 {
            set.insert(num)
        }
        var res = [Int]()
        
        for num in nums2 {
            if set.contains(num) {
                res.append(num)
                set.remove(num)
            }
        }
        
        return res
    }
    
    func productExceptSelf(_ nums: [Int]) -> [Int] {
//        https://leetcode.com/problems/product-of-array-except-self/submissions/
        var lefts = Array(repeating: 1, count: nums.count)
        var rights = Array(repeating: 1, count: nums.count)
        
        for i in 1..<lefts.count {
            lefts[i] = lefts[i - 1] * nums[ i - 1]
        }
        
        for i in stride(from: nums.count - 2, through: 0, by: -1) {
            rights[i] = rights[i + 1] * nums[ i + 1]
        }
        
        var res = nums
        for i in 0..<nums.count {
            res[i] = lefts[i] * rights[i]
        }
        return res
    }
    
    func replaceElements(_ arr: [Int]) -> [Int] {
//        https://leetcode.com/problems/replace-elements-with-greatest-element-on-right-side/
        var maxArr = Array(repeating: -1, count: arr.count)
        for i in stride(from: arr.count - 2, through: 0, by: -1) {
            maxArr[i] = max(arr[i + 1], maxArr[i + 1])
        }
        return maxArr
    }
    
    func threeSum(_ _nums: [Int]) -> [[Int]] {
        //https://leetcode.com/problems/3sum/submissions/
        var map = [Int: Int]()
        var res = Set<[Int]>()
        let sum = 0
        var nums = _nums
        nums = nums.sorted()
        print(nums)
        for (index, value) in nums.enumerated() {
            map[value] = index
        }
        
        for i in 0..<nums.count - 2 {
            for j in i + 1..<nums.count - 1 {
                
                let sum2 = sum - (nums[i] + nums[j])
                if let k = map[sum2],
                   k > i,
                   k > j {
                    let resArr = [nums[i], nums[j], sum2]
//                    resArr.sort()
                    print("\(i) \(j) \(k): \(resArr)")
                    res.insert(resArr)
                }
            }
        }
        return Array(res)
    }
    
    func sumZero(_ n: Int) -> [Int] {
//    https://leetcode.com/problems/find-n-unique-integers-sum-up-to-zero/submissions/
        var res = [Int]()
        for i in 0..<(n/2) {
            res.append(i + 1)
            res.append(-(i + 1))
        }
        
        if n % 2 != 0 {
            res.append(0)
        }
        return res
    }
    
    func plusOne(_ digits: [Int]) -> [Int] {
//        https://leetcode.com/problems/plus-one/submissions/
        var shouldContinue = true
        var i = digits.count - 1
        var res = digits
        var carry: Int?
        while shouldContinue && i >= 0 {
            let ele = digits[i] + 1
            if ele == 10 {
                res[i] = 0
                i -= 1
                carry = 1
            } else {
                res[i] = ele
                carry = nil
                shouldContinue = false
            }
        }
        
        if i < 0 ,
           let _carry = carry {
            
            res.insert(1, at: 0)
        }
        return res
    }
    
    func trap(_ height: [Int]) -> Int {
        //https://leetcode.com/problems/trapping-rain-water/submissions/
        var left = Array(repeating: 0, count: height.count)
        
        left[0] = height[0]
        for i in 1..<height.count {
            left[i] = max(left[i - 1], height[i])
        }
        
        var right = Array(repeating: 0, count: height.count)
        right[height.count - 1] = height[height.count - 1]
        for i in stride(from: height.count - 2, through: 0, by: -1) {
            right[i] = max(right[i + 1], height[i])
        }
         
        var count = 0
        for i in 0..<height.count {
            let ele = height[i]
            count += min(left[i], right[i]) - height[i]
        }
        return count
    }
    
    func longestConsecutive(_ nums: [Int]) -> Int {
//https://leetcode.com/problems/longest-consecutive-sequence/submissions/
            var set = Set<Int>()
            for num in nums {
                set.insert(num)
            }
            
            var res = 0
            for num in nums {
                if !set.contains(num - 1) {
                    var temp = 0
                    var j = num
                    while set.contains(j) {
                        j += 1
                        temp += 1
                    }
                    
                    res = max(temp, res)
                }
            }
            return res
        }
    
    func countNegatives(_ grid: [[Int]]) -> Int {
//        https://leetcode.com/problems/count-negative-numbers-in-a-sorted-matrix/submissions/
           var rowsCount = grid.count
           var colCount = grid[0].count
           var count = 0
           for i in 0..<rowsCount {
               var row = grid[i]
               var j = colCount - 1
               while j >= 0 && row[j] < 0 {
                   count += 1
                   j -= 1
               }
           }
           return count
       }
    
    func oddCells(_ m: Int, _ n: Int, _ indices: [[Int]]) -> Int {
//        https://leetcode.com/problems/cells-with-odd-values-in-a-matrix/submissions/
            var grid = Array(repeating: Array(repeating: 0, count: n), count: m)
            
            for ind in indices {
                var r = ind[0]
                var c = ind[1]
                
                grid[r] = grid[r].map{ $0 + 1 }
                var i = 0
                while i < m {
                    grid[i][c] += 1
                    i += 1
                }
            }
            
            var count = 0
            for row in grid {
                for ele in row {
                    if ele % 2 != 0 {
                        count += 1
                    }
                }
            }
            return count
        }
    
    func generate(_ numRows: Int) -> [[Int]] {
//        https://leetcode.com/problems/pascals-triangle/submissions/
            var res = [[Int]]()
            var recentRow = [Int]()
            var t = numRows
            if t > 0 {
                recentRow = [1]
                res.append(recentRow)
                t -= 1
            }
            
            while t > 0 {
                var nextRow = [1]
                
                var i = 0
                while i + 1 < recentRow.count {
                    var x = recentRow[i] + recentRow[i + 1]
                    nextRow.append(x)
                    i += 1
                }
                
                nextRow.append(1)
                res.append(nextRow)
                recentRow = nextRow
                t -= 1
            }
            return res
        }
    
    func getRow(_ rowIndex: Int) -> [Int] {
        var res = [[Int]]()
        var recentRow = [Int]()
        var t = rowIndex
        if t > 0 {
            recentRow = [1]
            res.append(recentRow)
            t -= 1
        }
        
        while t > 0 {
            var nextRow = [1]
            
            var i = 0
            while i + 1 < recentRow.count {
                var x = recentRow[i] + recentRow[i + 1]
                nextRow.append(x)
                i += 1
            }
            
            nextRow.append(1)
            res.append(nextRow)
            recentRow = nextRow
            t -= 1
        }
        return res.last!
    }

    func pascelTriangeII(_ rowIndex: Int) -> [Int] {
//    https://leetcode.com/problems/pascals-triangle-ii/submissions/
            var res = [[Int]]()
            var recentRow = [Int]()
            var t = rowIndex + 1
            if t > 0 {
                recentRow = [1]
                res.append(recentRow)
                t -= 1
            }
            
            while t > 0 {
                var nextRow = [1]
                
                var i = 0
                while i + 1 < recentRow.count {
                    let x = recentRow[i] + recentRow[i + 1]
                    nextRow.append(x)
                    i += 1
                }
                
                nextRow.append(1)
                res.append(nextRow)
                recentRow = nextRow
                t -= 1
            }
            return res.last!
        }
    
    func findWords(_ words: [String]) -> [String] {
//    https://leetcode.com/problems/keyboard-row/submissions/
        let set1: Set<Character> = Set("qwertyuiop")
        let set2: Set<Character> = Set("asdfghjkl")
        let set3: Set<Character> = Set("zxcvbnm")
        
        var res = [String]()
        
        for _word in words {
            let word = _word.lowercased()
            var firstCount = 0
            var secondCount = 0
            var thiredCount = 0
            for char in word {
                if set1.contains(char) {
                    firstCount += 1
                }
                if set2.contains(char) {
                    secondCount += 1
                }
                if set3.contains(char) {
                    thiredCount += 1
                }
            }
            
            if firstCount == _word.count || secondCount == _word.count || thiredCount == _word.count {
                res.append(_word)
            }
        }
        return res
    }

    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
//        https://leetcode.com/problems/remove-element/submissions/
        var count = nums.count
        var i = 0
        var j = count - 1
        while i < j {
            if nums[i] == val {
                nums.swapAt(i, j)
                count -= 1
                j -= 1
            } else {
                i += 1
            }
        }
        
        while nums.last! == val {
            nums.removeLast()
        }
        return count
    }
    
    func runningSum(_ _nums: [Int]) -> [Int] {
        //    https://leetcode.com/problems/running-sum-of-1d-array/submissions/
        var nums = _nums
        var sum = nums[0]
        
        for i in 1..<nums.count {
            sum += nums[i]
            nums[i] = sum
        }
        return nums
    }
    
    func getTwoLargestNumber(_ nums: [Int]) -> [Int] {
//    https://www.geeksforgeeks.org/find-second-largest-element-array/
        var first = 0
        var second = 0
        for num in nums {
            if num > first {
                second = first
                first = num
            } else if num < first && num > second {
                second = num
            }
        }
        return [second, first]
    }
    
    func maxProduct(_ nums: [Int]) -> Int {
//    https://leetcode.com/problems/maximum-product-of-two-elements-in-an-array/
        var first = 0
        var second = 0
        for num in nums {
            if num > first {
                second = first
                first = num
            } else if num <= first && num > second {
                second = num
            }
        }
        return (first - 1) * (second - 1)
    }
    
    func xorOperation(_ n: Int, _ start: Int) -> Int {
//        https://leetcode.com/problems/xor-operation-in-an-array/
        var nums = Array(repeating: 0, count: n)
        var res = 0
        for i in 0..<nums.count {
            let x = start + (2 * i)
//            if i == 0 {
//                res = x
//            }
            res ^= x
            nums[i] = x
        }
        
        return res
    }
    func numIdenticalPairs(_ nums: [Int]) -> Int {
//    https://leetcode.com/problems/number-of-good-pairs/submissions/
        var map = [Int: Int]()
        
        for (index, num) in nums.enumerated() {
            if var value = map[num] {
                map[num] = value + 1
            } else {
                map[num] = 1
            }
        }
        
        var count = 0
        for key in map.keys {
            if let value = map[key] {
                count += (value * (value - 1)) / 2
            }
        }
        return count
    }
    
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
//    https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/
            let max = candies.max()!
            var res = [Bool]()
            return candies.map{ ($0 + extraCandies) >= max }
        }
    
    
    func backspaceCompare(_ s: String, _ t: String) -> Bool {
        //        https://leetcode.com/problems/backspace-string-compare/submissions/
        
        
        var a1 = Array(s)
        for i in 0..<a1.count {
            let ele = a1[i]
            if ele == "#" {
                a1.remove(at: i)
                if i > 0 {
                    a1.remove(at: i - 1)
                }
            }
        }
        
        var a2 = Array(t)
        for i in 0..<a2.count {
            let ele = a2[i]
            if ele == "#" {
                a2.remove(at: i)
                if i > 0 {
                    a2.remove(at: i - 1)
                }
            }
        }
        let s1 = a1.map{ String($0) }.joined()
        let s2 = a2.map{ String($0) }.joined()
        return s1 == s2
    }
    
    func longestCommonPrefix(_ strs: [String]) -> String {
//    https://leetcode.com/problems/longest-common-prefix/
     
        var res = ""
        var i = 0
        var firstWord = Array(strs[0])
        while i < firstWord.count {
            var notMatched = false
            
            var j = 1
            while j < strs.count {
                let word = Array(strs[j])
                if i >= firstWord.count || i >= word.count || word[i] != firstWord[i] {
                    notMatched = true
                    break
                }
                j += 1
            }
            
            if notMatched {
                break
            } else {
                res += String(firstWord[i])
            }
            
            i += 1
        }
        return res
    }
    
    func groupAnagrams(_ _strs: [String]) -> [[String]] {
        //        https://leetcode.com/problems/group-anagrams/
        var res = [[String]]()
        var strs = _strs
        var i = 0
        while i < strs.count {
            var word = strs[i]
            var wordSet = Set(Array(word))
            var row = [word]
            var j = i + 1
            while j < strs.count {
                
                var _set = wordSet
                var test = strs[j]
                for char in test {
                    _set.remove(char)
                }
                if _set.isEmpty {
                    row.append(test)
                    strs.remove(at: j)
                } else {
                    j += 1
                }
            }
            res.append(row)
            strs.remove(at: i)
        }
        return res
    }
    
    func generateParenthesis(_ n: Int) -> [String] {
//    https://leetcode.com/problems/generate-parentheses/submissions/
        func printParenthesis(_ peren: String,
                              _ o: Int,
                              _ c: Int,
                              _ n:Int,
                              _ res: inout [String]) {
            
            if c > o {
                return
            }
            
            if c == o && c == n {
                res.append(peren)
            }
            
            if c < n {
                printParenthesis(peren + ")", o, c + 1, n, &res)
            }
            
            if o < n {
                printParenthesis(peren + "(", o + 1, c, n, &res)
                
            }
        }
        
        var res = [String]()
        printParenthesis("(", 1, 0, n, &res)
        return res
    }
    
    func arrayStringsAreEqual(_ word1: [String], _ word2: [String]) -> Bool {
        let str1 = word1.joined()
        let str2 = word2.joined()
        return str1 == str2
        
    }
}
