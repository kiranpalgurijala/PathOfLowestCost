//
//  LowCostPathFinder.swift
//  PhotonCodeKata
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation
// The objective of this class is to find the path of lowest cost when moving across a grid.
class LowCostPathFinder {
    
    init() {
    }
    
    func findPath(_ matrix: Array<Array<Int>>) -> (Bool, Int, Array<Int>) {
        if matrix.isEmpty {
            return (false, 0, [])
        }
        
        // Calculate the least path starting at each row and choose the
        // of the results.
        let m = Matrix(matrix)
        var least: (Bool, Int, Array<Int>)! = nil
        for row in 1...m.rows {
            let rowLeast = findFrom(m, 0, [], (row, 1))
            if (least == nil || rowLeast.1 < least.1) {
                least = rowLeast
            }
        }
        
        return least
    }

    
    /**
     * Recursive helper method that calculates the least path from a given starting point.
     * - parameter m: The Matrix
     * - parameter prevResistance: The resistance up to this point
     * - parameter prevPath: The path up to this point
     * - parameter coords: The coordinates of this point
     */
    func findFrom(_ m: Matrix, _ prevResistance: Int, _ prevPath: Array<Int>, _ coords: (Int, Int)) -> (Bool, Int, Array<Int>) {
        // Add the current point to the previous path.
        let resistance = prevResistance + m.get(coords)
        let (r, c) = coords
        let path = prevPath + [r]
        
        // Base cases that stop the recursion.
        if resistance > 60 {
            return (false, prevResistance, prevPath)
        } else if c == m.columns {
            return (true, resistance, path)
        }
        
        // Calulate all possible paths from this point.
        let up = findFrom(m, resistance, path, m.up(coords))
        let right = findFrom(m, resistance, path, m.right(coords))
        let down = findFrom(m, resistance, path, m.down(coords))
        
        // Choose the least path from this point.
        if betterThan(up, right) && betterThan(up, down) {
            return up
        } else if betterThan(right, down) {
            return right
        } else {
            return down
        }
    }
    
    /**
     * Determines whether the result on the left is better (lesser path) than the result on
     * the right.
     * - parameter lhs: The left hand side
     * - parameter rhs: The right hand side
     */
    fileprivate func betterThan(_ lhs: (Bool, Int, Array<Int>), _ rhs: (Bool, Int, Array<Int>)) -> Bool {
        if lhs.2.count != rhs.2.count {
            return lhs.2.count > rhs.2.count
        } else {
            return lhs.1 <= rhs.1
        }
    }
}
