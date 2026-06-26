# Menu de Disciplinas — Azulejo DSL

Projeto 2 da disciplina de Linguagens de Programação.

## O que o programa faz

Apresenta um menu interativo no terminal com três disciplinas do curso:
**Computação Gráfica**, **Paradigmas de Programação** e **Física Computacional**.

Ao selecionar uma disciplina, o terminal exibe informações como nome do professor,
horário, sala e ementa. Em seguida, o runtime **LÖVE2D** abre uma janela com uma
pixel art temática desenhada em Azulejo (`.azlj`) representando aquela matéria.
Fechar a janela retorna ao menu.

Os três arquivos `.azlj` foram escritos manualmente:

| Arquivo | Arte |
|---|---|
| `disciplinas/comp_grafica.azlj` | Monitor com o Homem de Ferro |
| `disciplinas/paradigmas.azlj`   | Símbolo lambda (λ) |
| `disciplinas/fisica.azlj`       | Átomo |

## Dependências

| Ferramenta | Versão testada | Link |
|---|---|---|
| Lua | 5.4 | https://www.lua.org |
| LÖVE2D | 11.x | https://love2d.org |

### Instalação rápida (Ubuntu/Debian)

```bash
sudo apt install lua5.4 love
```

### macOS (Homebrew)

```bash
brew install lua
brew install --cask love
```

### Windows

Baixe os instaladores em lua.org e love2d.org e adicione ambos ao PATH.

## Como executar

```bash
# Clone o repositório (ou extraia o zip)
git clone https://github.com/seu-usuario/azulejo-menu.git
cd azulejo-menu

# Rode o menu
lua menu.lua
```

Navegue com os números `1`, `2` ou `3` e pressione ENTER.  
Use `0` para sair.

> **Sem LÖVE2D instalado?** O menu ainda funciona normalmente; só a janela gráfica
> não será aberta. Uma mensagem de aviso aparecerá no terminal.

## Estrutura do projeto

```
azulejo-menu/
├── menu.lua                        # ponto de entrada — menu interativo
├── README.md
├── disciplinas/
│   ├── comp_grafica.azlj           # pixel art: Computação Gráfica
│   ├── paradigmas.azlj             # pixel art: Paradigmas
│   └── fisica.azlj                 # pixel art: Física
└── source/                         # runtime Azulejo (equipe C — Projeto 1)
    ├── main.lua
    ├── tokenizer.lua
    ├── parser.lua
    ├── draw.lua
    ├── state.lua
    └── debug.lua
```

```
