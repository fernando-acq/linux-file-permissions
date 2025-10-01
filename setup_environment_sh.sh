#!/bin/bash

# ============================================
# Linux File Permissions - Setup do Ambiente
# Cria estrutura de arquivos e diretórios para testes
# ============================================

echo "=========================================="
echo "Configurando Ambiente de Teste"
echo "=========================================="
echo ""

# Remove ambiente anterior se existir
if [ -d "projects" ]; then
    echo "🗑️  Removendo ambiente anterior..."
    rm -rf projects
fi

# Cria diretório principal
echo "📁 Criando diretório projects..."
mkdir -p projects

# Cria subdiretório drafts
echo "📁 Criando subdiretório drafts..."
mkdir -p projects/drafts

# Cria arquivos regulares
echo "📄 Criando arquivos de projeto..."
touch projects/project_k.txt
touch projects/project_m.txt
touch projects/project_r.txt
touch projects/project_t.txt

# Cria arquivo oculto
echo "📄 Criando arquivo oculto .project_x.txt..."
touch projects/.project_x.txt

# Adiciona conteúdo aos arquivos
echo "Este é o projeto K" > projects/project_k.txt
echo "Este é o projeto M" > projects/project_m.txt
echo "Este é o projeto R" > projects/project_r.txt
echo "Este é o projeto T" > projects/project_t.txt
echo "Este é o projeto X (oculto)" > projects/.project_x.txt

# Adiciona arquivo no subdiretório drafts
touch projects/drafts/draft1.txt
echo "Rascunho 1" > projects/drafts/draft1.txt

# Configura permissões iniciais conforme o projeto
echo "🔧 Configurando permissões iniciais..."

# project_k.txt com permissões rw-rw-rw- (666)
chmod 666 projects/project_k.txt

# Outros arquivos com permissões variadas
chmod 644 projects/project_m.txt
chmod 664 projects/project_r.txt
chmod 644 projects/project_t.txt

# Arquivo oculto com permissões rw--w---- (620)
chmod 620 projects/.project_x.txt

# Diretório drafts com permissões drwxr-xr-x (755)
chmod 755 projects/drafts

# Arquivo dentro de drafts
chmod 644 projects/drafts/draft1.txt

echo ""
echo "✅ Ambiente de teste criado com sucesso!"
echo ""
echo "Estrutura criada:"
echo ""
ls -la projects/
echo ""
echo "Para executar a demonstração, use:"
echo "./file_permissions_demo.sh"
echo ""