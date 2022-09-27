//
//  LFUCache.swift
//  Console
//
//  Created by Hitesh Agarwal on 30/08/22.
//

import Foundation

class LFUCache {
    var nodeMap = [Int: CacheNode]()
    var freqMap = [Int: CacheList]()
    var capacity: Int
    var size = 0
    var leastUsedFrequency =  1
    
    init(_ capacity: Int) {
        self.capacity = capacity
    }
    
    func get(_ key: Int) -> Int {
        guard let node = nodeMap[key] else {
            return -1
        }
        updateFreq(node: node)
        return node.value
    }
    
    func put(_ key: Int, _ value: Int) {
        if let node = nodeMap[key] {
            node.value = value
            updateFreq(node: node)
        } else {
            checkIfSizeNeedsToUpdate()
            let newNode = CacheNode(key: key, value: value)
            listAdd(newNode)
            nodeMap[key] = newNode
            size += 1
        }
    }
    
    func checkIfSizeNeedsToUpdate() {
        guard size >= capacity else {
            return
        }
        
        if let list = freqMap[leastUsedFrequency],
           let cacheNode = list.getLeastRecntUsed() {
            
            listRemove(cacheNode)
            nodeMap[cacheNode.key] = nil
        }
    }
    
    func updateFreq(node: CacheNode) {
        guard let list = freqMap[node.freq] else {
            return
        }
        list.remove(node: node)
        
        if list.isEmpty {
            freqMap[node.freq] = nil
            
            if leastUsedFrequency == node.freq {
                leastUsedFrequency += 1
            }
        }
        
        node.freq += 1
        listAdd(node)
        
    }
    
    func listRemove(_ node: CacheNode) {
        guard let list = freqMap[node.freq] else {
            return
        }
        list.remove(node: node)
        size -= 1
        if list.isEmpty {
            freqMap[node.freq] = nil
            
            if leastUsedFrequency == node.freq {
                leastUsedFrequency += 1
            }
        }
    }
    
    func listAdd(_ node: CacheNode) {
        let list = freqMap[node.freq] ?? CacheList()
        list.add(node: node)
        freqMap[node.freq] = list
    }
}

class CacheList {
    
    var headNode = CacheNode(key: 0, value: 0)
    var tailNode = CacheNode(key: 0, value: 0)
    var count = 0
    
    var isEmpty: Bool {
        return count == 0
    }
    
    init() {
        headNode = CacheNode(key: 0, value: 0)
        tailNode = CacheNode(key: 11, value: 11)
        
        headNode.next = tailNode
        tailNode.prev = headNode
    }
    
    func add(node: CacheNode) {
        let temp = headNode.next
        headNode.next = node
        node.prev = headNode
        
        node.next = temp
        temp?.prev = node
        count += 1
    }
    
    func remove(node: CacheNode) {
        
        tailNode.prev = tailNode.prev?.prev
        tailNode.prev?.next = tailNode
        count -= 1
    }
    
    func getLeastRecntUsed() -> CacheNode? {
        if isEmpty {
            return nil
        }
        return tailNode.prev
    }
}

class CacheNode {
    var key: Int
    var value: Int
    var prev: CacheNode?
    var next: CacheNode?
    var freq: Int
    
    init(key: Int, value: Int) {
        self.key = key
        self.value = value
        freq = 1
    }
}



