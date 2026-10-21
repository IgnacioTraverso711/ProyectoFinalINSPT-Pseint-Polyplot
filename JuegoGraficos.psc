//Esta Funcion va a mostrar la grilla completa y todos los puntos que yo le pide, esta funcion se va a usar para mostrar en pantalla cualquier cosa que necesita, sea puntos individuales o todos los puntos que forman el grafico
Funcion MostrarGraficoPuntos(puntos Por Referencia, filas Por Copia, puntosObjetivo Por Referencia, cantObjetivos Por Copia)
	Definir ejeY, ejeX, i Como Entero
	Definir esFuncion, esObjetivo Como Entero
	
	Escribir ""
	Escribir "* = Objetivo  ///  O = Tu Funcion  ///  X = ¡GOLPE!"
	Escribir "+ = Centro    ///  | = (Y=0)       ///  - = (X=0)"
	Escribir ". = Vacio"
	Escribir ""
	Escribir "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	Escribir "----------------------------------------------------------------------------------------------------------------- JUEGITO DE GRAFICOS!!! ---------------------------------------------------------------------------------------------------------------"
	Escribir "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	Escribir ""
	
	Para ejeY <- 25 Hasta -25 Con Paso -1 Hacer
		// Muestra los números del eje Y alineados
		Si ejeY >= 0 y ejeY < 10 Entonces
			Escribir Sin Saltar "  ", ejeY, " | "
		Sino
			Si ejeY <= -10 Entonces
				Escribir Sin Saltar ejeY, " | "
			SiNo
				Escribir Sin Saltar " ", ejeY, " | "
			FinSi
		FinSi
		
		// Recorre el eje X
		Para ejeX <- -60 Hasta 60 Con Paso 1 Hacer 
			esObjetivo <- 0
			esFuncion <- 0
			
			// 1. Chequear si la coordenada actual es un punto objetivo
			Para i <- 0 Hasta cantObjetivos - 1 Con Paso 1 Hacer
				Si ejeX == puntosObjetivo[i, 0] Y ejeY == puntosObjetivo[i, 1] Entonces
					esObjetivo <- 1
					i <- cantObjetivos // Rompe el ciclo para optimizar
				FinSi
			FinPara
			
			// 2. Chequear si la coordenada actual es un punto de la función del usuario
			Para i <- 0 Hasta filas - 1 Con Paso 1 Hacer
				Si ejeX == puntos[i, 0] Y ejeY == puntos[i, 1] Entonces
					esFuncion <- 1
					i <- filas // Rompe el ciclo para optimizar
				FinSi
			FinPara
			
			// 3. Dibujar el símbolo correspondiente
			Si esObjetivo == 1 Y esFuncion == 1 Entonces
				Escribir Sin Saltar "X " // Impacto
			Sino 
				Si esObjetivo == 1 Entonces
					Escribir Sin Saltar "* " // Solo objetivo
				Sino 
					Si esFuncion == 1 Entonces
						Escribir Sin Saltar "O " // Solo función
					Sino
						// Fondo y ejes
						Si ejeX == 0 Y ejeY == 0 Entonces
							Escribir Sin Saltar "+ " 
						Sino
							Si ejeY == 0 Entonces
								Escribir Sin Saltar "- " 
							Sino
								Si ejeX == 0 Entonces
									Escribir Sin Saltar "| " 
								Sino
									Escribir Sin Saltar ". "
								FinSi
							FinSi
						FinSi
					FinSi
				FinSi
			FinSi
		FinPara
		Escribir "" 
	FinPara
	
	// Eje X
	Escribir "     --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
	Escribir "     -60       -55       -50       -45       -40       -35       -30       -25       -20       -15       -10       -5         0         5        10        15        20        25        30        35        40        45        50        55        60"
	Escribir ""
	Escribir "--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------"
FinFuncion

//La Funcion  MostrarGraficoPuntos no esta chequeando de manera correcta si los puntos de la matriz que recibe estan dentro del rango deseado, ya que cuando se programo la primera vez fue programado para un punto solo y fue arreglado por arriba solo para que funcione cuando lo transforme a que funcione con una matriz.
//Puedo intentar arreglarlo, o dejar que esta funcion funcione de esta manera y asegurarme de que los puntos esten dentro del rango fuera de la funcion cuando cree la matriz.
// Funciones que necesito
// 1- Funcion para leer la funcion puesta por el usuario y generarla correctamente. Luego tiene que generar todos los puntos que esta funcion recorre y guardarlos en un vector en el que el indice va a ser x y el valor guardado en ese indice va a ser y siempre este vector va a ser de tama;o 120 siempre de 0 a 119 en el que sero es -60 y 119 es 60


Funcion EscribirFuncionGuardarMatriz(dibujoDeFuncion Por Referencia, tamaMatriz Por Valor)
	Definir grado, terminos, i,termino,ingresado Como Entero
	Definir  seguimos Como Caracter
	Dimensionar terminos[1]
	Repetir
		Repetir
			Escribir "Escribir el grado de la funcion que queres ingresar --- MAXIMO GRADO 3 ---"
			Leer grado
			Si grado > 3 Entonces
				Escribir Sin Saltar "El grado maximo es 3, te pasaste, volve a "
			SiNo 
				Si grado <= 0 Entonces
					Escribir Sin Saltar "Tiene que tener al menos un termino volve a "
				FinSi
			FinSi
		Mientras Que grado > 3 o grado <= 0
		
		
		grado <- grado+1
		Redimensionar terminos[grado]
		ingresado <- 0
		Para i<-grado-1 Hasta 0 Con Paso -1 Hacer		
			Si ingresado == 0 Entonces
				Escribir "ingrese el primer termino"
				ingresado <- 1
			SiNo
				Escribir "Ingrese el siguiente termino en orden"
			FinSi
			leer termino
			terminos[i] <- termino
		FinPara
		
		
		Escribir Sin Saltar "Su funcion es: "
		Para i<-grado-1 Hasta 0 Con Paso -1 Hacer
			Si i == 0 Entonces
				Escribir Sin Saltar terminos[i]
			SiNo
				Si i=1 Entonces
					Escribir Sin Saltar terminos[i], "x "
				SiNo
					Escribir Sin Saltar terminos[i], "x^", i, " "
				FinSi
			FinSi
			
			Si i == 0 Entonces
				Escribir Sin Saltar ""
			SiNo
				Escribir Sin Saltar "+ "
			FinSi
		FinPara
		
		Escribir ""
		Escribir "Quiere cambiar la funcion? S - SI -------- N - NO"
		Leer seguimos
	Mientras Que seguimos == "S"  o seguimos == "s"
	
	
	Para i<-0 Hasta tamaMatriz-1 Con Paso 1 Hacer
		dibujoDeFuncion[i,0] <- i-60
		dibujoDeFuncion[i,1] <- calcularPuntoFuncion(terminos,grado,i-60)
	FinPara
	
	Para i<-0 Hasta tamaMatriz-1 Con Paso 1 Hacer
		Escribir Sin Saltar dibujoDeFuncion[i,0], " ", dibujoDeFuncion[i,1]
		Escribir " "
	FinPara
FinFuncion

funcion puntoY <- calcularPuntoFuncion(terminos,grado,puntoX)
	Definir puntoY Como Entero
	puntoY <- 0
	Para i<-grado-1 Hasta 0 Con Paso -1 Hacer
		Segun i Hacer
			0:
				puntoY <- puntoY + terminos[i]
			1:
				puntoY <- puntoY + (terminos[i] * puntoX)
			2:
				puntoY <- puntoY + (terminos[i] * (puntoX^2))
			3:
				puntoY <- puntoY + (terminos[i] * (puntoX^3))
		FinSegun
	FinPara
	
FinFuncion

Funcion GenerarPuntosObjetivo(puntosObjetivo Por Referencia, cantObjetivos Por Valor)
	Definir grado, i, j, xCandidata, yCalculada, repetido Como Entero
	Definir terminos Como Entero
	Dimensionar terminos[4]

	// (Valores pequeños entre -2 y 2 para evitar que el gráfico se escape mucho de Y)
	grado <- Aleatorio(1, 3)
	Para i <- 0 Hasta 3 Con Paso 1 Hacer
		Si i <= grado Entonces
			terminos[i] <- Aleatorio(-2, 2)
		SiNo
			terminos[i] <- 0
		FinSi
	FinPara
	
	Si terminos[0] == 0 Y terminos[1] == 0 Y terminos[2] == 0 Y terminos[3] == 0 Entonces
		terminos[0] <- Aleatorio(1, 5)
	FinSi
	
	Para i <- 0 Hasta cantObjetivos - 1 Con Paso 1 Hacer
		Repetir
			repetido <- 0
			xCandidata <- Aleatorio(-50, 50)
			
			Para j <- 0 Hasta i - 1 Con Paso 1 Hacer
				Si puntosObjetivo[j, 0] == xCandidata Entonces
					repetido <- 1
					j <- i
				FinSi
			FinPara
			
			yCalculada <- calcularPuntoFuncion(terminos, grado + 1, xCandidata)
			
			Si yCalculada < -25 O yCalculada > 25 Entonces
				repetido <- 1
			FinSi
			
		Mientras Que repetido == 1
		
		puntosObjetivo[i, 0] <- xCandidata
		puntosObjetivo[i, 1] <- yCalculada
	FinPara
FinFuncion

Funcion impactos <- ContarImpactos(dibujoDeFuncion, tamaMatriz, puntosObjetivo, cantObjetivos)
	Definir impactos, i, j Como Entero
	impactos <- 0
	Para i <- 0 Hasta cantObjetivos - 1 Hacer
		Para j <- 0 Hasta tamaMatriz - 1 Hacer
			Si puntosObjetivo[i, 0] == dibujoDeFuncion[j, 0] Y puntosObjetivo[i, 1] == dibujoDeFuncion[j, 1] Entonces
				impactos <- impactos + 1
				j <- tamaMatriz 
			FinSi
		FinPara
	FinPara
FinFuncion

Algoritmo JuegoGraficos
	Definir vidas, cantObjetivos, impactos, tamaMatriz Como Entero
	Definir dibujoDeFuncion, puntosObjetivo Como Entero
	
	tamaMatriz <- 121
	vidas <- 5
	cantObjetivos <- 1 // Nivel 1 empieza con 1 objetivo
	
	Dimensionar dibujoDeFuncion[tamaMatriz, 2]
	Dimensionar puntosObjetivo[50, 2] // Soporta hasta el nivel 50
	
	Mientras vidas > 0 Hacer
		Borrar Pantalla
		Escribir "=== NIVEL ", cantObjetivos, " | VIDAS: ", vidas, " ==="
		
		
		GenerarPuntosObjetivo(puntosObjetivo, cantObjetivos)
		
		MostrarGraficoPuntos(dibujoDeFuncion, 0, puntosObjetivo, cantObjetivos)
		
	
		EscribirFuncionGuardarMatriz(dibujoDeFuncion, tamaMatriz)
		
		Borrar Pantalla
		Escribir "=== RESULTADO DEL TIRO ==="
		
		MostrarGraficoPuntos(dibujoDeFuncion, tamaMatriz, puntosObjetivo, cantObjetivos)
		
		
		impactos <- ContarImpactos(dibujoDeFuncion, tamaMatriz, puntosObjetivo, cantObjetivos)
		
		Si impactos == cantObjetivos Entonces
			Escribir "¡BIEN! Golpeaste todos los puntos."
			cantObjetivos <- cantObjetivos + 1
		Sino
			Escribir "Fallaste... Golpeaste ", impactos, " de ", cantObjetivos, " puntos."
			vidas <- vidas - 1
		FinSi
		
		Escribir "Toca cualquier tecla para continuar..."
		Esperar Tecla
	FinMientras
	
	Borrar Pantalla
	Escribir "=== TE QUEDASTE SIN VIDA ==="
	Escribir "Llegaste hasta el nivel ", cantObjetivos
FinAlgoritmo

