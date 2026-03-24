-- ============================================================
-- CONVERGENCIA ELECTORAL — Perfiles de Votante
-- Ejecutar en Supabase → SQL Editor
-- ============================================================

-- ------------------------------------------------------------
-- 1. TABLA DE PERFILES DE VOTANTE
-- Cada perfil tiene un conjunto de respuestas "tipo" (type_answers)
-- que se usará para calcular similitud con las respuestas del usuario.
-- type_answers es un JSON: {"1": "A", "2": "C", ...}
-- No es necesario definir todas las preguntas; solo las más representativas.
-- ------------------------------------------------------------
CREATE TABLE IF NOT EXISTS voter_profiles (
    id          serial      PRIMARY KEY,
    name        text        NOT NULL,
    description text,
    icon_url    text,
    -- Respuestas tipo del perfil por pregunta_id
    -- Ejemplo: {"1": "A", "5": "B", "12": "C"}
    type_answers jsonb       NOT NULL DEFAULT '{}'
);

ALTER TABLE voter_profiles DISABLE ROW LEVEL SECURITY;

-- ------------------------------------------------------------
-- 2. INSERTAR PERFILES INICIALES
-- Ajusta type_answers a las opciones reales de cada pregunta.
-- Puedes editar estos valores directamente en el Table Editor de Supabase.
-- ------------------------------------------------------------
INSERT INTO voter_profiles (name, description, icon_url, type_answers) VALUES
(
    'El Pragmático',
    'Prioriza soluciones prácticas y eficientes. Valora el crecimiento económico con responsabilidad social. Desconfía de posturas ideológicas extremas y busca el equilibrio entre Estado y mercado.',
    NULL,
    '{}'
),
(
    'El Progresista Social',
    'Defiende la expansión de derechos y el fortalecimiento del Estado de bienestar. Apoya reformas estructurales en salud, educación y trabajo. Ve en la desigualdad el principal problema del país.',
    NULL,
    '{}'
),
(
    'El Conservador Institucional',
    'Valora el orden, la seguridad y las instituciones establecidas. Prefiere cambios graduales y desconfía de reformas radicales. Prioriza la autoridad del Estado en materia de orden público.',
    NULL,
    '{}'
),
(
    'El Liberal Moderno',
    'Defiende las libertades individuales tanto en lo económico como en lo social. Apoya mercados competitivos y el respeto a la diversidad. Busca un Estado eficiente que no intervenga de más.',
    NULL,
    '{}'
),
(
    'El Ambientalista',
    'La crisis climática y la sostenibilidad son su brújula de decisión. Apoya la transición energética y regula la explotación de recursos naturales. Ve el desarrollo desde una perspectiva ecosistémica.',
    NULL,
    '{}'
),
(
    'El Populista Crítico',
    'Desconfía de las élites políticas y económicas tradicionales. Apoya medidas redistributivas fuertes y la participación directa de la ciudadanía. Ve al pueblo como el verdadero soberano.',
    NULL,
    '{}'
),
(
    'El Tecnocrático',
    'Cree en la evidencia, los datos y la gestión técnica de los problemas públicos. Prefiere políticas basadas en resultados y evaluación. La eficacia por encima de la ideología.',
    NULL,
    '{}'
);

-- ------------------------------------------------------------
-- 3. AÑADIR COLUMNA voter_profile_id A quiz_responses
-- ------------------------------------------------------------
ALTER TABLE quiz_responses
    ADD COLUMN IF NOT EXISTS voter_profile_id integer REFERENCES voter_profiles(id);

-- ============================================================
-- NOTAS:
-- Después de insertar los perfiles, debes:
-- 1. Ir a Supabase → Table Editor → voter_profiles
-- 2. Para cada perfil, editar la columna type_answers con un JSON
--    que mapee question_id → respuesta_tipo
--    Ej: {"1": "A", "2": "B", "5": "C", "10": "A", ...}
--    Puedes definir solo las preguntas más representativas del perfil.
-- ============================================================
