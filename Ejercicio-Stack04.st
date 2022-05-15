!classDefinition: #OOStackTest category: 'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:29:55'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:01'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:09'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:48'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'DO 5/14/2022 16:51:41'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:24'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'NR 5/13/2020 13:30:31'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'DO 5/15/2022 19:30:25'!
test11LimitedStackCannotStackWhenCapacityHasBeenReached 
	|limitedStack firstPushedObject secondPushedObject|
	
	limitedStack := OOLimitedStack with: 2.
	firstPushedObject := 'first'.
	secondPushedObject := 'second'.
	
	limitedStack push: firstPushedObject.
	limitedStack push: secondPushedObject.
	self should: [limitedStack push: 'hola']
		raise: Error 
		withExceptionDo: [ :currentError | self assert: currentError messageText equals: (OOLimitedStack fullStackCapacityErrorDescription)].
	
! !


!classDefinition: #SentenceFinderByPrefixTest category: 'Stack-Exercise'!
TestCase subclass: #SentenceFinderByPrefixTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:53:30'!
test01PrefixCannotBeEmpty

	|stack notEmptyStack|
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('hola' 'como' 'estas').
	self try: [self applyFinderTo: notEmptyStack With: ''] AndRaiseError: #PrefixIsEmptyErrorDescription.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:51:16'!
test02PrefixCannotContainSpaces
	|stack notEmptyStack |
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('hola' 'como' 'estas').
	self try: [self applyFinderTo: notEmptyStack With: 'ho la'] AndRaiseError: #PrefixContainsSpaceErrorDescription.! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:56:12'!
test03FinderDoesNotWorkIfStackIsEmpty
	|stack|
	stack := OOStack new.
	self try: [self applyFinderTo: stack With: 'hola'] AndRaiseError: #StackIsEmptyErrorDescription.
	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:27:14'!
test04FinderDetectsNumbersAndSymbols 
	|stack result notEmptyStack|
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('123' '12?HOLA').
	result := self applyFinderTo: notEmptyStack With: '12?'.
	
	self assert:  result first equals: ('12?HOLA').
	self assert: result size equals: 1.	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:31:43'!
test05FinderIsCaseSensitive
	|stack notEmptyStack  resultUC resultLC|
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('Winter is coming' 'winter is coming' 'coming is Winter').
	resultUC := self applyFinderTo: notEmptyStack With: 'Wint'.
	resultLC := self applyFinderTo: notEmptyStack With: 'wint'.
	
	self assert: resultUC first equals: ('Winter is coming').
	self assert: resultUC size equals: 1.	
	self assert: resultLC first equals: ('winter is coming').
	self assert: resultLC size equals: 1.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:33:28'!
test06FinderDoesNotFindThePrefix
	|stack notEmptyStack result|
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('winter is coming' 'Winter is coming').
	result := self applyFinderTo: notEmptyStack With: 'hello'.
	
	
	self assert: result size equals: 0.	! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:35:19'!
test07FinderFindsMoreThanOneMatch
	|stack notEmptyStack sentenceFinder result|
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('Winter is coming' 'Winter is not coming' 'coming is Winter').
	sentenceFinder := SentenceFinderByPrefix with: stack.
	result := self applyFinderTo: notEmptyStack With: 'Wint'.
	
	self assert: result first equals: ('Winter is not coming') .
	self assert: result second equals: ('Winter is coming').
	self assert: result size equals: 2.	
! !

!SentenceFinderByPrefixTest methodsFor: 'tests' stamp: 'DO 5/15/2022 16:39:01'!
test08StackRemainsEqualAfterUsingFinder
	|stack notEmptyStack |
	stack := OOStack new.
	notEmptyStack := self fill: stack With: #('Winter is coming' 'Winter is approaching' 'hola').
	self applyFinderTo: notEmptyStack With: 'Wint'.
	
	self assert: stack pop = ('hola').
	self assert: stack pop = ('Winter is approaching').
	self assert: stack pop = ('Winter is coming').
	self assert: stack isEmpty.
	
	
	! !


!SentenceFinderByPrefixTest methodsFor: 'auxiliar' stamp: 'DO 5/15/2022 16:26:06'!
applyFinderTo: aStack With: aPrefix
	|sentenceFinder|
	sentenceFinder := SentenceFinderByPrefix with: aStack.
	^sentenceFinder find: aPrefix.
	! !

!SentenceFinderByPrefixTest methodsFor: 'auxiliar' stamp: 'DO 5/15/2022 16:17:38'!
fill: aStack With: aCollection
	aCollection do: [:element| aStack push: element].
	
	^aStack.! !

!SentenceFinderByPrefixTest methodsFor: 'auxiliar' stamp: 'DO 5/15/2022 16:48:12'!
try: aClosure AndRaiseError: anError
	self should: aClosure
		raise: Error 
		withExceptionDo: [ :currentError | self assert: currentError messageText equals: (anError asMessage sendTo: SentenceFinderByPrefix)].
		! !


!SentenceFinderByPrefixTest methodsFor: 'set up' stamp: 'DO 5/14/2022 23:39:39'!
setUp
	sentenceFinder := SentenceFinderByPrefix new.  ! !


!classDefinition: #Node category: 'Stack-Exercise'!
Object subclass: #Node
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!Node methodsFor: 'get methods' stamp: 'DO 5/15/2022 19:12:53'!
returnPrevious
	^previous. ! !

!Node methodsFor: 'get methods' stamp: 'DO 5/14/2022 17:16:10'!
returnValue 
	^value. ! !


!classDefinition: #BaseNode category: 'Stack-Exercise'!
Node subclass: #BaseNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!BaseNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:11:40'!
returnNodeAtTheTopOf: aStack 
	^aStack sendEmptyErrorMessage.! !

!BaseNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 18:23:59'!
size 
	^0.! !


!classDefinition: #DataNode category: 'Stack-Exercise'!
Node subclass: #DataNode
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!DataNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 18:16:41'!
assignPreviousBelow: aNode
	previous := aNode! !

!DataNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:07:21'!
initializeWith: aString 
	value := aString.! !

!DataNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 18:42:46'!
previous
	^previous.! !

!DataNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:11:40'!
returnNodeAtTheTopOf: aStack
	^value. ! !

!DataNode methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 18:24:49'!
size 
	^previous size + 1.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'DataNode class' category: 'Stack-Exercise'!
DataNode class
	instanceVariableNames: ''!

!DataNode class methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:08:39'!
with: aString 
	^self new initializeWith: aString.! !


!classDefinition: #OOStack category: 'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'size elements first'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'initialization' stamp: 'DO 5/15/2022 18:26:08'!
initialize
	
	"elements := OrderedCollection new."  
	first := BaseNode new.! !


!OOStack methodsFor: 'functions' stamp: 'DO 5/15/2022 18:20:09'!
isEmpty
	^first isKindOf: BaseNode.! !

!OOStack methodsFor: 'functions' stamp: 'DO 5/15/2022 19:11:41'!
pop
	|elementToPop|
	elementToPop := first returnNodeAtTheTopOf: self.
	first := first previous.
	^elementToPop.
	
	! !

!OOStack methodsFor: 'functions' stamp: 'DO 5/15/2022 19:13:36'!
push: aString
	self updateTop: aString! !

!OOStack methodsFor: 'functions' stamp: 'DO 5/15/2022 18:22:59'!
size
 	^first size.! !

!OOStack methodsFor: 'functions' stamp: 'DO 5/15/2022 19:14:07'!
top
	first returnNodeAtTheTopOf: self. 
	^first returnValue. ! !


!OOStack methodsFor: 'error' stamp: 'DO 5/15/2022 18:33:51'!
sendEmptyErrorMessage 
	^self error: self class stackEmptyErrorDescription.! !



!OOStack methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:01:40'!
updateTop: aString
	|new|
	new := DataNode with: aString.
	new assignPreviousBelow: first.
	first := new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: 'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'DO 5/15/2022 17:04:43'!
stackEmptyErrorDescription
	
	^'Stack is empty'! !


!classDefinition: #OOLimitedStack category: 'Stack-Exercise'!
OOStack subclass: #OOLimitedStack
	instanceVariableNames: 'capacity'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:18:00'!
initializeWith: aCapacity 
	capacity := aCapacity.
	first := BaseNode new. ! !

!OOLimitedStack methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:23:33'!
push: aString 
	(capacity = self size) ifTrue: [self error: self class fullStackCapacityErrorDescription ].
	self updateTop: aString.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOLimitedStack class' category: 'Stack-Exercise'!
OOLimitedStack class
	instanceVariableNames: ''!


!OOLimitedStack class methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:21:37'!
fullStackCapacityErrorDescription 
	^'Stack capacity has been reached'! !

!OOLimitedStack class methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 19:28:12'!
with: aCapacity 
	^self new initializeWith: aCapacity.! !


!classDefinition: #SentenceFinderByPrefix category: 'Stack-Exercise'!
Object subclass: #SentenceFinderByPrefix
	instanceVariableNames: 'stack'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!SentenceFinderByPrefix methodsFor: 'initialization' stamp: 'DO 5/14/2022 18:13:38'!
initializeWith: aStack 
	stack := aStack.! !


!SentenceFinderByPrefix methodsFor: 'functions' stamp: 'DO 5/15/2022 17:02:46'!
find: aPrefix
	| collection matchCollection|
	self testUse: aPrefix.
	collection := OrderedCollection new.
	matchCollection := OrderedCollection new. 
	[stack isEmpty not] whileTrue: [collection add: stack pop].
	collection do: [:element| (element beginsWith: aPrefix) ifTrue: [matchCollection addLast: element]].
	(collection reversed)do: [:element| stack push: element]. 
	^matchCollection.
		 
	 ! !

!SentenceFinderByPrefix methodsFor: 'functions' stamp: 'DO 5/15/2022 17:02:46'!
testUse: aPrefix
	(aPrefix isEmpty) ifTrue: [^self error: self class PrefixIsEmptyErrorDescription].
	(aPrefix includesSubString: ' ') ifTrue: [^self error: self class PrefixContainsSpaceErrorDescription]. 
	(stack isEmpty) ifTrue: [^self error: self class StackIsEmptyErrorDescription].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'SentenceFinderByPrefix class' category: 'Stack-Exercise'!
SentenceFinderByPrefix class
	instanceVariableNames: ''!

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'DO 5/14/2022 23:57:32'!
PrefixContainsSpaceErrorDescription
	^'Prefix contains space'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'DO 5/14/2022 23:31:57'!
PrefixIsEmptyErrorDescription
	^'Prefix is Empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'DO 5/15/2022 02:58:46'!
StackIsEmptyErrorDescription
	^'Stack is Empty'.! !

!SentenceFinderByPrefix class methodsFor: 'as yet unclassified' stamp: 'DO 5/14/2022 18:14:57'!
with: aStack 
	^self new initializeWith: aStack.! !
