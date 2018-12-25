import Foundation

//struct GenericTypeParameter<T: Hashable>: Hashable {
//    var value: T
//
//    static func == (lhs: GenericTypeParameter<T>, rhs: GenericTypeParameter<T>) -> Bool {
//        return lhs.value == rhs.value
//    }
//
//    var hasValue: Int {
//        return value.hashValue
//    }
//
////    func hash(into hasher: inout Hasher) {
////        hasher.combine(value)
////    }
//}


class Node: Equatable {
    
    var value: Int? = nil
    var next: Node? = nil
    
    static func ==(lhs: Node, rhs: Node) -> Bool {
        if (lhs.value == rhs.value) && (lhs.next == rhs.next) {
            return true
        }
        return false
    }
}

class LinkList {
    var head: Node? = nil

    func insert(value: Int) {
        let node = Node()
        node.value = value
        node.next = nil
        
        guard head != nil else {
            head = node
            return
        }
        
        var lastNode = head
        while let next = lastNode?.next {
            lastNode = next
        }
        
//        print("DEBUG:- lastnode \(next?.value)")
        lastNode?.next = node
    }
}

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

//Helper Method
extension LinkList {
    func showAllValue() {
        print("Showing all values")
        guard let headNode = head, let headValue = headNode.value else {
            print("Oops! Linked List is empty...")
            return
        }
        print(headValue)
        var iteratorNode = headNode
        while let nextNode = iteratorNode.next  {
            print(nextNode.value ?? "Empty Value")
            iteratorNode = nextNode
        }
    }
    
    func getCout(node: Node?) -> Int {
        guard node != nil else {
            return 0
        }
        
        return 1 + getCout(node: node?.next)
    }
}

//Search
extension LinkList {
    func search(node: Node?, key: Int) -> Bool {
//        print(node?.value)
        if let valueNode = node {
            if valueNode.value! == key {
//                print("Value found")
                return true
            } else {
                return search(node: node?.next, key: key)
                
            }
        }
//        print("Value not found")
        return false
    }
    
    func getNode(atNthPosition n: Int) -> Node? {
        guard var temp = head else {
            print("List is empty")
            return nil
        }
        
        for _ in 0..<n {
            if let next = temp.next {
                temp = next
            } else {
                return nil
            }
        }
        return temp
    }
    
    func geNthFromLast(n: Int) -> Node? {
        guard let temp = head else {
            print("List is empty")
            return nil
        }
        
        var referencePointer = temp
        var mainPointer = temp
        
        for _ in 0..<(n - 1) {
            if let next = referencePointer.next {
                referencePointer = next
            } else {
                return nil
            }
        }
//        print("Reference next = \(referencePointer.value!)")
        while let next = referencePointer.next {
            referencePointer = next
//            print("Next = \(next.value!)")
            mainPointer = mainPointer.next!
        }
        return mainPointer
    }
    
    func getMiddle() -> Node?{
        guard let headNode = head else {
            print("List is empty")
            return nil
        }
        
        var temp: Node? = headNode
        var mid = temp!
        var count = 0
        while temp != nil {
            count += 1
            if count % 2 == 0 {
                mid = mid.next!
            }
            temp = temp?.next
        }
        return mid
    }
}

// MARK:- Loop
extension LinkList {
    
    var hasLoop: Bool {
        guard let temp = head else {
            print("List is empty")
            return false
        }
        
        var mainPointer = temp
        var loopPointer: Node? = temp
        
        while true {
            guard let next = loopPointer?.next else {
                return false
            }
            
            if next == mainPointer {
                return true
            }
            
            mainPointer = mainPointer.next!
            loopPointer = loopPointer?.next?.next
        }
    }
    
//    func createLoop() {
//        var temp = head
//        while temp != nil {
//            temp = temp?.next
//        }
//        print(temp?.next)
//        print(head?.next?.value)
//        temp?.next = head?.next
//        print(temp?.next)
//        print(head?.next?.value)
//    }
}

let myLinkList = LinkList()

myLinkList.insert(value: 1)
myLinkList.insert(value: 2)
myLinkList.insert(value: 3)
myLinkList.insert(value: 4)
myLinkList.insert(value: 5)


//print("Count = \(myLinkList.getCout(node: myLinkList.head))")
//myLinkList.showAllValue()

//myLinkList.delete(atPosition: 2)
//myLinkList.showAllValue()

//print("Value Found = \(myLinkList.search(node: myLinkList.head, key: 3))")

//print("Node at \(nthNode)th Position is \(myLinkList.getNode(atNthPosition: nthNode)?.value)")
//let nthNode = 1
//print("Node at \(nthNode)th Position from end is \(myLinkList.geNthFromLast(n: nthNode)?.value)")
//for i in 1...myLinkList.getCout(node: myLinkList.head) {
//    let nthNode = i
//    print("Node at \(nthNode)th Position from end is \(myLinkList.geNthFromLast(n: nthNode)?.value)")
//}


//print(myLinkList.getMiddle()?.value!)
//myLinkList.createLoop()
//print(myLinkList.hasLoop)
