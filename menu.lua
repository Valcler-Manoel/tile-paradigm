-- menu.lua
-- Executa via: lua menu.lua
-- Apresenta menu de disciplinas no terminal e abre o arquivo .azlj correspondente

local disciplinas = {
    {
        nome    = "Computacao Grafica",
        codigo  = "CG301",
        prof    = "IALIS CAVALCANTE DE PAULA JUNIOR",
        email   = "ialis@ufc.br",
        ementa  = "Pipeline grafico, rasterizacao, shaders, transformacoes 3D.",
        horario = "Terca e Quinta, 10h-12h",
        sala    = "Sala 11",
        arquivo = "disciplinas/comp_grafica.azlj",
    },
    {
        nome    = "Paradigmas de Programacao",
        codigo  = "PP214",
        prof    = "EVILASIO COSTA JUNIOR",
        email   = "junior.facanha@gmail.com",
        ementa  = "Paradigmas funcional, logico, imperativo e orientado a objetos.",
        horario = "Quarta e Sexta, 10h-12h",
        sala    = "Sala 9",
        arquivo = "disciplinas/paradigmas.azlj",
    },
    {
        nome    = "Fisica Computacional",
        codigo  = "FC180",
        prof    = "LUIS EDUARDO ARARIPE GOMES DA SILVA",
        email   = "luis@fisica.ufc.br",
        ementa  = "Mecanica classica, eletromagnetismo, simulacoes numericas.",
        horario = "Terca e Sexta, 08h-10h",
        sala    = "Sala 02",
        arquivo = "disciplinas/fisica.azlj",
    }
}


local function is_windows()
    return package.config:sub(1,1) == "\\"
end

-- Retorna o comando correto do love2d para o SO atual
local function love_cmd()
    if is_windows() then
        -- Caminhos comuns de instalacao no Windows
        local paths = {
            '"C:\\Program Files\\LOVE\\love.exe"',
            '"C:\\Program Files (x86)\\LOVE\\love.exe"',
        }
        for _, p in ipairs(paths) do
            -- testa se o executavel existe
            if os.execute(p .. " --version > NUL 2>&1") then
                return p
            end
        end
        return '"C:\\Program Files\\LOVE\\love.exe"' -- fallback
    end
    return "love"
end


local function cls()
    if is_windows() then
        os.execute("cls")
    else
        os.execute("clear")
    end
end

local function linha(char, n)
    char = char or "-"
    n    = n    or 48
    print(string.rep(char, n))
end

local function cabecalho()

    print("        MENU - AZULEJO")
end

local function pausar()
    io.write("\nPressione ENTER para voltar ao menu...")
    io.read()
end

local function sleep(s)
    if is_windows() then
        os.execute("timeout /t " .. s .. " > NUL")
    else
        os.execute("sleep " .. s)
    end
end

-- Exibe a disciplina

local function exibir_disciplina(d)
    cls()
    linha("-", 48)
    print(string.format("  [%s] %s", d.codigo, d.nome))
    linha("-", 48)
    print(string.format("  Professor : %s", d.prof))
    print(string.format("  Horario   : %s", d.horario))
    print(string.format("  Sala      : %s", d.sala))
    linha("-", 48)
    print("  Ementa:")
    print("  " .. d.ementa)
    linha("-", 48)
    print("\n  Abrindo visualizacao pixel art no Azulejo...")
    print("  (feche a janela para voltar ao menu)\n")

    local exe = love_cmd()
    local cmd
    if is_windows() then
        cmd = string.format('cmd /C "%s source/ %s"', exe, d.arquivo)
    else
        cmd = string.format('%s source/ "%s"', exe, d.arquivo)
    end
    local ok  = os.execute(cmd)

    if not ok then
        print("  [aviso] LOVE2D nao encontrado ou nao executou.")
        print("  Baixe em: https://love2d.org  e instale no caminho padrao.")
    end

    pausar()
end

-- Loop do menu

local function menu_principal()
    while true do
        cls()
        cabecalho()
        print("\n  Escolha uma disciplina:\n")

        for i, d in ipairs(disciplinas) do
            print(string.format("  [%d] %s", i, d.nome))
        end

        print("\n  [0] Sair")
        linha("-", 48)
        io.write("  Opcao: ")

        local entrada = io.read()

        if entrada == nil then
            print("\n  Encerrando...\n")
            break
        end

        local opcao = tonumber(entrada)

        if opcao == 0 then
            cls()
            print("\n  Ate logo!\n")
            break
        elseif opcao and disciplinas[opcao] then
            exibir_disciplina(disciplinas[opcao])
        else
            print("\n  Opcao invalida. Tente novamente.")
            sleep(1)
        end
    end
end

-- ponto de entrada
menu_principal()
