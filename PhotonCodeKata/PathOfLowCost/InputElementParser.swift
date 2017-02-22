//
//  InputElementParser.swift
//  PhotonCodeKata
//
//  Created by Kiranpal Reddy Gurijala on 2/21/17.
//  Copyright © 2017 AryaVahni. All rights reserved.
//

import Foundation

class InputElementParser {
    
    init() {
        
    }
    
    func parse(_ input: String) -> Array<Array<Int>> {
        var matrix: Array<Array<Int>> = []
        
        let rowStrings = input.components(separatedBy: "\n")
        for rowString in rowStrings {
            if rowString.isEmpty {
                break
            }
            let colStrings = rowString.components(separatedBy: " ")
            matrix.append(colStrings.map() { x in Int(x) ?? 0 })
        }
        
        // Validate that all rows in the grid have the same length
        var width: Int!
        for row in matrix {
            width = width ?? row.count
            if row.count != width {
                fatalError("All rows must have the same length")
            }
        }
        
        return matrix
    }
    
}
