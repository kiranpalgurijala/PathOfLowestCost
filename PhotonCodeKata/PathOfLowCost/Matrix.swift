//
//  Matrix.swift
//  PhotonCodeKata
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

/**
 * Provides a navigateable matrix.
 */
class Matrix {
    
    var matrix: Array<Array<Int>>!
    
    init(_ matrix: Array<Array<Int>>) {
        self.matrix = matrix
    }
    
    var rows: Int {
        return matrix.count
    }
    
    var columns: Int {
        return matrix[0].count
    }
    
    /**
     * Returns the resistance at the given coordinates.
     */
    func get(_ coords: (Int, Int)) -> Int! {
        let (r, c) = coords
        if r <= 0 || r > matrix.count || c <= 0 || c > matrix[0].count {
            return nil
        }
        return matrix[r - 1][c - 1]
    }
    
    /**
     * Navigates straight to the right and returns the new point.
     */
    func right(_ coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c >= matrix[0].count {
            return nil
        }
        return (r, c + 1)
    }
    
    /**
     * Navigates up and to the right and returns the new point.
     */
    func up(_ coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c >= matrix[0].count {
            return nil
        }
        return (r == 1 ? matrix.count : r - 1, c + 1)
    }
    
    /**
     * Navigates down and to the right and returns the new point.
     */
    func down(_ coords: (Int, Int)) -> (Int, Int)! {
        let (r, c) = coords
        if c >= matrix[0].count {
            return nil
        }
        return (r == matrix.count ? 1 : r + 1, c + 1)
    }
    
}
