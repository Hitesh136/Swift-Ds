import Foundation

 
extension Solution {
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
        return head
    }
}

print(Solution().removeNthFromEnd(ListNode(1), 1))
