//
//  LeetCode_206.swift
//  Console
//
//  Created by Hitesh Agarwal on 28/04/22.
//

import Foundation
//https://leetcode.com/problems/reverse-linked-list/
 
class LeetCode_206 {
    func reverseList(_ head: ListNode?) -> ListNode? {
            
        if head == nil {
            return head
        }
        var current = head
        var previous: ListNode? = nil
        
        while current != nil {
            
            let temp = current!.next
            
            current?.next = previous
            previous = current
            current = temp
        }
        return previous
    }
}
