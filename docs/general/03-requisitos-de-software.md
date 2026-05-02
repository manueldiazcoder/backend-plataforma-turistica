# Documento de Requerimientos de Software (SRS)

**Proyecto:** Plataforma Digital Turística de Calima Darién
**Versión:** 1.0
**Fecha:** 20-09-2025
**Autor:** Juan Manuel Díaz

---

## 1. Introducción

### 1.1 Propósito

El propósito de este documento es describir los requerimientos funcionales y no funcionales de la plataforma digital para Calima Darién, cuyo objetivo principal es impulsar la economía local mediante la centralización y organización de la oferta turística y comercial, al tiempo que se mejora la experiencia de los visitantes.

### 1.2 Alcance

La plataforma estará disponible en versiones web y móvil. Iniciará como un **directorio digital con información estratégica y mapa interactivo** para turistas y evolucionará hacia una solución de **reservas, compras y servicios autogestionados por los negocios locales**, con posibilidad de expansión a otros municipios turísticos.

### 1.3 Definiciones y acrónimos

- **Turista**: Usuario visitante del municipio (local, nacional o extranjero).
- **Dueño de negocio**: Usuario propietario de hoteles, restaurantes, tiendas, guías turísticos o servicios relacionados.
- **Administrador**: Perfil encargado de la moderación general (alcaldía u organización de turismo).
- **MVP (Minimum Viable Product)**: Versión mínima viable del sistema que permite validar la propuesta inicial.

---

## 2. Descripción general

### 2.1 Actores principales

- **Turistas**: consultan información, guardan preferencias, eventualmente reservan y califican.
- **Dueños de negocios**: registran y actualizan sus datos (precios, productos, promociones).
- **Alcaldía/organización local**: gestiona el sistema, obtiene métricas y promueve el turismo.

### 2.2 Objetivos principales

1. Impulsar la economía local.
2. Mejorar la experiencia del visitante.
3. Centralizar toda la información turística en un solo lugar.

### 2.3 Metas por fases

- **Corto plazo:** directorio digital + mapa interactivo.
- **Mediano plazo:** reservas, compras, calificaciones, reseñas.
- **Largo plazo:** comparación de precios + expansión geográfica.

---

## 3. Requerimientos funcionales

### 3.1 Módulo de información turística

- RF-1: El sistema debe mostrar información estratégica y atractiva sobre sitios turísticos, actividades, negocios y rutas.
- RF-2: El sistema debe contar con un **mapa interactivo** que permita ubicar sitios de interés, transporte y negocios cercanos.
- RF-3: La información debe estar categorizada (ej. gastronomía, hospedaje, actividades acuáticas, etc.).

### 3.2 Módulo de usuarios

- RF-4: Los turistas deben poder **registrarse** para guardar preferencias.
- RF-5: Los dueños de negocios deben poder **crear un perfil especial** para gestionar su información.
- RF-6: Los dueños de negocios deben poder modificar sus datos en cualquier momento (precios, fotos, promociones).
- RF-7: Los administradores deben poder aprobar o rechazar registros de negocios.

### 3.3 Módulo de reservas y compras (mediano plazo)

- RF-8: El sistema debe permitir realizar **reservas en línea** (hoteles, tours, alquileres, etc.).
- RF-9: El sistema debe permitir **pagos en línea** mediante pasarelas (ej. PayU, MercadoPago, Stripe).
- RF-10: El sistema debe generar **comisiones** automáticas por cada transacción realizada.

### 3.4 Módulo de interacción

- RF-11: Los turistas deben poder **calificar y dejar reseñas** de negocios y actividades.
- RF-12: El sistema debe permitir mostrar contenido personalizado según las preferencias del usuario.

### 3.5 Administración

- RF-13: Los administradores deben poder **gestionar usuarios, negocios y contenidos**.
- RF-14: El sistema debe generar **reportes y métricas** sobre visitas, reservas y ventas.

---

## 4. Requerimientos no funcionales

### 4.1 Rendimiento y escalabilidad

- RNF-1: El sistema debe soportar al menos 1,000 usuarios concurrentes en su fase inicial.
- RNF-2: El sistema debe ser escalable para expandirse a otros municipios sin rediseñar la arquitectura.

### 4.2 Usabilidad

- RNF-3: La interfaz debe ser intuitiva, atractiva y accesible para diferentes edades y perfiles.
- RNF-4: La aplicación debe estar disponible en **español e inglés** (posteriormente multilingüe).

### 4.3 Seguridad

- RNF-5: La plataforma debe cumplir con estándares de protección de datos (ej. encriptación de contraseñas, HTTPS).
- RNF-6: Solo los dueños de negocios podrán editar la información de sus establecimientos.

### 4.4 Disponibilidad

- RNF-7: El sistema debe estar disponible el 99% del tiempo (excepto mantenimientos programados).
- RNF-8: El sistema debe ser **responsivo** (adaptarse a móviles, tablets y web).

### 4.5 Mantenibilidad

- RNF-9: El código debe estar documentado y seguir buenas prácticas (ej. principios SOLID, arquitectura modular).
- RNF-10: La plataforma debe permitir incorporar nuevas funcionalidades sin afectar las existentes.
