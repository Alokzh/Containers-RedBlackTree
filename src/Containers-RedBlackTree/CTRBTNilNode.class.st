"
I represent an empty leaf node in a Red-Black Tree. All leaf nodes in a Red-Black tree are considered black
"
Class {
	#name : 'CTRBTNilNode',
	#superclass : 'CTRBTAbstractNode',
	#category : 'Containers-RedBlackTree',
	#package : 'Containers-RedBlackTree'
}

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

{ #category : 'accessing' }
CTRBTNilNode >> height [ 

	^ 0
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

{ #category : 'accessing' }
CTRBTNilNode >> size [ 

	^ 0
]
