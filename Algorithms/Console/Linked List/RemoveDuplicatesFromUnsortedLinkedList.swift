//
//  RemoveDuplicatesFromUnsortedLinkedList.swift
//  Console
//
//  Created by Hitesh Agarwal on 19/05/22.
//

import Foundation
extension LinkedList {
    //Remove duplicates from unsorted linked list
    func removeDuplicatesFromUnsortedLinkedList() {
        var current = head
        var prev: Node? = nil
        var hashMap = [Int: Bool]()
        while current != nil {
            if let value = current?.value {
                if hashMap[value] != nil {
                    prev?.next = current?.next
                    current = current?.next
                } else {
                    hashMap[value] = true
                    prev = current
                    current = current?.next
                }
            }
        }
    }
}
