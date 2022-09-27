//
//  LeetCode_19.swift
//  Console
//
//  Created by Hitesh Agarwal on 12/04/22.
//

import Foundation
//https://leetcode.com/problems/remove-nth-node-from-end-of-list/submissions/

class LeetCode_19 {
    func removeNthFromEnd(_ head: ListNode?, _ n: Int) -> ListNode? {
        var dummyNode: ListNode? = ListNode(0)
        
        
        dummyNode?.next = head
        var left = dummyNode
        var right = head
        for _ in 0..<n {
            right = right?.next
        }
        
        while right != nil {
            right = right?.next
            left = left?.next
        }
        
        left?.next = left?.next?.next
        return dummyNode?.next
    }
}
