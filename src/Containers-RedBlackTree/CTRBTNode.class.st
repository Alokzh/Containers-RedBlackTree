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

{ #category : 'enumerating' }
CTRBTNode >> elementsFrom: min to: max into: aCollection [

	contents > min ifTrue: [
		left elementsFrom: min to: max into: aCollection ].
	(contents between: min and: max) ifTrue: [ aCollection add: contents ].
	contents < max ifTrue: [
		right elementsFrom: min to: max into: aCollection ]
]

{ #category : 'enumerating' }
CTRBTNode >> elementsGreaterThan: anObject into: aCollection [

	contents > anObject ifTrue: [
		left elementsGreaterThan: anObject into: aCollection.
		aCollection add: contents ].
	right elementsGreaterThan: anObject into: aCollection
]

{ #category : 'enumerating' }
CTRBTNode >> elementsLessThan: anObject into: aCollection [

	left elementsLessThan: anObject into: aCollection.
	contents < anObject ifFalse: [ ^ self ].
	aCollection add: contents.
	right elementsLessThan: anObject into: aCollection
]

{ #category : 'searching' }
CTRBTNode >> findMax [

	^ right isEmpty
		ifTrue: [ contents ]
		ifFalse: [ right findMax ]
]

{ #category : 'searching' }
CTRBTNode >> findMaxNode [

	^ right isEmpty
		ifTrue: [ self ]
		ifFalse: [ right findMaxNode ]
]

{ #category : 'searching' }
CTRBTNode >> findMin [

	^ left isEmpty
		ifTrue: [ contents ]
		ifFalse: [ left findMin ]
]

{ #category : 'searching' }
CTRBTNode >> findMinNode [

	^ left isEmpty
		ifTrue: [ self ]
		ifFalse: [ left findMinNode ]
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
CTRBTNode >> fixAfterDeletion [

	| currentNode sibling newRoot |
	newRoot := self.
	currentNode := self.
	
	[ currentNode isRed or: [ currentNode parent isNil ] ] whileFalse: [
		currentNode == currentNode parent left
			ifTrue: [
				"Current is left child"
				sibling := currentNode parent right.
				
				"Case 1: Red sibling"
				sibling isRed ifTrue: [
					sibling color: #black.
					currentNode parent color: #red.
					newRoot := currentNode parent rotateLeftAndUpdateRoot: newRoot.
					sibling := currentNode parent right ].
				
				"Case 2: Black sibling with black children"
				(sibling left isBlack and: [ sibling right isBlack ]) ifTrue: [
					sibling color: #red.
					currentNode := currentNode parent ]
				ifFalse: [
					"Case 3: Black sibling with red left child"
					sibling right isBlack ifTrue: [
						sibling left color: #black.
						sibling color: #red.
						newRoot := sibling rotateRightAndUpdateRoot: newRoot.
						sibling := currentNode parent right ].
					"Case 4: Black sibling with red right child"
					sibling color: currentNode parent color.
					currentNode parent color: #black.
					sibling right color: #black.
					newRoot := currentNode parent rotateLeftAndUpdateRoot: newRoot.
					currentNode := newRoot "Exit loop" ] ]
			ifFalse: [
				"Current is right child - mirror cases"
				sibling := currentNode parent left.
				
				"Case 1: Red sibling"
				sibling isRed ifTrue: [
					sibling color: #black.
					currentNode parent color: #red.
					newRoot := currentNode parent rotateRightAndUpdateRoot: newRoot.
					sibling := currentNode parent left ].
				
				"Case 2: Black sibling with black children"
				(sibling left isBlack and: [ sibling right isBlack ]) ifTrue: [
					sibling color: #red.
					currentNode := currentNode parent ]
				ifFalse: [
					"Case 3: Black sibling with red right child"
					sibling left isBlack ifTrue: [
						sibling right color: #black.
						sibling color: #red.
						newRoot := sibling rotateLeftAndUpdateRoot: newRoot.
						sibling := currentNode parent left ].
					"Case 4: Black sibling with red left child"
					sibling color: currentNode parent color.
					currentNode parent color: #black.
					sibling left color: #black.
					newRoot := currentNode parent rotateRightAndUpdateRoot: newRoot.
					currentNode := newRoot "Exit loop" ] ] ].
	
	currentNode color: #black.
	^ newRoot
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

{ #category : 'enumerating' }
CTRBTNode >> postOrderDo: aBlock [

	left postOrderDo: aBlock.
	right postOrderDo: aBlock.
	aBlock value: contents
]

{ #category : 'enumerating' }
CTRBTNode >> preOrderDo: aBlock [

	aBlock value: contents.
	left preOrderDo: aBlock.
	right preOrderDo: aBlock
]

{ #category : 'searching' }
CTRBTNode >> predecessorOf: anObject [

	| rightResult |
	anObject <= contents ifTrue: [
		^ left predecessorOf: anObject ].
	rightResult := right predecessorOf: anObject.
	^ rightResult ifNil: [ contents ] ifNotNil: [ rightResult ]
]

{ #category : 'removing' }
CTRBTNode >> removeThisNode [

	"Complete removal with proper fixup"
	| successor originalColor replacementNode newRoot |
	originalColor := self color.
	newRoot := self.
	
	"Case 1: No left child"
	left isEmpty ifTrue: [
		replacementNode := right.
		newRoot := self replaceWith: right.
		originalColor = #black ifTrue: [
			newRoot := replacementNode fixAfterDeletion ].
		^ newRoot ].
	
	"Case 2: No right child"
	right isEmpty ifTrue: [
		replacementNode := left.
		newRoot := self replaceWith: left.
		originalColor = #black ifTrue: [
			newRoot := replacementNode fixAfterDeletion ].
		^ newRoot ].
	
	"Case 3: Two children - replace with successor"
	successor := right findMinNode.
	originalColor := successor color.
	replacementNode := successor right.
	
	"Replace content with successor's content"
	self contents: successor contents.
	
	"Remove successor"
	self right: (right removeValue: successor contents).
	
	"Fix if we removed a black node"
	originalColor = #black ifTrue: [
		newRoot := self fixAfterDeletion ].
	
	^ newRoot
]

{ #category : 'removing' }
CTRBTNode >> removeValue: anObject [

	anObject < contents ifTrue: [
		self left: (left removeValue: anObject).
		^ self ].
	anObject > contents ifTrue: [
		self right: (right removeValue: anObject).
		^ self ].
	
	"Found node to remove"
	^ self removeThisNode
]

{ #category : 'replacing' }
CTRBTNode >> replaceWith: replacementNode [

	"Replace this node with replacementNode in tree structure"
	parent ifNil: [ ^ replacementNode ].
	
	self == parent left
		ifTrue: [ parent left: replacementNode ]
		ifFalse: [ parent right: replacementNode ].
	
	^ replacementNode
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

{ #category : 'searching' }
CTRBTNode >> successorOf: anObject [

	| leftResult |
	anObject >= contents ifTrue: [
		^ right successorOf: anObject ].
	leftResult := left successorOf: anObject.
	^ leftResult ifNil: [ contents ] ifNotNil: [ leftResult ]
]

{ #category : 'validation' }
CTRBTNode >> validateBSTProperty [

	^ self validateBSTPropertyWithMin: nil max: nil
]

{ #category : 'validation' }
CTRBTNode >> validateBSTPropertyWithMin: min max: max [

	"Check BST property"
	(min notNil and: [ contents < min ]) ifTrue: [ ^ false ].
	(max notNil and: [ contents > max ]) ifTrue: [ ^ false ].
	
	"Check Red-Black properties"
	(self isRed and: [ left isRed or: [ right isRed ] ]) ifTrue: [ ^ false ].
	left blackHeight ~= right blackHeight ifTrue: [ ^ false ].
	
	"Recursively validate children"
	^ (left validateBSTPropertyWithMin: min max: contents) and: [
		right validateBSTPropertyWithMin: contents max: max ]
]
