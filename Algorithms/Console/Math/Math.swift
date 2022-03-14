//
//  Math.swift
//  Console
//
//  Created by Hitesh Agarwal on 11/03/22.
//

import Foundation


/*
 
 Links of Questions
    https://therahulgoel.medium.com/top-maths-programs-for-interview-swift-5-0-part-3-8f8aec1277e8
    https://github.com/soapyigu/LeetCode-Swift/tree/master/Math
 */



extension Solution {
    func judgeSquareSum(_ c: Int) -> Bool {
//        https://leetcode.com/problems/sum-of-square-numbers/
        var left = 0
        var right = Int(sqrt(Double(c)))
        
        while left <= right {
            let sum = (left * left) + (right * right)
            if sum == c {
                return true
            } else if sum > c {
                right -= 1
            } else {
                left += 1
            }
        }
        return false
    }
    
    func trailingZeroes(_ n: Int) -> Int {
//    https://leetcode.com/problems/factorial-trailing-zeroes/
           var res = 0
           var x = 5
           while n / x >= 1 {
               res += n / x
               x *= 5
           }
           return res
       }
    
    func selfDividingNumbers(_ left: Int, _ right: Int) -> [Int] {
//        https://leetcode.com/problems/self-dividing-numbers/submissions/
            var start = left
            var res = [Int]()
            while start <= right {
                if isSelfDividingNumber(start) {
                    res.append(start)
                }
                start += 1
            }
            return res
        }
        
        func isSelfDividingNumber(_ num: Int) -> Bool {
            var number = num
            var status = true
            while number > 0 {
                var lastDigit = number % 10
                if lastDigit != 0 {
                    if num % lastDigit != 0 {
                        status = false
                        break
                    }
                } else {
                    status = false
                    break
                }
                number /= 10
            }
            return status
        }
    
    func isPowerOfTwo(_ n: Int) -> Bool {
//        https://leetcode.com/problems/power-of-two/submissions/
           guard n > 0 else { return false }
           return (n & (n - 1)) == 0
       }
    
    func addBinary(_ a: String, _ b: String) -> String {
//        https://leetcode.com/problems/add-binary/submissions/
            var carry = 0
            let arr1 = Array(a)
            let arr2 = Array(b)
            var res = ""
            var i = arr1.count - 1
            var j = arr2.count - 1
            
            while i >= 0 || j >= 0 || carry != 0 {
                var sum = carry
                
                if i >= 0  {
                    sum += Int(String(arr1[i]))!
                    i -= 1
                }
                
                if j >= 0 {
                    sum += Int(String(arr2[j]))!
                    j -= 1
                }
                
                
                let ans = sum % 2
                carry = sum / 2
                res = "\(ans)" + res
            }
            return res
        }
    
    func addDigits(_ num: Int) -> Int {
//        https://leetcode.com/problems/add-digits/submissions/
            // guard num > 0 else { return 0}
            // guard num > 9 else { return num}
            var n = num
            
            while n > 9 {
                var sum = 0
                var res = n
                while res > 0 {
                    let lastDigit = res % 10
                    sum += lastDigit
                    res = res / 10
                }
                
                n = sum
            }
            
            return n
        }
    
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
//        https://leetcode.com/problems/add-two-numbers/
         
            var head: ListNode? = nil
            var res: ListNode? = nil
            
            var node1 = l1
            var node2 = l2
            var carry = 0
            while node1 != nil || node2 != nil || carry != 0 {
                var sum = carry
                
                if node1 != nil {
                    sum += node1!.val
                    node1 = node1!.next
                }
                
                if node2 != nil {
                    sum += node2!.val
                    node2 = node2!.next
                }
                
                if sum > 9 {
                    sum = sum % 10
                    carry = 1
                } else {
                    carry = 0
                }
                let newNode = ListNode(sum)
                if head == nil {
                    head = newNode
                }
                
                if res == nil {
                    res = newNode
                } else {
                    res?.next = newNode
                    res = newNode
                }
            }
            return head
        }
    
    func bitwiseComplement(_ N: Int) -> Int {
//    https://leetcode.com/problems/complement-of-base-10-integer/submissions/
        guard N != 0 else { return 1 }
        var i = 1
        
        while i <= N {
            i <<= 1
        }
        
        return (i - 1) ^ N
    }
    
    func countPrimeSetBits(_ left: Int, _ right: Int) -> Int {
//    https://leetcode.com/problems/prime-number-of-set-bits-in-binary-representation/submissions/
        func isPrime(_ num: Int) -> Bool {
            
            guard num >= 2 else { return false}
            var i = 2
            while i * i <= num {
                if num % i == 0 {
                    return false
                }
                i += 1
            }
            return true
        }
        
        var primesCount = 0
        var num = left
        while num < right {
            var count = 0
            var x = num
            while x > 0 {
                let lastSetBit = x & 1
                if lastSetBit == 1 {
                    count += 1
                }
                x = x >> 1
            }
            
            if isPrime(count) {
                primesCount += 1
            }
            num += 1
        }
        
        return primesCount
    }
    
    func integerReplacement(_ n: Int) -> Int {
//        https://leetcode.com/problems/integer-replacement/submissions/
        guard n > 1 else { return 0}
        if n & 1 == 0 {
            return 1 + integerReplacement(n / 2)
        } else {
            var count = 0
            let left = integerReplacement(n - 1)
            let right = integerReplacement(n + 1)
            return 1 + min(left, right)
        }
    }
}

public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}
