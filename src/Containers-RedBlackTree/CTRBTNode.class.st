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
CTRBTNode >> blackHeight [

	^ (self isBlack ifTrue: [ 1 ] ifFalse: [ 0 ]) + left blackHeight
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

{ #category : 'searching' }
CTRBTNode >> findMax [

	^ right isEmpty
		ifTrue: [ contents ]
		ifFalse: [ right findMax ]
]

{ #category : 'searching' }
CTRBTNode >> findMin [

	^ left isEmpty
		ifTrue: [ contents ]
		ifFalse: [ left findMin ]
]

{ #category : 'accessing' }
CTRBTNode >> height [

	^ 1 + (left height max: right height)
]

{ #category : 'enumerating' }
CTRBTNode >> inOrderDo: aBlock [

	left inOrderDo: aBlock.
	aBlock value: contents.
	right inOrderDo: aBlock
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

{ #category : 'private' }
CTRBTNode >> rotateLeft [

	"Standard left rotation"
	| newRoot |
	newRoot := right.
	self right: newRoot left.
	newRoot left: self.
	
	"Update parent connections"
	newRoot parent: parent.
	parent ifNotNil: [
		self == parent left
			ifTrue: [ parent left: newRoot ]
			ifFalse: [ parent right: newRoot ] ].
	
	^ newRoot
]

{ #category : 'private' }
CTRBTNode >> rotateLeftAndUpdateRoot: currentRoot [

	"Rotate left and return new root if this was the root"
	| newLocalRoot |
	newLocalRoot := self rotateLeft.
	^ self == currentRoot ifTrue: [ newLocalRoot ] ifFalse: [ currentRoot ]
]

{ #category : 'private' }
CTRBTNode >> rotateRight [

	"Standard right rotation"
	| newRoot |
	newRoot := left.
	self left: newRoot right.
	newRoot right: self.
	
	"Update parent connections"
	newRoot parent: parent.
	parent ifNotNil: [
		self == parent left
			ifTrue: [ parent left: newRoot ]
			ifFalse: [ parent right: newRoot ] ].
	
	^ newRoot
]

{ #category : 'private' }
CTRBTNode >> rotateRightAndUpdateRoot: currentRoot [

	"Rotate right and return new root if this was the root"
	| newLocalRoot |
	newLocalRoot := self rotateRight.
	^ self == currentRoot ifTrue: [ newLocalRoot ] ifFalse: [ currentRoot ]
]

{ #category : 'accessing' }
CTRBTNode >> search: anObject [

	contents = anObject ifTrue: [ ^ contents ].
	^ anObject < contents
		ifTrue: [ left search: anObject ]
		ifFalse: [ right search: anObject ]
]

{ #category : 'accessing' }
CTRBTNode >> size [

	^ 1 + left size + right size
]
