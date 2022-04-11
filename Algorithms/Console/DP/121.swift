//
//  121.swift
//  Console
//
//  Created by Hitesh Agarwal on 15/03/22.
//

import Foundation
//https://leetcode.com/problems/best-time-to-buy-and-sell-stock/

class Best_Time_To_Buy_And_Sell_Stock {
    func maxProfit(_ prices: [Int]) -> Int {
        var min = prices[0]
        var profit = 0
        for price in prices {
            if price < min {
                min = price
            } else {
                let newProfit = price - min
                if newProfit > profit {
                    profit = newProfit
                }
            }
        }
        return profit
    }
}
