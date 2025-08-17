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

{ #category : 'enumerating' }
CTRedBlackTree >> anySatisfy: aBlock [

	self inOrderDo: [ :each |
		(aBlock value: each) ifTrue: [ ^ true ]
	].
	^ false
]

{ #category : 'converting' }
CTRedBlackTree >> asArray [

	| result |
	result := OrderedCollection new: self size.
	self inOrderDo: [ :each | result add: each ].
	^ result asArray
]

{ #category : 'accessing' }
CTRedBlackTree >> at: anObject ifAbsent: aBlock [

	| result |
	result := root search: anObject.
	^ result ifNil: [ aBlock value ] ifNotNil: [ result ]
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
CTRedBlackTree >> collect: aBlock [

	| result |
	result := OrderedCollection new: self size.
	self inOrderDo: [ :each | result add: (aBlock value: each) ].
	^ result
]

{ #category : 'enumerating' }
CTRedBlackTree >> detect: aBlock ifNone: absentBlock [

	self inOrderDo: [ :each |
		(aBlock value: each) ifTrue: [ ^ each ]
	].
	^ absentBlock value
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
CTRedBlackTree >> findMaxNode [

		^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMaxNode ]
]

{ #category : 'searching' }
CTRedBlackTree >> findMin [

	^ root findMin
]

{ #category : 'searching' }
CTRedBlackTree >> findMinNode [

	^ self isEmpty
		ifTrue: [ nil ]
		ifFalse: [ root findMinNode ]
]

{ #category : 'accessing' }
CTRedBlackTree >> first [

	^ self findMin
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
CTRedBlackTree >> last [

	^ self findMax
]

{ #category : 'enumerating' }
CTRedBlackTree >> postOrderDo: aBlock [

	root postOrderDo: aBlock
]

{ #category : 'enumerating' }
CTRedBlackTree >> preOrderDo: aBlock [

	root preOrderDo: aBlock
]

{ #category : 'searching' }
CTRedBlackTree >> predecessorOf: anObject [

	^ root predecessorOf: anObject
]

{ #category : 'removing' }
CTRedBlackTree >> remove: anObject [

	^ self
		remove: anObject
		ifAbsent: [ NotFound signalFor: anObject in: self ]
]

{ #category : 'removing' }
CTRedBlackTree >> remove: anObject ifAbsent: aBlock [

	(self includes: anObject) ifFalse: [ ^ aBlock value ].
	root := root removeValue: anObject.
	root parent: nil.
	root isEmpty ifFalse: [ root color: #black ].
	^ anObject
]

{ #category : 'accessing' }
CTRedBlackTree >> root [

	^ root isEmpty ifTrue: [ nil ] ifFalse: [ root ]
]

{ #category : 'enumerating' }
CTRedBlackTree >> select: aBlock [

	| result |
	result := OrderedCollection new.
	self inOrderDo: [ :each | (aBlock value: each) ifTrue: [ result add: each ] ].
	^ result
]

{ #category : 'accessing' }
CTRedBlackTree >> size [

	^ root size
]

{ #category : 'searching' }
CTRedBlackTree >> successorOf: anObject [

	^ root successorOf: anObject
]

{ #category : 'accessing' }
CTRedBlackTree >> validate [

	"Validate that the tree maintains Red-Black Tree properties"
	^ root isEmpty or: [ 
		root isBlack and: [ root validateBSTProperty ] ]
]

{ #category : 'validation' }
CTRedBlackTree >> validateBSTProperty [

	"Validate that the tree maintains Red-Black Tree properties"
	^ self validate
]
