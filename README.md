## 🧠 Prompt Completo para Desenvolvimento do App em Flutter

Crie um aplicativo Flutter com base no layout da imagem enviada, cujo objetivo é gerenciar tarefas diárias por meio de um calendário. O projeto deve conter as seguintes **telas, funcionalidades e regras de negócio**, além de uma integração com o **Firebase** para persistência de dados.

---

### 🖼️ Estrutura Visual e Telas (baseado na imagem)

1. **Tela de Boas-vindas**

   * Mensagem de boas-vindas com nome do usuário e RA.
   * Design limpo e minimalista.
   * Acesso apenas para usuários autenticados.

2. **Tela de Login**

   * Campos: `Email` e `Senha`.
   * Botão "Entrar".
   * Link para cadastro.
   * Layout roxo gradiente com ícone no topo.

3. **Tela de Cadastro**

   * Campos: `Email` e `Senha`.
   * Botão "Cadastrar".
   * Mesmo layout da tela de login.

4. **Tela de Calendário**

   * Exibe um calendário (ex: pacote `table_calendar`).
   * Botão "Selecionar o dia".
   * Após a seleção, redireciona para a tela de tarefas daquele dia.

5. **Tela de Lista de Tarefas**

   * Exibe a data selecionada.
   * Lista com ícones:

     * 🔵 Tarefa em andamento.
     * ✅ Tarefa concluída.
   * Botão flutuante de adição (`FloatingActionButton` com ícone `+`).

6. **Tela de Adicionar Tarefa**

   * Campo de texto.
   * Botão “Adicionar tarefa”.
   * As tarefas são criadas como **não concluídas** por padrão.

---

### 🔧 Funcionalidades Obrigatórias

* [x] **Autenticação com Firebase Authentication**:

  * Cadastro e login com email/senha.
  * Exibição de nome e RA após login.

* [x] **Gerenciamento de Tarefas com Firebase Firestore**:

  * Cada tarefa contém: `nome`, `status` (pendente/concluída), `data`, `userId`.
  * Ao listar:

    * Exibir **pendentes primeiro**, depois **concluídas**, ambos em **ordem alfabética**.

* [x] **CRUD de Tarefas**:

  * Adicionar tarefa (input + botão).
  * Marcar como concluída (checkbox ou botão).
  * Remover tarefa (opcional: botão de excluir).
  * As alterações são refletidas imediatamente na lista.

* [x] **Persistência de dados por usuário**:

  * Cada usuário só vê suas tarefas.
  * Firebase organiza as tarefas por UID.

* [x] **Interface Responsiva e Colorida**:

  * Usar esquema de cores vibrantes (baseado em roxo com degradê).
  * Evitar padrões visuais comuns.
  * Padding e arredondamento suave nas caixas e botões.

---

### 📦 Estrutura do Projeto Flutter (sugestão)

```
/lib
 ┣ main.dart
 ┣ /screens
 ┃ ┣ login_screen.dart
 ┃ ┣ register_screen.dart
 ┃ ┣ calendar_screen.dart
 ┃ ┣ task_list_screen.dart
 ┃ ┗ add_task_screen.dart
 ┣ /widgets
 ┃ ┣ task_item.dart
 ┃ ┗ custom_button.dart
 ┣ /models
 ┃ ┗ task_model.dart
 ┣ /services
 ┃ ┣ auth_service.dart
 ┃ ┗ firestore_service.dart
```

---

### 🔐 Firebase Setup

1. **Crie um projeto no Firebase**.
2. Ative **Authentication (email/senha)**.
3. Ative **Firestore Database** com regras de leitura/escrita por usuário autenticado.
4. Instale e configure os pacotes Flutter:

   ```yaml
   firebase_core: ^2.x.x
   firebase_auth: ^4.x.x
   cloud_firestore: ^5.x.x
   provider: ^6.x.x
   table_calendar: ^3.x.x
   ```

---

### ✅ Conclusão Técnica (exemplo para escrever no campo “RESPOSTA DO ALUNO”)

> Desenvolvi o aplicativo utilizando Flutter com integração ao Firebase Authentication para login/cadastro e Cloud Firestore para persistência das tarefas. A navegação entre telas foi implementada com `Navigator`. Utilizei `StreamBuilder` para atualizar as tarefas em tempo real. A estrutura do projeto foi modularizada com diretórios para telas, modelos, serviços e widgets reutilizáveis. As tarefas são ordenadas conforme a regra do enunciado: pendentes primeiro e ordenadas alfabeticamente. O layout foi inspirado no modelo fornecido, com cores vibrantes, ícones intuitivos e responsividade. Optei por usar o pacote `table_calendar` para facilitar a seleção de datas. Concluí todos os requisitos funcionais e as telas foram testadas no simulador do Android Studio.

---

### 🖼️ Prints a serem entregues

* Tela de **Login/Cadastro** (1 imagem)
* Tela de **Calendário** (1 imagem)
* Tela de **Tarefas com adição** (1 imagem)
