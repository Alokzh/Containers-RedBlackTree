"
I represent an empty node in a Red-Black Tree using the Null Object pattern.
I am always black by definition (Red-Black Tree property), which simplifies tree algorithms.
I provide default 'do nothing' behavior for all tree operations, eliminating the need for nil checks throughout the tree algorithms.
When elements are added to me, I create and return a new CTRBTNode containing the element, effectively growing the tree.
My black height is 0, and I contribute 0 to any path's black node count.
"
Class {
	#name : 'CTRBTNilNode',
	#superclass : 'CTRBTAbstractNode',
	#category : 'Containers-RedBlackTree',
	#package : 'Containers-RedBlackTree'
}

{ #category : 'adding' }
CTRBTNilNode >> addChild: anObject [

	^ CTRBTNode new
		contents: anObject;
		color: #red;
		parent: self parent;
		yourself
]

{ #category : 'accessing' }
CTRBTNilNode >> blackHeight [

	^  0
]

{ #category : 'accessing' }
CTRBTNilNode >> color [

	^ #black
]

{ #category : 'accessing' }
CTRBTNilNode >> color: aColor [

	"Nil nodes are always black - ignore color changes"
]

{ #category : 'accessing' }
CTRBTNilNode >> contents [

	^ nil
]

{ #category : 'accessing' }
CTRBTNilNode >> contents: anObject [

	"Do Nothing for Nil Node"
]

{ #category : 'enumerating' }
CTRBTNilNode >> elementsFrom: min to: max into: aCollection [

	"Do nothing for nil node"
]

{ #category : 'enumerating' }
CTRBTNilNode >> elementsGreaterThan: anObject into: aCollection [

	"Do nothing for nil node"
]

{ #category : 'enumerating' }
CTRBTNilNode >> elementsLessThan: anObject into: aCollection [

	"Do nothing for nil node"
]

{ #category : 'searching' }
CTRBTNilNode >> findMax [ 

	^ nil
]

{ #category : 'searching' }
CTRBTNilNode >> findMaxNode [ 
	
	^ self
]

{ #category : 'searching' }
CTRBTNilNode >> findMin [ 

	^ nil
]

{ #category : 'searching' }
CTRBTNilNode >> findMinNode [

	^ self
]

{ #category : 'accessing' }
CTRBTNilNode >> height [ 

	^ 0
]

{ #category : 'enumerating' }
CTRBTNilNode >> inOrderDo: aBlock [

	"Do nothing for nil node"
]

{ #category : 'testing' }
CTRBTNilNode >> isBlack [

	^ true
]

{ #category : 'testing' }
CTRBTNilNode >> isEmpty [

	^ true
]

{ #category : 'testing' }
CTRBTNilNode >> isLeaf [

	^ false
]

{ #category : 'testing' }
CTRBTNilNode >> isRed [

	^ false
]

{ #category : 'enumerating' }
CTRBTNilNode >> postOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'enumerating' }
CTRBTNilNode >> preOrderDo: aBlock [

	"Do Nothing for Nil Node"
]

{ #category : 'searching' }
CTRBTNilNode >> predecessorOf: anObject [

	^ nil
]

{ #category : 'removing' }
CTRBTNilNode >> removeValue: anObject [

	^ self
]

{ #category : 'accessing' }
CTRBTNilNode >> search: anObject [

	^ nil
]

{ #category : 'accessing' }
CTRBTNilNode >> size [ 

	^ 0
]

{ #category : 'searching' }
CTRBTNilNode >> successorOf: anObject [

	^ nil
]

{ #category : 'validation' }
CTRBTNilNode >> validateBSTProperty [

	^ true
]

{ #category : 'validation' }
CTRBTNilNode >> validateBSTPropertyWithMin: min max: max [

	^ true
]
