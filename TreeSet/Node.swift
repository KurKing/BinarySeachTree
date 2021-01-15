//
//  Node.swift
//  TreeSet
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

///Node of TreeSet
class Node<T: Comparable>: Comparable {
    
    let value: T
    
    var rigthNode: Node<T>?
    var leftNode: Node<T>?
    
    init(value: T) {
        self.value = value
    }
    
    static func < (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value < rhs.value
    }
    
    static func == (lhs: Node<T>, rhs: Node<T>) -> Bool {
        return lhs.value == rhs.value
    }
}
