//
//  LeetCode_203.swift
//  Console
//
//  Created by Hitesh Agarwal on 28/04/22.
//

import Foundation
// https://leetcode.com/problems/remove-linked-list-elements/
class LeetCode_203 {
    func removeElements(_ head: ListNode?, _ val: Int) -> ListNode? {
        
        if head == nil {
            return head
        }
        var dummy = ListNode(0)
        dummy.next = head
        
        var current = dummy
        while current.next != nil {
            
            if current.next!.val == val {
                current.next = current.next!.next
            } else {
                current = current.next!
            }
            
        }
        
        return dummy.next
    }
}
