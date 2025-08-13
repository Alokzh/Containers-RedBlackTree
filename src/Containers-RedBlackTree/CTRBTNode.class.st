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
	^ self fixAfterInsertion
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

{ #category : 'private' }
CTRBTNode >> findNewlyInsertedNode [

	"Find the red node that was just inserted"
	| queue current |
	queue := OrderedCollection with: self.
	
	[ queue isEmpty ] whileFalse: [
		current := queue removeFirst.
		current isRed ifTrue: [
			(current left isEmpty and: [ current right isEmpty ]) ifTrue: [ ^ current ] ].
		current left isEmpty ifFalse: [ queue add: current left ].
		current right isEmpty ifFalse: [ queue add: current right ] ].
	
	^ self
]

{ #category : 'private' }
CTRBTNode >> fixAfterInsertion [

	| currentNode uncle grandparent newRoot |
	newRoot := self.
	
	"Find the newly inserted red node"
	currentNode := self findNewlyInsertedNode.
	
	[ currentNode parent notNil and: [ currentNode parent isRed ] ] whileTrue: [
		grandparent := currentNode parent parent.
		currentNode parent == grandparent left
			ifTrue: [
				uncle := grandparent right.
				uncle isRed
					ifTrue: [
						"Case 1: Red uncle - recolor"
						currentNode parent color: #black.
						uncle color: #black.
						grandparent color: #red.
						currentNode := grandparent ]
					ifFalse: [
						"Case 2 & 3: Black uncle"
						currentNode == currentNode parent right ifTrue: [
							"Case 2: Triangle - rotate to make line"
							currentNode := currentNode parent.
							newRoot := currentNode rotateLeftAndUpdateRoot: newRoot ].
						"Case 3: Line - rotate and recolor"
						currentNode parent color: #black.
						grandparent color: #red.
						newRoot := grandparent rotateRightAndUpdateRoot: newRoot ] ]
			ifFalse: [
				"Mirror cases for right side"
				uncle := grandparent left.
				uncle isRed
					ifTrue: [
						"Case 1: Red uncle"
						currentNode parent color: #black.
						uncle color: #black.
						grandparent color: #red.
						currentNode := grandparent ]
					ifFalse: [
						"Case 2 & 3: Black uncle"
						currentNode == currentNode parent left ifTrue: [
							"Case 2: Triangle"
							currentNode := currentNode parent.
							newRoot := currentNode rotateRightAndUpdateRoot: newRoot ].
						"Case 3: Line"
						currentNode parent color: #black.
						grandparent color: #red.
						newRoot := grandparent rotateLeftAndUpdateRoot: newRoot ] ] ].
	
	"Ensure root is black"
	newRoot color: #black.
	^ newRoot
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
