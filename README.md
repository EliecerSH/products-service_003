# products-service — ShopSmart

Microservicio de gestión de productos para la plataforma de e-commerce **ShopSmart**.
Desarrollado con **Spring Boot 3.2** + **Java 21**.

## Requisitos
- Java 21+
- (Maven no necesario, se incluye wrapper `mvnw`)

## Ejecutar localmente

```bash
# Windows
mvnw.cmd spring-boot:run

# Linux / macOS
./mvnw spring-boot:run
```

El servicio queda disponible en: `http://localhost:8080`

## Endpoints principales

| Método | Ruta              | Descripción                          |
|--------|-------------------|--------------------------------------|
| GET    | /productos        | Listar todos los productos activos   |
| GET    | /productos/{id}   | Obtener un producto por ID           |
| POST   | /productos        | Crear un nuevo producto              |
| PUT    | /productos/{id}   | Actualizar un producto existente     |
| DELETE | /productos/{id}   | Desactivar un producto (soft delete) |
| GET    | /health           | Estado del microservicio             |

### Filtros disponibles en GET /productos
- `?categoria=Electrónica`
- `?nombre=laptop`

## Swagger UI
```
http://localhost:8080/swagger-ui.html
```

## Consola H2 (BD en memoria)
```
http://localhost:8080/h2-console
JDBC URL: jdbc:h2:mem:productsdb
User: sa  /  Password: (vacío)
```

## Ejemplo POST /productos

```json
{
  "nombre": "Tablet Pro 10",
  "descripcion": "Tablet con pantalla 10 pulgadas, 128GB",
  "precio": 299990.00,
  "stock": 30,
  "categoria": "Electrónica"
}
```

## Despliegue en Render
1. Hacer push del repositorio a GitHub
2. Crear un nuevo **Web Service** en Render apuntando al repo
3. Render usará `render.yaml` para la configuración automática
