//
//  LeetCode_21.swift
//  Console
//
//  Created by Hitesh Agarwal on 12/04/22.
//

import Foundation

/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     public var val: Int
 *     public var next: ListNode?
 *     public init() { self.val = 0; self.next = nil; }
 *     public init(_ val: Int) { self.val = val; self.next = nil; }
 *     public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
 * }
 */
//https://leetcode.com/problems/merge-two-sorted-lists/
class LeetCode_21 {
    func mergeTwoLists(_ list1: ListNode?, _ list2: ListNode?) -> ListNode? {
        var dummyNode: ListNode? = ListNode(0)
        var itr = dummyNode
        var _list1 = list1
        var _list2 = list2
        
        while _list1 != nil && _list2 != nil {
            if _list1!.val < _list2!.val {
                itr!.next = _list1
                _list1 = _list1!.next
            } else {
                itr!.next = _list2
                _list2 = _list2!.next
            }
            itr = itr?.next
        }
        
        itr!.next = _list1 ?? _list2
    
        return dummyNode?.next
    }
}
