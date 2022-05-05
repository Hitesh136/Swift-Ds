//
//  LeetCode_141.swift
//  Console
//
//  Created by Hitesh Agarwal on 05/05/22.
//

import Foundation
class LeetCode_141 {
    func hasCycle(_ head: ListNode?) -> Bool {
        var slow = head
        var fast = head
        
        while fast != nil {
            slow = slow?.next
            fast = fast?.next?.next
            
            if let slowVal = slow?.val,
                let fastVal = fast?.val,
                slowVal == fastVal {
                return true
            }
        }
        
        return false
    }
}
