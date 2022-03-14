//
//  MyHashMap.swift
//  Console
//
//  Created by Hitesh Agarwal on 10/03/22.
//

import Foundation

class MyHashMap<K: Hashable> {
 
    class Element<K: Hashable> {
        var key: K
        var value: Int
        init(key: K, value: Int) {
            self.key = key
            self.value = value
        }
    }
    
    var buckets = [[Element<K>]]()
    var count = 10
    init() {
        
    }
    
    func put(_ key: K, _ value: Int) {
        let index = indexOf(key: key)
        
        
        if let oldElementIndex = buckets[index].firstIndex(where: { $0.key == key }) {
            let element = buckets[index][oldElementIndex]
            element.value = value
            buckets[index][oldElementIndex] = element
        } else {
            let newElement = Element(key: key, value: value)
            buckets[index].append(newElement)
        }
    }
    
    func get(_ key: K) -> Int {
        let index = indexOf(key: key)
        if let oldElementIndex = buckets[index].firstIndex(where: { $0.key == key }) {
            return buckets[index][oldElementIndex].value
        } else {
            return -1
        }
    }
    
    func remove(_ key: K) {
        let index = indexOf(key: key)
        if let oldElementIndex = buckets[index].firstIndex(where: { $0.key == key }) {
            buckets[index].remove(at: oldElementIndex)
        }
    }
    
    func indexOf(key: K) -> Int {
        let index = key.hashValue % count
        return index
    }
}

