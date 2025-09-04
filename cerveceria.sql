-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3306
-- Tiempo de generación: 03-09-2025 a las 16:49:41
-- Versión del servidor: 8.0.43
-- Versión de PHP: 8.3.14

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cerveceria`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cervezas`
--

DROP TABLE IF EXISTS `cervezas`;
CREATE TABLE IF NOT EXISTS `cervezas` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `ABV` int NOT NULL,
  `IBU` int NOT NULL,
  `descripcion` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `proceso` text CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `imagen` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `cervezas`
--

INSERT INTO `cervezas` (`id`, `nombre`, `ABV`, `IBU`, `descripcion`, `proceso`, `imagen`) VALUES
(1, 'IPA Citrus', 7, 60, 'Una IPA vibrante con notas cítricas de pomelo y naranja, equilibrada con un amargor fresco.', 'Elaborada con maltas pálidas y una selección de lúpulos americanos (Citra y Mosaic). Se macera a 65°C para resaltar la dulzura de la malta, seguido de una doble adición de lúpulo en la ebullición y dry-hopping para intensificar los aromas cítricos. Fermentada con levadura ale a 20°C durante 10 días.', 'pfwjjm56al1yjq8q9bjx'),
(2, 'Stout Chocolate', 6, 30, 'Cerveza oscura con ricos sabores a chocolate negro y café tostado, perfecta para el invierno.', 'Usamos maltas tostadas y cacao puro en la maceración a 68°C. La ebullición incluye lúpulos suaves para un amargor equilibrado. Fermentada con levadura ale a 18°C durante 12 días, con una guarda prolongada para suavizar los sabores.', 'u2ckcuifdyxr4otafcsc'),
(3, 'Blonde Ale', 5, 20, 'Ligera, suave y refrescante, con un toque de malta dulce y un final limpio.', 'Elaborada con maltas pilsner y un toque de trigo. Macerada a 66°C para un cuerpo ligero. Lúpulos nobles añadidos en la ebullición para un amargor suave. Fermentada con levadura ale limpia a 19°C durante 8 días.', 'ztcb7rwkguim8hsmxhtt'),
(4, 'Red Ale', 5, 25, 'Cerveza rojiza con notas de caramelo y un final ligeramente tostado.', 'Mezcla de maltas caramelizadas y tostadas, maceradas a 67°C para resaltar los sabores dulces. Lúpulos ingleses añadidos en la ebullición para un amargor moderado. Fermentada con levadura ale a 19°C durante 10 días.', 'aq1tzbjjmmfkhrumhvlr'),
(5, 'Hazy IPA', 7, 40, 'Turbia y jugosa, con intensos aromas a mango, piña y cítricos.', 'Elaborada con maltas pálidas y avena para una textura sedosa. Lúpulos Citra, Mosaic y El Dorado en dry-hopping masivo. Macerada a 65°C y fermentada con levadura Vermont a 21°C durante 12 días.', 'b6nkvlyvqh5xlrnlv0jd'),
(6, 'Porter Vainilla', 6, 35, 'Cerveza oscura con un toque cremoso de vainilla y notas de malta tostada.', 'Maltas tostadas y chocolate combinadas con vainas de vainilla natural en la guarda. Macerada a 68°C para un cuerpo robusto. Fermentada con levadura ale a 18°C durante 14 días.', 'oueh6jmjk3xkr2evj0ao'),
(7, 'Wheat Beer', 5, 15, 'Cerveza de trigo con aromas a plátano y clavo, refrescante y ligera.', 'Mezcla de maltas de trigo y cebada, macerada a 66°C. Lúpulos nobles para un amargor mínimo. Fermentada con levadura hefeweizen a 22°C para resaltar los ésteres frutales, durante 10 días.', 'yscuxtb22rx0hg83izbk'),
(8, 'Session IPA', 4, 45, 'Una IPA ligera con sabores cítricos y un amargor refrescante, ideal para cualquier momento.', 'Maltas pálidas y un toque de malta cristal, maceradas a 65°C. Lúpulos Centennial y Simcoe en ebullición y dry-hopping. Fermentada con levadura ale a 20°C durante 8 días.', 'jt3eefaspkgasc9ehhgu'),
(9, 'Belgian Tripel', 9, 30, 'Cerveza dorada con notas especiadas, frutales y un final seco.', 'Maltas pilsner y azúcar candi para un cuerpo ligero y alta fermentación. Macerada a 67°C. Lúpulos Saaz y especias como cilantro en la ebullición. Fermentada con levadura belga a 24°C durante 14 días.', 'trmdysqcxvzfcp1dpm9v'),
(10, 'Saison de Verano', 6, 25, 'Cerveza rústica con notas de cítricos, especias y un toque herbal.', 'Maltas pálidas y un toque de trigo, maceradas a 66°C. Lúpulos franceses y hierbas locales añadidas en la ebullición. Fermentada con levadura saison a 26°C para un perfil especiado, durante 12 días.', 'kgcrxa0ob9o61p6dhlne'),
(11, 'Double IPA', 8, 80, 'Potente y lupulada, con intensos aromas a pino y cítricos.', 'Maltas pálidas para soportar el amargor, maceradas a 65°C. Lúpulos Chinook, Simcoe y Citra en múltiples adiciones y dry-hopping. Fermentada con levadura ale a 20°C durante 14 días.', 'letihd92pzvogapeq31t'),
(12, 'Barleywine', 10, 50, 'Cerveza intensa con sabores a caramelo, frutas secas y un final cálido.', 'Maltas caramelizadas y tostadas, maceradas a 68°C para un cuerpo denso. Lúpulos ingleses para un amargor equilibrado. Fermentada con levadura ale a 19°C durante 20 días, con guarda en barrica de roble por 3 meses.', 'pqumzeskgganydjciqi0'),
(21, 'Wolf IPA Doble', 6, 60, 'Mezcla de maltas caramelizadas y tostadas, maceradas a 67°C para resaltar los sabores dulces. Lúpulos ingleses añadidos en la ebullición para un amargor moderado. Fermentada con levadura ale a 19°C durante 10 días.', 'Mezcla de maltas caramelizadas y tostadas, maceradas a 67°C para resaltar los sabores dulces. Lúpulos ingleses añadidos en la ebullición para un amargor moderado. Fermentada con levadura ale a 19°C durante 10 días.', 'rl6dk77vb82bkpti0esu');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id` int NOT NULL AUTO_INCREMENT,
  `usuario` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  `password` varchar(250) CHARACTER SET utf8mb3 COLLATE utf8mb3_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `usuario`, `password`) VALUES
(1, 'flavia', '81dc9bdb52d04dc20036dbd8313ed055'),
(2, 'agustin', '25f9e794323b453885f5181f1b624d0b'),
(3, 'FLORENCIA', '9a7582cf9868b776efa9c1b5daee1f7d');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
