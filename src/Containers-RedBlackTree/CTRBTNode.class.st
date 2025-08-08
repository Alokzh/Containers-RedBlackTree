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

{ #category : 'initialization' }
CTRBTNode >> initialize [

	super initialize.
	left := CTRBTNilNode new parent: self.
	right := CTRBTNilNode new parent: self.
	color := #red
]

{ #category : 'testing' }
CTRBTNode >> isEmpty [

	^ false
]
