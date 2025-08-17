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
CTRedBlackTreeTest >> testAnySatisfy [

	tree addAll: #(50 30 70 20 40).
	self assert: (tree anySatisfy: [ :each | each > 60 ]).
	self deny: (tree anySatisfy: [ :each | each > 100 ])
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testAsArray [

	tree addAll: #(50 30 70 20 40 60 80).
	self assert: tree asArray equals: #(20 30 40 50 60 70 80)
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testAtIfAbsent [

	tree addAll: #(50 30 70).
	self assert: (tree at: 30 ifAbsent: [ #notFound ]) equals: 30.
	self assert: (tree at: 99 ifAbsent: [ #notFound ]) equals: #notFound
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testBlackHeight [

	self assert: tree blackHeight equals: 0.
	tree add: 10.
	self assert: tree blackHeight equals: 1.
	tree addAll: #(5 15).
	self assert: tree blackHeight equals: 1
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testClear [

	tree clear.
	self assert: tree isEmpty.
	self assert: tree size equals: 0
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testDetect [

	| found |
	tree addAll: #(50 30 70 20 40).
	found := tree detect: [ :each | each > 45 ] ifNone: [ nil ].
	self assert: found equals: 50.
	found := tree detect: [ :each | each > 100 ] ifNone: [ #none ].
	self assert: found equals: #none
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testDoMethod [


	| result |
	tree addAll: #(50 30 70 20 40).
	result := OrderedCollection new.
	tree do: [ :each | result add: each ].
	self assert: result asArray equals: #(20 30 40 50 70)
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

{ #category : 'tests' }
CTRedBlackTreeTest >> testFindMinMax [

	self assert: tree findMin isNil.
	self assert: tree findMax isNil.
	
	tree addAll: #(50 30 70 20 80 10 90).
	self assert: tree findMin equals: 10.
	self assert: tree findMax equals: 90
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testFindMinMaxNode [

	tree addAll: #(50 30 70 20 80).
	self assert: tree findMinNode contents equals: 20.
	self assert: tree findMaxNode contents equals: 80
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testFirstLast [

	tree addAll: #(50 30 70 20 80).
	self assert: tree first equals: 20.
	self assert: tree last equals: 80
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testHeight [

	self assert: tree height equals: 0.
	tree add: 50.
	self assert: tree height equals: 1.
	tree addAll: #(30 70).
	self assert: tree height equals: 2
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testInOrderTraversal [

	| result |
	tree addAll: #(50 30 70 20 40).
	result := OrderedCollection new.
	tree inOrderDo: [ :each | result add: each ].
	self assert: result asArray equals: #(20 30 40 50 70)
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testIncludes [

	tree addAll: #(50 30 70 20 40).
	self assert: (tree includes: 50).
	self assert: (tree includes: 30).
	self deny: (tree includes: 99)
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testInsertionRebalancing [

	tree addAll: #(20 10 30).
	tree add: 5.
	self assert: tree root color equals: #black.
	tree add: 15.
	tree add: 25.
	tree add: 35
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testPostOrderTraversal [

		| result |
	tree addAll: #(50 30 70 20).
	result := OrderedCollection new.
	tree postOrderDo: [ :each | result add: each ].
	self assert: result last equals: tree root contents
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testPreOrderTraversal [

	| result |
	tree addAll: #(50 30 70 20).
	result := OrderedCollection new.
	tree preOrderDo: [ :each | result add: each ].
	self assert: result first equals: tree root contents
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testPredecessorSuccessor [

	tree addAll: #(50 30 70 20 40 60 80).
	self assert: (tree predecessorOf: 50) equals: 40.
	self assert: (tree predecessorOf: 20) isNil.
	self assert: (tree successorOf: 50) equals: 60.
	self assert: (tree successorOf: 80) isNil.
	self assert: (tree predecessorOf: 35) equals: 30.
	self assert: (tree successorOf: 35) equals: 40
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testRemoveLeafNode [

	tree addAll: #(50 30 70 20).
	tree remove: 20.
	self assert: tree size equals: 3.
	self deny: (tree includes: 20).
	self assert: tree validate
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testRemoveNodeWithTwoChildren [

	tree addAll: #(50 30 70 20 40).
	tree remove: 30.
	self assert: tree size equals: 4.
	self deny: (tree includes: 30).
	self assert: tree validate
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testRemoveRoot [

	tree addAll: #(50 30 70 20 40 60 80).
	tree remove: 50.
	self assert: tree size equals: 6.
	self deny: (tree includes: 50).
	self assert: tree validate
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testRootIsAlwaysBlack [

	tree add: 50.
	self assert: tree root isBlack.
	tree addAll: #(30 70 20 40 60 80).
	self assert: tree root isBlack
]

{ #category : 'tests' }
CTRedBlackTreeTest >> testValidation [

	self assert: tree validate.
	tree addAll: #(50 30 70 20 40).
	self assert: tree validate.
	tree add: 60.
	self assert: tree validate
]
