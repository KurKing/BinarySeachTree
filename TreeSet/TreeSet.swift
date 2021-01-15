//
//  TreeSet.swift
//  TreeSet
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

///TreeSet class
class TreeSet<T: Comparable>{
    
    private var rootNode: Node<T>?
    
    // amount of nodes
    private var size = 0
    
    //MARK: Add node
    ///add new node
    func add(_ newValue: T){
        size += 1
        
        // if root node doesn`t exist -> create new root node
        guard let node = rootNode else {
            rootNode = Node(value: newValue)
            return
        }
        
        // if root node exist -> add node to root node
        add(newValue: newValue, node: node)
        
        // balance tree every 10 additions
        if size % 10 == 0 {
            balanceTree()
        }
    }
    
    private func add(newValue: T, node: Node<T>){
        
        // if newValue < current node value -> newValue go to left | else -> go to right
        if newValue < node.value {
            
            guard let leftNode = node.leftNode else {
                node.leftNode = Node(value: newValue)
                return
            }
            
            // recursion (if left node exist)
            add(newValue: newValue, node: leftNode)
            
        } else {
            
            guard let rightNode = node.rigthNode else {
                node.rigthNode = Node(value: newValue)
                return
            }
            
            // recursion (if rigth node exist)
            add(newValue: newValue, node: rightNode)
            
        }
    }
    
    //MARK: Remove node
    /// use to delete a node;
    /// true - mean success, false - node doesn't exist, can't remove
    func removeNode(with value: T) -> Bool{
        
        
        guard let rootNode = self.rootNode else {
            return false
        }
        
        guard let nodeToRemove = getNode(with: value, node: rootNode) else {
            return false
        }
        
        print(nodeToRemove.value)
        
        //size -= 1
        return true
    }
    
    //MARK: Balance tree
    private func balanceTree(){
        //TODO
    }
    
    //MARK: Getters
    ///get node by value
    private func getNode(with value: T, node: Node<T>?) -> Node<T>?{
        
        guard let node = node else {
            return nil
        }
        
        if value == node.value {
            return node
        }
        
        if value < node.value {
            return getNode(with: value, node: node.leftNode)
        } else {
            return getNode(with: value, node: node.rigthNode)
        }
    }
    
    /// get most left node value
    func getMinValue() -> T? {
        var currentNode = rootNode
        
        while let node = currentNode?.leftNode {
            currentNode = node
        }
        
        return currentNode?.value
    }
    
    /// get most rigth node value
    func getMaxValue() -> T? {
        var currentNode = rootNode
        
        while let node = currentNode?.rigthNode {
            currentNode = node
        }
        
        return currentNode?.value
    }
    
    /// get amount of nodes
    func getSize() -> Int {
        return size
    }
}
