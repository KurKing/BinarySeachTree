//
//  main.swift
//  Tree
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

let tree = Tree<Int>()

tree.add(5)

tree.add(3)
tree.add(4)
tree.add(2)

tree.add(7)
tree.add(6)
tree.add(8)

tree.traverse()

tree.removeNode(with: 5)

print("Traverse after remove:")
tree.traverse()
