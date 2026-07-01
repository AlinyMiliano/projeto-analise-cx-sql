# Projeto de Análise de Qualidade e Atendimento (CX) com SQL

# Objetivo:
O objetivo principal do projeto é ministrar e por em prática habilidades na linguagem SQL utilizando PgAdimin4. 

# Contexto do projeto:
A simulação de uma empresa que quer entender a qualidade do atendimento ao cliente com base nos chamados registrados. (Os dados são meramente simulados) 

A empresa quer responder perguntas como: 
- Quantos chamados foram abertos 
- Qual o tempo médio de resolução 
- Qual percentual ficou dentro do SLA
- Qual a taxa de reabertura 
- Quais categorias geram mais chamados 
- Quais atendentes têm melhor desempenho

As análises têm como foco entender os indicadoes de qualidade de atendimento ao cliente (cx), utilizando sql para modelagem consulta e geração de métricas operacionais

# Ferramentas Utilizadas
PostgreSQL
pgAdmin 4
SQL

# Estrutura do Projeto
sql/
├── create_table.sql
├── insert_data.sql
└── analises.sql
docs/ 
└── insights.md

# Métricas Analisadas
- Total de chamados
- Tempo médio de resolução
- Percentual de cumprimento do SLA
- Taxa de reabertura
- Quantidade de chamados por categoria
- Desempenho dos atendentes

# Principais Insights
- 70% dos chamados foram resolvidos dentro do SLA.
- A taxa de reabertura foi de 30%.
- Existem diferenças de desempenho entre os atendentes, indicando oportunidades de melhoria e treinamento.
- O monitoramento dos indicadores auxilia na tomada de decisão e na melhoria da experiência do cliente.

# Competências Demonstradas
- Modelagem de banco de dados
- Consultas SQL intermediárias
- Funções agregadas (COUNT, SUM, AVG, ROUND)
- Uso de CASE WHEN
- Agrupamentos com GROUP BY
- Geração de KPIs e análise de dados.
