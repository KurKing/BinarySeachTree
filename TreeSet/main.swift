//
//  main.swift
//  TreeSet
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

let tree = TreeSet<Int>()

for _ in 0..<10 {
    tree.add(Int.random(in: -5...5))
}

//print(tree.getMaxValue())
//print(tree.getMinValue())
//
//print(tree.getSize())

print(tree.removeNode(with: 10))
print(tree.removeNode(with: 1))
print(tree.removeNode(with: 2))
