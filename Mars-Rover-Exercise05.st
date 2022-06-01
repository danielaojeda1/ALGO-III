!classDefinition: #MarsRoverTest category: 'Mars Rover - Exercise'!
TestCase subclass: #MarsRoverTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!MarsRoverTest methodsFor: 'testing-private' stamp: 'DO 5/31/2022 15:19:03'!
send: aComand To: aMarsRover AndCheck: aCurrentPoint WithMethod: aMethod
	aMarsRover receivesComands: aComand. 
	self assert: (aMethod asMessage sendTo: aMarsRover) equals: aCurrentPoint.! !

!MarsRoverTest methodsFor: 'testing-private' stamp: 'DO 5/31/2022 15:29:20'!
try: aClosure AndRaiseError: anError
	self should: aClosure
		raise: Error 
		withExceptionDo: [ :currentError | self assert: currentError messageText equals: (anError asMessage sendTo: MarsRover)].! !


!MarsRoverTest methodsFor: 'testing' stamp: 'DO 5/31/2022 15:18:33'!
test01MarsRoverMovesForwardInNorthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'N'.
	
	self send: 'f' To: marsRover AndCheck: {0@1.}  WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 5/31/2022 15:19:58'!
test02MarsRoverMovesBackwardsInNorthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'N'.
	self send: 'b' To: marsRover AndCheck: {0@-1.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 5/31/2022 15:21:33'!
test03MarsRoverRotatesLeftFromNorthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'N'.
	self send: 'l' To: marsRover AndCheck: 'O' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 5/31/2022 15:22:16'!
test04MarsRoverRotatesRightFromNorthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'N'.
	self send: 'r' To: marsRover AndCheck: 'E' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:10:53'!
test05MarsRoverMovesForwardFromSouthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'S'.
	self send: 'f' To: marsRover AndCheck: {0@-1.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:11:39'!
test06MarsRoverMovesBackwardsFromSouthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'S'.
	self send: 'b' To: marsRover AndCheck: {0@1.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:11:23'!
test07MarsRoverRotatesLeftFromSouthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'S'.
	self send: 'l' To: marsRover AndCheck: 'E' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:13:00'!
test08MarsRoverRotatesRightFromSouthOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'S'.
	self send: 'r' To: marsRover AndCheck: 'O' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:17:49'!
test09MarsRoverMovesForwardFromEastOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'E'.
	self send: 'f' To: marsRover AndCheck: {1@0.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:18:15'!
test10MarsRoverMovesBackwardsFromEastOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'E'.
	self send: 'b' To: marsRover AndCheck: {-1@0.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:18:29'!
test11MarsRoverRotatesLeftFromEastOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'E'.
	self send: 'l' To: marsRover AndCheck: 'N' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 19:22:05'!
test12MarsRoverRotatesRightFromEastOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'E'.
	self send: 'r' To: marsRover AndCheck: 'S' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:08:28'!
test13MarsRoverMovesForwardFromWestOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'O'.
	self send: 'f' To: marsRover AndCheck: {-1@0.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:14:18'!
test14MarsRoverMovesBackwardsFromWestOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'O'.
	self send: 'b' To: marsRover AndCheck: {1@0.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:14:28'!
test15MarsRoverRotatesLeftFromWestOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'O'.
	self send: 'l' To: marsRover AndCheck: 'S' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:04:28'!
test16MarsRoverRotatesRightFromWestOrientation
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'O'.
	self send: 'r' To: marsRover AndCheck: 'N' WithMethod: #currentOrientation.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:04:47'!
test17MarsRoverMovesBackwardsMultipleTimes
	| marsRover |
	marsRover := MarsRover at: {1@0.} WithOrientation: 'O'.
	self send: 'bbb' To: marsRover AndCheck: {4@0.} WithMethod: #currentPosition! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:06:09'!
test18MarsRoverRotatesMultipleTimes
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'E'.
	self send: 'lrrrll' To: marsRover AndCheck: 'E' WithMethod: #currentOrientation! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:06:47'!
test19MarsRoverCannotExecuteAnInvalidComand
	|marsRover|
	marsRover := MarsRover at: {0@0.} WithOrientation: 'S'.
	self try: [marsRover receivesComands: 'h'] AndRaiseError: #InvalidComandErrorDescription.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:05:28'!
test20MarsRoverMovesForwardMultipleTimes
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'S'.
	self send: 'fff' To: marsRover AndCheck: {0@-3.} WithMethod: #currentPosition.! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:06:37'!
test21MarsRoverCannotBeInitializedWithAnInvalidOrientation
	self try: [MarsRover at: {0@0.} WithOrientation: 'K'.] AndRaiseError: #InvalidOrientationErrorDescription.
	
	
		! !

!MarsRoverTest methodsFor: 'testing' stamp: 'DO 6/1/2022 20:07:07'!
test22MarsRoverCanProperlyExecuteASetOfComands
	| marsRover |
	marsRover := MarsRover at: {0@0.} WithOrientation: 'E'.
	self send: 'fbrlffl' To: marsRover  AndCheck: 'N' WithMethod: #currentOrientation.
	self assert: (marsRover currentPosition) equals: {2@0.}.! !


!classDefinition: #CardinalPoint category: 'Mars Rover - Exercise'!
Object subclass: #CardinalPoint
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!CardinalPoint methodsFor: 'accessing' stamp: 'DO 5/31/2022 16:32:03'!
value 
	self subclassResponsibility.! !


!CardinalPoint methodsFor: 'movements' stamp: 'DO 5/31/2022 16:15:38'!
movesBackwards: aMarsRover 
	self subclassResponsibility.
! !

!CardinalPoint methodsFor: 'movements' stamp: 'DO 5/31/2022 16:16:28'!
movesForward: aMarsRover 
	self subclassResponsibility.
! !

!CardinalPoint methodsFor: 'movements' stamp: 'DO 5/31/2022 16:15:45'!
rotatesLeft: aMarsRover 
	self subclassResponsibility.
! !

!CardinalPoint methodsFor: 'movements' stamp: 'DO 5/31/2022 16:15:48'!
rotatesRight: aMarsRover 
	self subclassResponsibility.
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CardinalPoint class' category: 'Mars Rover - Exercise'!
CardinalPoint class
	instanceVariableNames: ''!

!CardinalPoint class methodsFor: 'initialization' stamp: 'DO 5/31/2022 16:46:08'!
setWith: aCardinalPoint
	self subclassResponsibility.! !

!CardinalPoint class methodsFor: 'initialization' stamp: 'DO 5/31/2022 17:50:46'!
with: aCardinal
	|anOrientation| 
	anOrientation := CardinalPoint allSubclasses detect: [:subclass | subclass setWith: aCardinal].
	^anOrientation new.
! !


!classDefinition: #East category: 'Mars Rover - Exercise'!
CardinalPoint subclass: #East
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!East methodsFor: 'accessing' stamp: 'DO 5/31/2022 16:29:15'!
value
	^'E'.! !


!East methodsFor: 'movements' stamp: 'DO 5/31/2022 16:07:58'!
movesBackwards: aMarsRover 
	aMarsRover movesBackwardsInEastDirection.! !

!East methodsFor: 'movements' stamp: 'DO 5/31/2022 15:57:21'!
movesForward: aMarsRover 
	aMarsRover movesForwardInEastDirection.! !

!East methodsFor: 'movements' stamp: 'DO 5/31/2022 17:54:48'!
rotatesLeft: aMarsRover 
	aMarsRover rotateLeftFromEastDirection.! !

!East methodsFor: 'movements' stamp: 'DO 5/31/2022 17:54:56'!
rotatesRight: aMarsRover 
	aMarsRover rotateRightFromEastDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'East class' category: 'Mars Rover - Exercise'!
East class
	instanceVariableNames: ''!

!East class methodsFor: 'initialization' stamp: 'DO 5/31/2022 02:31:44'!
setWith: aCardinalPoint
	^aCardinalPoint = 'E'. ! !


!classDefinition: #North category: 'Mars Rover - Exercise'!
CardinalPoint subclass: #North
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!North methodsFor: 'accessing' stamp: 'DO 5/31/2022 16:30:31'!
value 
	^'N'! !


!North methodsFor: 'movements' stamp: 'DO 5/31/2022 16:08:31'!
movesBackwards: aMarsRover 
	aMarsRover movesBackwardsInNorthDirection.! !

!North methodsFor: 'movements' stamp: 'DO 5/31/2022 15:59:13'!
movesForward: aMarsRover 
	aMarsRover movesForwardInNorthDirection.! !

!North methodsFor: 'movements' stamp: 'DO 5/31/2022 17:55:03'!
rotatesLeft: aMarsRover 
	aMarsRover rotateLeftFromNorthDirection.! !

!North methodsFor: 'movements' stamp: 'DO 5/31/2022 17:55:06'!
rotatesRight: aMarsRover 
	aMarsRover rotateRightFromNorthDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'North class' category: 'Mars Rover - Exercise'!
North class
	instanceVariableNames: ''!

!North class methodsFor: 'initialization' stamp: 'DO 5/31/2022 02:32:45'!
setWith: aCardinalPoint
	^aCardinalPoint = 'N'. ! !


!classDefinition: #South category: 'Mars Rover - Exercise'!
CardinalPoint subclass: #South
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!South methodsFor: 'accessing' stamp: 'DO 5/31/2022 16:31:07'!
value 
	^'S'.! !


!South methodsFor: 'movements' stamp: 'DO 5/31/2022 16:11:37'!
movesBackwards: aMarsRover
	aMarsRover movesBackwardsInSouthDirection.! !

!South methodsFor: 'movements' stamp: 'DO 5/31/2022 16:11:50'!
movesForward: aMarsRover
	aMarsRover movesForwardInSouthDirection.! !

!South methodsFor: 'movements' stamp: 'DO 5/31/2022 17:55:11'!
rotatesLeft: aMarsRover
	aMarsRover rotateLeftFromSouthDirection.! !

!South methodsFor: 'movements' stamp: 'DO 5/31/2022 17:55:16'!
rotatesRight: aMarsRover
	aMarsRover rotateRightFromSouthDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'South class' category: 'Mars Rover - Exercise'!
South class
	instanceVariableNames: ''!

!South class methodsFor: 'initialization' stamp: 'DO 5/31/2022 02:33:04'!
setWith: aCardinalPoint
	^aCardinalPoint = 'S'. ! !


!classDefinition: #West category: 'Mars Rover - Exercise'!
CardinalPoint subclass: #West
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!West methodsFor: 'accessing' stamp: 'DO 5/31/2022 16:31:32'!
value 
	^'O'! !


!West methodsFor: 'movements' stamp: 'DO 5/31/2022 18:15:00'!
movesBackwards: aMarsRover
	aMarsRover movesBackwardsInWestDirection.! !

!West methodsFor: 'movements' stamp: 'DO 5/31/2022 16:13:47'!
movesForward: aMarsRover
	aMarsRover movesForwardInWestDirection.! !

!West methodsFor: 'movements' stamp: 'DO 5/31/2022 17:55:25'!
rotatesLeft: aMarsRover
	aMarsRover rotateLeftFromWestDirection.! !

!West methodsFor: 'movements' stamp: 'DO 5/31/2022 17:55:21'!
rotatesRight: aMarsRover
	aMarsRover rotateRightFromWestDirection.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'West class' category: 'Mars Rover - Exercise'!
West class
	instanceVariableNames: ''!

!West class methodsFor: 'initialization' stamp: 'DO 5/31/2022 02:33:26'!
setWith: aCardinalPoint
	^aCardinalPoint = 'O'. ! !


!classDefinition: #MarsRover category: 'Mars Rover - Exercise'!
Object subclass: #MarsRover
	instanceVariableNames: 'position orientation'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover - Exercise'!

!MarsRover methodsFor: 'initialization' stamp: 'DO 5/31/2022 16:28:24'!
initializeAt: aPoint WithOrientation: aCardinalPoint
	position := aPoint.
	(#('N' 'S' 'O' 'E') includes: aCardinalPoint) ifFalse: [self error: self class InvalidOrientationErrorDescription ].
	orientation := CardinalPoint with: aCardinalPoint.! !


!MarsRover methodsFor: 'comand handling' stamp: 'DO 6/1/2022 20:21:52'!
processComands: aComand 
	(aComand = $f) ifTrue: [^orientation movesForward: self].
	(aComand = $b) ifTrue: [^orientation movesBackwards: self].
	(aComand = $l) ifTrue: [^orientation rotatesLeft: self].
	(aComand = $r) ifTrue: [^orientation rotatesRight: self].
	^self error: self class InvalidComandErrorDescription.! !

!MarsRover methodsFor: 'comand handling' stamp: 'DO 6/1/2022 20:22:10'!
receivesComands: setOfComands
	setOfComands do: [:comand| self processComands: comand.
	]
		
	! !


!MarsRover methodsFor: 'accesing' stamp: 'DO 5/31/2022 16:32:28'!
currentOrientation
	^orientation value.! !

!MarsRover methodsFor: 'accesing' stamp: 'DO 5/31/2022 01:35:48'!
currentPosition 
	^position.! !


!MarsRover methodsFor: 'backwards movements' stamp: 'DO 5/31/2022 16:18:39'!
movesBackwardsInEastDirection 
	position := position - {1@0.}! !

!MarsRover methodsFor: 'backwards movements' stamp: 'DO 5/31/2022 16:18:46'!
movesBackwardsInNorthDirection 
	position := position - {0@1.}! !

!MarsRover methodsFor: 'backwards movements' stamp: 'DO 5/31/2022 16:01:51'!
movesBackwardsInSouthDirection 
	position := position + {0@1.}! !

!MarsRover methodsFor: 'backwards movements' stamp: 'DO 5/31/2022 16:18:57'!
movesBackwardsInWestDirection 
	position := position + {1@0.}! !


!MarsRover methodsFor: 'right rotation' stamp: 'DO 5/31/2022 16:24:32'!
rotateRightFromEastDirection
	^orientation := CardinalPoint with: 'S'.! !

!MarsRover methodsFor: 'right rotation' stamp: 'DO 5/31/2022 16:24:49'!
rotateRightFromNorthDirection
	^orientation := CardinalPoint with: 'E'.! !

!MarsRover methodsFor: 'right rotation' stamp: 'DO 5/31/2022 16:25:04'!
rotateRightFromSouthDirection
	^orientation := CardinalPoint with: 'O'.! !

!MarsRover methodsFor: 'right rotation' stamp: 'DO 5/31/2022 16:25:25'!
rotateRightFromWestDirection
	^orientation := CardinalPoint with: 'N'.! !


!MarsRover methodsFor: 'left rotation' stamp: 'DO 5/31/2022 16:22:25'!
rotateLeftFromEastDirection
	^orientation := CardinalPoint with: 'N'.
! !

!MarsRover methodsFor: 'left rotation' stamp: 'DO 5/31/2022 16:21:31'!
rotateLeftFromNorthDirection
	^orientation := CardinalPoint with: 'O'.! !

!MarsRover methodsFor: 'left rotation' stamp: 'DO 5/31/2022 16:21:48'!
rotateLeftFromSouthDirection
	^orientation := CardinalPoint with: 'E'.
! !

!MarsRover methodsFor: 'left rotation' stamp: 'DO 5/31/2022 16:22:13'!
rotateLeftFromWestDirection
	^orientation := CardinalPoint with: 'S'.
! !


!MarsRover methodsFor: 'forward movements' stamp: 'DO 5/31/2022 16:18:05'!
movesForwardInEastDirection 
	position := position + {1@0.}! !

!MarsRover methodsFor: 'forward movements' stamp: 'DO 5/31/2022 15:36:04'!
movesForwardInNorthDirection 
	position := position + {0@1.}! !

!MarsRover methodsFor: 'forward movements' stamp: 'DO 5/31/2022 16:17:42'!
movesForwardInSouthDirection 
	position := position - {0@1.}! !

!MarsRover methodsFor: 'forward movements' stamp: 'DO 5/31/2022 16:18:14'!
movesForwardInWestDirection 
	position := position - {1@0.}! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: 'Mars Rover - Exercise'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'initialization' stamp: 'DO 5/31/2022 01:22:41'!
at: aPoint WithOrientation: aCardinalPoint
	^self new initializeAt: aPoint WithOrientation: aCardinalPoint.! !


!MarsRover class methodsFor: 'error descriptions' stamp: 'DO 5/31/2022 01:46:02'!
InvalidComandErrorDescription 
	^'Comand is invalid'! !

!MarsRover class methodsFor: 'error descriptions' stamp: 'DO 5/31/2022 14:39:23'!
InvalidOrientationErrorDescription 
	^'Orientation is invalid'! !
