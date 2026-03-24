-- ============================================================
-- ACTUALIZAR type_answers DE LOS PERFILES DE VOTANTE
-- Basado en las 16 preguntas del PDF "Convergencia Electoral feb 11 2026"
-- Ejecutar en Supabase → SQL Editor
-- ============================================================
-- 
-- LÓGICA DE ASIGNACIÓN:
-- Cada perfil eligió la opción que mejor refleja su visión en cada eje:
--   Eje 1: Economía (Q1, Q2)
--   Eje 2: Trabajo/Salud (Q3, Q4)
--   Eje 3: Educación (Q5, Q6)
--   Eje 4: Ambiente/Energía (Q7, Q8)
--   Eje 5: Paz/Seguridad (Q9, Q10)
--   Eje 6: Institucionalidad (Q11, Q12, Q13, Q14)
--   Eje 7: Internacional/Agrario (Q15, Q16)
-- ============================================================

-- 1. El Pragmático
-- E=acuerdo nacional fiscal | A=incentivos tributarios IED | C=regímenes laborales MiPymes |
-- C=fondo único salud | B=matrícula diferencial | E=pago contingente Icetex |
-- E=Ecopetrol lidera transición | D=incentivos empresas residuos |
-- C=inversión social zonas de conflicto | C=atacar eslabones fuertes narcotráfico |
-- E=fortalecer capacidad antes de recursos | C=magistrados por méritos |
-- E=liderazgo multilateral | A=capital semilla e inversión startups |
-- B=diversificación equilibrada | E=formalización propiedad rural
UPDATE voter_profiles
SET type_answers = '{"1":"E","2":"A","3":"C","4":"C","5":"B","6":"E","7":"E","8":"D","9":"C","10":"C","11":"E","12":"C","13":"E","14":"A","15":"B","16":"E"}'::jsonb
WHERE name = 'El Pragmático';

-- 2. El Progresista Social
-- B=subir impuestos ricos | D=servicios públicos e infraestructura IED |
-- B=mantener reforma laboral | B=modelo 100% público salud |
-- C=gratuidad universal universidad | C=condonar deuda estratos bajos |
-- D=descentralizar energía comunidades | E=integrar recicladores |
-- B=Paz Total negociación | D=regular drogas salud pública |
-- B=reforma SGP más transferencias | B=justicia comunitaria |
-- C=renegociar TLC industrial | D=emprendimiento popular/regional |
-- D=integración regional latinoamérica | A=expropiación tierras improductivas
UPDATE voter_profiles
SET type_answers = '{"1":"B","2":"D","3":"B","4":"B","5":"C","6":"C","7":"D","8":"E","9":"B","10":"D","11":"B","12":"B","13":"C","14":"D","15":"D","16":"A"}'::jsonb
WHERE name = 'El Progresista Social';

-- 3. El Conservador Institucional
-- A=reducir gasto y programas | E=TLC para IED |
-- A=reducir aportes, flexibilizar contratos | A=modelo mixto EPS |
-- A=préstamos condonables por mérito | B=eliminar Icetex, becas por mérito |
-- C=continuar hidrocarburos para financiar transición | A=cultura y educación ambiental |
-- A=confrontación militar | A=retomar glifosato |
-- C=centralizar recursos Nación | A=corte unificada |
-- A=alineación total con EE.UU. | A=fondos de capital e inversión |
-- A=alianza prioritaria EE.UU./Occidente | C=impuesto latifundios improductivos
UPDATE voter_profiles
SET type_answers = '{"1":"A","2":"E","3":"A","4":"A","5":"A","6":"B","7":"C","8":"A","9":"A","10":"A","11":"C","12":"A","13":"A","14":"A","15":"A","16":"C"}'::jsonb
WHERE name = 'El Conservador Institucional';

-- 4. El Liberal Moderno
-- D=impulsar sectores clave, asumir deuda corto plazo | B=simplificar sistema tributario |
-- A=reducir aportes, flexibilizar | C=fondo nacional único, competen aseguradoras |
-- E=alianzas público-privadas becas | E=pago contingente al ingreso |
-- B=incentivos fiscales empresas privadas renovables | D=incentivos económicos empresas residuos |
-- E=cooperación internacional inteligencia | D=regular sustancias ilícitas |
-- A=autonomía fiscal total departamentos | C=magistrados por méritos, sin política |
-- B=diversificación: EE.UU/Europa + Asia | B=sandboxes regulatorios innovación |
-- B=diversificación equilibrada | E=formalización propiedad rural
UPDATE voter_profiles
SET type_answers = '{"1":"D","2":"B","3":"A","4":"C","5":"E","6":"E","7":"B","8":"D","9":"E","10":"D","11":"A","12":"C","13":"B","14":"B","15":"B","16":"E"}'::jsonb
WHERE name = 'El Liberal Moderno';

-- 5. El Ambientalista
-- E=acuerdo nacional con reforma tributaria | C=subsidios sectores alto valor (biocombustibles, IA) |
-- D=subsidios para grupos vulnerables | D=atención primaria zonas rurales |
-- D=educación técnica alineada sectores productivos | D=diversificar fuentes Icetex |
-- B=incentivos fiscales empresas renovables | B=infraestructura tecnología plantas tratamiento |
-- C=inversión social zonas de conflicto | B=fortalecer sustitución cultivos PNIS |
-- D=crear regiones de planificación RAP | B=justicia comunitaria accesible |
-- D=cooperación ambiental con EE.UU. | C=I+D conectar investigación con mercado |
-- C=no alineamiento, priorizar medio ambiente y autonomía | B=comprar tierras a precio comercial
UPDATE voter_profiles
SET type_answers = '{"1":"E","2":"C","3":"D","4":"D","5":"D","6":"D","7":"B","8":"B","9":"C","10":"B","11":"D","12":"B","13":"D","14":"C","15":"C","16":"B"}'::jsonb
WHERE name = 'El Ambientalista';

-- 6. El Populista Crítico
-- C=renegociar deuda externa | D=fortalecer servicios públicos e infraestructura |
-- E=fortalecer inspección laboral | B=modelo 100% público salud |
-- C=gratuidad universal | A=Icetex banco social 0% |
-- A=control estatal total energía | E=integrar recicladores informales |
-- B=Paz Total negociación todos los grupos | D=regular sustancias, salud pública |
-- A=autonomía fiscal total pueblos | B=justicia comunitaria |
-- C=renegociar TLC proteger economía | D=emprendimiento popular/regional inclusión |
-- E=reorientación potencias emergentes BRICS | A=expropiación tierras improductivas rápida
UPDATE voter_profiles
SET type_answers = '{"1":"C","2":"D","3":"E","4":"B","5":"C","6":"A","7":"A","8":"E","9":"B","10":"D","11":"A","12":"B","13":"C","14":"D","15":"E","16":"A"}'::jsonb
WHERE name = 'El Populista Crítico';

-- 7. El Tecnocrático
-- E=acuerdo nacional + metas deuda | C=subsidios sectores exportaciones alto valor |
-- D=subsidiar grupos específicos con evidencia | E=digitalizar sistema salud |
-- D=educación técnica alineada mercado | E=pago contingente al ingreso |
-- E=Ecopetrol diversifica en energías limpias | B=infraestructura y tecnología tratamiento |
-- E=cooperación inteligencia internacional | C=atacar eslabones fuertes narcotráfico |
-- E=fortalecer capacidad institucional | E=digitalizar justicia con IA |
-- E=liderazgo multilateral Colombia | C=I+D investigación y desarrollo |
-- B=diversificación equilibrada global | E=formalización propiedad rural títulos
UPDATE voter_profiles
SET type_answers = '{"1":"E","2":"C","3":"D","4":"E","5":"D","6":"E","7":"E","8":"B","9":"E","10":"C","11":"E","12":"E","13":"E","14":"C","15":"B","16":"E"}'::jsonb
WHERE name = 'El Tecnocrático';

-- ============================================================
-- VERIFICAR RESULTADOS
SELECT id, name, type_answers FROM voter_profiles ORDER BY id;
-- ============================================================
