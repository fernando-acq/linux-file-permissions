# 📖 Guia Rápido de Permissões Linux

Referência rápida para comandos e conceitos de permissões de arquivos no Linux.

---

## 📊 Estrutura da String de Permissões

```
-rwxrwxrwx
│├─┼─┼─┼─┘
│ │ │ └─── outros (other)
│ │ └───── grupo (group)
│ └─────── usuário (user)
└───────── tipo
```

### Tipos de Arquivo
- `-` = arquivo regular
- `d` = diretório
- `l` = link simbólico

### Permissões
- `r` = leitura (read) - valor 4
- `w` = gravação (write) - valor 2
- `x` = execução (execute) - valor 1
- `-` = sem permissão - valor 0

---

## 🔢 Permissões Numéricas (Modo Octal)

| Permissão | Binário | Decimal | Descrição |
|-----------|---------|---------|-----------|
| `---`     | 000     | 0       | Nenhuma permissão |
| `--x`     | 001     | 1       | Apenas execução |
| `-w-`     | 010     | 2       | Apenas gravação |
| `-wx`     | 011     | 3       | Gravação e execução |
| `r--`     | 100     | 4       | Apenas leitura |
| `r-x`     | 101     | 5       | Leitura e execução |
| `rw-`     | 110     | 6       | Leitura e gravação |
| `rwx`     | 111     | 7       | Todas as permissões |

### Exemplos Comuns

```bash
chmod 644 arquivo.txt    # rw-r--r-- (arquivos normais)
chmod 755 script.sh      # rwxr-xr-x (scripts executáveis)
chmod 600 senha.txt      # rw------- (arquivos sensíveis)
chmod 700 privado/       # rwx------ (diretório privado)
chmod 777 publico/       # rwxrwxrwx (acesso total - EVITE!)
```

---

## 💻 Comandos Básicos

### Listar Permissões

```bash
ls -l                    # Lista arquivos com permissões
ls -la                   # Inclui arquivos ocultos
ls -ld diretorio/        # Mostra permissões do diretório
```

### Modo Simbólico

**Sintaxe:** `chmod [quem][operação][permissão] arquivo`

**Quem:**
- `u` = usuário (user)
- `g` = grupo (group)
- `o` = outros (other)
- `a` = todos (all)

**Operação:**
- `+` = adiciona permissão
- `-` = remove permissão
- `=` = define permissão exata

**Exemplos:**
```bash
chmod u+x script.sh      # Adiciona execução ao usuário
chmod g-w arquivo.txt    # Remove gravação do grupo
chmod o-rwx privado.txt  # Remove todas de outros
chmod a+r publico.txt    # Adiciona leitura para todos
chmod u=rw,g=r,o= dados  # Define permissões específicas
```

### Modo Numérico

```bash
chmod 644 arquivo        # rw-r--r--
chmod 755 diretorio      # rwxr-xr-x
chmod 600 senha          # rw-------
chmod 400 readonly       # r--------
```

---

## 🔐 Casos de Uso Comuns

### Arquivos de Configuração
```bash
chmod 600 ~/.ssh/id_rsa           # Chave SSH privada
chmod 644 ~/.ssh/config           # Configuração SSH
chmod 644 /etc/config.conf        # Arquivos de config
```

### Scripts e Executáveis
```bash
chmod 755 script.sh               # Script executável por todos
chmod 750 admin_script.sh         # Executável apenas para user/group
chmod +x programa                 # Torna arquivo executável
```

### Diretórios
```bash
chmod 755 /var/www/html           # Diretório web público
chmod 700 ~/privado               # Diretório privado
chmod 775 /var/shared             # Compartilhado com grupo
```

### Arquivos Sensíveis
```bash
chmod 600 senhas.txt              # Apenas dono pode ler/escrever
chmod 400 certificado.pem         # Apenas dono pode ler
chmod 000 bloqueado.txt           # Ninguém pode acessar
```

---

## 🚫 O Que EVITAR

### ❌ Permissões Perigosas
```bash
chmod 777 arquivo        # NUNCA faça isso!
chmod 666 script.sh      # Executável sem permissão de execução
chmod -R 777 /           # EXTREMAMENTE PERIGOSO!
```

### ⚠️ Por que 777 é perigoso?
- Qualquer usuário pode modificar o arquivo
- Possibilita injeção de código malicioso
- Viola o princípio de menor privilégio
- Pode comprometer a segurança do sistema

---

## ✅ Boas Práticas

1. **Princípio de Menor Privilégio**
   - Conceda apenas permissões necessárias
   - Use `chmod 600` para arquivos sensíveis
   - Use `chmod 700` para diretórios privados

2. **Arquivos Executáveis**
   - Scripts: `755` ou `750`
   - Binários: `755`
   - Scripts administrativos: `700`

3. **Arquivos de Dados**
   - Leitura/escrita pessoal: `600`
   - Leitura por todos: `644`
   - Compartilhado com grupo: `660` ou `640`

4. **Diretórios**
   - Privado: `700`
   - Compartilhado: `750` ou `755`
   - Público (apenas leitura): `755`

---

## 🔍 Verificação Rápida

### Identificar Problemas de Permissões
```bash
# Arquivos com permissão 777 (perigoso)
find /caminho -type f -perm 0777

# Arquivos modificáveis por todos
find /caminho -type f -perm /o+w

# Diretórios acessíveis por todos
find /caminho -type d -perm /o+x
```

### Verificar Permissões de Arquivos Importantes
```bash
ls -l ~/.ssh/id_rsa              # Deve ser 600
ls -l /etc/passwd                # Deve ser 644
ls -ld /root                     # Deve ser 700
```

---

## 🎓 Exemplos Práticos do Projeto

### Remover Gravação de Outros
```bash
# Antes: -rw-rw-rw-
chmod o-w project_k.txt
# Depois: -rw-rw-r--
```

### Ajustar Arquivo Oculto
```bash
# Antes: -rw--w----
chmod u-w,g+r,g-w .project_x.txt
# Depois: -r--r-----
```

### Remover Execução de Grupo
```bash
# Antes: drwxr-xr-x
chmod g-x drafts
# Depois: drwxr--r-x
```

---

## 📚 Recursos Adicionais

- `man chmod` - Manual do comando chmod
- `man ls` - Manual do comando ls
- `info coreutils` - Informações sobre utilitários GNU

---

**💡 Dica:** Sempre teste comandos de permissões em ambiente controlado antes de aplicar em produção!