# Identidad Visual

## Idea central de la identidad (resumen ejecutivo)

**Nombre:** Calima Explorer

**Posicionamiento:** una plataforma que convierte al usuario en un “explorador” del Lago Calima: curiosidad, retorno y descubrimiento continuo.

**Emoción a transmitir:** aventura confiable, frescura natural, descubrimiento y optimismo. No queremos clichés turísticos (olas/velas) — preferimos referencia cartográfica/topográfica y símbolos de exploración abstractos que sugieran ruta, orientación y descubrimiento sin ser obvios.

## Tipografías

**Primaria (display / logotipo / headings):** **Poppins**

-   Por qué: es geométrica, moderna, con buena presencia en títulos y wordmarks; funciona muy bien en interfaces y en branding digital por su aspecto amigable y profesional. Sus formas redondeadas conectan con la idea de lago y comunidad.
-   Uso: logotipo / títulos H1–H3 / botones principales / logotype.

**Secundaria (cuerpo / UI):** **Inter** (preferida por legibilidad)

-   Por qué: Inter fue diseñada para interfaces, tiene excelente legibilidad a tamaños pequeños, interlineado eficiente y mucha variedad de pesos. Complementa muy bien a Poppins sin competir por atención.
-   Uso: cuerpos de texto, labels, formularios, menús, microcopy.

**Stack recomendado en CSS:**

```css
font-family: "Poppins", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue",
  Arial, sans-serif;
--ui-font: "Inter", system-ui, -apple-system, "Segoe UI", Roboto, "Helvetica Neue",
  Arial, sans-serif;
```

**Pesos sugeridos:**

-   Poppins: 700 (logo/H1), 600 (H2/H3), 500 (CTA grande)
-   Inter: 400 (body), 500 (labels), 600 (nav)

**Tamaños guía (web)**

-   H1 (desktop): 48–56 px (Poppins 700, line-height 1.05–1.15)
-   H2: 32–40 px (Poppins 600)
-   H3: 20–28 px (Poppins 600)
-   Body: 16 px (Inter 400, line-height 1.4–1.6)
-   Small UI text: 12–14 px (Inter 400/500)

## Paleta de colores

-   `#FF6F3C` — naranja (Brand / CTA(Call To Action) / energía)
-   `#0F76A8` — azul (Confianza / cabeceras / links)
-   `#23C4D6` — cian (degradados / acentos)
-   `#1FB06B` — verde (éxitos / naturaleza)
-   `#FFC857` — amarillo (badges / highlights)

### Roles concretos

-   `Primary (brand)`: `#FF6F3C` → botones CTA primarios, icono del logo, acciones principales.
-   `Secondary`: `#0F76A8` → header/nav, links, fondo de secciones informativas.
-   `Accent`: `#23C4D6 / #FFC857` → héroe, microinteracciones, badges.
-   `Success`: `#1FB06B`.
-   `Neutral`: #111 (texto fuerte), #666 (texto secundario), #f7f7f7 (fondo claro).

### Paleta (roles + HEX + uso sugerido) `#0F76A8-#23C4D6-#FF6F3C-#1FB06B-#FFC857`

1.  **Agua Profunda (Primary)** — `#0F76A8`
    -   Rol: marca principal, fondos hero moderados, header accent.
    -   Emoción: confianza, tranquilidad acuática, credibilidad.
2.  **Aqua Vivo (Secondary / Fresh)** — `#23C4D6`
    -   Rol: highlights, icon fills, map pins secundarios, microinteracciones.
    -   Emoción: frescura, modernidad, descubrimiento.
3.  **Coral Aventura (CTA / Accent)** — `#FF6F3C`
    -   Rol: botones primarios, llamadas a la acción, alertas positivas, badges.
    -   Emoción: energía, curiosidad, “hazlo ahora”.
4.  **Verde Sendero (Natural Accent)** — `#1FB06B`
    -   Rol: indicadores de naturaleza, etiquetas de categoría (ej. “ecoturismo”), etiquetas positivas (open/available).
    -   Emoción: naturaleza, recorrido, sostenibilidad.
5.  **Ámbar Descubrimiento (Badge / Reward)** — `#FFC857`
    -   Rol: insignias, badges de explorador, microgratificaciones, highlights secundarios.
    -   Emoción: calidez, recompensa, optimismo.

### Combinaciones recomendadas (ejemplos de uso)

-   **Header / hero**: fondo `Agua Profunda` (#0F76A8) con botones CTA `Coral Aventura` (#FF6F3C) y subtítulos en `Ámbar Descubrimiento` (#FFC857) para contraste.
-   **Botón primario**: fondo `Coral Aventura` (#FF6F3C) con texto blanco (usar blanco real para accesibilidad). Hover: oscurecer 10–12%.
-   **Tarjetas**: borde o chip en `Aqua Vivo` (#23C4D6) con small accents `Verde Sendero` para etiquetas.
-   **Badges / gamification**: `Ámbar Descubrimiento` para distintivos, `Coral Aventura` para niveles especiales.

## Accesibilidad y contraste (recomendaciones concretas)

-   Las paletas color emocional están pensadas para UI, pero **el texto debe cumplir contrast ratio 4.5:1** para tamaños normales.
-   Práctica: usa `Agua Profunda` (#0F76A8) como fondo con texto blanco solamente si la relación de contraste lo permite; para body text corto, usa un **neutral muy oscuro** (#0B2130 por ejemplo) aunque no forme parte de la paleta emocional.
-   Herramientas: WebAIM Contrast Checker, Lighthouse (Chrome).
-   Recomendación final: define variables CSS `-text-on-light`, `-text-on-dark` con neutrales adecuados.

## Guía de estilo (ligera)

### Uso del logo

-   Mantener clearspace y versiones SVG.
-   No recolorear fuera de la paleta.

### Iconografía y rejilla

-   Espaciado basado en 8px.
-   Bordes suaves (8–12px radius).
