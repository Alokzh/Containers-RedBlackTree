"
I represent a node containing data in a Red-Black Tree. I hold a value and a color.
"
Class {
	#name : 'CTRBTNode',
	#superclass : 'CTRBTAbstractNode',
	#instVars : [
		'contents',
		'left',
		'right',
		'color'
	],
	#category : 'Containers-RedBlackTree',
	#package : 'Containers-RedBlackTree'
}

{ #category : 'adding' }
CTRBTNode >> addChild: anObject [

	anObject < contents
		ifTrue: [ self left: (left addChild: anObject) ]
		ifFalse: [
			anObject > contents ifTrue: [ self right: (right addChild: anObject) ] ].
	^ self
]

{ #category : 'accessing' }
CTRBTNode >> color [

	^ color
]

{ #category : 'accessing' }
CTRBTNode >> color: aColor [

	color := aColor
]

{ #category : 'accessing' }
CTRBTNode >> contents [

	^ contents
]

{ #category : 'accessing' }
CTRBTNode >> contents: anObject [

	contents := anObject
]

{ #category : 'accessing' }
CTRBTNode >> height [

	^ 1 + (left height max: right height)
]

{ #category : 'initialization' }
CTRBTNode >> initialize [

	super initialize.
	left := CTRBTNilNode new parent: self.
	right := CTRBTNilNode new parent: self.
	color := #red
]

{ #category : 'testing' }
CTRBTNode >> isBlack [

	^ color = #black
]

{ #category : 'testing' }
CTRBTNode >> isEmpty [

	^ false
]

{ #category : 'testing' }
CTRBTNode >> isLeaf [

	^ left isEmpty and: [ right isEmpty ]
]

{ #category : 'testing' }
CTRBTNode >> isRed [

	^ color = #red
]

{ #category : 'accessing' }
CTRBTNode >> left [

	^ left
]

{ #category : 'accessing' }
CTRBTNode >> left: aNode [

	left := aNode.
	aNode ifNotNil: [ aNode parent: self ]
]

{ #category : 'accessing' }
CTRBTNode >> right [

	^ right
]

{ #category : 'accessing' }
CTRBTNode >> right: aNode [

	right := aNode.
	aNode ifNotNil: [ aNode parent: self ]
]

{ #category : 'accessing' }
CTRBTNode >> size [

	^ 1 + left size + right size
]
