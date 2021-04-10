//
//  StackQueue.swift
//  DS
//
//  Created by Hitesh Agarwal on 26/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation

struct QueueStack<Element: Equatable> {
    var enqueueStack: Stack<Element> = []
    var dequeueStack: Stack<Element> = []
    
    func isEmpty() -> Bool {
        return enqueueStack.isEmpty() && dequeueStack.isEmpty()
    }
    
    mutating func peek() -> Element? {
        if dequeueStack.isEmpty() {
           fillDequeueStack()
        }
        return dequeueStack.peek()
    }
    
    mutating func enqueue(_ element: Element) {
        enqueueStack.push(element)
    }
    
    @discardableResult
    mutating func dequeue() -> Element? {
        if dequeueStack.isEmpty() {
            fillDequeueStack()
        }
        return dequeueStack.pop()
    }
    
    mutating func fillDequeueStack() {
        while let top = enqueueStack.pop() {
            dequeueStack.push(top)
        }
    }
}

extension QueueStack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        for ele in elements {
            enqueueStack.push(ele)
        }
    }
}

extension QueueStack: CustomStringConvertible {
    var description: String {
        if dequeueStack.isEmpty() {
            return enqueueStack.description
        } else {
            return dequeueStack.description + " " + enqueueStack.description
        }
    }
}
