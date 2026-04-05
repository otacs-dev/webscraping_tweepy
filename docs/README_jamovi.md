# Análise Estatística Híbrida - Google Ads & Meta Ads | Jamovi

Bem-vindo! Você recebeu **3 arquivos R** estruturados para sua análise estatística no Jamovi.

---

## Arquivos Inclusos

### 1. **analise_hibrida_jamovi.R** (PRINCIPAL)
   - ✅ Script completo pronto para copiar/colar no **Rj Editor** do Jamovi
   - Contém toda a análise estatística necessária
   - Estruturado em 3 partes:
     - **Parte 1**: Análise detalhada dos dados sintéticos (300 opiniões)
     - **Parte 2**: Resumo descritivo dos dados reais (12 tweets)
     - **Parte 3**: Notas metodológicas

### 2. **guia_uso_jamovi.R** (INSTRUÇÕES)
   - 📖 Passo a passo completo de como usar o script
   - Como preparar seus dados no Jamovi
   - Como interpretar cada seção de resultados
   - Solução de problemas comuns

### 3. **cheat_sheet_interpretacao.R** (REFERÊNCIA)
   - 🎯 Exemplos práticos de como ler resultados ANOVA
   - Modelos de texto para escrever no seu TCC
   - Testes post-hoc (Tukey)
   - Verificação de pressupostos
   - Estrutura sugerida para seção de resultados

---

## 5 passos

### Passo 1: Abra o Jamovi
```
Instale Jamovi em: https://www.jamovi.org/
```

### Passo 2: Importe seus datasets
- **Arquivo 1**: `dataset_simulado_300_opinoes.csv` → Nomeie como `dados_sinteticos`
- **Arquivo 2**: `analise_rapida_12_opinoes.csv` → Nomeie como `dados_reais`

### Passo 3: Abra o Rj Editor
- No menu do Jamovi, procure por **Rj Editor** (ou Modules → Rj)
- Uma nova aba abrirá

### Passo 4: Cole o código
- Abra o arquivo `analise_hibrida_jamovi.R`
- **Copie TUDO** (Ctrl+A, Ctrl+C)
- Cole no Rj Editor do Jamovi (Ctrl+V)

### Passo 5: Execute!
- Clique no botão **"Run"** (ícone ▶)
- Seus resultados aparecerão no painel **Results**

---

## O que o script faz

### **Para Dados Sintéticos (300 opiniões)**

✅ **Análise de Frequência**
- Contagem e porcentagem de Sentimentos (Positivo/Negativo/Neutro) por período
- Tabelas estruturadas

✅ **Análise de Variância (ANOVA)**
- 4 testes estatísticos independentes:
  1. Polaridade (-1 a 1)
  2. Felicidade (0-100%)
  3. Concordância (0-100%)
  4. Relevância Score
- Tamanho de efeito (Partial Eta²)
- Testes post-hoc (Tukey)

✅ **Estatísticas Descritivas**
- Média, Desvio Padrão, Mín, Máx
- Intervalo de Confiança 95%
- Agrupado por período

### **Para Dados Reais (12 tweets)**

✅ **Resumo Descritivo Breve**
- Frequência de sentimentos por período
- Polaridade média por período
- Formato simples e exploratório (sem testes inferenciais)

---

##  Interpretando Seus Resultados

### **p-value (p)**
```
p < 0.001  →  Altamente significativo ***
p < 0.01   →  Muito significativo **
p < 0.05   →  Significativo *
p ≥ 0.05   →  Não-significativo
```

### **Partial Eta² (Tamanho do Efeito)**
```
η² < 0.06    →  Pequeno
0.06 ≤ η² < 0.14  →  Médio
η² ≥ 0.14    →  Grande
```

### **Exemplo de Leitura**
Se você vir:
```
F(2,297) = 21.47, p < 0.001, η² = 0.126
```

Interprete assim:
> "Há diferença ALTAMENTE significativa na polaridade entre os períodos 
> (F = 21.47, p < 0.001). O período explica 12.6% da variação (efeito médio)."

---

## ⚠️ Verificação de Dados

Antes de rodar, certifique-se de que seus dados têm:

### **Dados Sintéticos (300 linhas)**
Colunas obrigatórias:
- `periodo` (valores: "Pré-Evento", "Evento", "Pós-Evento")
- `sentimento` (valores: "Positivo", "Negativo", "Neutro")
- `polaridade` (números de -1 a 1)
- `felicidade_pct` (números de 0 a 100)
- `concordancia_pct` (números de 0 a 100)
- `relevancia_score` (números)

### **Dados Reais (12 linhas)**
Colunas obrigatórias:
- `periodo` (valores: "Pré-Evento", "Evento", "Pós-Evento")
- `sentimento` (valores: "Positivo", "Negativo", "Neutro")
- `polaridade` (números)

**Nota**: Se os nomes das colunas forem diferentes, adapte no script (procure pelos nomes).

---

## 🛠️ Solução de Problemas

### ❌ "object 'dados_sinteticos' not found"
→ Verifique se importou o CSV e nomeou como `dados_sinteticos`

### ❌ "unknown column 'polaridade'"
→ A coluna pode ter nome diferente no seu CSV
→ Adapte o nome no script na linha onde aparece

### ❌ "some columns are not numeric"
→ No Jamovi, clique na coluna → Type → "Number"

### ❌ "Formula error"
→ Verifique que o nome da variável existe no dataset

---

## 📚 Documentação Adicional

Para entender melhor:
- **ANOVA**: https://pt.wikipedia.org/wiki/An%C3%A1lise_de_vari%C3%A2ncia
- **Jamovi**: https://www.jamovi.org/
- **jmv R package**: https://cran.r-project.org/package=jmv

---

## Dicas Finais

1. **Salve seu projeto Jamovi frequentemente** (File → Save As)

2. **Os resultados pressupõem normalidade e homocedasticidade**
   - Se violar muito, considere transformação de dados
   - Ou use testes não-paramétricos (Kruskal-Wallis)

3. **Post-hoc Tukey é importante!**
   - Use APENAS se a ANOVA overall foi significativa
   - Mostra qual período difere de qual

4. **Tamanho de efeito é tão importante quanto p-value**
   - Uma ANOVA com p < 0.05 mas η² < 0.06 pode ser irrelevante
   - Sempre reporte η² nas suas conclusões

5. **Para apresentação:**
   - Screenshot dos resultados no Jamovi
   - Cite corretamente: F(df1, df2) = valor, p = valor, η² = valor
   - Interprete em contexto do seu projeto

---

## Dúvidas?

Se encontrar problemas:
1. Consulte o `guia_uso_jamovi.R` (seção "Solução de Problemas")
2. Verifique o `cheat_sheet_interpretacao.R` para exemplos práticos
3. Revise os nomes das colunas no seu CSV vs no script

---

## ✅ Próximos Passos

- [ ] Importar datasets no Jamovi
- [ ] Nomeá-los como `dados_sinteticos` e `dados_reais`
- [ ] Abrir o Rj Editor
- [ ] Copiar/colar `analise_hibrida_jamovi.R`
- [ ] Clicar "Run"
- [ ] Interpretar resultados com `cheat_sheet_interpretacao.R`
- [ ] Escrever resultados no TCC
- [ ] Gerar gráficos (aba Plot do Jamovi)

---

## otacs-dev