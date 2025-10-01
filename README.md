# 🐧 Linux File Permissions

Gerenciamento de permissões de arquivos e diretórios no Linux utilizando comandos `ls`, `chmod` e boas práticas de segurança.

## 📋 Descrição

Este projeto aborda a gestão de permissões de arquivos e diretórios no Linux, demonstrando o uso dos comandos `ls -l`, `ls -la` e `chmod`. Durante o desenvolvimento, foram analisadas e ajustadas permissões em diferentes cenários - incluindo arquivos regulares, diretórios e arquivos ocultos - para garantir que apenas usuários autorizados tenham acesso adequado (leitura, gravação e execução).

O projeto reforça boas práticas de segurança na configuração de sistemas Linux, essenciais para ambientes corporativos e de cibersegurança.

## 🎯 Objetivos do Projeto

- Demonstrar o uso correto de comandos Linux para gestão de permissões
- Aplicar o princípio de menor privilégio em arquivos e diretórios
- Interpretar e modificar strings de permissões
- Garantir controle de acesso adequado em diferentes cenários
- Proteger arquivos sensíveis e ocultos

## 🛠️ Tecnologias Utilizadas

- **Linux** (Bash shell)
- Comandos: `ls`, `chmod`, `cd`
- Gestão de permissões de arquivo
- Navegação em sistema de arquivos

## 📁 Estrutura do Projeto

```
linux-file-permissions/
│
├── README.md                    # Documentação do projeto
├── file_permissions_demo.sh     # Script demonstrativo dos comandos
├── permissions_guide.md         # Guia de referência rápida
└── setup_environment.sh         # Script para criar ambiente de teste
```

## 🚀 Como Usar

### Pré-requisitos

- Sistema Linux ou macOS
- Acesso ao terminal/shell
- Permissões básicas de usuário

### Configuração do Ambiente de Teste

1. **Clone o repositório:**
   ```bash
   git clone https://github.com/fernando-acq/linux-file-permissions.git
   cd linux-file-permissions
   ```

2. **Configure o ambiente de teste:**
   ```bash
   chmod +x setup_environment.sh
   ./setup_environment.sh
   ```

3. **Execute o script demonstrativo:**
   ```bash
   chmod +x file_permissions_demo.sh
   ./file_permissions_demo.sh
   ```

## 📊 Cenários Práticos

### 🔹 Cenário 1: Verificar Detalhes de Arquivos e Diretórios

**Comando para listar arquivos:**
```bash
ls -l
```

**Comando para listar arquivos incluindo ocultos:**
```bash
ls -la
```

**Exemplo de saída:**
```
-rw-rw-rw- 1 user group  1024 Jan 15 10:30 project_k.txt
drwxr-xr-x 2 user group  4096 Jan 15 10:25 drafts
-rw--w---- 1 user group   512 Jan 15 10:20 .project_x.txt
```

---

### 🔹 Cenário 2: Entender a String de Permissões

Uma string de permissões possui **10 caracteres** que definem as permissões:

```
-rw-rw-rw-
│├─┼─┼─┼─┘
│ │ │ └── Permissões para Outros (other)
│ │ └──── Permissões para Grupo (group)
│ └────── Permissões para Usuário (user)
└──────── Tipo de arquivo
```

**Caracteres:**
- **1º caractere:** Tipo (`d` = diretório, `-` = arquivo regular)
- **2º-4º:** Permissões do usuário (user)
- **5º-7º:** Permissões do grupo (group)
- **8º-10º:** Permissões para outros (other)

**Permissões:**
- `r` = leitura (read)
- `w` = gravação (write)
- `x` = execução (execute)
- `-` = sem permissão

**Exemplo:** `-rw-rw-rw-`
- É um **arquivo** (não diretório)
- **Usuário:** leitura e gravação (rw-)
- **Grupo:** leitura e gravação (rw-)
- **Outros:** leitura e gravação (rw-)

---

### 🔹 Cenário 3: Remover Permissão de Gravação para Outros

**Problema:** A política da organização restringe permissão de gravação para outros usuários.

**Arquivo original:**
```
-rw-rw-rw- project_k.txt
```

**Comando para remover gravação de "outros":**
```bash
chmod o-w project_k.txt
```

**Resultado:**
```
-rw-rw-r-- project_k.txt
```

**Verificar alteração:**
```bash
ls -l project_k.txt
```

---

### 🔹 Cenário 4: Ajustar Permissões de Arquivo Oculto

**Problema:** Arquivo oculto `.project_x.txt` precisa ter apenas leitura para usuário e grupo.

**Arquivo original:**
```
-rw--w---- .project_x.txt
```

**Comando para remover gravação do usuário e adicionar leitura ao grupo:**
```bash
chmod u-w,g+r,g-w .project_x.txt
```

**Resultado:**
```
-r--r----- .project_x.txt
```

**Verificar alteração:**
```bash
ls -la .project_x.txt
```

---

### 🔹 Cenário 5: Remover Permissão de Execução de Diretório

**Problema:** O grupo não deve ter permissão de execução no diretório `drafts`.

**Diretório original:**
```
drwxr-xr-x drafts
```

**Comando para remover execução do grupo:**
```bash
chmod g-x drafts
```

**Resultado:**
```
drwxr--r-x drafts
```

**Verificar alteração:**
```bash
ls -l
```

## 🔐 Tabela de Permissões Numéricas

| Permissão | Binário | Decimal |
|-----------|---------|---------|
| ---       | 000     | 0       |
| --x       | 001     | 1       |
| -w-       | 010     | 2       |
| -wx       | 011     | 3       |
| r--       | 100     | 4       |
| r-x       | 101     | 5       |
| rw-       | 110     | 6       |
| rwx       | 111     | 7       |

**Exemplo de uso numérico:**
```bash
chmod 644 arquivo.txt  # rw-r--r--
chmod 755 script.sh    # rwxr-xr-x
chmod 600 senha.txt    # rw-------
```

## 💡 Comandos Úteis

### Listar Permissões
```bash
ls -l                 # Lista arquivos com permissões
ls -la                # Lista todos incluindo ocultos
ls -ld diretorio/     # Lista permissões do diretório
```

### Modificar Permissões (Modo Simbólico)
```bash
chmod u+x arquivo     # Adiciona execução ao usuário
chmod g-w arquivo     # Remove gravação do grupo
chmod o=r arquivo     # Define apenas leitura para outros
chmod a+r arquivo     # Adiciona leitura para todos (all)
```

### Modificar Permissões (Modo Numérico)
```bash
chmod 644 arquivo     # rw-r--r--
chmod 755 script      # rwxr-xr-x
chmod 600 senha       # rw-------
```

### Navegar entre Diretórios
```bash
cd projects           # Entra no diretório projects
cd ..                 # Volta um nível
cd ~                  # Vai para home
pwd                   # Mostra diretório atual
```

## 🎓 Boas Práticas de Segurança

1. ✅ **Princípio de Menor Privilégio:** Conceda apenas as permissões necessárias
2. ✅ **Arquivos Sensíveis:** Use `600` ou `400` para arquivos com dados sensíveis
3. ✅ **Scripts Executáveis:** Use `755` ou `750` para scripts
4. ✅ **Diretórios:** Permissão de execução é necessária para acessar conteúdo
5. ✅ **Arquivos Ocultos:** Proteja arquivos de configuração com permissões restritivas

## 📚 Conceitos Aplicados

- **Controle de Acesso Baseado em Permissões**
- **Princípio de Menor Privilégio**
- **Gestão de Arquivos no Sistema Linux**
- **Interpretação de Strings de Permissões**
- **Segurança em Ambientes Multiusuário**

## 🔒 Aplicações em Cibersegurança

Este projeto demonstra habilidades essenciais para:

- ✅ **Hardening de Sistemas:** Configuração segura de permissões
- ✅ **Administração Linux:** Gestão de acessos em servidores
- ✅ **Segurança de Dados:** Proteção de arquivos sensíveis
- ✅ **Compliance:** Conformidade com políticas de segurança
- ✅ **Incident Response:** Análise de permissões em investigações

## 🤝 Contribuições

Sugestões e melhorias são bem-vindas! Sinta-se à vontade para abrir issues ou pull requests.

## 📝 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 👤 Autor

**Fernando Acquesta**
- GitHub: [@fernando-acq](https://github.com/fernando-acq)
- LinkedIn: [Fernando Acquesta](https://www.linkedin.com/in/fernando-acquesta-cybersecurity)

---

⭐ Se este projeto ajudou você a entender melhor permissões no Linux, considere dar uma estrela no repositório!
