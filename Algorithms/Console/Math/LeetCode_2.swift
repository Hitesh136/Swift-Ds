//
//  LeetCode_@.swift
//  Console
//
//  Created by Hitesh Agarwal on 22/04/22.
//

import Foundation
class LeetCode_2 {
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
    
}
