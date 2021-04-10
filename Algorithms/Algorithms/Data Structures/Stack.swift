//
//  Stack.swift
//  DS
//
//  Created by Hitesh Agarwal on 25/02/19.
//  Copyright © 2019 Finoit Technologies. All rights reserved.
//

import Foundation

struct Stack<Element: Equatable>: Equatable {
    private var storage = [Element]()
    
    func isEmpty() -> Bool {

        return storage.isEmpty
    }
    
    func peek() -> Element? {
        return storage.last
    }
    
    mutating func push(_ element: Element) {
        storage.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element? {
        return storage.popLast()
    }
    
    init(withArray elements: [Element]) {
        storage = elements
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage.map{ "\($0)" }.joined(separator: " ")
    }
}

extension Stack: ExpressibleByArrayLiteral {
    init(arrayLiteral elements: Element...) {
        self.storage = elements
    }
}
