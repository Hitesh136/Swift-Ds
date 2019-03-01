//
//  Queue.swift
//  DS
//
//  Created by Hitesh Agarwal on 25/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation
protocol QueueProtocol {
    associatedtype T
    mutating func enQueue(_ element: T)
    mutating func deQueue() -> T?
    var peek: T? { get }
    var isEmpty: Bool { get }
}

struct Queue<T: Equatable>: QueueProtocol, Equatable {
    
    private var items = [T]()
    
    mutating func enQueue(_ element: T) {
        items.append(element)
    }
    
    @discardableResult
    mutating func deQueue() -> T? {
        return items.isEmpty ? nil : items.removeFirst()
    }
    
    var peek: T? {
        return items.first
    }
    
    var isEmpty: Bool {
        return items.isEmpty
    } 
}

extension Queue: CustomStringConvertible {
    var description: String {
        return items.map{ "\($0)" }.joined(separator: " ")
    }
}

extension Queue: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: T...) {
        self.items = elements
    }
}
