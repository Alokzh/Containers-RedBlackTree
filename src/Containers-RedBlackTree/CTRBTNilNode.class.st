"
I represent an empty leaf node in a Red-Black Tree. All leaf nodes in a Red-Black tree are considered black
"
Class {
	#name : 'CTRBTNilNode',
	#superclass : 'CTRBTAbstractNode',
	#category : 'Containers-RedBlackTree',
	#package : 'Containers-RedBlackTree'
}

{ #category : 'testing' }
CTRBTNilNode >> isEmpty [

	^ true
]
