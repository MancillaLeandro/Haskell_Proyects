import PdePreludat
import Language.Haskell.TH (viaStrategy)

data Videojuego = UnVideojuego {
    titulo :: String,
    anioDeLanzamiento :: Number,
    expanciones :: [String],
    precio :: Number
}

cantExpanciones :: Videojuego -> Number
cantExpanciones = length.expanciones

condicionDeClasico :: Videojuego -> Bool
condicionDeClasico videojuego = cantExpanciones videojuego > 3

esRetro :: Videojuego -> Bool
esRetro videojuego = anioDeLanzamiento videojuego < 1990

evaluarComunidad :: Videojuego -> Bool
evaluarComunidad videojuego = cantExpanciones videojuego == 0

clasicoReinventado :: Videojuego -> Number
clasicoReinventado videojuego = precio videojuego * cantExpanciones videojuego

valorDeCulto :: Videojuego -> Number
valorDeCulto videojuego = precio videojuego + 200 * (1990 - anioDeLanzamiento videojuego)

sinComunidad :: Videojuego -> Number
sinComunidad = (/2).precio 

normaGeneral :: Videojuego -> Number
normaGeneral videojuego = precio videojuego + 100 * cantExpanciones videojuego

impactoDe :: Videojuego -> Number
impactoDe videojuego 
    | esRetro videojuego && condicionDeClasico videojuego  = clasicoReinventado videojuego
    | esRetro videojuego                                    = valorDeCulto videojuego
    | evaluarComunidad videojuego                           = sinComunidad videojuego
    | otherwise                                             = normaGeneral videojuego