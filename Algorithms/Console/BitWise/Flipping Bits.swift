//
//  Flipping Bits.swift
//  Algorithms
//
//  Created by Hitesh Agarwal on 20/01/22.
//

import Foundation
//https://www.hackerrank.com/challenges/three-month-preparation-kit-flipping-bits/problem?isFullScreen=true&h_l=interview&playlist_slugs%5B%5D=preparation-kits&playlist_slugs%5B%5D=three-month-preparation-kit&playlist_slugs%5B%5D=three-month-week-two
func flippingBits(n: Int) -> Int {
    let binary = String(n, radix: 2)
    let binaryOf1 = String(repeating: "1", count: 32)
    let d1 = Int(binary, radix: 2)!
    let d2 = Int(binaryOf1, radix: 2)!
    return d1 ^ d2
}
