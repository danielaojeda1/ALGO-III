# CUESTIONARIO SOBRE EJERCICIO 3: NÚMEROS
## Aporte de los mensajes de DD
La informacion que aporta cada uno de los llamados es que dependiendo cada sublcase y su implementacion, a la hora de llamar por medio de mensajes, sabrá lo que tiene que hacer dadas las condiciones de implementación dadas. 

## Lógica de instanciado
La lógica de cómo instanciar un objeto deberia colocarse dentro de una clase que represente el dominio de problema y que sea lo suficientemente flexible como para responder a los mensajes de cada sublcase de forma genérica aunque adecuandose a lo que debe responder cada subclase (sin dejar de ser un buen modelo). Si se crea ese objeto desde diferentes lugares y de diferentes formas (interpretamos que se trata de un caso como el del ejercicio, donde tanto Entero como Fraccion se implementaban desde una misma clase madre (Numero) pero cuyas implementaciones eran distintas) se debe poder delegar desde la clase superior (es decir, el concepto mas abstracto) a las subclases  para que resuelvan el problema a su modo. Las instancias serán distintas dependiendo cada subclase pero estas seran respondidas por la clase superior. 

## Nombres de las categorías de métodos
Usamos un criterio que tenga que ver con el tipo de accion que realizan. Por ejemplo, las operaciones aritmeticas como por ejemplo: suma, resta, multiplicacion, etc. Los metodos tienen nombres representativos que describen lo que hacen y su categorización tambien se hace manteniendo este principio de describir que se esta haciendo en el código y no el cómo. 

## Subclass Responsibility
Ponemos ese mensaje sólo con un “self subclassResponsibility” en la superclase ya que si bien, las subclases dependen de la superclase, cada una de ellas tiene su forma de responder a los mensajes que se envian. De este modo, la responsabilidad pasa a las subclases que pueden cumplir ese rol. Esto sirve en el caso de que dos subclases pertenecientes a una misma superclase, reciban un mismo mensaje pero cuya respuesta sea distinta. Un ejemplo de esto, es la suma de Fraccion y de Entero. Si bien se pide que hagan lo mismo, cambia el como porque son dos objetos distintos. 

## No rompas
Los problemas que trae romper encapsulamiento genera un código desprolijo y poco legible. Esto a la larga, será dificil de mantener y a la hora de solucionar algun error dentro del codigo, costará mucho más que si se utiliza el encapsulamiento. Cuando se rompe el encapsulamiento, no se respetan las responsabilidades. A su vez, una clase podría estar utilizando metodos que no le corresponderian usar. 