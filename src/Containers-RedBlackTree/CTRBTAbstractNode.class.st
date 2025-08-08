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

{ #category : 'testing' }
CTRBTAbstractNode >> isEmpty [ 

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
