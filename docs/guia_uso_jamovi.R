# ============================================================================
# GUIA PRÁTICO: COMO USAR O SCRIPT NO JAMOVI (Rj Editor)
# ============================================================================

# PASSO 1: PREPARAÇÃO DOS DADOS NO JAMOVI
# --------------------------------------------------------------------------
# 
# 1.1 Abra o Jamovi
# 
# 1.2 Importe seu primeiro dataset (dataset_simulado_300_opinoes.csv):
#     • Clique em File → Open
#     • Selecione o arquivo CSV
#     • Na janela "Import Data", configure:
#       - Delimitador: vírgula (,) ou automático
#       - Primeira linha como nomes: ✓ (marcado)
#       - Depois clique OK
# 
# 1.3 Renomear o dataframe para "dados_sinteticos":
#     • Na aba inferior, você verá o dataset importado
#     • Nomeie como "dados_sinteticos" (caso o Jamovi não faça automaticamente)
# 
# 1.4 Importe o segundo dataset (analise_rapida_12_opinoes.csv) em um 
#     documento Jamovi separado (ou use a mesma sessão com múltiplos datasets)
#     e nomeie como "dados_reais"
#

# PASSO 2: VERIFICAR NOMES DAS COLUNAS
# --------------------------------------------------------------------------
#
# O script espera as seguintes colunas em ambos os datasets:
#
# Obrigatórias em ambos:
#   - periodo (Pré-Evento, Evento, Pós-Evento)
#   - sentimento (Positivo, Negativo, Neutro)
#
# Dados Sintéticos (300 observações):
#   - polaridade (numérica, -1 a 1)
#   - felicidade_pct (numérica, 0 a 100)
#   - concordancia_pct (numérica, 0 a 100)
#   - relevancia_score (numérica)
#
# Dados Reais (12 observações):
#   - polaridade (numérica)
#
# ATENÇÃO: Se os nomes das colunas no CSV forem diferentes, você pode:
#   Opção A: Renomear as colunas no Jamovi (clicar no nome da coluna → Edit)
#   Opção B: Adaptar os nomes no script (procure pelos nomes das colunas abaixo)
#

# PASSO 3: COPIAR E COLAR O CÓDIGO
# --------------------------------------------------------------------------
#
# 3.1 Abra a aba "Rj Editor" no Jamovi
#     (está no menu superior ou na barra de abas)
#
# 3.2 Copie TODO o código do arquivo 'analise_hibrida_jamovi.R'
#
# 3.3 Cole no Rj Editor
#
# 3.4 Clique no botão "Run" (ícone de seta ▶) para executar
#
# 3.5 Os resultados aparecerão no painel "Results" à direita
#

# PASSO 4: INTERPRETAR OS RESULTADOS
# --------------------------------------------------------------------------
#
# PARTE 1 - DADOS SINTÉTICOS:
#
# Seção 1.1 - Frequência de Sentimentos:
#   • Mostra quantas opiniões Positivas, Negativas e Neutras em cada período
#   • Útil para entender a distribuição do sentimento ao longo do tempo
#   • Interpretação: aumentou positivos após o evento?
#
# Seção 1.2 - ANOVA:
#   • Quatro testes (Polaridade, Felicidade, Concordância, Relevância)
#   • Cada teste responde: "Há diferença significativa entre os períodos?"
#   • Procure pelo valor "p" (p-value):
#     - Se p < 0.05: há diferença significativa entre períodos (rejeita H0)
#     - Se p ≥ 0.05: não há diferença significativa (falha em rejeitar H0)
#   • "partialEta" mostra o tamanho do efeito (0 a 1):
#     - Pequeno: η² < 0.06
#     - Médio: 0.06 ≤ η² < 0.14
#     - Grande: η² ≥ 0.14
#   • Testes post-hoc (Tukey): mostram qual período difere de qual
#
# Seção 1.3 - Estatísticas Descritivas:
#   • Média, desvio padrão, mínimo, máximo para cada métrica por período
#   • IC 95% oferece intervalo onde a verdadeira média provavelmente está
#
# PARTE 2 - DADOS REAIS:
#
# Seção 2.1 - Resumo Descritivo:
#   • Apenas frequências e média de polaridade
#   • Não faz testes de hipótese (amostra pequena)
#   • Use para validar que a coleta foi bem-sucedida
#   • Descritivo: quantos tweets por período? A polaridade média varia?
#

# ============================================================================
# AJUSTES POSSÍVEIS NO SCRIPT
# ============================================================================

# Se você precisar alterar nomes de colunas, localize:
#
# Linha ~50: formula = polaridade ~ periodo
#            ↓ mude 'polaridade' se a coluna tem outro nome
#
# Linha ~60: formula = felicidade_pct ~ periodo
#            ↓ mude 'felicidade_pct' se a coluna tem outro nome
#
# Linha ~70: formula = concordancia_pct ~ periodo
#            ↓ mude 'concordancia_pct' se a coluna tem outro nome
#
# Linha ~80: formula = relevancia_score ~ periodo
#            ↓ mude 'relevancia_score' se a coluna tem outro nome
#

# ============================================================================
# SOLUÇÃO DE PROBLEMAS
# ============================================================================

# ERRO: "object 'dados_sinteticos' not found"
# → Solução: Certifique-se de que importou o dataset e nomeou como 
#           "dados_sinteticos" (case-sensitive)
#

# ERRO: "object 'dados_reais' not found"
# → Solução: Importe o segundo dataset e nomeie como "dados_reais"
#

# ERRO: "unknown column 'polaridade'"
# → Solução: Verifique se a coluna se chama exatamente "polaridade" 
#           (cuidado com maiúsculas/minúsculas)
#           Adapte o nome no script se necessário
#

# AVISO: "In anova(...) : some columns are not numeric"
# → Solução: Verifique que as colunas das métricas (polaridade, felicidade, 
#           concordancia, relevancia) são do tipo numérico no Jamovi
#           Clique em cada coluna → Type → Number
#

# AVISO: "In anova(...) : period variable is character, not factor"
# → Não é grave! O script automaticamente converte para fator
#

# ============================================================================
# DICAS FINAIS
# ============================================================================

# 1. Salve seu projeto Jamovi com frequência
#    (File → Save As)
#
# 2. Os resultados da ANOVA pressupõem:
#    - Normalidade das variáveis dependentes (teste de Shapiro-Wilk)
#    - Homocedasticidade (teste de Levene)
#    Se violar muito, considere:
#      • Transformação de dados (log, raiz quadrada)
#      • Testes não-paramétricos (Kruskal-Wallis)
#
# 3. Para incluir diagnósticos de ANOVA:
#    - Normality plot
#    - Homogeneity of variance plot
#    Você pode usar: jmv::anova(..., plots = TRUE, normPlots = TRUE)
#
# 4. O tamanho de efeito (eta-quadrado) é importante!
#    Uma ANOVA com p < 0.05 mas efeito pequeno (η² < 0.06) 
#    pode ser estatisticamente significativa mas praticamente irrelevante
#
# 5. Para apresentação em seminário/tcc:
#    - Screenshot dos resultados no Jamovi
#    - Cite valores: "F(2,297) = 12.45, p = 0.001, η² = 0.08"
#    - Interprete em contexto do seu projeto
#

# ============================================================================
# REFERÊNCIAS DE INTERPRETAÇÃO ANOVA
# ============================================================================

# p-value (significância estatística):
#   p < 0.001 → Altamente significativo ***
#   p < 0.01  → Muito significativo **
#   p < 0.05  → Significativo *
#   p ≥ 0.05  → Não-significativo (ns)
#
# Eta-quadrado (η²) - Tamanho do Efeito:
#   0.01 - 0.06    → Pequeno
#   0.06 - 0.14    → Médio
#   > 0.14         → Grande
#
# Post-hoc Tukey:
#   Mostra comparações entre pares de períodos
#   Se um par tem p < 0.05, diferem significativamente
#   Use este teste APENAS se a ANOVA overall foi significativa
#

print("
Guia carregado com sucesso!
Procure pela aba 'Rj Editor' no Jamovi para colar o script principal.
")
