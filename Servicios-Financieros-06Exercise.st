!classDefinition: #PortfolioTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: 'portfolio1 portfolioN2 account1 accountN2 portfolio3'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 17:57:53'!
test01EmptyPortfolioHasNoMembers
	self assert: portfolio1 size equals: 0.
	self assert: portfolio1 balance equals: 0.

	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 22:01:29'!
test02PortfolioCanStoreAccounts
	self addsMembers: {account1. accountN2} To: portfolio1.
	
	self assert: portfolio1 size equals: 2.

	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 19:19:14'!
test03BalanceIsSumOfMembersBalance
	Deposit register: 50 * peso on: account1.
	Deposit register: 50 * peso on: accountN2.
	self addsMembers: {account1. accountN2} To: portfolio1.
	
	self assert: portfolio1 balance equals: 100 * peso.! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 17:58:59'!
test04PortfolioKnowsEachMembersTransactions
	| listOfTransactions |
	Deposit register: 50 * peso on: account1.
	Deposit register: 1000 * peso on: account1. 
	Withdraw register: 300 * peso on: account1.
	portfolio1 addMember: account1. 
	listOfTransactions := portfolio1 listTransactionsOf: account1.
	
	self assert: listOfTransactions size equals: account1 transactions size. 
	account1 transactions do: [:aTransaction| self assert: listOfTransactions includes: aTransaction].! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 19:19:59'!
test05PortfolioCanOnlyKnowTransactionsOfMembers
	Deposit register: 50 * peso on: account1.
	self try: [portfolio1 listTransactionsOf: account1.] AndRaiseError: #PortfolioCannotAccessDataFromANonMemberErrorDescription.! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 17:32:41'!
test06PortfolioCanIdentifyIfAnAccountMemberHasDoneAnyTransactions
	portfolio1 addMember: account1.
	self evaluateTransactionsOf: account1 In: portfolio1.

	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 19:23:20'!
test07PortfolioCanStoreOtherPortfolios
	portfolioN2 addMember: account1. 
	portfolio1 addMember: portfolioN2.
	
	self assert: portfolioN2 size equals: 1. 
	self assert: portfolio1 size equals: 1. 
	self assert: portfolio1 members includes: portfolioN2.
	self assert: portfolioN2 members includes: account1.
	
	


	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 19:22:56'!
test08PortfolioReturnsBalanceCorrectlyGivenPortfoliosAsMembers
	Deposit register: 5000 * peso on: account1.
	Deposit register: 50* peso on: accountN2.
	portfolioN2 addMember: account1.
	self addsMembers: {portfolioN2. accountN2.} To: portfolio1.
	self assert: portfolio1 size equals: 2. 
	self assert: portfolio1 balance equals: 5050 * peso.
	
	
	
	


	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 19:22:15'!
test09PortfolioCanReturnTheTransactionsDoneInsideAMemberPortfolio
	Deposit register: 5000 * peso on: account1.
	Deposit register: 50 * peso on: accountN2.
	portfolioN2 addMember: account1.
	self addsMembers: {portfolioN2. accountN2.} To: portfolio1.
	
	self assert: portfolio1 size equals: 2. 
	self assert: portfolio1 balance equals: 5050 * peso.
	
	
	
	
	


	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/7/2022 20:40:10'!
test10PortfolioCanListTransactionsOfMemberThatIsPortfolio
	| listOfTransactions listOfTransactions2 |
	Deposit register: 5000 * peso on: account1.
	Withdraw register: 50 * peso on: account1.
	Deposit register: 50 * peso on: accountN2.
	
	self addsMembers: {account1. accountN2.} To: portfolioN2. 
	portfolio1 addMember: portfolioN2.
	
	listOfTransactions := portfolio1 listTransactionsOf: portfolioN2.
	listOfTransactions2 := self fill: OrderedCollection new WithTransactionsFrom: portfolioN2.
	self assert: listOfTransactions size equals: 3. 
	listOfTransactions2 do: [:aTransaction| self assert: listOfTransactions includes: aTransaction].
	
	


	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 17:32:29'!
test11PortfolioCanIdentifyIfAPortfolioMemberHasDoneAnyTransactions
	self addsMembers: {account1. accountN2.} To: portfolioN2.
	portfolio1 addMember: portfolioN2.
	self evaluateTransactionsOf: portfolioN2 In: portfolio1. 
	


	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 21:56:20'!
test12PortfolioCannotAddAMemberTwice 
	self addsMembers: {account1. portfolioN2} To: portfolio1.
	
	self try: [portfolio1 addMember: account1.] AndRaiseError: #PortfolioDoesNotAcceptDuplicatesErrorDescription.
	self try: [portfolio1 addMember: portfolioN2.] AndRaiseError: #PortfolioDoesNotAcceptDuplicatesErrorDescription.

	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 21:56:36'!
test13PortfolioCannotAddAMemberOfAPortfolioMember
	self addsMembers: {portfolio3. account1} To: portfolioN2.
	self addsMembers: {portfolioN2} To: portfolio1.
	
	self try: [portfolio1 addMember: account1.] AndRaiseError: #PortfolioDoesNotAcceptDuplicatesErrorDescription.
	self try: [portfolio1 addMember: portfolio3.] AndRaiseError: #PortfolioDoesNotAcceptDuplicatesErrorDescription.

	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 21:57:09'!
test14PortfolioCannotAddItselfAsAMember
	self try: [portfolio1 addMember: portfolio1.	] AndRaiseError: #	PortfolioDoesNotAcceptDuplicatesErrorDescription.


	! !

!PortfolioTest methodsFor: 'testing' stamp: 'DO 6/8/2022 22:33:21'!
test15PortfolioCannotAddAPortfolioThatContainsACommonMember
	portfolio1 := Portfolio new.
	portfolioN2 := Portfolio new.
	portfolio1 addMember: accountN2.
	portfolioN2 addMember: accountN2.
	
	self try: [portfolio1 addMember: portfolioN2.] AndRaiseError: #PortfolioDoesNotAcceptDuplicatesErrorDescription.

	! !


!PortfolioTest methodsFor: 'set up' stamp: 'DO 6/7/2022 20:18:18'!
setUp
	portfolio1 := Portfolio new.
	portfolioN2 := Portfolio new.
	portfolio3 := Portfolio new.
	account1 := ReceptiveAccount new.
	accountN2 := ReceptiveAccount new.! !


!PortfolioTest methodsFor: 'testing - private' stamp: 'DO 6/7/2022 19:14:09'!
addsMembers: aSetOfMembers To: aPortfolio
 
	aSetOfMembers do: [:aMember| aPortfolio addMember: aMember].! !

!PortfolioTest methodsFor: 'testing - private' stamp: 'DO 6/8/2022 17:31:26'!
evaluateTransactionsOf: aMember In: aPortfolio
	self assert: (aPortfolio memberHasDoneTransactions: aMember).
	Deposit register: 50 * peso on: account1.
	Deposit register: 1000 * peso on: account1.
	self deny: (aPortfolio memberHasDoneTransactions: aMember).! !

!PortfolioTest methodsFor: 'testing - private' stamp: 'DO 6/7/2022 18:26:51'!
fill: aCollection WithTransactionsFrom: aPortfolio
	aPortfolio members do: [:aMember|
		aCollection addAll: aMember transactions].
	^aCollection.! !

!PortfolioTest methodsFor: 'testing - private' stamp: 'DO 6/7/2022 18:49:46'!
try: aClosure AndRaiseError: anError
	self should: aClosure
		raise: Error 
		withExceptionDo: [ :currentError | self assert: currentError messageText equals: (anError asMessage sendTo: Portfolio)].! !


!classDefinition: #ReceptiveAccountTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:43'!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:20'!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 * peso on: account.
		
	self assert: 100 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:14:24'!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 * peso on: account.
	Withdraw register: 50 * peso on: account.
		
	self assert: 50 * peso equals: account balance
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:14'!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50 * peso.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:10:22'!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 * peso on: account.
	withdraw := Withdraw register: 50 * peso on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:14'!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 100 * peso.
	withdraw := Withdraw for: 50 * peso.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'LL 7/1/2021 03:12:23'!
test07AccountKnowsItsTransactions 

	| account deposit |
	
	account := ReceptiveAccount new.
	
	deposit := Deposit register: 50 * peso on: account.
		
	self assert: 1 equals: account transactions size.
	self assert: (account transactions includes: deposit).
! !


!classDefinition: #TransferTest category: 'ServiciosFinancieros-Ejercicio'!
TestCase subclass: #TransferTest
	instanceVariableNames: 'depositAccount extractionAccount'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTest methodsFor: 'testing' stamp: 'DO 6/7/2022 17:40:32'!
test01TransferBetweenEmptyAccountsRemainsEmpty
	self try: [Transfer for: 0* peso From: extractionAccount To: depositAccount.] AndRaiseError: #EmptyTransferErrorDescription.! !

!TransferTest methodsFor: 'testing' stamp: 'DO 6/7/2022 17:39:41'!
test02AccountShouldHaveEnoughMoneyToTransfer	
	Deposit register: 100 * peso on: extractionAccount.	
	Deposit register: 100 * peso on: depositAccount.	
	self try: [Transfer for: 150* peso From: extractionAccount To: depositAccount] AndRaiseError: #NotEnoughMoneyToTransferErrorDescription.! !

!TransferTest methodsFor: 'testing' stamp: 'DO 6/7/2022 18:37:23'!
test03AccountsBalanceUpdatesWithOperation
	Deposit register: 100 * peso on: extractionAccount.	
	Deposit register: 100 * peso on: depositAccount.	
	Transfer for: 100* peso From: extractionAccount To: depositAccount.
	
	self assert: extractionAccount balance equals: 0 * peso.
	self assert: extractionAccount transactions size equals: 2. 
	self assert: depositAccount balance equals: 200 * peso.
	self assert: depositAccount transactions size equals: 2.! !

!TransferTest methodsFor: 'testing' stamp: 'DO 6/9/2022 01:21:57'!
test04AccountsCanIdentifyTheirCounterPart
	| transfer depositPart extractionPart |	
	Deposit register: 100 * peso on: extractionAccount.
	transfer  := Transfer for: 100* peso From: extractionAccount To: depositAccount.
	extractionPart := transfer withdrawPart.
	depositPart := transfer depositPart.
	
	self assert: (depositPart counterpartPart) equals: extractionPart. 
	self assert: (extractionPart counterpartPart) equals: depositPart.

	! !


!TransferTest methodsFor: 'testing - private' stamp: 'DO 6/7/2022 18:49:04'!
try: aClosure AndRaiseError: anError
	self should: aClosure
		raise: Error 
		withExceptionDo: [ :currentError | self assert: currentError messageText equals: (anError asMessage sendTo: Transfer)].! !


!TransferTest methodsFor: 'set up' stamp: 'DO 6/7/2022 17:32:56'!
setUp 
	depositAccount := ReceptiveAccount new.
	extractionAccount := ReceptiveAccount new.! !


!classDefinition: #AccountTransaction category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'DO 6/5/2022 16:36:44'!
sumTo: aSumOfMoney

	self subclassResponsibility ! !

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 9/12/2011 12:25'!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 10/17/2019 03:22:00'!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:45'!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'DO 6/5/2022 16:36:45'!
sumTo: aSumOfMoney
	^value + aSumOfMoney! !

!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:38'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: 'ServiciosFinancieros-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:38'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #TransferTransaction category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #TransferTransaction
	instanceVariableNames: 'transfer'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'DO 6/9/2022 01:21:57'!
counterpartPart
	self subclassResponsibility.! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 20:59:53'!
initializeWith: aTransfer 
	transfer := aTransfer! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 21:13:24'!
sumTo: aSumOfMoney
	self subclassResponsibility.! !

!TransferTransaction methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 21:03:09'!
value 
	^transfer value. ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferTransaction class' category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction class
	instanceVariableNames: ''!

!TransferTransaction class methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 21:02:49'!
with: aTransfer
	^self new initializeWith: aTransfer.! !


!classDefinition: #TransferDeposit category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferDeposit
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'DO 6/9/2022 01:21:57'!
counterpartPart
	^transfer withdrawPart. ! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 22:54:17'!
initializeFor: aValue
	value := aValue! !

!TransferDeposit methodsFor: 'as yet unclassified' stamp: 'DO 6/9/2022 01:01:38'!
sumTo: aSumOfMoney
	^transfer value + aSumOfMoney! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferDeposit class' category: 'ServiciosFinancieros-Ejercicio'!
TransferDeposit class
	instanceVariableNames: ''!

!TransferDeposit class methodsFor: 'as yet unclassified' stamp: 'DO 6/7/2022 19:08:32'!
for: aValue
	^ self new initializeFor: aValue! !


!classDefinition: #TransferWithdraw category: 'ServiciosFinancieros-Ejercicio'!
TransferTransaction subclass: #TransferWithdraw
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'DO 6/9/2022 01:21:57'!
counterpartPart
	^transfer depositPart.! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 22:54:00'!
initializeFor: aValue
	value := aValue! !

!TransferWithdraw methodsFor: 'as yet unclassified' stamp: 'DO 6/9/2022 01:00:15'!
sumTo: aSumOfMoney
	^transfer value negated + aSumOfMoney! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TransferWithdraw class' category: 'ServiciosFinancieros-Ejercicio'!
TransferWithdraw class
	instanceVariableNames: ''!

!TransferWithdraw class methodsFor: 'as yet unclassified' stamp: 'DO 6/7/2022 19:08:17'!
for: aValue
	^ self new initializeFor: aValue! !


!classDefinition: #Withdraw category: 'ServiciosFinancieros-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 7/13/2011 18:46'!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'DO 6/7/2022 18:46:25'!
sumTo: aSumOfMoney
	^value negated + aSumOfMoney
	! !

!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 7/13/2011 18:33'!
value

	^ value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: 'ServiciosFinancieros-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 7/13/2011 18:33'!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Member category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Member
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Member methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 21:31:14'!
balance
	self subclassResponsibility.
	! !

!Member methodsFor: 'as yet unclassified' stamp: 'DO 6/8/2022 21:31:52'!
transactions 
	self subclassResponsibility.! !


!classDefinition: #Portfolio category: 'ServiciosFinancieros-Ejercicio'!
Member subclass: #Portfolio
	instanceVariableNames: 'members'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Portfolio methodsFor: 'accessing' stamp: 'DO 6/6/2022 20:27:40'!
balance 
	^members sum: [:aMember| aMember balance] ifEmpty: [0].! !

!Portfolio methodsFor: 'accessing' stamp: 'DO 6/6/2022 20:41:13'!
members 
	^members copy.! !

!Portfolio methodsFor: 'accessing' stamp: 'DO 6/6/2022 20:24:48'!
size
	^members size.! !

!Portfolio methodsFor: 'accessing' stamp: 'DO 6/7/2022 18:26:02'!
transactions
	|aCollection|
	aCollection := OrderedCollection new.
	members do: [:aMember| aCollection addAll: aMember transactions].
	^aCollection.! !


!Portfolio methodsFor: 'member functions' stamp: 'DO 6/8/2022 22:42:40'!
addMember: aMember
	aMember members do: [:anInsideMember| (self containsAMember: anInsideMember) ifTrue: [^self error: self class PortfolioDoesNotAcceptDuplicatesErrorDescription]].
	(self containsAMember: aMember) ifTrue: [^self error: self class PortfolioDoesNotAcceptDuplicatesErrorDescription].
	members add: aMember.! !

!Portfolio methodsFor: 'member functions' stamp: 'DO 6/8/2022 21:52:10'!
containsAMember: aPossibleMember 
	(self == aPossibleMember) ifTrue: [^true].
	members do: [:aMember| (aMember containsAMember: aPossibleMember) ifTrue: [^true]].
	^false.! !

!Portfolio methodsFor: 'member functions' stamp: 'DO 6/6/2022 21:07:33'!
listTransactionsOf: aMember
	(members includes: aMember) ifTrue: [^aMember transactions].
	^self error: self class PortfolioCannotAccessDataFromANonMemberErrorDescription.! !

!Portfolio methodsFor: 'member functions' stamp: 'DO 6/6/2022 21:07:33'!
memberHasDoneTransactions: aMember
	(members includes: aMember) ifTrue: [^aMember transactions size = 0 negated.].
	^self error: self class PortfolioCannotAccessDataFromANonMemberErrorDescription.! !


!Portfolio methodsFor: 'initialization' stamp: 'DO 6/7/2022 20:05:48'!
initialize
	members := Set new.
	! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: 'ServiciosFinancieros-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'error descriptions' stamp: 'DO 6/7/2022 19:48:42'!
PortfolioCannotAccessDataFromANonMemberErrorDescription
	^'No se puede acceder a las transferencias de un no miembro'! !

!Portfolio class methodsFor: 'error descriptions' stamp: 'DO 6/8/2022 21:55:27'!
PortfolioDoesNotAcceptDuplicatesErrorDescription
	^'No se puede acceder a las transferencias de un no miembro'! !


!classDefinition: #ReceptiveAccount category: 'ServiciosFinancieros-Ejercicio'!
Member subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 10/17/2019 15:06:56'!
initialize

	transactions := OrderedCollection new.! !

!ReceptiveAccount methodsFor: 'initialization' stamp: 'DO 6/8/2022 22:38:56'!
members
	^OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DO 6/5/2022 16:36:45'!
balance
	|currentSum | 
	currentSum := 0.
	(transactions do: [:transaction| 
		currentSum := transaction sumTo: currentSum]) ifEmpty: [currentSum := 0].
	^currentSum
	
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DO 6/8/2022 21:44:45'!
containsAMember: aPossibleMember 
	^self == aPossibleMember.! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'DO 6/8/2022 23:22:29'!
counterpartFrom: aTransfer
	^aTransfer counterpartAccount: self transactions last.
	! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'NR 10/17/2019 03:28:43'!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'main protocol' stamp: 'HernanWilkinson 7/13/2011 18:37'!
transactions 

	^ transactions copy! !


!classDefinition: #Transfer category: 'ServiciosFinancieros-Ejercicio'!
Object subclass: #Transfer
	instanceVariableNames: 'value extractionAccount depositAccount extractionPart depositPart'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'ServiciosFinancieros-Ejercicio'!

!Transfer methodsFor: 'accessing' stamp: 'DO 6/9/2022 01:16:18'!
depositPart 
	^depositPart.! !

!Transfer methodsFor: 'accessing' stamp: 'DO 6/5/2022 16:18:06'!
value 
	^value.! !

!Transfer methodsFor: 'accessing' stamp: 'DO 6/9/2022 01:16:10'!
withdrawPart 
	^extractionPart.! !


!Transfer methodsFor: 'validation' stamp: 'DO 6/8/2022 14:10:28'!
validationTransfer: aValue And: aWithDrawAccount
	(aValue = 0) ifTrue: [^self error: self class EmptyTransferErrorDescription].
	(aWithDrawAccount balance < aValue) ifTrue: [^self error: self class NotEnoughMoneyToTransferErrorDescription].! !


!Transfer methodsFor: 'functions' stamp: 'DO 6/9/2022 01:21:57'!
counterpartAccount: aPart 
	^aPart counterpartPart.! !

!Transfer methodsFor: 'functions' stamp: 'DO 6/8/2022 18:17:15'!
sumTo: aSumOfMoney 
	self subclassResponsibility.! !


!Transfer methodsFor: 'initialization' stamp: 'DO 6/9/2022 01:15:19'!
initializeFor: aValue From: aWithDrawAccount To: aDepositAccount
	self validationTransfer: aValue And: aWithDrawAccount.
	value := aValue.
	extractionPart := TransferWithdraw with: self.
	depositPart := TransferDeposit with: self.
	
	aWithDrawAccount register: extractionPart. 
	aDepositAccount register: depositPart.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Transfer class' category: 'ServiciosFinancieros-Ejercicio'!
Transfer class
	instanceVariableNames: 'value'!

!Transfer class methodsFor: 'error descriptions' stamp: 'DO 6/5/2022 16:57:47'!
EmptyTransferErrorDescription 
	^'No se puede transferir si el valor es 0'! !

!Transfer class methodsFor: 'error descriptions' stamp: 'DO 6/5/2022 16:51:02'!
NotEnoughMoneyToTransferErrorDescription 
	^'No hay dinero suficiente para transferir'! !


!Transfer class methodsFor: 'initialization' stamp: 'DO 6/5/2022 16:02:30'!
for: aValue From: aWithDrawAccount To: aDepositAccount
	^self new initializeFor: aValue From: aWithDrawAccount To: aDepositAccount.! !
