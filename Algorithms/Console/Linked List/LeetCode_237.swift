//
//  LeetCode_237.swift
//  Console
//
//  Created by Hitesh Agarwal on 28/04/22.
//

import Foundation
//https://leetcode.com/problems/delete-node-in-a-linked-list/

class LeetCode_237 {
    func deleteNode(_ node: ListNode?) {
        
        node!.val = node!.next!.val
        node!.next = node!.next?.next
        
    }
}
