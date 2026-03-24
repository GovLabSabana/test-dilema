-- ============================================================
-- ACTUALIZACIÓN DEL PERFIL "EL REACCIONARIO"
-- Ejecutar en Supabase → SQL Editor
-- Perfil mucho más de derecha: militarista, libre mercado, autoritario
-- ============================================================

UPDATE voter_profiles 
SET 
    -- Descripción más de extrema derecha, orden estricto y mercado libre
    description = 'Fiel defensor del orden, la mano dura institucional y la libertad de mercado absoluta. Prioriza la inversión privada sin restricciones, el combate frontal contra la criminalidad con toda la fuerza del Estado y una reducción drástica del tamaño gubernamental.',
    
    -- Respuestas apuntando a privatización total, fuerza militar, recorte de estado, cero subsidios, etc.
    -- Basado en las opciones más a la derecha del cuestionario:
    -- Opciones de extrema derecha (Militarismo, Libre mercado, Cero subsidios)
    -- Parecido al candidato pero con diferencias clave (ej. postura íntegra sobre petróleo, pensiones, etc) para no ser un clon exacto.
    type_answers = '{"1":"A","2":"E","3":"A","4":"E","5":"A","6":"B","7":"A","8":"A","9":"C","10":"A","11":"C","12":"E","13":"A","14":"A","15":"A","16":"C"}'
WHERE name = 'El Reaccionario';

-- Verificar el cambio:
SELECT id, name, description, type_answers 
FROM voter_profiles 
WHERE name = 'El Reaccionario';
