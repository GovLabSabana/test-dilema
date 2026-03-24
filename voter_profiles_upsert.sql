-- ============================================================
-- UPSERT COMPLETO DE PERFILES DE VOTANTE (INSERT + type_answers)
-- Ejecutar en Supabase → SQL Editor
-- Esto inserta los 7 perfiles con sus respuestas ideales en un solo paso.
-- ============================================================

-- Asegurar constraint UNIQUE en name (por si no existe)
ALTER TABLE voter_profiles ADD CONSTRAINT voter_profiles_name_key UNIQUE (name);

INSERT INTO voter_profiles (name, description, icon_url, type_answers) VALUES

(
    'El Pragmático',
    'Prioriza soluciones prácticas y eficientes. Valora el crecimiento económico con responsabilidad social. Desconfía de posturas ideológicas extremas y busca el equilibrio entre Estado y mercado.',
    NULL,
    '{"1":"E","2":"A","3":"C","4":"C","5":"B","6":"E","7":"E","8":"D","9":"C","10":"C","11":"E","12":"C","13":"E","14":"A","15":"B","16":"E"}'
),
(
    'El Progresista Social',
    'Defiende la expansión de derechos y el fortalecimiento del Estado de bienestar. Apoya reformas estructurales en salud, educación y trabajo. Ve en la desigualdad el principal problema del país.',
    NULL,
    '{"1":"B","2":"D","3":"B","4":"B","5":"C","6":"C","7":"D","8":"E","9":"B","10":"D","11":"B","12":"B","13":"C","14":"D","15":"D","16":"A"}'
),
(
    'El Conservador Institucional',
    'Valora el orden, la seguridad y las instituciones establecidas. Prefiere cambios graduales y desconfía de reformas radicales. Prioriza la autoridad del Estado en materia de orden público.',
    NULL,
    '{"1":"A","2":"E","3":"A","4":"A","5":"A","6":"B","7":"C","8":"A","9":"A","10":"A","11":"C","12":"A","13":"A","14":"A","15":"A","16":"C"}'
),
(
    'El Liberal Moderno',
    'Defiende las libertades individuales tanto en lo económico como en lo social. Apoya mercados competitivos y el respeto a la diversidad. Busca un Estado eficiente que no intervenga de más.',
    NULL,
    '{"1":"D","2":"B","3":"A","4":"C","5":"E","6":"E","7":"B","8":"D","9":"E","10":"D","11":"A","12":"C","13":"B","14":"B","15":"B","16":"E"}'
),
(
    'El Ambientalista',
    'La crisis climática y la sostenibilidad son su brújula de decisión. Apoya la transición energética y regula la explotación de recursos naturales. Ve el desarrollo desde una perspectiva ecosistémica.',
    NULL,
    '{"1":"E","2":"C","3":"D","4":"D","5":"D","6":"D","7":"B","8":"B","9":"C","10":"B","11":"D","12":"B","13":"D","14":"C","15":"C","16":"B"}'
),
(
    'El Populista Crítico',
    'Desconfía de las élites políticas y económicas tradicionales. Apoya medidas redistributivas fuertes y la participación directa de la ciudadanía. Ve al pueblo como el verdadero soberano.',
    NULL,
    '{"1":"C","2":"D","3":"E","4":"B","5":"C","6":"A","7":"A","8":"E","9":"B","10":"D","11":"A","12":"B","13":"C","14":"D","15":"E","16":"A"}'
),
(
    'El Tecnocrático',
    'Cree en la evidencia, los datos y la gestión técnica de los problemas públicos. Prefiere políticas basadas en resultados y evaluación. La eficacia por encima de la ideología.',
    NULL,
    '{"1":"E","2":"C","3":"D","4":"E","5":"D","6":"E","7":"E","8":"B","9":"E","10":"C","11":"E","12":"E","13":"E","14":"C","15":"B","16":"E"}'
)

ON CONFLICT (name) DO UPDATE SET
    description  = EXCLUDED.description,
    type_answers = EXCLUDED.type_answers;

-- Verificar:
SELECT id, name, type_answers FROM voter_profiles ORDER BY id;
