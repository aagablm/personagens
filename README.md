# Rick and Morty - Personagem Aleatório
> Projeto desenvolvido na disciplina de Desenvolvimento para Plataforma Móveis do curso de Sistema de Informações da UNIDAVI

## Funcionalidades

- **Gerar Personagem Aleatório**: Ao pressionar o botão de atualização, um personagem aleatório é carregado da API *Rick and Morty* e seus detalhes são exibidos.
- **Salvar Personagem**: O usuário pode salvar personagens para visualizá-los mais tarde.
- **Visualizar Personagens Salvos**: A lista de personagens salvos pode ser acessada em uma tela separada.

## Estrutura do Aplicativo


**Tela Principal**:
   - Exibe um personagem aleatório.
   - Permite gerar um novo personagem ao pressionar um botão.
   - Permite salvar o personagem atual para visualização futura.
     
![image](https://github.com/user-attachments/assets/7cbfb48f-ed6d-4748-a830-f73f005fe9e2)


**Tela de Personagens Salvos**:
   - Exibe uma lista dos personagens salvos.
     
![image](https://github.com/user-attachments/assets/b3429437-1dd4-410d-a9c0-6b9de4b00a39)

## Tecnologias Utilizadas

- **Flutter**: Framework para o desenvolvimento de aplicativos móveis.
- **HTTP**: Para fazer requisições à API *Rick and Morty*.
- **JSON**: Para manipulação dos dados recebidos da API.

## Como Rodar o Projeto

### Pré-requisitos

- Instale o [Flutter](https://flutter.dev/docs/get-started/install) em seu computador.
- Instale o Android Studio ou outro editor de sua escolha.

### Passos para rodar

1. Clone o repositório:
   ```bash
   git clone https://github.com/aagablm/personagens.git
   cd personagens

2. Instale as dependências:
   ```bash
   flutter pub get

3. Execute o aplicativo:
   ```bash
   flutter run
