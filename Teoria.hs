import PdePreludat

-- Funcion

f :: Num a => a -> a
f x = x * 2

-- Funcion Mas Declarativa

dobleDe :: Num a => a -> a
dobleDe numero = numero * 2

-- Funcion Que Recibe Dos Argumentos
suma1 :: Num a => a -> a -> a
suma1 x y = x + y

-- Pattern Matching

valorDeVerdad :: Bool -> String
valorDeVerdad True = "Es Verdadero"
valorDeVerdad False = "Es Falso"

-- Sin Aplicacion de Patrones

conjuncion :: Bool -> Bool -> Bool
conjuncion True True = True
conjuncion True False = False
conjuncion False True = False
conjuncion False False = False

-- Aplicacion de Patrones

conjuncion' :: Bool -> Bool -> Bool
conjuncion' True True = True
conjuncion' _ _ = False

-- Guardas

funcionSigno :: (Ord a, Num a) => a -> String
funcionSigno x
    | x > 0     = "Positivo"
    | x < 0     = "Negativo"
    | otherwise = "Cero"

-- Tuplas

coordenada :: (Number, Number)
coordenada = (3, 4)

persona :: (String, Number, String)
persona = ("Alice", 30, "Ingeniera")

-- Currying

suma :: Num a => a -> a -> a
suma x y = x + y

sumaCurried :: Num a => a -> a -> a
sumaCurried x y = (+) x y

-- Tipos De Datos
data Estudiante = UnEstudiante {
    nombre :: String,
    legajo :: Number,
    nota :: Number,
    carrera :: String
}

juan :: Estudiante
juan = UnEstudiante "Juan" 12345 8.5 "Ingenieria"

pepe :: Estudiante
pepe = UnEstudiante {
    nombre = "Pepe",
    legajo = 54321,
    nota = 7.0,
    carrera = "Ingenieria"
}

-- Composicion de Funciones

longDeCadena :: String -> Number
longDeCadena cadena = length cadena

esPar :: Number -> Bool
esPar numero = even numero

-- Composicion de Funciones

esParLaLongitud :: String -> Bool
esParLaLongitud palabra = (esPar . longDeCadena) palabra

-- Graph Reduction

longDeCadena :: String -> Number
longDeCadena = length

esPar :: Number -> Bool
esPar = even 

esParLaLongitud :: String -> Bool
esParLaLongitud = esPar . longDeCadena 

-- Aplicacion Parcial

mayorDeEdad :: Number -> Bool
mayorDeEdad edad = (> 18) edad

