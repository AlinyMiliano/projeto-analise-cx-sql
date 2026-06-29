SELECT COUNT(*) AS total_chamados
FROM chamados;

-- Quantidade total de tickets 
-- Total_chamados: 40

SELECT 
    ROUND(AVG(tempo_resolucao_horas), 2) AS tempo_medio
FROM chamados
WHERE status = 'Fechado';

-- Média de tempo para resolver o chamado 
-- Tempo_medio: 18.65 horas

SELECT 
    ROUND(
        SUM(CASE 
            WHEN tempo_resolucao_horas <= sla_horas THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS percentual_dentro_sla
FROM chamados
WHERE status = 'Fechado';

-- Eficiência do atendimento 
-- Percentual_dentro_sla: 70.00%

SELECT
    ROUND(
        SUM(CASE 
            WHEN reaberto = 'Sim' THEN 1 
            ELSE 0 
        END) * 100.0 / COUNT(*),
        2
    ) AS taxa_reabertura
FROM chamados;

-- Qualidade do atendimento 
-- Taxa_rebertura: 30.00%

SELECT 
    categoria,
    COUNT(*) AS total_chamados
FROM chamados
GROUP BY categoria
ORDER BY total_chamados DESC;

-- Onde estão os maiores "problemas"
-- Categoria: Cancelamento, Cadastro, Suporte Técnico, Reclamação e Finaceiro
-- Total_chamados: 8, 8, 8 ,8 e 8
-- Os chamados estão igualmente distribuídos entre as categorias, indicando que não existe um único processo concentrando a maior parte dos problemas

SELECT
    atendente,
    COUNT(*) AS total_chamados,
    ROUND(AVG(tempo_resolucao_horas), 2) AS tempo_medio
FROM chamados
WHERE status = 'Fechado'
GROUP BY atendente
ORDER BY tempo_medio;

-- Quem resolve mais rápido 
-- Atendente e Tempo_medio: Diego 6.50, Ana 10.50, Bruno 22.25, Fernanda 24.25 e Carla 29.75
-- Total_chamados: 8, 8, 8 ,8 e 8  

SELECT
    categoria,
    ROUND(
        SUM(CASE
            WHEN reaberto = 'Sim' THEN 1
            ELSE 0
        END) * 100.0 / COUNT(*),
        2
    ) AS taxa_reabertura
FROM chamados
GROUP BY categoria
ORDER BY taxa_reabertura DESC;

-- Categoria com maior taxa de reabertura 
-- Cadastro, Cancelamento, Financeiro, Suporte Técnico e Reclamção
-- 75.00, 50.00, 25.00, 0.00 e 0.00

SELECT
    atendente,
    ROUND(
        SUM(
            CASE
                WHEN reaberto = 'Sim' THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS taxa_reabertura
FROM chamados
GROUP BY atendente
ORDER BY taxa_reabertura;

-- Qual atenedente resolve os problemas de forma mais definitiva
--Diego, Ana, Bruno, Fernanda e Carla
-- Taxa de reabertura: 0.00, 0.00, 25.00, 50.00 e 75.00

SELECT
    atendente,
    ROUND(
        SUM(
            CASE
                WHEN tempo_resolucao_horas <= sla_horas THEN 1
                ELSE 0
            END
        ) * 100.0 / COUNT(*),
        2
    ) AS percentual_sla
FROM chamados
WHERE status = 'Fechado'
GROUP BY atendente
ORDER BY percentual_sla DESC;

-- Quem mais consegue resolver dentro do prazo
-- Diego, Ana, Bruno, Fernanda e Carla
-- 100.00, 100.00, 75.00, 50.00 e 25.00

SELECT
    status,
    COUNT(*) AS total
FROM chamados
GROUP BY status;

-- taxa de fechamento
-- Fechado 40

SELECT
    CASE
        WHEN tempo_resolucao_horas <= sla_horas
            THEN 'Dentro do SLA'
        ELSE 'Fora do SLA'
    END AS situacao_sla,
    COUNT(*) AS total
FROM chamados
WHERE status = 'Fechado'
GROUP BY situacao_sla;

-- Chamados dentro e fora do SLA
-- Dentro 28, Fora 12