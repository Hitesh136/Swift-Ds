//
//  Stack.swift
//  Console
//
//  Created by Hitesh Agarwal on 27/12/21.
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
    
    init() {
        storage = []
    }
}

extension Stack: CustomStringConvertible {
    var description: String {
        return storage.map{ "\($0)" }.joined(separator: " ")
    }
}

extension Stack: Sequence {
    struct StackIterator: IteratorProtocol {
        var stack: Stack
        
        init(stack: Stack) {
            self.stack = stack
        }
        
        mutating func next() -> Element? {
            return stack.pop()
        }
    }

    
    func makeIterator() -> StackIterator {
        return StackIterator(stack: self)
    }
}

extension Stack: ExpressibleByArrayLiteral {
//    typealias ArrayLiteralElement = Element
    
    
    init(arrayLiteral elements: Element...) {
        self.init(withArray: elements)
    }
    
}



//https://www.geeksforgeeks.org/design-and-implement-special-stack-data-structure/
//struct SpecialStack {
//  var stack = Stack()
//  var minStack = Stack()
//  var statIndex = 0
//  var endIndex = 0
//  var max: Int
//  init(max: Int) {
//      self.max = max
//  }
//  
//  mutating func push(_ element: Int) {
//      stack.push(ele: element)
//      endIndex += 1
//      if let top = minStack.top() {
//          minStack.push(ele: min(element, top))
//      } else {
//          minStack.push(ele: element)
//      }
//  }
//  
//  mutating func pop() -> Int? {
//      endIndex -= 1
//      minStack.pop()
//      return stack.pop()
//  }
//  func isEmpty() -> Bool {
//      return endIndex == 0
//  }
//  
//  func isFull() -> Bool {
//      return endIndex == (max - 1)
//  }
//  
//  func getMin() -> Int? {
//      return minStack.top()
//  }
//}
