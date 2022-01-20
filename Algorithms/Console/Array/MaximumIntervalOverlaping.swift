//
//  MaximumIntervalOverlaping.swift
//  Algorithms
//
//  Created by Hitesh Agarwal on 25/04/21.
//

import Foundation
 
public class MaximumIntervalOverlaping {
    
    
    func solve(arrivals: [Int], exits: [Int]) -> Int {
        let sortedArrivals = arrivals.sorted()
        let sortedExits = exits.sorted()
        
        var i = 0
        var j = 0
        let arrivalsN = sortedArrivals.count
        let exitsN = sortedExits.count
        
        var maxTime = Int.min
        for i in 0..<sortedExits.count {
            if sortedExits[i] > maxTime {
                maxTime = sortedExits[i]
            }
        }
        
        var currentGuestCount = 0
        var maxGuestsCount = 0
        var pickTime = 0
        while i < arrivalsN && j < exitsN {
            if sortedArrivals[i] <= sortedExits[j] {
                currentGuestCount += 1
                if currentGuestCount > maxGuestsCount {
                    maxGuestsCount = currentGuestCount
                    pickTime = sortedArrivals[i]
                }
                i += 1
            } else {
                currentGuestCount -= 1
                j += 1
            }
        }
        return pickTime
    }
}
