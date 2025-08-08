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
CTRedBlackTreeTest >> testInitialStateEmpty [

	self assert: tree isEmpty 
]
