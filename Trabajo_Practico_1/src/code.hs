module Library where
import PdePreludat

data Videojuego = UnVideojuego {
    titulo :: String,
    anioDeLanzamiento :: Number,
    expanciones :: [String],
    precio :: Number
}

-- FUNCIONES AUXILARES - PUNTO 1

cantExpanciones :: Videojuego -> Number
cantExpanciones = length.expanciones

condicionDeClasico :: Videojuego -> Bool
condicionDeClasico videojuego = cantExpanciones videojuego > 3

esRetro :: Videojuego -> Bool
esRetro videojuego = anioDeLanzamiento videojuego < 1990

evaluarComunidad :: Videojuego -> Bool
evaluarComunidad videojuego = cantExpanciones videojuego == 0

-- CALCULO DE IMPACTO - PUNTO 1

clasicoReinventado :: Videojuego -> Number
clasicoReinventado videojuego = precio videojuego * cantExpanciones videojuego

valorDeCulto :: Videojuego -> Number
valorDeCulto videojuego = precio videojuego + 200 * (1990 - anioDeLanzamiento videojuego)

sinComunidad :: Videojuego -> Number
sinComunidad = (/2).precio 

normaGeneral :: Videojuego -> Number
normaGeneral videojuego = precio videojuego + 100 * cantExpanciones videojuego

-- FUNCION PRINCIPAL - PUNTO 1

impactoDe :: Videojuego -> Number
impactoDe juego 
    | esRetro juego && condicionDeClasico juego  = clasicoReinventado juego
    | esRetro juego                                    = valorDeCulto juego
    | evaluarComunidad juego                           = sinComunidad juego
    | otherwise                                             = normaGeneral juego