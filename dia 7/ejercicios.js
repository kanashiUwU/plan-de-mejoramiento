const moneda = new Intl.NumberFormat("es-CO", {
  style: "currency",
  currency: "COP",
  maximumFractionDigits: 0
});

const productoMasCaro = [...productos].sort((a, b) => b.precio - a.precio)[0];

const unidadesPorCategoria = productos.reduce((acc, p) => {
  acc[p.categoria] = (acc[p.categoria] ?? 0) + p.stock;
  return acc;
}, {});

const stockCritico = productos.filter(p => p.stock < 5);

const promedioPrecio = productos.reduce((suma, p, _, arr) => suma + p.precio / arr.length, 0);

console.log("--- RESULTADOS DE ANÁLISIS DE DATOS ---");
console.log("Producto más caro:", productoMasCaro.nombre, "-", moneda.format(productoMasCaro.precio));
console.log("Unidades totales por categoría:");
console.table(unidadesPorCategoria);
console.log("Productos con stock menor a 5:");
console.table(stockCritico);
console.log("Precio promedio de los productos:", moneda.format(promedioPrecio));