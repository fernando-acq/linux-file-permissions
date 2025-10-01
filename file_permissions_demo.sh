#!/bin/bash

# ============================================
# Linux File Permissions - Script Demonstrativo
# Demonstra os comandos usados no projeto
# ============================================

echo "=========================================="
echo "Linux File Permissions - Demonstração"
echo "=========================================="
echo ""

# Verifica se o ambiente de teste existe
if [ ! -d "projects" ]; then
    echo "❌ Ambiente de teste não encontrado!"
    echo "Execute primeiro: ./setup_environment.sh"
    exit 1
fi

# ============================================
# Cenário 1: Verificar Detalhes dos Arquivos
# ============================================

echo "📂 Cenário 1: Listando arquivos e diretórios"
echo "Comando: ls -l projects/"
echo ""
ls -l projects/
echo ""

echo "📂 Listando arquivos incluindo ocultos"
echo "Comando: ls -la projects/"
echo ""
ls -la projects/
echo ""
read -p "Pressione Enter para continuar..."
echo ""

# ============================================
# Cenário 2: String de Permissões
# ============================================

echo "=========================================="
echo "📖 Cenário 2: Entendendo a String de Permissões"
echo "=========================================="
echo ""
echo "Estrutura: -rw-rw-rw-"
echo "           ├┬┬┬┬┬┬┬┬┬"
echo "           │││││││││└─ Outros: escrita (w)"
echo "           ││││││││└── Outros: leitura (r)"
echo "           │││││││└─── Outros: sem execução (-)"
echo "           ││││││└──── Grupo: escrita (w)"
echo "           │││││└───── Grupo: leitura (r)"
echo "           ││││└────── Grupo: sem execução (-)"
echo "           │││└─────── Usuário: escrita (w)"
echo "           ││└──────── Usuário: leitura (r)"
echo "           │└───────── Usuário: sem execução (-)"
echo "           └────────── Tipo: arquivo (-)"
echo ""
read -p "Pressione Enter para continuar..."
echo ""

# ============================================
# Cenário 3: Remover Permissão de Gravação para Outros
# ============================================

echo "=========================================="
echo "🔧 Cenário 3: Remover gravação de 'outros' em project_k.txt"
echo "=========================================="
echo ""
echo "Permissões ANTES:"
ls -l projects/project_k.txt
echo ""
echo "Executando: chmod o-w projects/project_k.txt"
chmod o-w projects/project_k.txt
echo ""
echo "Permissões DEPOIS:"
ls -l projects/project_k.txt
echo ""
echo "✅ Gravação removida de 'outros'"
echo ""
read -p "Pressione Enter para continuar..."
echo ""

# ============================================
# Cenário 4: Ajustar Permissões de Arquivo Oculto
# ============================================

echo "=========================================="
echo "🔧 Cenário 4: Ajustar permissões do arquivo oculto .project_x.txt"
echo "=========================================="
echo ""
echo "Permissões ANTES:"
ls -la projects/.project_x.txt
echo ""
echo "Executando: chmod u-w,g+r,g-w projects/.project_x.txt"
chmod u-w,g+r,g-w projects/.project_x.txt
echo ""
echo "Permissões DEPOIS:"
ls -la projects/.project_x.txt
echo ""
echo "✅ Agora apenas leitura para usuário e grupo"
echo ""
read -p "Pressione Enter para continuar..."
echo ""

# ============================================
# Cenário 5: Remover Permissão de Execução de Diretório
# ============================================

echo "=========================================="
echo "🔧 Cenário 5: Remover execução do grupo no diretório drafts"
echo "=========================================="
echo ""
echo "Permissões ANTES:"
ls -ld projects/drafts
echo ""
echo "Executando: chmod g-x projects/drafts"
chmod g-x projects/drafts
echo ""
echo "Permissões DEPOIS:"
ls -ld projects/drafts
echo ""
echo "✅ Grupo não pode mais acessar o diretório drafts"
echo ""
read -p "Pressione Enter para continuar..."
echo ""

# ============================================
# Resumo Final
# ============================================

echo "=========================================="
echo "✅ Demonstração Concluída!"
echo "=========================================="
echo ""
echo "Resumo das alterações realizadas:"
echo ""
echo "1. ✅ Verificamos permissões com ls -l e ls -la"
echo "2. ✅ Removemos gravação de 'outros' em project_k.txt"
echo "3. ✅ Ajustamos permissões do arquivo oculto .project_x.txt"
echo "4. ✅ Removemos execução do grupo no diretório drafts"
echo ""
echo "Estado final dos arquivos:"
ls -la projects/
echo ""
echo "Para restaurar o ambiente, execute novamente:"
echo "./setup_environment.sh"
echo ""