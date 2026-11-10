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

Funcion juegoPolyplot
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
FinFuncion

Funcion cargartablero(table)                // "+" fichas blancas "-" fichas negras "[ ]" espacio vacio
	Definir i, j Como Entero
	Para i<-0 Hasta 9 Con Paso 1 Hacer
		Para j<-0 Hasta 9 Con Paso 1 Hacer
			table[i,j] <- "[ ]"
			Si i mod 2 == 0 y i < 4 y j mod 2 == 1 Entonces
				table[i,j] <- " - "
			SiNo
				Si i mod 2 == 1 y i < 4 y j mod 2 == 0 Entonces
					table[i,j] <- " - "
				FinSi
			FinSi
			Si i mod 2 == 0 y i > 5 y j mod 2 == 1 Entonces
				table[i,j] <- " + "
			SiNo
				Si i mod 2 == 1 y i > 5 y j mod 2 == 0 Entonces
					table[i,j] <- " + "
				FinSi
			FinSi
		FinPara
	FinPara
	mostrarTablero(table)
FinFuncion

Funcion mostrarTablero(table)
	Definir i, j Como Entero
	Escribir "=== JUEGO DE DAMAS ==="
	Escribir ""
	Escribir "Fichas: + son las fichas blancas y # es la dama blanca | - son las fichas negras y & es la dama negra"
	Escribir ""
	Para i<-0 Hasta 10 Con Paso 1 Hacer
		Para j<-0 Hasta 10 Con Paso 1 Hacer
			si i == 0 y j == 0 Entonces
				Escribir Sin Saltar "    "
			FinSi
			si i == 0 y j <> 0 Entonces
				Escribir Sin Saltar j-1, "    "
			FinSi
			si i <> 0 y j == 0 Entonces
				Escribir Sin Saltar i-1, "| "
			FinSi
			si i <> 0 y j <> 0 Entonces
				Escribir Sin Saltar table[i-1,j-1], "  "
			FinSi
		FinPara
		Escribir " "
	FinPara
FinFuncion

Funcion JUEGODAMAS(table)
	Definir flag Como Logico
	flag <- Verdadero
	Definir cantidadBLA, cantidadNEG Como Entero
	cantidadBLA <- 20
	cantidadNEG <- 20
	Definir fila, columna, intermedioCOLUM Como Entero
	Definir fila1, columna1, filaNT, columnaNT Como Entero
	Definir i, j Como Entero
	Definir turno Como Entero
	
	turno <- 1
	
	Repetir
		Escribir ""
		Escribir "## TURNO DEL JUGADOR ", turno, " ##"
		Escribir ""
		Escribir "Que ficha desea mover?"
		Escribir Sin Saltar "Fila: "
		Leer fila
		Escribir Sin Saltar "Columna: "
		Leer columna
		
		Si (fila <= 9 y fila >= 0) y (columna >= 0 y columna <= 9) Entonces
			Si esDama(table,fila,columna,turno) Entonces
				Repetir
					Escribir "Hacia donde quiere mover la dama?"
					Escribir Sin Saltar "Fila: "
					Leer fila1
					Escribir Sin Saltar "Columna: "
					Leer columna1
					
					Si puedeComerDama(table,fila,columna,fila1,columna1,turno) Entonces
						eliminarPiezaComidaDama(table,fila,columna,fila1,columna1,turno)
						table[fila1,columna1] <- table[fila,columna]
						table[fila,columna] <- "[ ]"
						
						Si turno = 1 Entonces
							cantidadNEG <- cantidadNEG - 1
							flag <- Falso
						SiNo
							cantidadBLA <- cantidadBLA - 1
							flag <- Falso
						FinSi
						
						fila <- fila1
						columna <- columna1
						Limpiar Pantalla
						mostrarTablero(table)
						Mientras damaPuedeComer(table,fila,columna,turno) Hacer
							Escribir "La dama puede seguir capturando."
							Escribir "Ingrese la fila destino:"
							Leer fila1
							Escribir "Ingrese la columna destino:"
							Leer columna1
							
							Si puedeComerDama(table,fila,columna,fila1,columna1,turno) Entonces
								eliminarPiezaComidaDama(table,fila,columna,fila1,columna1,turno)
								table[fila1,columna1] <- table[fila,columna]
								table[fila,columna] <- "[ ]"
								
								Si turno = 1 Entonces
									cantidadNEG <- cantidadNEG - 1
									flag <- Falso
								SiNo
									cantidadBLA <- cantidadBLA - 1
									flag <- Falso
								FinSi
								
								fila <- fila1
								columna <- columna1
								
							SiNo
								Escribir "Debe realizar una captura válida."
							FinSi
						FinMientras
						Limpiar Pantalla
						mostrarTablero(table)
					SiNo
						Si puedeMoverDama(table,fila,columna,fila1,columna1) Entonces
							table[fila1,columna1] <- table[fila,columna]
							table[fila,columna] <- "[ ]"
							Limpiar Pantalla
							mostrarTablero(table)
						SiNo
							Escribir "Movimiento inválido."
						FinSi
						
					FinSi
					Si turno == 1 y (cantidadBLA > 0 y cantidadNEG > 0) Entonces
						turno <- 2
					SiNo
						Si turno == 2 y (cantidadBLA > 0 y cantidadNEG > 0) Entonces
							turno <- 1
						FinSi
					FinSi
				Mientras Que flag
			SiNo
				Si puedecomer(table, fila, columna, turno) Entonces
					Repetir
						Escribir "Indique las coordenadas de movimiento luego de comer la ficha enemiga: "
						Escribir Sin Saltar "Fila: "
						Leer fila1
						Escribir Sin Saltar "Columna: "
						Leer columna1
						
						Si turno == 1 entonces 
							Si (fila1 <= 9 y fila1 >= 0) y (columna1 >= 0 y columna1 <= 9) Entonces
								Si ((fila1 == fila-2 y columna1 == columna-2) o (fila1 == fila-2 y columna1 == columna+2)) y table[fila1, columna1] == "[ ]" Entonces
									table[fila1, columna1] <- " + "
									table[fila, columna] <- "[ ]"
									intermedioCOLUM <- columna1 - columna
									si intermedioCOLUM < 0 Entonces
										intermedioCOLUM <- intermedioCOLUM + 1
										si columna < intermedioCOLUM Entonces
											table[fila-1, intermedioCOLUM - columna] <- "[ ]"
										SiNo
											table[fila-1, columna + intermedioCOLUM] <- "[ ]"
										FinSi
									SiNo
										intermedioCOLUM <- intermedioCOLUM - 1
										si columna < intermedioCOLUM Entonces
											table[fila-1, intermedioCOLUM - columna] <- "[ ]"
										SiNo
											table[fila-1, columna + intermedioCOLUM] <- "[ ]"
										FinSi
									FinSi
									Limpiar Pantalla
									mostrarTablero(table)
									flag <- Falso
									cantidadNEG <- cantidadNEG - 1
									fila <- fila1
									columna <- columna1
								SiNo
									Escribir "No es una cordenada valida, intentelo de nuevo"
									Esperar Tecla
									Limpiar Pantalla
									mostrarTablero(table)
									flag <- Verdadero
								FinSi
							SiNo
								Escribir "No son coordenadas dentro del tablero, intentelo de nuevo"
								Esperar Tecla
								Limpiar Pantalla
								mostrarTablero(table)
								flag <- Verdadero
							FinSi
							si fila1 == 0 Entonces
								table[fila1, columna1] <- " # "
								Limpiar Pantalla
								mostrarTablero(table)
							FinSi
						SiNo
							Si (fila1 <= 9 y fila1 >= 0) y (columna1 >= 0 y columna1 <= 9) Entonces
								Si ((fila1 == fila+2 y columna1 == columna-2) o (fila1 == fila+2 y columna1 == columna+2)) y table[fila1, columna1] == "[ ]" Entonces
									table[fila1, columna1] <- " - "
									table[fila, columna] <- "[ ]"
									intermedioCOLUM <- columna1 - columna
									si intermedioCOLUM < 0 Entonces
										intermedioCOLUM <- intermedioCOLUM + 1
										si columna < intermedioCOLUM Entonces
											table[fila+1, intermedioCOLUM - columna] <- "[ ]"
										SiNo
											table[fila+1, columna + intermedioCOLUM] <- "[ ]"
										FinSi
									SiNo
										intermedioCOLUM <- intermedioCOLUM - 1
										si columna < intermedioCOLUM Entonces
											table[fila+1, intermedioCOLUM - columna] <- "[ ]"
										SiNo
											table[fila+1, columna + intermedioCOLUM] <- "[ ]"
										FinSi
									FinSi
									Limpiar Pantalla
									mostrarTablero(table)
									flag <- Falso
									cantidadBLA <- cantidadBLA - 1
									fila <- fila1
									columna <- columna1
								SiNo
									Escribir "No es una cordenada valida, intentelo de nuevo"
									Esperar Tecla
									Limpiar Pantalla
									mostrarTablero(table)
									flag <- Verdadero
								FinSi
							SiNo
								Escribir "No son coordenadas dentro del tablero, intentelo de nuevo"
								Esperar Tecla
								Limpiar Pantalla
								mostrarTablero(table)
								flag <- Verdadero
							FinSi
							si fila1 == 9 Entonces
								table[fila1, columna1] <- " & "
								Limpiar Pantalla
								mostrarTablero(table)
							FinSi
						FinSi
						
					Mientras Que puedecomer(table, fila1, columna1, turno) o flag
					Si turno == 1 y (cantidadBLA > 0 y cantidadNEG > 0) Entonces
						turno <- 2
					SiNo
						Si turno == 2 y (cantidadBLA > 0 y cantidadNEG > 0) Entonces
							turno <- 1
						FinSi
					FinSi
				SiNo
					Si puedemover(table, fila, columna, turno) Entonces
						Repetir
							Escribir "Hacia donde quiere mover la ficha?"
							Escribir Sin Saltar "Fila: "
							Leer fila1
							Escribir Sin Saltar "Columna: "
							Leer columna1
							Si turno == 1 entonces 
								Si (fila1 <= 9 y fila1 >= 0) y (columna1 >= 0 y columna1 <= 9) Entonces
									Si ((fila1 == fila-1 y columna1 == columna-1) o (fila1 == fila-1 y columna1 == columna+1)) y table[fila1, columna1] == "[ ]" Entonces
										table[fila1, columna1] <- " + "
										table[fila, columna] <- "[ ]"
										Limpiar Pantalla
										mostrarTablero(table)
										flag <- Falso
									SiNo
										Escribir "No es una cordenada valida, intentelo de nuevo"
										Esperar Tecla
										Limpiar Pantalla
										mostrarTablero(table)
										flag <- Verdadero
									FinSi
								SiNo
									Escribir "No son coordenadas dentro del tablero, intentelo de nuevo"
									Esperar Tecla
									Limpiar Pantalla
									mostrarTablero(table)
									flag <- Verdadero
								FinSi
								si fila1 == 0 Entonces
									table[fila1, columna1] <- " # "
									Limpiar Pantalla
									mostrarTablero(table)
								FinSi
							SiNo
								Si (fila1 <= 9 y fila1 >= 0) y (columna1 >= 0 y columna1 <= 9) Entonces
									Si ((fila1 == fila+1 y columna1 == columna-1) o (fila1 == fila+1 y columna1 == columna+1)) y table[fila1, columna1] == "[ ]" Entonces
										table[fila1, columna1] <- " - "
										table[fila, columna] <- "[ ]"
										Limpiar Pantalla
										mostrarTablero(table)
										flag <- Falso
									SiNo
										Escribir "No es una cordenada valida, intentelo de nuevo"
										Esperar Tecla
										Limpiar Pantalla
										mostrarTablero(table)
										flag <- Verdadero
									FinSi
								SiNo
									Escribir "No son coordenadas dentro del tablero, intentelo de nuevo"
									Esperar Tecla
									Limpiar Pantalla
									mostrarTablero(table)
									flag <- Verdadero
								FinSi
								si fila1 == 9 Entonces
									table[fila1, columna1] <- " & "
									Limpiar Pantalla
									mostrarTablero(table)
								FinSi
							FinSi
							
						Mientras Que flag
						Si turno == 1 y (cantidadBLA > 0 y cantidadNEG > 0) Entonces
							turno <- 2
						SiNo
							Si turno == 2 y (cantidadBLA > 0 y cantidadNEG > 0) Entonces
								turno <- 1
							FinSi
						FinSi
					SiNo
						Escribir "Ese espacio no hay una ficha valida seleccionada, intentelo de nuevo"
						Esperar Tecla
						Limpiar Pantalla
						mostrarTablero(table)
					FinSi
				FinSi
			FinSi
			
			
		SiNo
			Escribir "No son coordenadas dentro del tablero, intentelo de nuevo"
			Esperar Tecla
			Limpiar Pantalla
			mostrarTablero(table)
		FinSi
		
	Mientras Que cantidadBLA > 0 y cantidadNEG > 0
	Escribir "## GANO EL JUGADOR ", turno, " ##"
	Esperar Tecla
FinFuncion

Funcion booleano <- puedemover(table, fila, columna, turno)
	Definir booleano Como Logico
	
	
	Segun columna Hacer
		0:
			Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y table[fila-1, columna+1] == "[ ]") o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y table[fila+1, columna+1] == "[ ]") Entonces
				booleano <- Verdadero
			SiNo
				booleano <- Falso
			FinSi
		9:
			Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y table[fila-1, columna-1] == "[ ]") o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y table[fila+1, columna-1] == "[ ]") Entonces
				booleano <- Verdadero
			SiNo
				booleano <- Falso
			FinSi
		De Otro Modo:
			Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y (table[fila-1, columna+1] == "[ ]" o table[fila-1, columna-1] == "[ ]")) o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y (table[fila+1, columna+1] == "[ ]" o table[fila+1, columna-1] == "[ ]")) Entonces
				booleano <- Verdadero
			SiNo
				booleano <- Falso
			FinSi
	FinSegun
	
	
FinFuncion

Funcion comer <- puedecomer (table, fila, columna, turno)
	Definir comer Como Logico
	
	Segun columna Hacer
		0:
			Si (fila <= 1 y turno == 1) o (fila >= 8 y turno == 2) Entonces
				comer <- Falso
			SiNo
				Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y (table[fila-1, columna+1] == " - " o table[fila-1, columna+1] == " & ")) o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y (table[fila+1, columna+1] == " + " o table[fila+1, columna+1] == " # ")) Entonces
					Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y table[fila-2, columna+2] == "[ ]") o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y table[fila+2, columna+2] == "[ ]") Entonces
						comer <- Verdadero
					SiNo
						comer <- Falso
					FinSi
				SiNo
					comer <- Falso
				FinSi
			FinSi
			
		1:
			Si (fila <= 1 y turno == 1) o (fila >= 8 y turno == 2) Entonces
				comer <- Falso
			SiNo
				Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y (table[fila-1, columna+1] == " - " o table[fila-1, columna+1] == " & ")) o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y (table[fila+1, columna+1] == " + " o table[fila+1, columna+1] == " # ")) Entonces
					Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y table[fila-2, columna+2] == "[ ]") o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y table[fila+2, columna+2] == "[ ]") Entonces
						comer <- Verdadero
					SiNo
						comer <- Falso
					FinSi
				SiNo
					comer <- Falso
				FinSi
			FinSi
			
		9:
			Si (fila <= 1 y turno == 1) o (fila >= 8 y turno == 2) Entonces
				comer <- Falso
			SiNo
				Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y (table[fila-1, columna-1] == " - " o table[fila-1, columna-1] == " & ")) o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y (table[fila+1, columna-1] == " + " o table[fila+1, columna-1] == " # ")) Entonces
					Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y table[fila-2, columna-2] == "[ ]") o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y table[fila+2, columna-2] == "[ ]") Entonces
						comer <- Verdadero
					SiNo
						comer <- Falso
					FinSi
				SiNo
					comer <- Falso
				FinSi
			FinSi
		8: 
			Si (fila <= 1 y turno == 1) o (fila >= 8 y turno == 2) Entonces
				comer <- Falso
			SiNo
				Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y (table[fila-1, columna-1] == " - " o table[fila-1, columna-1] == " & ")) o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y (table[fila+1, columna-1] == " + " o table[fila+1, columna-1] == " # ")) Entonces
					Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y table[fila-2, columna-2] == "[ ]") o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y table[fila+2, columna-2] == "[ ]") Entonces
						comer <- Verdadero
					SiNo
						comer <- Falso
					FinSi
				SiNo
					comer <- Falso
				FinSi
			FinSi
		De Otro Modo:
			Si (fila <= 1 y turno == 1) o (fila >= 8 y turno == 2) Entonces
				comer <- Falso
			SiNo
				Si (turno == 1 y (table[fila,columna] == " + " o table[fila,columna] == " # ") y ((table[fila-2, columna+2] == "[ ]" y (table[fila-1, columna+1] == " - " o table[fila-1, columna+1] == " & ")) o (table[fila-2, columna-2] == "[ ]" y (table[fila-1, columna-1] == " - " o table[fila-1, columna-1] == " & ")))) o (turno == 2 y (table[fila,columna] == " - " o table[fila,columna] == " & ") y ((table[fila+2, columna+2] == "[ ]" y (table[fila+1, columna+1] == " + " o table[fila+1, columna+1] == " # ")) o (table[fila+2, columna-2] == "[ ]" y (table[fila+1, columna-1] == " + " o table[fila+1, columna-1] == " # ")))) Entonces
					comer <- Verdadero
				SiNo
					comer <- Falso
				FinSi
			FinSi
	FinSegun
	
	
	
FinFuncion

Funcion DAMA <- esDama (table, fila, columna, turno)
	Definir DAMA Como Logico
	Si (turno == 1 y table[fila, columna] == " + ") o (turno == 2 y table[fila, columna] == " - ") Entonces
		DAMA <- Falso
	SiNo
		Si (turno == 1 y table[fila, columna] == " # ") o (turno == 2 y table[fila, columna] == " & ") Entonces
			DAMA <- Verdadero
		FinSi
	FinSi
FinFuncion

Funcion valido <- puedeMoverDama(table,fila,columna,fila1,columna1)
	Definir valido Como Logico
	Definir direccionfila, direccioncolumna, filareal, columnareal Como Entero
	valido <- Verdadero
	
	Si table[fila1,columna1] <> "[ ]" Entonces			//detecta si el destino es una casilla valida
		valido <- Falso
	FinSi
	
	Si Abs(fila1-fila) <> Abs(columna1-columna) Entonces		//detecta si de verdad esta en diagonal 
		valido <- Falso
	FinSi
	
	Si valido Entonces
		
		Si fila1 > fila Entonces
			direccionfila <- 1									//calcula si las filas suben o bajan para las coordenadas
		SiNo
			direccionfila <- -1
		FinSi
		Si columna1 > columna Entonces							//calcula si las columnas van para la izquierda o la derecha
			direccioncolumna <- 1
		SiNo
			direccioncolumna <- -1
		FinSi
		
		filareal <- fila + direccionfila
		columnareal <- columna + direccioncolumna       			//calcula la posicion de inicio
		
		Mientras filareal <> fila1 y valido Hacer
			Si table[filareal,columnareal] <> "[ ]" Entonces		//si hay algo que no sea un espacio vacio entremedio del origen y el destino acaba la funcion
				valido <- Falso
			FinSi
			filareal <- filareal + direccionfila
			columnareal <- columnareal + direccioncolumna
		FinMientras
	FinSi
	
FinFuncion

Funcion puede <- puedeComerDama(table,fila,columna,fila1,columna1,turno)
	Definir puede Como Logico
	Definir filadireccion, columnadireccion, realfila, realcolumna Como Entero
	Definir enemigos Como Entero
	puede <- Verdadero
	enemigos <- 0
	
	Si table[fila1,columna1] <> "[ ]" Entonces
		puede <- Falso
	FinSi
	
	Si Abs(fila1-fila) <> Abs(columna1-columna) Entonces
		puede <- Falso
	FinSi
	
	Si puede Entonces
		
		Si fila1 > fila Entonces
			filadireccion <- 1
		SiNo
			filadireccion <- -1
		FinSi
		
		Si columna1 > columna Entonces
			columnadireccion <- 1
		SiNo
			columnadireccion <- -1
		FinSi
		
		realfila <- fila + filadireccion
		realcolumna <- columna + columnadireccion
		
		Mientras realfila <> fila1 y puede Hacer
			
			Si turno = 1 Entonces
				
				Si table[realfila, realcolumna] = " + " o table[realfila, realcolumna] = " # " Entonces
					puede <- Falso
				FinSi
				
				Si table[realfila, realcolumna] = " - " o table[realfila, realcolumna] = " & " Entonces
					enemigos <- enemigos + 1
				FinSi
				
			SiNo
				
				Si table[realfila, realcolumna] = " - " o table[realfila, realcolumna] = " & " Entonces
					puede <- Falso
				FinSi
				
				Si table[realfila, realcolumna] = " + " o table[realfila, realcolumna] = " # " Entonces
					enemigos <- enemigos + 1
				FinSi
				
			FinSi
			
			realfila <- realfila + filadireccion
			realcolumna <- realcolumna + columnadireccion
			
		FinMientras
		
		Si enemigos <> 1 Entonces
			puede <- Falso
		FinSi
		
	FinSi
	
FinFuncion

Funcion eliminarPiezaComidaDama(table,fila,columna,fila1,columna1,turno)
	Definir direccionFila,direccionColumna Como Entero
	Definir filaActual,columnaActual Como Entero
	
	Si fila1 > fila Entonces
		direccionFila <- 1
	SiNo
		direccionFila <- -1
	FinSi
	
	Si columna1 > columna Entonces
		direccionColumna <- 1
	SiNo
		direccionColumna <- -1
	FinSi
	
	filaActual <- fila + direccionFila
	columnaActual <- columna + direccionColumna
	
	Mientras filaActual <> fila1 Hacer
		Si turno = 1 Entonces
			Si table[filaActual, columnaActual] = " - " o table[filaActual, columnaActual] = " & " Entonces
				table[filaActual, columnaActual] <- "[ ]"
			FinSi
		SiNo	
			Si table[filaActual, columnaActual] = " + " o table[filaActual, columnaActual] = " # " Entonces
				table[filaActual,columnaActual] <- "[ ]"
			FinSi
		FinSi
		
		filaActual <- filaActual + direccionFila
		columnaActual <- columnaActual + direccionColumna
		
	FinMientras
	
FinFuncion

Funcion puedeSeguirComiendo <- damaPuedeComer(table,fila,columna,turno)
	
	Definir direccionFila,direccionColumna Como Entero
	Definir filaActual,columnaActual Como Entero
	Definir enemigoEncontrado Como Logico
	Definir terminarBusqueda Como Logico
	Definir puedeSeguirComiendo Como Logico
	
	puedeSeguirComiendo <- Falso
	
	Para direccionFila <- -1 Hasta 1 Con Paso 2 Hacer
		
		Para direccionColumna <- -1 Hasta 1 Con Paso 2 Hacer
			
			filaActual <- fila + direccionFila
			columnaActual <- columna + direccionColumna
			
			enemigoEncontrado <- Falso
			terminarBusqueda <- Falso
			
			Mientras filaActual >= 0 Y filaActual <= 9 Y columnaActual >= 0 Y columnaActual <= 9 Y No terminarBusqueda Hacer
				
				
				Si table[filaActual,columnaActual] = "[ ]" Entonces
					
					Si enemigoEncontrado Entonces
						
						puedeSeguirComiendo <- Verdadero
						terminarBusqueda <- Verdadero
						
					FinSi
					
				SiNo
					
					Si turno = 1 Entonces
						
						Si table[filaActual,columnaActual] = " + " o table[filaActual,columnaActual] = " # " Entonces
							
							terminarBusqueda <- Verdadero
							
						FinSi
						
						Si table[filaActual,columnaActual] = " - " o table[filaActual,columnaActual] = " & " Entonces
							
							Si enemigoEncontrado Entonces
								
								terminarBusqueda <- Verdadero
								
							SiNo
								
								enemigoEncontrado <- Verdadero
								
							FinSi
							
						FinSi
						
					SiNo
						
						Si table[filaActual,columnaActual] = " - " o table[filaActual,columnaActual] = " & " Entonces
							
							terminarBusqueda <- Verdadero
							
						FinSi
						
						Si table[filaActual,columnaActual] = " + " o table[filaActual,columnaActual] = " # " Entonces
							
							Si enemigoEncontrado Entonces
								
								terminarBusqueda <- Verdadero
								
							SiNo
								
								enemigoEncontrado <- Verdadero
								
							FinSi
							
						FinSi
						
					FinSi
					
				FinSi
				
				filaActual <- filaActual + direccionFila
				columnaActual <- columnaActual + direccionColumna
				
			FinMientras
			
		FinPara
		
	FinPara
	
FinFuncion



Algoritmo MenuJuegos
		Definir opcion Como Entero
		Definir table Como Caracter
		
		Repetir
			Escribir "=== MENÚ DE JUEGOS ==="
			Escribir "1. Jugar Damas"
			Escribir "2. Jugar Polyplot"
			Escribir "3. Salir"
			Escribir "Elija una opción (1-3):"
			Leer opcion
			
			Segun opcion Hacer
				1:
					Escribir "Iniciando Damas..."
					Dimensionar table[10,10]
					cargartablero(table)
					JUEGODAMAS(table)
				2:
					Escribir "Iniciando Polyplot..."
					juegoPolyplot()
				3:
					Escribir "Saliendo del sistema..."
				De Otro Modo:
					Escribir "Opción no válida. Intente nuevamente."
			FinSegun
			
			Escribir "" 
		Hasta Que opcion = 3
FinAlgoritmo
	


