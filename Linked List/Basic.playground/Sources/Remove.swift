import Foundation

//Remove
extension LinkList {
    
    func remove(value: Int) {
        guard let headNode = head else {
            return
        }
        
        if headNode.value == value {
            head = headNode.next
            return
        }
        
        guard let nextNode = headNode.next else {
            return
        }
        
        var iteratorNode = headNode
        var previousNode = headNode
        while let currentNode = iteratorNode.next {
            if let curentValue = currentNode.value, curentValue == value {
                
                previousNode.next = currentNode.next
                break
            } else {
                iteratorNode = currentNode
                previousNode = currentNode
            }
        }
    }
    
    func delete(atPosition position: Int) {
        guard let headNode = head else {
            print("List is empty")
            return
        }
        
        var temp: Node? = headNode
        guard position != 0 else {
            //            print("Remove head node")
            head = nil
            return
        }
        
        for _ in 0..<(position - 1) {
            if let currentNode = temp?.next {
                temp = currentNode
            } else {
                //                print("Previous node out of index")
                return
            }
        }
        
        //        print("Node = \(temp?.value)")
        if temp == nil || temp?.next == nil {
            //            print("Position out of index")
            return
        }
        
        //        print("currentNode: \(temp!.value)")
        temp?.next = temp?.next?.next
    }
}
