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

{ #category : 'removing' }
CTRedBlackTree >> clear [

	root := CTRBTNilNode new
]

{ #category : 'initialization' }
CTRedBlackTree >> initialize [

	super initialize.
	self clear
]

{ #category : 'testing' }
CTRedBlackTree >> isEmpty [

	^ root isEmpty
]

{ #category : 'accessing' }
CTRedBlackTree >> root [

	^ root isEmpty ifTrue: [ nil ] ifFalse: [ root ]
]
