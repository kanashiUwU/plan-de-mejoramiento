-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-09-2026 a las 02:39:40
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario_servicios`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre_producto` varchar(150) NOT NULL,
  `descripcion` text DEFAULT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 0,
  `unidad_medida` varchar(50) NOT NULL DEFAULT 'Unidades',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `actualizado_en` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `precio` decimal(12,2) NOT NULL DEFAULT 0.00,
  `imagen` varchar(255) DEFAULT NULL,
  `categoria_id` int(11) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `stock_minimo` int(11) NOT NULL DEFAULT 5
) ;

--
-- Volcado de datos para la tabla `inventario`
--

INSERT INTO `inventario` (`id`, `nombre_producto`, `descripcion`, `cantidad`, `unidad_medida`, `creado_en`, `actualizado_en`, `precio`, `imagen`, `categoria_id`, `activo`, `stock_minimo`) VALUES
(4, 'Consola Portátil Sup', 'Mini consola retro estilo Gameboy, varios colores, con control extra.', 25, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 45000.00, 'assets/productos/sup_console.jpg', NULL, 1, 5),
(5, 'Nintendo Switch', 'Consola híbrida Nintendo Switch con Joy-Con azul y rojo.', 12, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 1250000.00, 'assets/productos/nintendo_switch.jpg', NULL, 1, 5),
(6, 'Mouse Gamer RGB', 'Mouse óptico gamer con luces LED azules y botones programables.', 40, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 65000.00, 'assets/productos/mouse_gamer.jpg', NULL, 1, 5),
(7, 'Mouse Óptico Clásico', 'Mouse USB clásico blanco/gris, 3 botones, ideal oficina.', 60, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 18000.00, 'assets/productos/mouse_clasico.jpg', NULL, 1, 5),
(8, 'Mouse Vertical Ergonómico', 'Mouse vertical inalámbrico con receptor USB, reduce tensión de muñeca.', 30, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 89000.00, 'assets/productos/mouse_vertical.jpg', NULL, 1, 5),
(9, 'USB Kingston 16GB', 'Memoria USB Kingston DataTraveler SE9 16GB USB 2.0.', 80, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 25000.00, 'assets/productos/usb_kingston.jpg', NULL, 1, 5),
(10, 'Laptop HP Plata', 'Portátil HP delgado color plata, ideal estudio y oficina.', 8, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 2100000.00, 'assets/productos/laptop_hp.jpg', NULL, 1, 5),
(11, 'Laptops Variadas', 'Selección de portátiles (HP, ASUS ProArt y más). Consultar stock por modelo.', 15, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 2800000.00, 'assets/productos/laptops.jpg', NULL, 1, 5),
(12, 'ASUS ROG Strix', 'Laptop gamer ASUS ROG Strix, teclado RGB, alto rendimiento.', 6, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 4500000.00, 'assets/productos/rog_strix.jpg', NULL, 1, 5),
(13, 'Samsung Galaxy + Buds', 'Smartphone Samsung con auriculares inalámbricos incluidos.', 20, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 1890000.00, 'assets/productos/samsung_s.jpg', NULL, 1, 5),
(14, 'iPhone Azul', 'Apple iPhone color azul, dual cámara, listo para usar.', 10, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 3200000.00, 'assets/productos/iphone.jpg', NULL, 1, 5),
(15, 'Motorola G14 Power', 'Motorola moto g14 power, batería de larga duración.', 18, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 699000.00, 'assets/productos/motorola.jpg', NULL, 1, 5),
(16, 'Audífonos Over-Ear', 'Audífonos de diadema con cancelación de ruido, color negro.', 22, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 185000.00, 'assets/productos/audifonos.jpg', NULL, 1, 5),
(17, 'Audífonos Conducción Ósea', 'Auriculares de conducción ósea con display digital, ideales deporte.', 15, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 145000.00, 'assets/productos/bone_conduction.jpg', NULL, 1, 5),
(18, 'Earbuds Inalámbricos', 'Auriculares in-ear con estuche de carga, diseño metálico.', 35, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 95000.00, 'assets/productos/earbuds.jpg', NULL, 1, 5),
(19, 'Meta Quest VR', 'Visor de realidad virtual Meta Quest con controles.', 7, 'Unidades', '2026-09-21 20:21:25', '2026-09-21 20:21:25', 2100000.00, 'assets/productos/quest_vr.jpg', NULL, 1, 5),
(20, 'Xbox Series S / X', 'Consolas Xbox Series S (blanca) y Series X (negra) con controles.', 8, 'Unidades', '2026-09-21 20:21:25', '2026-09-27 15:45:13', 1890000.00, 'assets/productos/xbox.jpg', NULL, 1, 5),
(21, 'PlayStation 5', 'Consola PS5 con control DualSense.', 6, 'Unidades', '2026-09-21 20:21:25', '2026-09-27 23:22:02', 2490000.00, 'assets/productos/ps5.jpg', NULL, 1, 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED NOT NULL,
  `tipo_servicio` varchar(100) NOT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `referencia_pago` varchar(150) DEFAULT NULL,
  `total_pagado` decimal(10,2) NOT NULL DEFAULT 0.00,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp(),
  `estado` enum('pendiente','completado','cancelado') NOT NULL DEFAULT 'completado'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `usuario_id`, `tipo_servicio`, `direccion`, `metodo_pago`, `referencia_pago`, `total_pagado`, `fecha_pedido`, `estado`) VALUES
(1, 3, 'Xbox Series S / X x1', 'Sin especificar', 'Pendiente', '', 1890000.00, '2026-09-27 15:45:13', 'pendiente'),
(2, 3, 'PlayStation 5 x2', 'Sin especificar', 'Pendiente', '', 4980000.00, '2026-09-27 23:22:02', 'pendiente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedido_detalle`
--

CREATE TABLE `pedido_detalle` (
  `id` int(11) NOT NULL,
  `pedido_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `nombre_producto` varchar(150) NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio_unitario` decimal(12,2) NOT NULL DEFAULT 0.00,
  `subtotal` decimal(12,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `pedido_detalle`
--

INSERT INTO `pedido_detalle` (`id`, `pedido_id`, `producto_id`, `nombre_producto`, `cantidad`, `precio_unitario`, `subtotal`) VALUES
(1, 1, 20, 'Xbox Series S / X', 1, 1890000.00, 1890000.00),
(2, 2, 21, 'PlayStation 5', 2, 2490000.00, 4980000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `password` varchar(255) NOT NULL,
  `rol` enum('cliente','admin','vendedor','consultor') NOT NULL DEFAULT 'cliente',
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp(),
  `intentos_fallidos` int(11) NOT NULL DEFAULT 0,
  `bloqueado_hasta` datetime DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `telefono`, `password`, `rol`, `creado_en`, `intentos_fallidos`, `bloqueado_hasta`, `activo`) VALUES
(1, 'Administrador ScanClean', 'admin@admin.com', '3000000000', '$2b$10$b94VCS4XXXMqfmHSxs6sXel4piidYyqsEzeVwKWum.ydIRSjKT5cm', 'admin', '2026-09-21 16:26:09', 0, NULL, 1),
(2, 'kanashi', 'kanashi@gamil.com', '3214729293', '$2y$10$eHQElsKbXvIu5qfu60E0gezV.ZBsg87MW71bw0PpE/pC1pkCWIhCW', 'cliente', '2026-09-21 16:28:19', 0, NULL, 0),
(3, 'marcela', 'marcela@gmail.com', '3214729293', '$2y$10$ysZXLReVTLi0MbqXlkYU5OZb/sRnyuf9Oz/32J.e6d4PQlne/ddtK', 'cliente', '2026-09-21 16:34:16', 0, NULL, 1),
(4, 'Vendedor Demo', 'vendedor@bytestock.com', '3000000002', '$2y$10$i9Reat0v6C8uJ5inilZqMeg/9liQwoqJKtVVmmdGbL6.wTWyAeahi', 'vendedor', '2026-09-21 23:46:54', 0, NULL, 1),
(5, 'Consultor Demo', 'consultor@bytestock.com', '3000000003', '$2y$10$i9Reat0v6C8uJ5inilZqMeg/9liQwoqJKtVVmmdGbL6.wTWyAeahi', 'consultor', '2026-09-21 23:46:54', 0, NULL, 1),
(7, 'sebastian velasquez', 'senastianelaquez@gmail.com', '1234567890', '$2y$10$it31v42wFTjAsSunaRsFxunFardupquupyUTeegyQtRuUTNfBsXwa', 'cliente', '2026-09-27 23:23:31', 0, NULL, 1);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_pedidos_por_cliente`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_pedidos_por_cliente` (
`cliente_id` int(10) unsigned
,`cliente` varchar(150)
,`correo` varchar(150)
,`telefono` varchar(20)
,`total_pedidos` bigint(21)
,`total_gastado` decimal(32,2)
,`ultimo_pedido` timestamp
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_stock_critico`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_stock_critico` (
`id` int(10) unsigned
,`nombre_producto` varchar(150)
,`cantidad` int(11)
,`stock_minimo` int(11)
,`precio` decimal(12,2)
,`categoria` varchar(100)
,`deficit` bigint(12)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_ventas_por_categoria`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_ventas_por_categoria` (
`categoria` varchar(100)
,`cantidad_pedidos` bigint(21)
,`total_ventas` decimal(34,2)
,`unidades_vendidas` decimal(32,0)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `v_ventas_por_mes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `v_ventas_por_mes` (
`periodo` varchar(7)
,`etiqueta` varchar(37)
,`cantidad_pedidos` bigint(21)
,`total_ventas` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `v_pedidos_por_cliente`
--
DROP TABLE IF EXISTS `v_pedidos_por_cliente`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_pedidos_por_cliente`  AS SELECT `u`.`id` AS `cliente_id`, `u`.`nombre` AS `cliente`, `u`.`correo` AS `correo`, `u`.`telefono` AS `telefono`, count(`p`.`id`) AS `total_pedidos`, coalesce(sum(`p`.`total_pagado`),0) AS `total_gastado`, max(`p`.`fecha_pedido`) AS `ultimo_pedido` FROM (`usuarios` `u` left join `pedidos` `p` on(`p`.`usuario_id` = `u`.`id` and (`p`.`estado` = 'completado' or `p`.`estado` is null))) WHERE `u`.`rol` = 'cliente' AND (`u`.`activo` = 1 OR `u`.`activo` is null) GROUP BY `u`.`id`, `u`.`nombre`, `u`.`correo`, `u`.`telefono` ORDER BY coalesce(sum(`p`.`total_pagado`),0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_stock_critico`
--
DROP TABLE IF EXISTS `v_stock_critico`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_stock_critico`  AS SELECT `i`.`id` AS `id`, `i`.`nombre_producto` AS `nombre_producto`, `i`.`cantidad` AS `cantidad`, `i`.`stock_minimo` AS `stock_minimo`, `i`.`precio` AS `precio`, coalesce(`c`.`nombre`,'Sin categoría') AS `categoria`, `i`.`stock_minimo`- `i`.`cantidad` AS `deficit` FROM (`inventario` `i` left join `categorias` `c` on(`c`.`id` = `i`.`categoria_id`)) WHERE `i`.`activo` = 1 AND `i`.`cantidad` <= `i`.`stock_minimo` ORDER BY `i`.`cantidad` ASC, `i`.`stock_minimo`- `i`.`cantidad` DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_ventas_por_categoria`
--
DROP TABLE IF EXISTS `v_ventas_por_categoria`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ventas_por_categoria`  AS SELECT coalesce(`c`.`nombre`,'Sin categoría') AS `categoria`, count(distinct `p`.`id`) AS `cantidad_pedidos`, coalesce(sum(`pd`.`subtotal`),0) AS `total_ventas`, coalesce(sum(`pd`.`cantidad`),0) AS `unidades_vendidas` FROM (((`pedido_detalle` `pd` join `pedidos` `p` on(`p`.`id` = `pd`.`pedido_id`)) left join `inventario` `i` on(`i`.`id` = `pd`.`producto_id`)) left join `categorias` `c` on(`c`.`id` = `i`.`categoria_id`)) WHERE `p`.`estado` = 'completado' OR `p`.`estado` is null GROUP BY coalesce(`c`.`nombre`,'Sin categoría') ORDER BY coalesce(sum(`pd`.`subtotal`),0) DESC ;

-- --------------------------------------------------------

--
-- Estructura para la vista `v_ventas_por_mes`
--
DROP TABLE IF EXISTS `v_ventas_por_mes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_ventas_por_mes`  AS SELECT date_format(`pedidos`.`fecha_pedido`,'%Y-%m') AS `periodo`, date_format(`pedidos`.`fecha_pedido`,'%b %Y') AS `etiqueta`, count(0) AS `cantidad_pedidos`, coalesce(sum(`pedidos`.`total_pagado`),0) AS `total_ventas` FROM `pedidos` WHERE `pedidos`.`estado` = 'completado' OR `pedidos`.`estado` is null GROUP BY date_format(`pedidos`.`fecha_pedido`,'%Y-%m'), date_format(`pedidos`.`fecha_pedido`,'%b %Y') ORDER BY date_format(`pedidos`.`fecha_pedido`,'%Y-%m') ASC ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `nombre` (`nombre`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_inventario_nombre` (`nombre_producto`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `idx_pedidos_usuario_id` (`usuario_id`),
  ADD KEY `idx_pedidos_fecha` (`fecha_pedido`);

--
-- Indices de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uk_usuarios_correo` (`correo`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `pedido_detalle`
--
ALTER TABLE `pedido_detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
