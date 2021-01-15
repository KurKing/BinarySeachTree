//
//  main.swift
//  Tree
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

let tree = Tree<Int>()

for _ in 0..<10 {
    tree.add(Int.random(in: -5...5))
}

print(tree.getMaxValue())
print(tree.getMinValue())

print(tree.getSize())

tree.traverse()
