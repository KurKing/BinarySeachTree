//
//  Tree.swift
//  Tree
//
//  Created by Oleksiy on 15.01.2021.
//

import Foundation

///Tree class
class Tree<T: Comparable>{
    
    private var rootNode: Node<T>?
    private var nodeArray: [Node<T>] = []
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
        if size % 16 == 0 {
            balanceTree()
        }
    }
    
    private func add(newValue: T, node: Node<T>){
        
        // if newValue < current node value -> newValue go to left | else -> go to right
        if newValue < node.value {
            
            guard let leftNode = node.leftNode else {
                node.leftNode = Node(value: newValue, parent: node)
                return
            }
            
            // recursion (if left node exist)
            add(newValue: newValue, node: leftNode)
            
        } else {
            
            guard let rightNode = node.rigthNode else {
                node.rigthNode = Node(value: newValue, parent: node)
                return
            }
            
            // recursion (if rigth node exist)
            add(newValue: newValue, node: rightNode)
            
        }
    }
    
    private func add(to rootNode: Node<T>, node: Node<T>){
        
        if node.value < rootNode.value {
            
            guard let leftNode = rootNode.leftNode else {
                rootNode.leftNode = node
                rootNode.leftNode!.parent = rootNode
                return
            }
            
            add(to: leftNode, node: node)
            
        } else {
            
            guard let rightNode = rootNode.rigthNode else {
                rootNode.rigthNode = node
                rootNode.rigthNode!.parent = rootNode
                return
            }
            
            add(to: rightNode, node: node)
        }
    }
    
    //MARK: Remove node
    /// use to delete a node;
    func removeNode(with value: T) {
        
        guard let rootNode = self.rootNode else {
            return
        }
        
        guard let nodeToRemove = getNode(with: value, node: rootNode) else {
            return
        }
        
        size -= 1
        
        if nodeToRemove == self.rootNode{
            self.rootNode = nodeToRemove.rigthNode
            self.rootNode!.parent = nil
            
            if let leftNode = nodeToRemove.leftNode {
                add(to: self.rootNode!, node: leftNode)
            }
            
            return
        }
        
        removeChildNode(nodeToRemove, from: nodeToRemove.parent!)
        
        if let rigthNode = nodeToRemove.rigthNode {
            add(to: nodeToRemove.parent!, node: rigthNode)
        }
        
        if let leftNode = nodeToRemove.leftNode {
            add(to: nodeToRemove.parent!, node: leftNode)
        }
    }
    
    private func removeChildNode(_ child: Node<T>, from parent: Node<T>){
        if parent.rigthNode == child {
            parent.rigthNode = nil
        }
        if parent.leftNode == child {
            parent.leftNode = nil
        }
    }
    
    //MARK: Balance tree (TODO)
    func balanceTree(){
        self.toArray()
        
        rootNode = nil
        size = 0
        
        balanceTree(startIndex: 0, finishIndex: nodeArray.count-1)
        
        add(nodeArray[0].value)
        add(nodeArray[size].value)
    }
    private func balanceTree(startIndex: Int, finishIndex: Int){
        if startIndex == finishIndex { return }
        
        let index: Int = (finishIndex + startIndex) / 2
        
        if startIndex == index { return }
        if finishIndex == index { return }

        add(nodeArray[index].value)
        
        balanceTree(startIndex: startIndex,finishIndex: index)
        balanceTree(startIndex: index,finishIndex: finishIndex)
    }
    
    //MARK: Getters
    ///get node by value
    func getNode(with value: T, node: Node<T>?) -> Node<T>?{
        
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
    
    //MARK: - To Array
    func toArray() -> [Node<T>]{
        nodeArray = []
        
        guard let rootNode = self.rootNode else {
            return []
        }
        
        toArray(node: rootNode)
        
        return nodeArray
    }
    
    private func toArray(node: Node<T>){
        if let leftNode = node.leftNode {
            toArray(node: leftNode)
        }
        
        if let rigthNode = node.rigthNode {
            toArray(node: rigthNode)
        }
        
        nodeArray.append(node)
    }
}
