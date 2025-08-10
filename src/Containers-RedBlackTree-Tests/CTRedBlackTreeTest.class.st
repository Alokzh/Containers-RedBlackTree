"
A CTRedBlackTreeTest is a test class for testing the behavior of CTRedBlackTree
"
Class {
	#name : 'CTRedBlackTreeTest',
	#superclass : 'TestCase',
	#instVars : [
		'tree'
	],
	#category : 'Containers-RedBlackTree-Tests',
	#package : 'Containers-RedBlackTree-Tests'
}

{ #category : 'running' }
CTRedBlackTreeTest >> setUp [
	super setUp.
	tree := CTRedBlackTree new

]

{ #category : 'tests' }
CTRedBlackTreeTest >> testAddMultipleElements [

	tree addAll: #(50 30 70).
	self assert: tree size equals: 3
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testAddSingleElement [

	tree add: 42.
	self deny: tree isEmpty.
	self assert: tree size equals: 1.
	self assert: tree height equals: 1
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testClear [

	tree clear.
	self assert: tree isEmpty.
	self assert: tree size equals: 0
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testDuplicateHandling [

	tree addAll: #(50 30 70 30).
	self assert: tree size equals: 3
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testEmpty [

	self assert: tree isEmpty.
	self assert: tree size equals: 0.
	self assert: tree height equals: 0
	
]
