import Foundation


extension Array where Element: Comparable {
   
   mutating func insertionSort() {
       //https://www.youtube.com/watch?v=OGzPmgsI-pQ
       for i in 1..<count {
           var x = i
           while (x - 1) >= 0 {
               if self[x - 1] > self[x] {
                   swapAt(x - 1, x)
               }
               x -= 1
           }
       }
   }
   
   mutating func selectionSort() {
       // https://www.youtube.com/watch?v=xWBP4lzkoyM
       for i in 0..<(count - 1) {
           var minEle = self[i]
           var minEleIndex = i
           for j in (i + 1)..<count {
               if self[j] < minEle {
                   minEle = self[j]
                   minEleIndex = j
               }
           }
           swapAt(i, minEleIndex)
       }
   }
   
   mutating func countingSort() where Element == Int {
       var min = self[0]
       var max = self[0]
       for ele in self {
           if ele > max {
               max = ele
           }
           if ele < min {
               min = ele
           }
       }
       
       var countArr = Array(repeating: 0, count: (max - min) + 1)
       for n in self {
           countArr[n - min] += 1
       }
       
       var c = 0
       var i = 0
       
       while i < count {
           if countArr[c] == 0 {
               c += 1
           } else {
               self[i] = min + c
               countArr[c] -= 1
               i += 1
           }
       }
   }
   
   mutating func bubbleSort() {
       for i in 0..<count {
           for j in 1..<(count - i) {
               if self[j - 1] > self[j] {
                   swapAt(j - 1, j)
               }
           }
       }
   }
   mutating func heapSort() {}
   mutating func quickSort() {
       func sort(_ start: Int, _ end: Int) {
           guard start < end else { return }
           let pivot = self[end]
           var i = -1 + start
           for j in start..<end {
               if self[j] < pivot {
                   i += 1
                   swapAt(i, j)
               }
           }
//            i += start
           i += 1
           swapAt(i, end)
           sort(0, i  - 1)
           sort(i + 1, end)
       }
       sort(0, count - 1)
   }
   mutating func mergeSort() where Element == Int {
       func sort(_ start: Int, _ end: Int) -> [Int] {
           
           if start == end {
               return [self[start]]
           }
           let mid = start + ((end - start) / 2)
           var left = sort(start, mid)
           var right = sort(mid + 1, end)
           
           var j = 0
           var k = 0
           var result = [Int]()
           while j < left.count && k < right.count {
               if left[j] < right[k] {
                   result.append(left[j])
                   j += 1
               } else {
                   result.append(right[k])
                   k += 1
               }
           }
           
           if j < (left.count) {
               let suffix = left.suffix(left.count - j)
               result.append(contentsOf: suffix)
               
           } else if k < (right.count) {
               let suffix = right.suffix(right.count - k)
               result.append(contentsOf: suffix)
               
           }
           return result
       }
       self = sort(0, self.count - 1)
   }
}




