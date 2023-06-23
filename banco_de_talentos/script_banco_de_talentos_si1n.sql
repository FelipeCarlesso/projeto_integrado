/*
Script para o trabalho do Projeto Integrado
*/

-- Create table para criar a tabela "cadastro" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE cadastro (
                usuario_id NUMERIC NOT NULL,
                primeiro_nome VARCHAR(25) NOT NULL,
                sobrenome VARCHAR(255) NOT NULL,
                email VARCHAR(255) NOT NULL,
                senha VARCHAR(50) NOT NULL,
                CONSTRAINT pk_cadastro PRIMARY KEY (usuario_id)
);
-- Adicionar comentários individuais para tabela e cada coluna da tabela "cadastro"
COMMENT ON TABLE cadastro IS 'Tabela do cadastro.';
COMMENT ON COLUMN cadastro.usuario_id IS 'PK do usuário.';
COMMENT ON COLUMN cadastro.primeiro_nome IS 'Primeiro nome do usuário.';
COMMENT ON COLUMN cadastro.sobrenome IS 'Sobrenome do usuário.';
COMMENT ON COLUMN cadastro.email IS 'Email do usuário.';
COMMENT ON COLUMN cadastro.senha IS 'Senha do usuário.';


-- Create table para criar a tabela "hard_skills" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE hard_skills (
                hard_id NUMERIC NOT NULL,
                escolaridade VARCHAR(100) NOT NULL,
                curso_complementar VARCHAR(255),
                usuario_id NUMERIC NOT NULL,
                CONSTRAINT pk_hard_skills PRIMARY KEY (hard_id)
);
-- Adicionar comentários individuais para a tabela e cada coluna da tabela "hard_skills"
COMMENT ON TABLE hard_skills IS 'Tabela das hard skills.';
COMMENT ON COLUMN hard_skills.hard_id IS 'PK das hard skills.';
COMMENT ON COLUMN hard_skills.escolaridade IS 'Coluna do nivel de escolaridade.';
COMMENT ON COLUMN hard_skills.curso_complementar IS 'Coluna para curso complementar.';
COMMENT ON COLUMN hard_skills.usuario_id IS 'PK do usuário.';


-- Create table para criar a tabela "soft_skills" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE soft_skills (
                soft_id NUMERIC NOT NULL,
                futebol BOOLEAN NOT NULL,
                volei BOOLEAN NOT NULL,
                basquete BOOLEAN NOT NULL,
                usuario_id NUMERIC NOT NULL,
                CONSTRAINT pk_soft_skills PRIMARY KEY (soft_id)
);
-- Adicionar comentários individuais para a tabela e cada coluna da tabela "soft_skills"
COMMENT ON TABLE soft_skills IS 'Tabela das soft skills.';
COMMENT ON COLUMN soft_skills.soft_id IS 'PK das soft skills.';
COMMENT ON COLUMN soft_skills.futebol IS 'Coluna do futebol.';
COMMENT ON COLUMN soft_skills.volei IS 'Coluna do volei.';
COMMENT ON COLUMN soft_skills.basquete IS 'Coluna de basquete.';
COMMENT ON COLUMN soft_skills.usuario_id IS 'PK do usuário.';


-- Create table para criar a tabela "contato" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE contato (
                contato_id NUMERIC NOT NULL,
                nome_completo VARCHAR(255) NOT NULL,
                mensagem VARCHAR NOT NULL,
                usuario_id NUMERIC NOT NULL,
                CONSTRAINT pk_contato PRIMARY KEY (contato_id)
);
-- Adicionar comentários individuais para a tabela e cada coluna da tabela "contato"
COMMENT ON TABLE contato IS 'Tabela do contato SAQ.';
COMMENT ON COLUMN contato.contato_id IS 'PK do contato do SAQ.';
COMMENT ON COLUMN contato.nome_completo IS 'Nome completo de quem mandará o SAQ.';
COMMENT ON COLUMN contato.mensagem IS 'Mensagem do SAQ.';
COMMENT ON COLUMN contato.usuario_id IS 'FK do id do usuário.';


-- Create table para criar a tabela "postagem" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE postagem (
                postagem_id NUMERIC NOT NULL,
                usuario_id NUMERIC NOT NULL,
                mensagem_postagem VARCHAR(400) NOT NULL,
                numero_curtida NUMERIC,
                comentario_postagem VARCHAR NOT NULL,
                CONSTRAINT pk_postagem PRIMARY KEY (postagem_id)
);
-- Adicionar comentários individuais para a tabela e cada coluna da tabela "postagem"
COMMENT ON TABLE postagem IS 'Tabela da postagem.';
COMMENT ON COLUMN postagem.postagem_id IS 'PK do id da postagem.';
COMMENT ON COLUMN postagem.usuario_id IS 'FK do id do usuário.';
COMMENT ON COLUMN postagem.mensagem_postagem IS 'Conteúdo da postagem.';
COMMENT ON COLUMN postagem.numero_curtida IS 'Numero de curtidas.';
COMMENT ON COLUMN postagem.comentario_postagem IS 'Comentários da postagem.';


-- Create table para criar a tabela "curtidas" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE curtidas (
                numero_de_curtidas_id NUMERIC NOT NULL,
                postagem_id NUMERIC NOT NULL,
                CONSTRAINT pk_curtidas PRIMARY KEY (numero_de_curtidas_id, postagem_id)
);
-- Adicionar comentários individuais para a tabela e cada coluna da tabela "curtidas"
COMMENT ON TABLE curtidas IS 'Tabela de curtidas.';
COMMENT ON COLUMN curtidas.numero_de_curtidas_id IS 'PK do numero de curtidas';
COMMENT ON COLUMN curtidas.postagem_id IS 'PFK do id da postagem.';


-- Create table para criar a tabela "comentarios" com suas colunas já tipadas com obrigatoriedades e primary key já definidas.
CREATE TABLE comentarios (
                postagem_id NUMERIC NOT NULL,
                comentario_id NUMERIC NOT NULL,
                mensagem_comentario VARCHAR NOT NULL,
                CONSTRAINT pk_comentarios PRIMARY KEY (postagem_id, comentario_id)
);
-- Adicionar comentários individuais para a tabela e cada coluna da tabela "comentarios"
COMMENT ON TABLE comentarios IS 'Tabela dos comentários.';
COMMENT ON COLUMN comentarios.postagem_id IS 'PFK do id da postagem.';
COMMENT ON COLUMN comentarios.comentario_id IS 'PK do id do comentário.';
COMMENT ON COLUMN comentarios.mensagem_comentario IS 'Conteúdo do comentário.';


/*
- Adicionar uma restrição de chave estrangeira na tabela 'postagem' chamada 'cadastro_postagem_fk'.
- Definir a coluna 'usuario_id' na tabela 'postagem' como uma referência para a coluna 'usuario_id' na tabela 'cadastro'.
- Definir que nenhuma ação será executada automaticamente em caso de exclusão ou atualização dos registros relacionados.
- Restrição não pode ser adiada.
*/
ALTER TABLE postagem ADD CONSTRAINT cadastro_postagem_fk
FOREIGN KEY (usuario_id)
REFERENCES cadastro (usuario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
- Adicionar uma restrição de chave estrangeira na tabela 'contato' chamada 'cadastro_contato_fk'.
- Definir a coluna 'usuario_id' na tabela 'contato' como uma referência para a coluna 'usuario_id' na tabela 'cadastro'.
- Definir que nenhuma ação será executada automaticamente em caso de exclusão ou atualização dos registros relacionados.
- Restrição não pode ser adiada.
*/
ALTER TABLE contato ADD CONSTRAINT cadastro_contato_fk
FOREIGN KEY (usuario_id)
REFERENCES cadastro (usuario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
- Adicionar uma restrição de chave estrangeira na tabela 'soft_skills' chamada 'cadastro_soft_skills_fk'.
- Definir a coluna 'usuario_id' na tabela 'soft_skills' como uma referência para a coluna 'usuario_id' na tabela 'cadastro'.
- Definir que nenhuma ação será executada automaticamente em caso de exclusão ou atualização dos registros relacionados.
- Restrição não pode ser adiada.
*/
ALTER TABLE soft_skills ADD CONSTRAINT cadastro_soft_skills_fk
FOREIGN KEY (usuario_id)
REFERENCES cadastro (usuario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
- Adicionar uma restrição de chave estrangeira na tabela 'hard_skills' chamada 'cadastro_hard_skills_fk'.
- Definir a coluna 'usuario_id' na tabela 'hard_skills' como uma referência para a coluna 'usuario_id' na tabela 'cadastro'.
- Definir que nenhuma ação será executada automaticamente em caso de exclusão ou atualização dos registros relacionados.
- Restrição não pode ser adiada.
*/
ALTER TABLE hard_skills ADD CONSTRAINT cadastro_hard_skills_fk
FOREIGN KEY (usuario_id)
REFERENCES cadastro (usuario_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
- Adicionar uma restrição de chave estrangeira na tabela 'comentarios' chamada 'postagem_comentarios_fk'.
- Definir a coluna 'usuario_id' na tabela 'comentarios' como uma referência para a coluna 'usuario_id' na tabela 'cadastro'.
- Definir que nenhuma ação será executada automaticamente em caso de exclusão ou atualização dos registros relacionados.
- Restrição não pode ser adiada.
*/
ALTER TABLE comentarios ADD CONSTRAINT postagem_comentarios_fk
FOREIGN KEY (postagem_id)
REFERENCES postagem (postagem_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

/*
- Adicionar uma restrição de chave estrangeira na tabela 'curtidas' chamada 'postagem_curtidas_fk'.
- Definir a coluna 'usuario_id' na tabela 'curtidas' como uma referência para a coluna 'usuario_id' na tabela 'cadastro'.
- Definir que nenhuma ação será executada automaticamente em caso de exclusão ou atualização dos registros relacionados.
- Restrição não pode ser adiada.
*/
ALTER TABLE curtidas ADD CONSTRAINT postagem_curtidas_fk
FOREIGN KEY (postagem_id)
REFERENCES postagem (postagem_id)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;