//
//  main.swift
//  Tree
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

let tree = Tree<Int>()
let elementsCount = 10000

var startCalculationTime = Date().timeIntervalSinceReferenceDate

for _ in 0..<elementsCount {
    tree.add(Int.random(in: -20...20))
}

print("Add \(elementsCount) elements ")
var endCalculationTime = Date().timeIntervalSinceReferenceDate
print("\(endCalculationTime-startCalculationTime) seconds")

print("\nSize: \(tree.size) ")

startCalculationTime = Date().timeIntervalSinceReferenceDate

let treeArray = tree.toArray()

print("\nToArray \(elementsCount) elements ")
endCalculationTime = Date().timeIntervalSinceReferenceDate
print("\(endCalculationTime-startCalculationTime) seconds")

startCalculationTime = Date().timeIntervalSinceReferenceDate

for i in treeArray{
    tree.removeNode(with: i)
}

print("\nRemove \(elementsCount) elements ")
endCalculationTime = Date().timeIntervalSinceReferenceDate
print("\(endCalculationTime-startCalculationTime) seconds")

print("\n### WORST CASE ###")
startCalculationTime = Date().timeIntervalSinceReferenceDate

for _ in 0..<elementsCount {
    tree.add(1)
}

print("Add \(elementsCount) elements ")
endCalculationTime = Date().timeIntervalSinceReferenceDate
print("\(endCalculationTime-startCalculationTime) seconds")

startCalculationTime = Date().timeIntervalSinceReferenceDate

for _ in 0..<elementsCount {
    tree.removeNode(with: 1)
}

print("\nRemove \(elementsCount) elements ")
endCalculationTime = Date().timeIntervalSinceReferenceDate
print("\(endCalculationTime-startCalculationTime) seconds")
