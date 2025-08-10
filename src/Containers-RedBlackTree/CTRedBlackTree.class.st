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

{ #category : 'removing' }
CTRedBlackTree >> clear [

	root := CTRBTNilNode new
]

{ #category : 'accessing' }
CTRedBlackTree >> height [

	^ root height
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
