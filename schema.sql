-- ---------------------------------
-- HIERARQUIA TEXTUAL
-- A espinha dorsal da Bíblia, onde todo o conteúdo é ancorado.
-- ---------------------------------

CREATE TABLE IF NOT EXISTS TESTAMENTO (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT
);

CREATE TABLE IF NOT EXISTS LIVRO (
    id INTEGER PRIMARY KEY,
    testamento_id INTEGER NOT NULL,
    nome TEXT NOT NULL,
    abreviacao TEXT,
    autor TEXT,
    genero TEXT, -- Ex: Lei, História, Poesia, Profecia, Evangelho, Epístola
    ordem INTEGER,
    periodo_historico TEXT,
    FOREIGN KEY (testamento_id) REFERENCES TESTAMENTO(id)
);

CREATE TABLE IF NOT EXISTS CAPITULO (
    id INTEGER PRIMARY KEY,
    livro_id INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    resumo TEXT,
    FOREIGN KEY (livro_id) REFERENCES LIVRO(id)
);

CREATE TABLE IF NOT EXISTS VERSICULO (
    id INTEGER PRIMARY KEY,
    capitulo_id INTEGER NOT NULL,
    numero INTEGER NOT NULL,
    conteudo TEXT NOT NULL,
    FOREIGN KEY (capitulo_id) REFERENCES CAPITULO(id)
);

-- ---------------------------------
-- HIERARQUIA DE CONTEÚDO
-- As entidades ricas que conectam a narrativa através dos textos.
-- ---------------------------------

CREATE TABLE IF NOT EXISTS PERSONAGEM (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    tipo TEXT, -- Ex: Humano, Anjo, Divindade
    descricao TEXT,
    epoca_inicio INTEGER, -- Ano (pode ser negativo para AC)
    epoca_fim INTEGER -- Ano
);

CREATE TABLE IF NOT EXISTS LUGAR (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL,
    descricao TEXT,
    regiao TEXT,
    lat REAL, -- Latitude para mapas interativos
    lng REAL  -- Longitude para mapas interativos
);

CREATE TABLE IF NOT EXISTS EVENTO (
    id INTEGER PRIMARY KEY,
    titulo TEXT NOT NULL,
    descricao TEXT,
    tipo TEXT, -- Ex: Milagre, Batalha, Aliança, Nascimento
    capitulo_id INTEGER,
    FOREIGN KEY (capitulo_id) REFERENCES CAPITULO(id)
);

CREATE TABLE IF NOT EXISTS TEMA (
    id INTEGER PRIMARY KEY,
    nome TEXT NOT NULL UNIQUE,
    descricao TEXT
);

-- ---------------------------------
-- TABELAS DE JUNÇÃO (Relacionamentos N:N)
-- Conectam as hierarquias, permitindo consultas complexas.
-- ---------------------------------

CREATE TABLE IF NOT EXISTS PERSONAGEM_LIVRO (
    personagem_id INTEGER NOT NULL,
    livro_id INTEGER NOT NULL,
    papel TEXT,
    PRIMARY KEY (personagem_id, livro_id),
    FOREIGN KEY (personagem_id) REFERENCES PERSONAGEM(id),
    FOREIGN KEY (livro_id) REFERENCES LIVRO(id)
);

CREATE TABLE IF NOT EXISTS PERSONAGEM_VERSICULO (
    personagem_id INTEGER NOT NULL,
    versiculo_id INTEGER NOT NULL,
    PRIMARY KEY (personagem_id, versiculo_id),
    FOREIGN KEY (personagem_id) REFERENCES PERSONAGEM(id),
    FOREIGN KEY (versiculo_id) REFERENCES VERSICULO(id)
);

-- Auto-relacionamento para genealogias e redes de contato.
CREATE TABLE IF NOT EXISTS PERSONAGEM_RELACIONAMENTO (
    personagem_id INTEGER NOT NULL,
    relacionado_id INTEGER NOT NULL,
    tipo_relacao TEXT NOT NULL, -- Ex: 'Pai de', 'Discípulo de', 'Adversário de'
    PRIMARY KEY (personagem_id, relacionado_id, tipo_relacao),
    FOREIGN KEY (personagem_id) REFERENCES PERSONAGEM(id),
    FOREIGN KEY (relacionado_id) REFERENCES PERSONAGEM(id)
);

CREATE TABLE IF NOT EXISTS EVENTO_PERSONAGEM (
    evento_id INTEGER NOT NULL,
    personagem_id INTEGER NOT NULL,
    PRIMARY KEY (evento_id, personagem_id),
    FOREIGN KEY (evento_id) REFERENCES EVENTO(id),
    FOREIGN KEY (personagem_id) REFERENCES PERSONAGEM(id)
);

CREATE TABLE IF NOT EXISTS EVENTO_LUGAR (
    evento_id INTEGER NOT NULL,
    lugar_id INTEGER NOT NULL,
    PRIMARY KEY (evento_id, lugar_id),
    FOREIGN KEY (evento_id) REFERENCES EVENTO(id),
    FOREIGN KEY (lugar_id) REFERENCES LUGAR(id)
);

CREATE TABLE IF NOT EXISTS LIVRO_TEMA (
    livro_id INTEGER NOT NULL,
    tema_id INTEGER NOT NULL,
    PRIMARY KEY (livro_id, tema_id),
    FOREIGN KEY (livro_id) REFERENCES LIVRO(id),
    FOREIGN KEY (tema_id) REFERENCES TEMA(id)
);