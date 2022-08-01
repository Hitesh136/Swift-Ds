//
//  LeetCode_1431.swift
//  Console
//
//  Created by Hitesh Agarwal on 18/05/22.
//

import Foundation
// 29 July 2022: Round 2
class LeetCode_1431 {
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
//    https://leetcode.com/problems/kids-with-the-greatest-number-of-candies/
            let max = candies.max()!
            var res = [Bool]()
            return candies.map{ ($0 + extraCandies) >= max }
        }
    
}
