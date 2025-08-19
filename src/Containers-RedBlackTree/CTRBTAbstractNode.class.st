"
I am an abstract base class for Red-Black Tree nodes.
I define the common interface that both regular nodes (CTRBTNode) and nil nodes (CTRBTNilNode) must implement.
I include protocol for Red-Black Tree specific operations like color management and rebalancing, as well as standard tree enumeration and searching.

Red-Black Trees maintain these invariants:
1. Every node is either red or black
2. The root is always black
3. All nil nodes are black
4. Red nodes cannot have red children
5. Every path from root to nil contains the same number of black nodes

Subclasses:
- CTRBTNilNode
- CTRBTNode
"
Class {
	#name : 'CTRBTAbstractNode',
	#superclass : 'Object',
	#instVars : [
		'parent'
	],
	#category : 'Containers-RedBlackTree',
	#package : 'Containers-RedBlackTree'
}

{ #category : 'adding' }
CTRBTAbstractNode >> addChild: anObject [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTRBTAbstractNode >> blackHeight [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTRBTAbstractNode >> color [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> color: aColor [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> contents [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> contents: anObject [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTRBTAbstractNode >> elementsFrom: min to: max into: aCollection [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTRBTAbstractNode >> elementsGreaterThan: anObject into: aCollection [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTRBTAbstractNode >> elementsLessThan: anObject into: aCollection [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> findMax [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> findMaxNode [ 

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> findMin [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> findMinNode [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> height [ 

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTRBTAbstractNode >> inOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'testing' }
CTRBTAbstractNode >> isBlack [

	^ self subclassResponsibility 
]

{ #category : 'testing' }
CTRBTAbstractNode >> isEmpty [ 

	^ self subclassResponsibility 
]

{ #category : 'testing' }
CTRBTAbstractNode >> isLeaf [

	^ self subclassResponsibility 
]

{ #category : 'testing' }
CTRBTAbstractNode >> isRed [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> parent [ 
	
	^ parent 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> parent: aNode [

	parent := aNode
]

{ #category : 'enumerating' }
CTRBTAbstractNode >> postOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'enumerating' }
CTRBTAbstractNode >> preOrderDo: aBlock [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> predecessorOf: anObject [

	^ self subclassResponsibility
]

{ #category : 'removing' }
CTRBTAbstractNode >> removeValue: anObject [

	^ self subclassResponsibility
]

{ #category : 'accessing' }
CTRBTAbstractNode >> search: anObject [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> size [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> successorOf: anObject [

	^ self subclassResponsibility
]

{ #category : 'validation' }
CTRBTAbstractNode >> validateBSTProperty [

	^ self subclassResponsibility 
]

{ #category : 'validation' }
CTRBTAbstractNode >> validateBSTPropertyWithMin: min max: max [

	^ self subclassResponsibility 
]
