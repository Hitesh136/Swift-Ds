//
//  121.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/
// round 2
class Best_Time_To_Buy_And_Sell_Stock {
     
    func maxProfit(prices: [Int]) -> Int {
        guard prices.count > 0 else {return 0}
        var maxProfit = 0
        var buyDay = 0
        
        for i in 1 ..< prices.count {
            let profit = prices[i] - prices[buyDay]
            if profit < 0 {
                buyDay = i
            }
            maxProfit = max(profit, maxProfit)
        }
        
        return maxProfit
    }
}
