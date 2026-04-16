
-- Funcion

f :: Num a => a -> a
f x = x * 2

-- Funcion Mas Declarativa

dobleDe :: Num a => a -> a
dobleDe numero = numero * 2

-- Funcion Que Recibe Dos Argumentos
suma :: Num a => a -> a -> a
suma x y = x + y

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

conjuncion :: Bool -> Bool -> Bool
conjuncion True True = True
conjuncion _ _ = False

-- Guardas
funcionSigno :: (Ord a, Num a) => a -> String
funcionSigno x
    | x > 0     = "Positivo"
    | x < 0     = "Negativo"
    | otherwise = "Cero"

