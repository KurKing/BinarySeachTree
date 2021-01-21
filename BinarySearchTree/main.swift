//
//  main.swift
//  Tree
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

let tree = Tree<Int>()

for i in 0..<7 {
    tree.add(Int.random(in: -5...5))
}

var toPrint = ""
for i in tree.toArray() {
    toPrint += "\(i.value) "
}
print(toPrint)

tree.balanceTree()

toPrint = ""
for i in tree.toArray() {
    toPrint += "\(i.value) "
}
print(toPrint)
