!classDefinition: #ElHabitat category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #ElHabitat
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'ElHabitat class' category: 'AvispasYAbejasParte2'!
ElHabitat class
	instanceVariableNames: 'orugas huevos polillas huevosPorFirmaGenetica ultimaAvispaEnReproducirse'!

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 16:52:23'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^huevosPorFirmaGenetica at: Lara! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:30:16'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^huevosPorFirmaGenetica at: Oriana! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:45:51'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^huevosPorFirmaGenetica at: Oriana! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:29:25'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^huevosPorFirmaGenetica at: Polly! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:29:27'!
cantidadDeHuevosDeAvispas
	^huevos! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 16:23:57'!
cantidadDeOrugas
	^orugas ! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 16:57:58'!
cantidadDePolillas
	^polillas! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:57:08'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self queElHabitatTengaDosOrugasMas. 
	self queElHabitatTengaDosPolillasMas.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 17:07:25'!
hayPolillas
	| huevosConFirmaGenetica |
	polillas > 0 ifTrue: [
	ultimaAvispaEnReproducirse := Polly.
	huevos := huevos + 1.
	polillas := polillas - 1. 
	huevosConFirmaGenetica := huevosPorFirmaGenetica at: Polly. 
	huevosConFirmaGenetica := huevosConFirmaGenetica + 1.
	huevosPorFirmaGenetica at: Polly put: 		huevosConFirmaGenetica. ]! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 17:07:03'!
hayRecursos: unaAvispa
	| huevosConFirmaGenetica huevosDeOriana |
	orugas > 0 ifTrue: [
	ultimaAvispaEnReproducirse := unaAvispa. 
	huevos := huevos + 1.
	orugas := orugas - 1. 
	huevosConFirmaGenetica := huevosPorFirmaGenetica at: unaAvispa.
	huevosConFirmaGenetica := huevosConFirmaGenetica + 1.
	huevosPorFirmaGenetica at: unaAvispa put: huevosConFirmaGenetica.
	unaAvispa == Ornella ifTrue: [ 
		huevosDeOriana := huevosPorFirmaGenetica at: Oriana. 
		huevosDeOriana := huevosDeOriana + 1.
		huevosPorFirmaGenetica at: Oriana put: huevosDeOriana. ]
	]! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 16:40:57'!
queElHabitatTengaDosOrugasMas
	orugas := orugas + 2. ! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 17:06:09'!
queElHabitatTengaDosPolillasMas
	polillas := polillas + 2.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 16:36:41'!
queElHabitatTengaUnaOrugaMas
	orugas := orugas  + 1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 16:57:06'!
queElHabitatTengaUnaPolillaMas
	polillas := polillas + 1.! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/23/2022 16:31:15'!
retrocederElHabitatAlInicioDeLosTiempos
	self vaciar! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 17:12:04'!
robarHuevoParaLara
	| huevosLara huevosUltimaAvispa | 
	huevosUltimaAvispa := huevosPorFirmaGenetica at: ultimaAvispaEnReproducirse.
	huevosUltimaAvispa > 0 ifTrue: [
		huevosLara := huevosPorFirmaGenetica at: Lara. 
		huevosLara := huevosLara  + 1.
		huevosPorFirmaGenetica at: Lara put: huevosLara.
		huevosUltimaAvispa := huevosUltimaAvispa - 1.
		huevosPorFirmaGenetica at: ultimaAvispaEnReproducirse put: huevosUltimaAvispa. ]! !

!ElHabitat class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 17:03:33'!
vaciar
	huevos := 0.
	orugas := 0.
	polillas := 0.
	huevosPorFirmaGenetica := Dictionary new.
	huevosPorFirmaGenetica at: Oriana put: 0. 
	huevosPorFirmaGenetica at: Ornella put: 0.
	huevosPorFirmaGenetica at: Polly put: 0.
	huevosPorFirmaGenetica at: Lara put: 0.
	! !


!ElHabitat class methodsFor: '--** private fileout/in **--' stamp: 'AA 4/24/2022 17:49:40'!
initializeCollaboratorsFromFile
	"Auto generated method for loading purposes - Do not modify it"

	orugas := 0.
	huevos := 0.
	polillas := 0.
	huevosPorFirmaGenetica := ((Dictionary new) add: (Lara->0); add: (Oriana->0); add: (Ornella->0); add: (Polly->0); yourself).
	ultimaAvispaEnReproducirse := Polly.! !


!classDefinition: #Lara category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Lara
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Lara class' category: 'AvispasYAbejasParte2'!
Lara class
	instanceVariableNames: ''!

!Lara class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 16:29:59'!
intentarReproducirse
	ElHabitat robarHuevoParaLara.! !


!classDefinition: #Oriana category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Oriana
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Oriana class' category: 'AvispasYAbejasParte2'!
Oriana class
	instanceVariableNames: ''!

!Oriana class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:30:36'!
intentarReproducirse
	ElHabitat hayRecursos: Oriana! !


!classDefinition: #Ornella category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Ornella
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Ornella class' category: 'AvispasYAbejasParte2'!
Ornella class
	instanceVariableNames: ''!

!Ornella class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 16:57:32'!
intentarReproducirse
	ElHabitat hayRecursos: Ornella! !


!classDefinition: #Polly category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #Polly
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Polly class' category: 'AvispasYAbejasParte2'!
Polly class
	instanceVariableNames: ''!

!Polly class methodsFor: 'as yet unclassified' stamp: 'AA 4/24/2022 15:46:50'!
intentarReproducirse
	ElHabitat hayPolillas.! !


!classDefinition: #PruebasReproduccionDeAvispas category: 'AvispasYAbejasParte2'!
DenotativeObject subclass: #PruebasReproduccionDeAvispas
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'AvispasYAbejasParte2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'PruebasReproduccionDeAvispas class' category: 'AvispasYAbejasParte2'!
PruebasReproduccionDeAvispas class
	instanceVariableNames: ''!

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/18/2022 18:38:11'!
test01EnElInicioDeLosTiemposNoHayHuevos	
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:44'!
test02CuandoOrianaLaAvispaSeReproducePorPrimeraVezDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'AA 4/24/2022 15:54:47'!
test03CadaVezQueOrianaSeReproduceDejaUnHuevoMas
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 2.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:12:53'!
test04ParaDejarUnHuevoOrianaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:43'!
test05ParaDejarUnHuevoOrianaLaAvispaDecrementaEnUnoLaPoblacionDeOrugasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosOrugasMas.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Oriana' stamp: 'JMB 4/21/2022 12:13:22'!
test06CuandoNoHayOrugasOrianaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:24'!
test07CuandoOrnellaLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:18'!
test08ParaDejarUnHuevoOrnellaLaAvispaReduceLaPoblacionDeUnaOrugaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaOrugaMas.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeOrugas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Ornella' stamp: 'JMB 4/21/2022 12:14:11'!
test09CuandoNoHayOrugasOrnellaLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'AA 4/24/2022 15:56:16'!
test10CuandoPollyLaAvispaSeReproduceDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:40'!
test11ParaDejarUnHuevoPollyLaAvispaReduceLaPoblacionDeUnaPolillaANinguna
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaUnaPolillaMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:36'!
test12ParaDejarUnHuevoPollyLaAvispaDecrementaEnUnoLaPoblacionDePolillasDelHabitat
	self retrocederElHabitatAlInicioDeLosTiempos.
	self queElHabitatTengaDosPolillasMas.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDePolillas isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Polly' stamp: 'JMB 4/21/2022 12:14:30'!
test13CuandoNoHayPolillasPollyLaAvispaNoPuedeDejarHuevos
	self retrocederElHabitatAlInicioDeLosTiempos.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self habitat cantidadDeHuevosDeAvispas isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:06'!
test14CuandoOrianaLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:15:02'!
test15CuandoOrianaLaAvispaAunNoSeReprodujoNoTieneHuevosConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	
	self laAvispaOriana intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:58'!
test16CuandoPollyLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaPolly intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 1.
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - firma genetica' stamp: 'JMB 4/21/2022 12:14:54'!
test17CuandoOrnellaLaAvispaSeReproduceDejaUnHuevoConLaMismaFirmaGeneticaQueOriana
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	
	self laAvispaOrnella intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella isEqualTo: 1.
	Assert 
		that: self cantidadDeHuevosConLaFirmaGeneticaDeOrnella  
		isEqualTo: self cantidadDeHuevosConLaFirmaGeneticaDeOriana! !


!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'AA 4/24/2022 16:52:00'!
test18CuandoLaraLaAvispaSeReproduceDejaUnHuevoConSuFirmaGenetica
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOrnella intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 1.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:22'!
test19CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAOtraAvispa
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaOriana intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeOriana isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:18'!
test20CuandoLaraLaAvispaSeReproduceLeSacaElHuevoAPolly
	self retrocederElHabitatAlInicioDeLosTiempos. 
	self hacerQueElHabitatTengaLosRecursosSuficientes.
	self laAvispaPolly intentarReproducirse.
	
	self laAvispaLara intentarReproducirse.
	
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDePolly isEqualTo: 0.! !

!PruebasReproduccionDeAvispas class methodsFor: 'tests - Lara la ladrona' stamp: 'JMB 4/21/2022 12:15:12'!
test21CuandoLaraLaAvispaNoTieneRecursosNoDejaUnHuevo
	self retrocederElHabitatAlInicioDeLosTiempos. 
		
	self laAvispaLara intentarReproducirse.
		
	Assert that: self cantidadDeHuevosConLaFirmaGeneticaDeLara isEqualTo: 0.! !


!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/24/2022 16:31:40'!
cantidadDeHuevosConLaFirmaGeneticaDeLara
	^ self habitat cantidadDeHuevosConLaFirmaGeneticaDeLara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/24/2022 15:34:15'!
cantidadDeHuevosConLaFirmaGeneticaDeOriana
	^ self habitat cantidadDeHuevosConLaFirmaGeneticaDeOriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/24/2022 15:45:43'!
cantidadDeHuevosConLaFirmaGeneticaDeOrnella
	^ self habitat cantidadDeHuevosConLaFirmaGeneticaDeOrnella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/24/2022 15:39:40'!
cantidadDeHuevosConLaFirmaGeneticaDePolly
	^ self habitat cantidadDeHuevosConLaFirmaGeneticaDePolly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 15:53:45'!
habitat
	^ElHabitat! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/24/2022 15:56:33'!
hacerQueElHabitatTengaLosRecursosSuficientes
	self habitat hacerQueElHabitatTengaLosRecursosSuficientes.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/24/2022 15:57:58'!
laAvispaLara
	^Lara! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 15:56:47'!
laAvispaOriana
	^Oriana! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 16:53:53'!
laAvispaOrnella
	^Ornella! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 16:56:06'!
laAvispaPolly
	^Polly! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 16:41:27'!
queElHabitatTengaDosOrugasMas
	self habitat queElHabitatTengaDosOrugasMas. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 17:06:32'!
queElHabitatTengaDosPolillasMas
	self habitat queElHabitatTengaDosPolillasMas. ! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 16:39:07'!
queElHabitatTengaUnaOrugaMas
	self habitat queElHabitatTengaUnaOrugaMas. 
	"Assert isTrue: false description: 'Reemplazar esto por la implementación correspondiente'."! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 16:57:28'!
queElHabitatTengaUnaPolillaMas
	self habitat queElHabitatTengaUnaPolillaMas.! !

!PruebasReproduccionDeAvispas class methodsFor: 'Para completar' stamp: 'AA 4/23/2022 16:26:45'!
retrocederElHabitatAlInicioDeLosTiempos
	self habitat vaciar.! !

ElHabitat initializeAfterFileIn!