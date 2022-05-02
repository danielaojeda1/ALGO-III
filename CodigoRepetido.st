!classDefinition: #CantSuspend category: 'CodigoRepetido-Ejercicio'!
Error subclass: #CantSuspend
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #NotFound category: 'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #CustomerBookTest category: 'CodigoRepetido-Ejercicio'!
TestCase subclass: #CustomerBookTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:55:56'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds
	| customerBook |
	customerBook _ CustomerBook new.
	self AssertMaximumTimeForClosure: [ customerBook addCustomerNamed: 'John Lennon' ] maxTime: 50.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:56:10'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds
	| customerBook customerName |
	customerBook _ CustomerBook new.
	customerName _ 'Paul McCartney'.
	customerBook addCustomerNamed: customerName.
	self AssertMaximumTimeForClosure: [ customerBook removeCustomerNamed: customerName ] maxTime: 100.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:58:44'!
test03CanNotAddACustomerWithEmptyName
	| customerBook |
	
	customerBook := CustomerBook new.
	
	[ customerBook addCustomerNamed: ''.
	self fail ]
	on: Error 
	do: [ :anError | 
		self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
		self assert: customerBook isEmpty ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:59:35'!
test04CanNotRemoveAnInvalidCustomer
	| customerBook johnLennon |
	
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.

	[ customerBook removeCustomerNamed: 'Paul McCartney'.
	self fail ]
	on: NotFound 
	do: [ :anError | 
       		self assert: customerBook numberOfCustomers = 1.
      		self assert: (customerBook includesCustomerNamed: johnLennon) ]! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:57:06'!
test05SuspendingACustomerShouldNotRemoveItFromCustomerBook
	| customerBook customerName resultsByMessage |
	customerBook _ CustomerBook new.
	customerName _ 'Paul McCartney'.
	customerBook addCustomerNamed: customerName.
	customerBook suspendCustomerNamed: customerName.
	
	resultsByMessage := Dictionary new.
	resultsByMessage at: #numberOfActiveCustomers put: 0.
	resultsByMessage at: #numberOfSuspendedCustomers put: 1.
	resultsByMessage at: #numberOfCustomers put: 1. 
	
	self AssertResultsPerMessageForAnObject: resultsByMessage anObject: customerBook.
	self assert: (customerBook includesCustomerNamed: customerName).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:57:14'!
test06RemovingASuspendedCustomerShouldRemoveItFromCustomerBook
	| customerBook customerName resultsByMessage |
	customerBook _ CustomerBook new.
	customerName _ 'Paul McCartney'.
	customerBook addCustomerNamed: customerName.
	customerBook suspendCustomerNamed: customerName.
	customerBook removeCustomerNamed: customerName.
	
	resultsByMessage := Dictionary new.
	resultsByMessage at: #numberOfActiveCustomers put: 0.
	resultsByMessage at: #numberOfSuspendedCustomers put: 0.
	resultsByMessage at: #numberOfCustomers put: 0. 
	
	self AssertResultsPerMessageForAnObject: resultsByMessage anObject: customerBook. 
	self deny: (customerBook includesCustomerNamed: customerName).! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:57:39'!
test07CanNotSuspendAnInvalidCustomer
	| customerBook johnLennon |

   	customerBook := CustomerBook new.
   	johnLennon := 'John Lennon'.
   	customerBook addCustomerNamed: johnLennon.
	
	self AssertCustomersAfterSuspension: customerBook customerToBeSuspended: 'Ringo Starr' customerToAssert: johnLennon.! !

!CustomerBookTest methodsFor: 'testing' stamp: 'A 5/1/2022 17:57:50'!
test08CanNotSuspendAnAlreadySuspendedCustomer
	| customerBook johnLennon |

   	customerBook := CustomerBook new.
   	johnLennon := 'John Lennon'.
   	customerBook addCustomerNamed: johnLennon.
   	customerBook suspendCustomerNamed: johnLennon.
	
	self AssertCustomersAfterSuspension: customerBook customerToBeSuspended: johnLennon customerToAssert: johnLennon.

   	! !


!CustomerBookTest methodsFor: 'auxiliary' stamp: 'A 5/1/2022 17:55:01'!
AssertCustomersAfterSuspension: customerBook customerToBeSuspended: suspendedCustomerName customerToAssert: assertCustomerName
	[ customerBook suspendCustomerNamed: suspendedCustomerName.
    		self fail ]
	on: CantSuspend 
       do: [ :anError | 
            self assert: customerBook numberOfCustomers = 1.
            self assert: (customerBook includesCustomerNamed: assertCustomerName) ]! !

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'A 5/1/2022 17:54:03'!
AssertMaximumTimeForClosure: aClosure maxTime: aTime
	| beforeRunningClosure afterRunningClosure |
	beforeRunningClosure _ Time millisecondClockValue * millisecond.
	aClosure.
	afterRunningClosure _ Time millisecondClockValue * millisecond.
	self assert: afterRunningClosure - beforeRunningClosure < (aTime * millisecond).! !

!CustomerBookTest methodsFor: 'auxiliary' stamp: 'A 5/1/2022 17:53:31'!
AssertResultsPerMessageForAnObject: aDictionary anObject: customerBook
	aDictionary keysAndValuesDo: [:key :value | self assert: value equals: [ key asMessage sendTo: customerBook ] value ].
	! !


!classDefinition: #CustomerBook category: 'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'suspended active'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing'!
! !

!CustomerBook methodsFor: 'testing'!
! !


!CustomerBook methodsFor: 'initialization'!
! !


!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

!CustomerBook methodsFor: 'customer management'!
! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: 'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages'!
! !

!CustomerBook class methodsFor: 'error messages'!
! !
