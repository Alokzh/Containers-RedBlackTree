"
I am the abstract base class for Red-Black Tree nodes.
I define the common interface that both regular nodes (CTRBTNode) and nil nodes (CTRBTNilNode) must implement.
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

{ #category : 'searching' }
CTRBTAbstractNode >> findMax [

	^ self subclassResponsibility 
]

{ #category : 'searching' }
CTRBTAbstractNode >> findMin [

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

{ #category : 'accessing' }
CTRBTAbstractNode >> search: anObject [

	^ self subclassResponsibility 
]

{ #category : 'accessing' }
CTRBTAbstractNode >> size [

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
