# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## What this repository is

A personal SQL/MySQL study-notes repo, written in Brazilian Portuguese. There is no application, build, lint, or test suite. Write new notes and SQL comments in pt-BR to match.

- [README.md](README.md) is the main artifact: a tutorial on database modeling, MySQL types, DDL/DML, SELECT, joins, TCL, views, triggers, functions, procedures, and access control.
- [MySQL/Curso em vídeo/](MySQL/Curso%20em%20vídeo/) holds annotated example scripts, one folder per lesson (`NN-topic/`), following the "Curso em Vídeo" MySQL course in order.
- [MySQL/brModelo.jar](MySQL/brModelo.jar) is the brModelo ER-diagram tool (`java -jar MySQL/brModelo.jar`). `config.chc` and `autosave.chc` are its local config files. The `MySQL/Puc/...` path they mention is not in the repo.

## How README and scripts are linked

The README has two parts, split by a `---` rule. The top part presents the repo for a future portfolio: course, a table of lessons, tools, and how to run. It links to scripts with **relative, URL-encoded** paths (spaces as `%20`, parentheses as `%28`/`%29`). The study-notes part below explains each concept and links to the matching script with an **absolute GitHub URL**, e.g. `https://github.com/marcospontoexe/SQL/blob/main/MySQL/Curso%20em%20v%C3%ADdeo/07-select/select.sql`. Renaming or moving a lesson file or folder silently breaks links in both parts, so update the README whenever you do. A new lesson needs a numbered folder with its script, a row or subsection in "Projetos desenvolvidos", and the theory in the notes.

Sections from "SQL-TCL" onward (views, triggers, functions, procedures, GRANT/REVOKE) have inline code blocks only, with no linked script.

## Running the scripts

The target is MySQL. The dumps come from server 5.6 (`Dump-CeV01.sql`) and 8.0 (`backup.sql`). Hand-written scripts are meant to be run statement by statement in MySQL Workbench, not as whole files: they are not idempotent (e.g. `create database` without `if not exists`, and `drop` lines left commented out).

Lessons share state through the `cadastro` database:
- `01` creates a separate `pacientes` database.
- `02` creates `cadastro`, and lessons `03`–`05` work inside it. `04` and `05` have no `use` statement, so they assume `cadastro` is already selected.
- `07` and `08` assume the `cursos` and `gafanhotos` tables. Load them from the course dump first:
  ```
  mysql -u root -p < "MySQL/Curso em vídeo/07-select/Dump-CeV01.sql"
  ```

Column names differ between the dumps: `cursos.idcurso` in `Dump-CeV01.sql`, `cursos.id_curso` in `backup.sql`. In `n para n.sql`, `idcursos` is the foreign-key column of `gafanhotos_cursos` and `idcurso` is the primary key of `cursos`. Check the actual schema before "fixing" queries.

## Conventions in the SQL files

- Keywords are lowercase. Comments use `#`, placed inline after statements to explain each line (the dumps use `--`).
- Tables are created with `default charset = utf8`.
- Identifiers with accents are backtick-quoted (e.g. `` `profissão` ``).

## Environment notes

- `git` is not on the PowerShell PATH in this environment. Use the full path to git or another shell if git commands fail.
- `MySQL/Curso em vídeo/01-criando db/Novo Documento de Texto.txt` is a near-duplicate of `01-.sql`.

## Portfolio plan

The user plans a portfolio that will feature this repo alongside their other study repos (e.g. PHP). Decided so far (2026-10-01):

- **No GitHub Pages site for this repo alone.** The README already serves as the project page, and a Pages copy would duplicate it.
- **One portfolio site instead:** a user site in a repo named `marcospontoexe.github.io`, served at `https://marcospontoexe.github.io`. It has a short page per repo that links to that repo's README. GitHub Pages is static-only, so the PHP projects would appear as screenshots and code, or be hosted elsewhere.
- **Order:**
  1. A profile README in a repo named `marcospontoexe`.
  2. The portfolio site, once there are 3–4 presentable projects.
  3. Optionally, an in-browser SQL playground built with sql.js, where visitors query the `gafanhotos` table. This needs the MySQL dump converted to the SQLite dialect first.

None of these has been started. Keep the README overview section accurate, because it is what the portfolio will link to.

---

# Regra: Persistência de Contexto (Handoff entre sessões)

## Objetivo

Garantir que nenhum trabalho se perca quando a sessão atual se tornar demasiado longa. O agente deve gravar todo o estado da sessão num ficheiro de handoff, de forma que **qualquer outro chat consiga retomar exatamente de onde parou**, com o mesmo contexto.

---

## Gatilho

Execute o procedimento de salvamento abaixo **antes de continuar qualquer tarefa** sempre que uma das seguintes condições for atingida:
1. A conversa prolongar-se por muitas interações (aproximando-se do limite prático da janela de contexto).
2. Uma funcionalidade ou milestone importante for concluída.
3. O utilizador disser explicitamente: `salvar contexto`, `handoff` ou `checkpoint`.

---

## Procedimento de salvamento

1. **Termine** a tarefa atual.
2. Crie ou atualize o arquivo **`CONTEXTO.md`** na raiz do projeto.
   - Se já existir, **atualize** as seções em vez de duplicar (mantenha o histórico relevante, remova o que já foi superado).
   - Sempre atualize o campo de data/hora e o número da sessão.
3. Preencha **todas** as seções do template abaixo. Não deixe seções vazias — escreva "nenhum" quando não houver conteúdo.
4. Confirme ao usuário que o contexto foi salvo e informe o caminho do arquivo.
5. **Gestão do CONTEXTO.md:**  Mantenha o CONTEXTO.md enxuto. Ele segue o template abaixo, mas cada seção deve ter só o resumo. Quando um tópico precisar de mais detalhe (uma decisão longa, um passo a passo, etc.), escreva-o num ficheiro em DOCS/ na raiz do projeto e coloque no CONTEXTO.md apenas o link para ele. O objetivo é não sobrecarregar a janela de contexto ao ler o CONTEXTO.md. Se precisar de mais informações sobre um tópico, abra o ficheiro específico em DOCS/.

---

## Template do `CONTEXTO.md`

```markdown
# CONTEXTO DA SESSÃO

- **Última atualização:** AAAA-MM-DD HH:MM
- **Sessão nº:** N
- **Status geral:** (em andamento | bloqueado | pronto para revisão)

## 1. Objetivo da tarefa
Descrição em 1–3 frases do que estamos tentando alcançar (o "porquê").

## 2. Já feito ✅
- Itens concluídos, com o(s) arquivo(s) afetado(s).
- Ex.: "Implementado endpoint POST /login em `src/auth.py`"

## 3. Em andamento 🔧
- O que estava sendo feito no momento do checkpoint.
- Em qual arquivo/linha parei e qual era o próximo passo imediato.

## 4. Próximos passos (planejado) 📋
- Lista ordenada do que falta fazer.
- Quanto mais específico, melhor (arquivo, função, comportamento esperado).

## 5. Decisões e raciocínio 🧠
- Escolhas técnicas feitas e o porquê.
- Alternativas descartadas (para evitar refazer a análise).
- Suposições assumidas.

## 6. Estado do projeto / ambiente
- Arquivos-chave e o papel de cada um.
- Branch git atual, alterações não commitadas, migrations pendentes, etc.
- Variáveis de ambiente ou dependências relevantes.

## 7. Bloqueios e pendências ⚠️
- Erros não resolvidos, dúvidas para o usuário, decisões aguardando aprovação.

## 8. Comandos úteis
- Comandos para rodar/testar/buildar o projeto.
- Ex.: `npm run dev`, `pytest tests/`, etc.

## 9. Como retomar
Instrução direta para o próximo chat: "Leia este arquivo e continue a partir
da seção 3 / passo X."
```

---

## Como retomar em um novo chat

No início de qualquer nova sessão, o agente deve:

1. Verificar se existe o ficheiro `CONTEXTO.md` na raiz do projeto .
2. Se existir, **lê-lo por completo antes de qualquer outra ação**.
3. Resumir ao utilizador em 2–3 linhas onde o trabalho parou e qual é o próximo passo, e então continuar.

> Comando sugerido para o utilizador iniciar um novo chat:
> **"Leia o `CONTEXTO.md` e continue de onde a sessão anterior parou."**

---

## Boas práticas

- **Escreva para um estranho:** o próximo chat não tem memória nenhuma; seja explícito.
- **Caminhos absolutos ou relativos à raiz**, nunca referências vagas ("aquele arquivo").
- **Não salve segredos** (tokens, senhas, chaves) no `CLAUDE.md` e `CONTEXTO.md`.
- **Um arquivo por projeto:** mantenha `CONTEXTO.md` enxuto; arquive versões antigas em `CONTEXTO.arquivo.md` se necessário.
- **Commit opcional:** se o usuário usar git, ofereça commitar o `CONTEXTO.md` para que ele persista entre máquinas.
- **Feedback de alterações:** Caso algum ficheiro seja alterado durante a sessão, informe sempre qual o ficheiro e o que foi alterado no final de cada mensagem.
- **referenciar diretórios e arquivos atraves de links:** Sempre que se referir a um diretório ou arquivo local, use link e não backticks.
