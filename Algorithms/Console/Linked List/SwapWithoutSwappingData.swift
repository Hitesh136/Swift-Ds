//
//  SwapWithoutSwappingData.swift
//  Console
//
//  Created by Hitesh Agarwal on 19/05/22.
//

import Foundation
extension LinkedList {
    

    //Swap nodes in a linked list without swapping data
    func swap(x: Int, y: Int) {
        var prevX: Node? = nil
        var prevY: Node? = nil
        var currentX: Node? = nil
        var currentY: Node? = nil
        var prev: Node? = nil
        var current = head
        while current != nil {
            guard let value = current?.value else {
                continue
            }

            if value == x {
                prevX = prev
                currentX = current
            }
            if value == y {
                prevY = prev
                currentY = current
            }

            prev = current
            current = current?.next
        }

        guard let _ = currentX, let _ = currentY else {
            return
        }

        if prevX == nil {
            head = currentY
        } else {
            prevX?.next = currentY
        }
        prevY?.next = currentX

        let tempNext = currentX?.next
        currentX?.next = currentY?.next
        currentY?.next = tempNext
    }
}
