-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-09-2026 a las 02:34:52
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
-- Base de datos: `scanclean`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias`
--

CREATE TABLE `categorias` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(80) NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `categorias`
--

INSERT INTO `categorias` (`id`, `nombre`, `descripcion`, `activo`, `creado_en`) VALUES
(1, 'Detergentes', 'Jabones y detergentes para ropa, loza y uso industrial', 1, '2026-09-20 19:04:30'),
(2, 'Desinfectantes', 'Productos para eliminar bacterias, virus y hongos', 1, '2026-09-20 19:04:30'),
(3, 'Limpiadores multiusos', 'Limpiadores de uso general para cualquier superficie', 1, '2026-09-20 19:04:30'),
(4, 'Cuidado de alfombras', 'Champús y quitamanchas para alfombras y tapetes', 1, '2026-09-20 19:04:30'),
(5, 'Cuidado de muebles', 'Limpiadores y brillos para madera, cuero y tapizados', 1, '2026-09-20 19:04:30'),
(6, 'Cuidado de colchones', 'Higienizantes y antiácaros para colchones', 1, '2026-09-20 19:04:30'),
(7, 'Limpieza de vidrios', 'Limpiavidrios y accesorios para superficies de vidrio', 1, '2026-09-20 19:04:30'),
(8, 'Cuidado de pisos', 'Ceras, brillos y limpiadores para todo tipo de piso', 1, '2026-09-20 19:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clientes`
--

CREATE TABLE `clientes` (
  `id` int(10) UNSIGNED NOT NULL,
  `tipo_documento` enum('CC','CE','NIT') NOT NULL DEFAULT 'CC',
  `documento` varchar(20) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `correo` varchar(150) DEFAULT NULL,
  `telefono` varchar(30) DEFAULT NULL,
  `direccion` varchar(200) DEFAULT NULL,
  `ciudad` varchar(80) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `clientes`
--

INSERT INTO `clientes` (`id`, `tipo_documento`, `documento`, `nombre`, `correo`, `telefono`, `direccion`, `ciudad`, `activo`, `creado_en`) VALUES
(1, 'NIT', '900123456-1', 'Hotel Andino Plaza S.A.S.', 'compras@hotelandinoplaza.test', '6015550101', 'Carrera 15 # 88-24', 'Bogotá', 1, '2026-09-20 19:04:30'),
(2, 'NIT', '901234567-2', 'Clínica San Rafael del Norte', 'proveedores@clinicasanrafael.test', '6015550102', 'Calle 134 # 7-45', 'Bogotá', 1, '2026-09-20 19:04:30'),
(3, 'NIT', '902345678-3', 'Colegio Los Cerezos', 'administracion@loscerezos.test', '6015550103', 'Diagonal 61 # 24-10', 'Bogotá', 1, '2026-09-20 19:04:30'),
(4, 'NIT', '903456789-4', 'Restaurante La Fogata del Llano', 'gerencia@lafogatallano.test', '6045550104', 'Avenida 30 # 12-66', 'Medellín', 1, '2026-09-20 19:04:30'),
(5, 'NIT', '904567890-5', 'Centro Comercial Portal Verde', 'mantenimiento@portalverde.test', '6025550105', 'Calle 9 # 45-80', 'Cali', 1, '2026-09-20 19:04:30'),
(6, 'CC', '1012345678', 'Laura Jiménez Ospina', 'laura.jimenez@correo.test', '3005550106', 'Carrera 7 # 120-15 Apto 402', 'Bogotá', 1, '2026-09-20 19:04:30'),
(7, 'CC', '1023456789', 'Andrés Felipe Rueda', 'andres.rueda@correo.test', '3015550107', 'Calle 45 Sur # 18-09', 'Bogotá', 1, '2026-09-20 19:04:30'),
(8, 'NIT', '905678901-6', 'Gimnasio Fuerza Viva', 'admin@fuerzaviva.test', '6075550108', 'Carrera 33 # 51-20', 'Bucaramanga', 1, '2026-09-20 19:04:30'),
(9, 'NIT', '906789012-7', 'Oficinas Torre Empresarial 92', 'servicios@torre92.test', '6015550109', 'Calle 92 # 11-30 Piso 6', 'Bogotá', 1, '2026-09-20 19:04:30'),
(10, 'CE', 'E0456789', 'Mariana Salcedo Bermúdez', 'mariana.salcedo@correo.test', '3025550110', 'Transversal 6 # 27-14', 'Barranquilla', 1, '2026-09-20 19:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_pedido`
--

CREATE TABLE `detalle_pedido` (
  `id` int(10) UNSIGNED NOT NULL,
  `pedido_id` int(10) UNSIGNED NOT NULL,
  `producto_id` int(10) UNSIGNED NOT NULL,
  `cantidad` int(11) NOT NULL DEFAULT 1,
  `precio_unitario` decimal(10,2) NOT NULL,
  `subtotal` decimal(12,2) GENERATED ALWAYS AS (`cantidad` * `precio_unitario`) STORED
) ;

--
-- Volcado de datos para la tabla `detalle_pedido`
--

INSERT INTO `detalle_pedido` (`id`, `pedido_id`, `producto_id`, `cantidad`, `precio_unitario`) VALUES
(1, 1, 2, 3, 19900.00),
(2, 1, 5, 3, 42000.00),
(3, 1, 13, 8, 21600.00),
(4, 2, 7, 2, 9800.00),
(5, 2, 17, 3, 24800.00),
(6, 3, 3, 10, 12400.00),
(7, 3, 8, 2, 11200.00),
(8, 3, 14, 3, 17300.00),
(9, 3, 19, 5, 14700.00),
(10, 4, 19, 10, 14700.00),
(11, 4, 20, 2, 45600.00),
(12, 5, 2, 6, 19900.00),
(13, 5, 5, 10, 42000.00),
(14, 5, 18, 4, 29900.00),
(15, 6, 10, 4, 13500.00),
(16, 6, 19, 3, 14700.00),
(17, 7, 4, 3, 34900.00),
(18, 7, 12, 2, 38700.00),
(19, 7, 18, 5, 29900.00),
(20, 8, 11, 12, 16900.00),
(21, 8, 14, 8, 17300.00),
(22, 8, 15, 6, 18900.00),
(23, 8, 18, 5, 29900.00),
(24, 9, 3, 12, 12400.00),
(25, 9, 8, 8, 11200.00),
(26, 9, 10, 12, 13500.00),
(27, 10, 3, 10, 12400.00),
(28, 10, 4, 4, 34900.00),
(29, 10, 20, 8, 45600.00),
(30, 11, 2, 3, 19900.00),
(31, 11, 14, 8, 17300.00),
(32, 11, 16, 8, 32500.00),
(33, 12, 15, 3, 18900.00),
(34, 12, 16, 3, 32500.00),
(35, 12, 20, 6, 45600.00),
(36, 13, 2, 6, 19900.00),
(37, 13, 3, 10, 12400.00),
(38, 13, 10, 8, 13500.00),
(39, 13, 15, 2, 18900.00),
(40, 14, 4, 2, 34900.00),
(41, 14, 6, 5, 15800.00),
(42, 14, 12, 6, 38700.00),
(43, 14, 16, 4, 32500.00),
(44, 15, 13, 3, 21600.00),
(45, 15, 16, 4, 32500.00),
(46, 15, 20, 12, 45600.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `cliente_id` int(10) UNSIGNED NOT NULL,
  `usuario_id` int(10) UNSIGNED DEFAULT NULL,
  `fecha_pedido` date NOT NULL,
  `estado` enum('pendiente','enviado','entregado','anulado') NOT NULL DEFAULT 'pendiente',
  `total` decimal(12,2) NOT NULL DEFAULT 0.00,
  `observaciones` varchar(255) DEFAULT NULL,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id`, `codigo`, `cliente_id`, `usuario_id`, `fecha_pedido`, `estado`, `total`, `observaciones`, `creado_en`) VALUES
(1, 'PED-2026-001', 1, NULL, '2026-06-03', 'entregado', 358500.00, 'Entrega en el área de mantenimiento', '2026-09-20 19:04:30'),
(2, 'PED-2026-002', 2, NULL, '2026-06-09', 'entregado', 94000.00, 'Facturar a fin de mes', '2026-09-20 19:04:30'),
(3, 'PED-2026-003', 3, NULL, '2026-06-17', 'enviado', 271800.00, 'Requiere factura electrónica', '2026-09-20 19:04:30'),
(4, 'PED-2026-004', 4, NULL, '2026-06-24', 'pendiente', 238200.00, 'Entregar antes de las 10 a.m.', '2026-09-20 19:04:30'),
(5, 'PED-2026-005', 5, NULL, '2026-07-01', 'entregado', 659000.00, 'Pedido mensual programado', '2026-09-20 19:04:30'),
(6, 'PED-2026-006', 6, NULL, '2026-07-08', 'pendiente', 98100.00, 'Confirmar stock antes de despachar', '2026-09-20 19:04:30'),
(7, 'PED-2026-007', 7, NULL, '2026-07-15', 'entregado', 331600.00, 'Entrega en portería', '2026-09-20 19:04:30'),
(8, 'PED-2026-008', 8, NULL, '2026-07-22', 'enviado', 604100.00, 'Cliente recoge en bodega', '2026-09-20 19:04:30'),
(9, 'PED-2026-009', 9, NULL, '2026-07-30', 'entregado', 400400.00, 'Incluir hoja de seguridad', '2026-09-20 19:04:30'),
(10, 'PED-2026-010', 10, NULL, '2026-08-05', 'anulado', 628400.00, 'Anulado por solicitud del cliente', '2026-09-20 19:04:30'),
(11, 'PED-2026-011', 1, NULL, '2026-08-12', 'pendiente', 458100.00, 'Pedido para sede norte', '2026-09-20 19:04:30'),
(12, 'PED-2026-012', 3, NULL, '2026-08-19', 'entregado', 427800.00, 'Entrega urgente', '2026-09-20 19:04:30'),
(13, 'PED-2026-013', 5, NULL, '2026-08-27', 'enviado', 389200.00, 'Despachar con transportadora', '2026-09-20 19:04:30'),
(14, 'PED-2026-014', 2, NULL, '2026-09-02', 'entregado', 511000.00, 'Pedido recurrente trimestral', '2026-09-20 19:04:30'),
(15, 'PED-2026-015', 9, NULL, '2026-09-10', 'pendiente', 742000.00, 'Pendiente de aprobación de compras', '2026-09-20 19:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `codigo` varchar(30) NOT NULL,
  `nombre` varchar(150) NOT NULL,
  `descripcion` varchar(500) DEFAULT NULL,
  `categoria_id` int(10) UNSIGNED NOT NULL,
  `precio` decimal(10,2) NOT NULL DEFAULT 0.00,
  `stock` int(11) NOT NULL DEFAULT 0,
  `presentacion` varchar(60) DEFAULT NULL,
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `descripcion`, `categoria_id`, `precio`, `stock`, `presentacion`, `activo`, `creado_en`) VALUES
(1, 'SC-001', 'Detergente líquido concentrado Mabardi', 'Detergente líquido de alto rendimiento para ropa blanca y de color.', 1, 28500.00, 120, 'Garrafa 3 L', 1, '2026-09-20 19:04:30'),
(2, 'SC-002', 'Detergente en polvo multiuso', 'Detergente en polvo con enzimas para lavado industrial.', 1, 19900.00, 200, 'Bolsa 2 kg', 1, '2026-09-20 19:04:30'),
(3, 'SC-003', 'Jabón líquido para loza limón', 'Jabón lavaloza con aroma a limón y alto poder desengrasante.', 1, 12400.00, 180, 'Botella 1 L', 1, '2026-09-20 19:04:30'),
(4, 'SC-004', 'Desengrasante industrial de cocina', 'Desengrasante alcalino para campanas extractoras, hornos y parrillas.', 1, 34900.00, 60, 'Garrafa 4 L', 1, '2026-09-20 19:04:30'),
(5, 'SC-005', 'Desinfectante amonio cuaternario 5ta generación', 'Desinfectante de amplio espectro para superficies y pisos.', 2, 42000.00, 75, 'Garrafa 4 L', 1, '2026-09-20 19:04:30'),
(6, 'SC-006', 'Hipoclorito de sodio al 5%', 'Blanqueador y desinfectante de uso institucional.', 2, 15800.00, 150, 'Garrafa 3.8 L', 1, '2026-09-20 19:04:30'),
(7, 'SC-007', 'Alcohol antiséptico 70%', 'Alcohol para desinfección rápida de superficies y manos.', 2, 9800.00, 240, 'Botella 700 ml', 1, '2026-09-20 19:04:30'),
(8, 'SC-008', 'Gel desinfectante de manos', 'Gel antibacterial con glicerina, no reseca la piel.', 2, 11200.00, 300, 'Frasco 500 ml', 1, '2026-09-20 19:04:30'),
(9, 'SC-009', 'Limpiador multiusos lavanda', 'Limpiador de uso general con aroma a lavanda.', 3, 13500.00, 190, 'Botella 1 L', 1, '2026-09-20 19:04:30'),
(10, 'SC-010', 'Limpiador multiusos aroma manzana', 'Limpiador concentrado diluible 1:20.', 3, 13500.00, 175, 'Botella 1 L', 1, '2026-09-20 19:04:30'),
(11, 'SC-011', 'Limpiador de banos antisarro', 'Removedor de sarro, moho y residuos de jabon.', 3, 16900.00, 110, 'Botella 1 L', 1, '2026-09-20 19:04:30'),
(12, 'SC-012', 'Champú para alfombras espuma seca', 'Champú de baja humedad para alfombras y tapetes.', 4, 38700.00, 45, 'Garrafa 3 L', 1, '2026-09-20 19:04:30'),
(13, 'SC-013', 'Quitamanchas para alfombras y tapetes', 'Quitamanchas en spray para manchas de café, vino y grasa.', 4, 21600.00, 80, 'Atomizador 750 ml', 1, '2026-09-20 19:04:30'),
(14, 'SC-014', 'Desodorizante para alfombras en polvo', 'Polvo absorbeolores para alfombras de alto tráfico.', 4, 17300.00, 95, 'Bolsa 1 kg', 1, '2026-09-20 19:04:30'),
(15, 'SC-015', 'Limpiador de muebles de madera', 'Limpia y nutre la madera dejando brillo natural.', 5, 18900.00, 85, 'Botella 500 ml', 1, '2026-09-20 19:04:30'),
(16, 'SC-016', 'Revitalizador de cuero para muebles', 'Hidrata y protege muebles y sillas de cuero.', 5, 32500.00, 40, 'Frasco 400 ml', 1, '2026-09-20 19:04:30'),
(17, 'SC-017', 'Limpiador de tapizados en espuma', 'Espuma activa para sofás y sillas en tela.', 5, 24800.00, 70, 'Aerosol 600 ml', 1, '2026-09-20 19:04:30'),
(18, 'SC-018', 'Higienizante antiácaros para colchones', 'Elimina ácaros y bacterias del colchon sin mojarlo.', 6, 29900.00, 55, 'Atomizador 1 L', 1, '2026-09-20 19:04:30'),
(19, 'SC-019', 'Limpiavidrios profesional sin marcas', 'Limpiavidrios de secado rápido que no deja halos.', 7, 14700.00, 160, 'Atomizador 1 L', 1, '2026-09-20 19:04:30'),
(20, 'SC-020', 'Cera autobrillante para pisos', 'Cera acrílica autobrillante para baldosa y porcelanato.', 8, 45600.00, 50, 'Garrafa 3.8 L', 1, '2026-09-20 19:04:30');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(150) NOT NULL,
  `clave_hash` varchar(255) NOT NULL,
  `rol` enum('admin','operador') NOT NULL DEFAULT 'operador',
  `activo` tinyint(1) NOT NULL DEFAULT 1,
  `creado_en` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `clave_hash`, `rol`, `activo`, `creado_en`) VALUES
(1, 'Carlos Administrador', 'admin@scanclean.test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', 'admin', 1, '2026-06-01 00:00:00'),
(2, 'Ana Vendedora', 'ventas@scanclean.test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '', 1, '2026-06-01 00:00:00'),
(3, 'Pedro Almacenista', 'almacen@scanclean.test', '$2y$10$92IXUNpkjO0rOQ5byMi.Ye4oKoEa3Ro9llC/.og/at2.uheWG/igi', '', 1, '2026-06-01 00:00:00');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_pedidos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_pedidos` (
`id` int(10) unsigned
,`codigo` varchar(20)
,`fecha_pedido` date
,`estado` enum('pendiente','enviado','entregado','anulado')
,`total` decimal(12,2)
,`cliente` varchar(150)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_pedidos`
--
DROP TABLE IF EXISTS `vista_pedidos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_pedidos`  AS SELECT `p`.`id` AS `id`, `p`.`codigo` AS `codigo`, `p`.`fecha_pedido` AS `fecha_pedido`, `p`.`estado` AS `estado`, `p`.`total` AS `total`, `c`.`nombre` AS `cliente` FROM (`pedidos` `p` join `clientes` `c` on(`c`.`id` = `p`.`cliente_id`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categorias`
--
ALTER TABLE `categorias`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_categorias_nombre` (`nombre`);

--
-- Indices de la tabla `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_clientes_documento` (`documento`),
  ADD KEY `idx_clientes_nombre` (`nombre`);

--
-- Indices de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_detalle_pedido_producto` (`pedido_id`,`producto_id`),
  ADD KEY `idx_detalle_producto` (`producto_id`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_pedidos_codigo` (`codigo`),
  ADD KEY `idx_pedidos_cliente` (`cliente_id`),
  ADD KEY `idx_pedidos_fecha` (`fecha_pedido`),
  ADD KEY `idx_pedidos_estado` (`estado`),
  ADD KEY `fk_pedidos_usuario` (`usuario_id`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_productos_codigo` (`codigo`),
  ADD KEY `idx_productos_nombre` (`nombre`),
  ADD KEY `idx_productos_categoria` (`categoria_id`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `uq_usuarios_correo` (`correo`),
  ADD KEY `idx_usuarios_rol` (`rol`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categorias`
--
ALTER TABLE `categorias`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_pedido`
--
ALTER TABLE `detalle_pedido`
  ADD CONSTRAINT `fk_detalle_pedido` FOREIGN KEY (`pedido_id`) REFERENCES `pedidos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_detalle_producto` FOREIGN KEY (`producto_id`) REFERENCES `productos` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `fk_pedidos_cliente` FOREIGN KEY (`cliente_id`) REFERENCES `clientes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_pedidos_usuario` FOREIGN KEY (`usuario_id`) REFERENCES `usuarios` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `fk_productos_categoria` FOREIGN KEY (`categoria_id`) REFERENCES `categorias` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
