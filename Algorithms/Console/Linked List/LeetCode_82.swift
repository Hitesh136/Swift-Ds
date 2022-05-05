//
//  LeetCode_82.swift
//  Console
//
//  Created by Hitesh Agarwal on 28/04/22.
//

import Foundation

//https://leetcode.com/problems/remove-duplicates-from-sorted-list-ii/
class LeetCode_82 {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        
        if head == nil || head!.next == nil {
            return head
        }
        var _dummy = ListNode(0)
        _dummy.next = head
        var dummy = _dummy
        while dummy.next != nil && dummy.next!.next != nil {
             
            if dummy.next!.val == dummy.next!.next!.val {
                
                let tempVal = dummy.next!.val
                
                while dummy.next != nil, dummy.next!.val == tempVal {
                    dummy.next = dummy.next!.next
                }
            } else {
                dummy = dummy.next!
            }
        }
        return _dummy.next
        // return current
    }
}
