CREATE TABLE chamados (
    id_chamado SERIAL PRIMARY KEY,
    data_abertura DATE,
    data_fechamento DATE,
    categoria VARCHAR(50),
    status VARCHAR(30),
    atendente VARCHAR(50),
    reaberto VARCHAR(10),
    sla_horas INTEGER,
    tempo_resolucao_horas INTEGER
);
