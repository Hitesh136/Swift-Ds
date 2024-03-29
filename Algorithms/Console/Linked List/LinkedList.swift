//
//  Queue.swift
//  Swift Command Line
//
//  Created by Hitesh  Agarwal on 05/09/19.

import Foundation


public class ListNode {
    public var val: Int
    public var next: ListNode?
    public init() { self.val = 0; self.next = nil; }
    public init(_ val: Int) { self.val = val; self.next = nil; }
    public init(_ val: Int, _ next: ListNode?) { self.val = val; self.next = next; }
}


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

public class LinkedList {
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


//Helper Method
extension LinkedList {
    func showAllValue(headARG: Node? = nil) {
        print("Showing all values")
        let rootHead: Node? = headARG ?? head

        guard let headNode = rootHead, let headValue = headNode.value else {
            print("Oops! Linked List is empty...")
            return
        }
        print("\(headValue) ", terminator: "")
        var iteratorNode = headNode
        while let nextNode = iteratorNode.next, let value = nextNode.value  {
            print("\(value) ", terminator: "")
            iteratorNode = nextNode
        }
        print("")
    }

    func getCount(node: Node?) -> Int {
        guard node != nil else {
            return 0
        }

        return 1 + getCount(node: node?.next)
    }
}

//Search
extension LinkedList {

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

    func getMiddle() -> Node? {
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
extension LinkedList {

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
}

//Remove
extension LinkedList {

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
 

func intersection(head_first: Node, head_second: Node) -> Node? {

    var currentNode_first: Node? = head_first
    var currentNode_second: Node? = head_second
    var headNode: Node?
    var currentNode_third: Node? =  nil
    while currentNode_first != nil, currentNode_second != nil {
        guard let firstValue = currentNode_first?.value, let secondValue = currentNode_second?.value else {
            return nil
        }
        if firstValue == secondValue {

            let newNode = Node()
            newNode.next = nil
            newNode.value = currentNode_first?.value

            if let headNode = currentNode_third  {
                headNode.next = newNode
            } else {
                headNode = newNode
                currentNode_third = newNode
            }
            currentNode_first = currentNode_first?.next
            currentNode_second = currentNode_second?.next
        } else if firstValue > secondValue {
            currentNode_second = currentNode_second?.next
        } else {
            currentNode_first = currentNode_first?.next
        }
    }
    return headNode
}


//let awsomeLinkedList_first = LinkedList()
//
//awsomeLinkedList_first.insert(value: 1)
//awsomeLinkedList_first.insert(value: 2)
//awsomeLinkedList_first.insert(value: 3)
//awsomeLinkedList_first.insert(value: 4)
////awsomeLinkedList_first.insert(value: 6)
//awsomeLinkedList_first.showAllValue()
//let awsomeLinkedList_second = LinkedList()
//
//awsomeLinkedList_second.insert(value: 2)
//awsomeLinkedList_second.insert(value: 4)
//awsomeLinkedList_second.insert(value: 6)
//awsomeLinkedList_second.insert(value: 8)
//awsomeLinkedList_second.showAllValue()
//
//if let head = intersection(head_first: awsomeLinkedList_first.head!, head_second: awsomeLinkedList_second.head!) {
//
//    awsomeLinkedList_first.showAllValue(headARG: head)
//}
//


