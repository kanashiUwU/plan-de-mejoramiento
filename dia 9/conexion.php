<?php
/**
 * ARCHIVO: app/config/conexion.php
 *
 * Clase reutilizable que entrega SIEMPRE el mismo objeto PDO.
 * Patron usado: "singleton" (una sola instancia para toda la peticion).
 *
 * Por que una sola conexion:
 *   Abrir una conexion a MySQL cuesta tiempo. Si cada consulta abriera
 *   la suya, la pagina seria lenta. Aqui se abre la primera vez que se
 *   necesita (conexion perezosa) y despues se reutiliza.
 */

declare(strict_types=1); // Obliga a respetar los tipos: int es int, string es string.

final class Conexion
{
    /**
     * Guarda el objeto PDO. Es estatica: vive mientras dure la peticion
     * y es compartida por todo el proyecto. Empieza en null porque
     * todavia no hay conexion.
     */
    private static ?PDO $pdo = null;

    /** Nadie puede hacer "new Conexion()". Solo se usa Conexion::obtener(). */
    private function __construct()
    {
    }

    /**
     * Devuelve la conexion PDO. La crea solo si aun no existe.
     */
    public static function obtener(): PDO
    {
        // Si ya existe, la devolvemos tal cual (reutilizacion).
        if (self::$pdo instanceof PDO) {
            return self::$pdo;
        }

        // Leemos las credenciales desde el archivo externo.
        // require devuelve el array que hay en credenciales.php.
        $rutaCredenciales = __DIR__ . '/credenciales.php';

        if (!is_file($rutaCredenciales)) {
            throw new RuntimeException(
                'No existe app/config/credenciales.php. ' .
                'Copia credenciales.example.php y renombralo como credenciales.php.'
            );
        }

        /** @var array{host:string,bd:string,usuario:string,clave:string,puerto:int} $cfg */
        $cfg = require $rutaCredenciales;

        // DSN = Data Source Name: le dice a PDO a que motor y base conectarse.
        // charset=utf8mb4 evita que las tildes y enies salgan como simbolos raros.
        $dsn = sprintf(
            'mysql:host=%s;port=%d;dbname=%s;charset=utf8mb4',
            $cfg['host'],
            (int) ($cfg['puerto'] ?? 3306),
            $cfg['bd']
        );

        $opciones = [
            // 1) Si algo falla, PDO lanza una excepcion en vez de quedarse callado.
            PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,

            // 2) Cada fila llega como arreglo asociativo: $fila['nombre'].
            PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,

            // 3) false = las sentencias preparadas las prepara MySQL de verdad,
            //    no las simula PHP. Es la opcion mas segura y correcta.
            PDO::ATTR_EMULATE_PREPARES   => false,

            // 4) No mantenemos conexiones persistentes (mas simple de depurar).
            PDO::ATTR_PERSISTENT         => false,
        ];

        try {
            self::$pdo = new PDO($dsn, $cfg['usuario'], $cfg['clave'], $opciones);
        } catch (PDOException $e) {
            // No mostramos usuario ni clave en el mensaje de error.
            throw new RuntimeException(
                'No se pudo conectar con MySQL. Revisa que Apache y MySQL esten ' .
                'encendidos en XAMPP y que la base "scanclean" exista. ' .
                'Detalle tecnico: ' . $e->getMessage(),
                (int) $e->getCode()
            );
        }

        return self::$pdo;
    }

    /** Cierra la conexion (rara vez hace falta: PHP la cierra al terminar). */
    public static function cerrar(): void
    {
        self::$pdo = null;
    }
}
