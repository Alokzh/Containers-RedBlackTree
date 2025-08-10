"
I represent a Red-Black Tree, a self-balancing binary search tree
"
Class {
	#name : 'CTRedBlackTree',
	#superclass : 'Object',
	#instVars : [
		'root'
	],
	#category : 'Containers-RedBlackTree',
	#package : 'Containers-RedBlackTree'
}

{ #category : 'adding' }
CTRedBlackTree >> add: anObject [

	root := root addChild: anObject.
	root color: #black.
	root parent: nil.
	^ anObject
]

{ #category : 'adding' }
CTRedBlackTree >> addAll: aCollection [

	aCollection do: [ :each | self add: each ].
	^ aCollection
]

{ #category : 'converting' }
CTRedBlackTree >> asArray [

	| result |
	result := OrderedCollection new: self size.
	self inOrderDo: [ :each | result add: each ].
	^ result asArray
]

{ #category : 'accessing' }
CTRedBlackTree >> blackHeight [

	"Return the black height of the tree"
	^ root blackHeight
]

{ #category : 'removing' }
CTRedBlackTree >> clear [

	root := CTRBTNilNode new
]

{ #category : 'enumerating' }
CTRedBlackTree >> do: aBlock [

	"Alias for inOrderDo: - visits elements in sorted order"
	self inOrderDo: aBlock
]

{ #category : 'searching' }
CTRedBlackTree >> findMax [

	^ root findMax
]

{ #category : 'searching' }
CTRedBlackTree >> findMin [

	^ root findMin
]

{ #category : 'accessing' }
CTRedBlackTree >> height [

	^ root height
]

{ #category : 'enumerating' }
CTRedBlackTree >> inOrderDo: aBlock [

	root inOrderDo: aBlock
]

{ #category : 'testing' }
CTRedBlackTree >> includes: anObject [

	^ (root search: anObject) notNil
]

{ #category : 'initialization' }
CTRedBlackTree >> initialize [

	super initialize.
	root := CTRBTNilNode new
]

{ #category : 'testing' }
CTRedBlackTree >> isEmpty [

	^ root isEmpty
]

{ #category : 'accessing' }
CTRedBlackTree >> root [

	^ root isEmpty ifTrue: [ nil ] ifFalse: [ root ]
]

{ #category : 'accessing' }
CTRedBlackTree >> size [

	^ root size
]
