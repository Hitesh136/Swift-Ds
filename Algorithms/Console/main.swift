import Foundation
 
//
//  LeetCode_78.swift
//  Console
//
//  Created by Hitesh Agarwal on 26/04/22.
//
//https://leetcode.com/problems/subsets/
//https://www.youtube.com/watch?v=REOH22Xwdkk
 

extension Solution {
    func deleteDuplicates(_ head: ListNode?) -> ListNode? {
        var newHead = head
        var current = newHead
        while current?.next != nil {

            if current!.next!.val == current!.val {
                current?.next = current?.next?.next
            } else {
                current = current?.next
            }
        }
        return newHead
        // return current
    }
}

let node5 = ListNode(6)
let node4 = ListNode(5, node5)
let node41 = ListNode(4, node4)
let node31 = ListNode(3, node41)
let node3 = ListNode(6, node31)
let node2 = ListNode(2, node3)
let node1 = ListNode(1, node2)

var res = LeetCode_203().removeElements(node1, 6)
print(res)
