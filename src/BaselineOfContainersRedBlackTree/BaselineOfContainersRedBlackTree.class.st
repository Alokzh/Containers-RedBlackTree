"
I represent the baseline for the Red-Black Tree container.
"
Class {
	#name : 'BaselineOfContainersRedBlackTree',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfContainersRedBlackTree',
	#package : 'BaselineOfContainersRedBlackTree'
}

{ #category : 'baselines' }
BaselineOfContainersRedBlackTree >> baseline: spec [

	<baseline>
	spec for: #common do: [
			spec package: 'Containers-RedBlackTree'.
			spec
				package: 'Containers-RedBlackTree-Tests'
				with: [ spec requires: #( 'Containers-RedBlackTree' ) ] ]
]
