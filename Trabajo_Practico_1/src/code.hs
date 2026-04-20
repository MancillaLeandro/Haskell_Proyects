module Library where
import PdePreludat

-- ============================
-- ESTRUCTURA DE DATOS - TP
-- ============================
data Videojuego = UnVideojuego {
    titulo :: String,
    anioDeLanzamiento :: Number,
    expanciones :: [String],
    precio :: Number
}

-- ============================
-- FUNCIÓNES AUXILIARES - PUNTO 1
-- ============================

cantExpanciones :: Videojuego -> Number
cantExpanciones = length.expanciones

condicionDeClasico :: Videojuego -> Bool
condicionDeClasico = (> 3).cantExpanciones 

esRetro :: Videojuego -> Bool
esRetro = (< 1990).anioDeLanzamiento

evaluarComunidad :: Videojuego -> Bool
evaluarComunidad = (== 0).cantExpanciones

-- ============================
-- CALCULOS DE IMPACTO - PUNTO 1
-- ============================

clasicoReinventado :: Videojuego -> Number
clasicoReinventado (UnVideojuego _ _ expansiones precio) = precio * length expansiones

valorDeCulto :: Videojuego -> Number
valorDeCulto (UnVideojuego _ anio _ precio) = precio + 200 * (1990 - anio)

sinComunidad :: Videojuego -> Number
sinComunidad (UnVideojuego _ _ _ precio) = precio / 2

normaGeneral :: Videojuego -> Number
normaGeneral (UnVideojuego _ _ expanciones precio) = precio + 100 * length expanciones

-- ============================
-- FUNCIÓN PRINCIPAL - PUNTO 1
-- ============================

impactoDe :: Videojuego -> Number
impactoDe juego 
    | esRetro juego && condicionDeClasico juego     = clasicoReinventado juego
    | esRetro juego                                 = valorDeCulto juego
    | evaluarComunidad juego                        = sinComunidad juego
    | otherwise                                     = normaGeneral juego