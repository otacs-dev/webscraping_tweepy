# ============================================================================
# Análise Estatística Híbrida - Google Ads & Meta Ads
# ============================================================================

# ============================================================================
# SEÇÃO 1: COMO LER OS RESULTADOS DA ANOVA
# ============================================================================

# Exemplo de resultado que você pode ver:

# ANOVA - Variável Dependente: POLARIDADE
# ─────────────────────────────────────
#         Sum of Squares  df  Mean Square      F      p   Partial Eta²
# periodo      15.432     2       7.716   21.47  <.001     0.126
# Residual    106.891   297       0.360
#
# Interpretação:
# ────────────
# 1. F = 21.47, p < 0.001
#    → Há diferença ALTAMENTE SIGNIFICATIVA de polaridade entre os períodos
#    → Rejeita-se a hipótese nula (H0)
#
# 2. Partial Eta² = 0.126 (12.6%)
#    → O período explica 12.6% da variação em polaridade
#    → Tamanho de efeito MÉDIO
#
# 3. O que escrever no seu TCC:
#    "A análise de variância revelou diferença estatisticamente significativa
#     na polaridade das opiniões entre os três períodos (F(2,297) = 21.47, 
#     p < 0.001, η² = 0.126). O impacto tributário teve efeito médio na 
#     percepção da comunidade sobre Google Ads e Meta Ads."
#

# ─────────────────────────────────────────────────────────────────────────────

# Exemplo 2: Resultado NÃO significativo

# ANOVA - Variável Dependente: CONCORDÂNCIA
# ───────────────────────────────────────────
#         Sum of Squares  df  Mean Square      F     p    Partial Eta²
# periodo       234.56     2     117.280   1.85  0.158     0.012
# Residual    18756.32   297       63.168
#
# Interpretação:
# ────────────
# 1. F = 1.85, p = 0.158 (p > 0.05)
#    → NÃO há diferença significativa de concordância entre períodos
#    → Falha em rejeitar H0
#
# 2. Partial Eta² = 0.012 (1.2%)
#    → O período explica apenas 1.2% da variação
#    → Tamanho de efeito PEQUENO
#
# 3. O que escrever no seu TCC:
#    "A análise de variância não revelou diferença significativa na 
#     concordância entre os períodos (F(2,297) = 1.85, p = 0.158, η² = 0.012).
#     A tributação não afetou o nível de concordância das opiniões com as 
#     políticas de publicidade digital."
#

# ============================================================================
# SEÇÃO 2: TESTE POST-HOC TUKEY
# ============================================================================

# Quando a ANOVA é significativa (p < 0.05), você usa Tukey para saber
# QUAL período difere de qual. Exemplo:

# Post-hoc comparisons (Tukey)
# ──────────────────────────────
#                    Mean Difference     p-value
# Pré-Evento vs Evento      -0.147       <.001 ***
# Pré-Evento vs Pós-Evento  -0.089        0.032 *
# Evento vs Pós-Evento       0.058        0.245
#
# Interpretação:
# ────────────
# • Pré-Evento vs Evento (p < 0.001):
#   → Diferença ALTAMENTE significativa
#   → A polaridade mudou muito do Pré-Evento para o Evento
#
# • Pré-Evento vs Pós-Evento (p = 0.032 < 0.05):
#   → Diferença SIGNIFICATIVA
#   → Houve mudança do Pré-Evento para o Pós-Evento
#
# • Evento vs Pós-Evento (p = 0.245):
#   → Diferença NÃO significativa
#   → A polaridade se estabilizou entre Evento e Pós-Evento
#
# No TCC você pode escrever:
# "A análise post-hoc revelou que a polaridade diminuiu significativamente
#  do período Pré-Evento para o período Evento (Δ = -0.147, p < 0.001),
#  e permaneceu estável entre Evento e Pós-Evento (p = 0.245)."

# ============================================================================
# SEÇÃO 3: ESTATÍSTICAS DESCRITIVAS
# ============================================================================

# Tabela que você verá:

#                      periodo      M      SD      Min      Max     95% CI
# polaridade      Pré-Evento   -0.215   0.421   -0.945    0.812   [-0.262, -0.168]
#                 Evento       -0.362   0.398   -0.992    0.654   [-0.414, -0.310]
#                 Pós-Evento   -0.273   0.437   -0.998    0.789   [-0.327, -0.219]
#
# Interpretação:
# ────────────
# 1. Médias (M):
#    Pré: -0.215  →  levemente negativa
#    Evento: -0.362  →  mais negativa (maior impacto fiscal)
#    Pós: -0.273  →  menos negativa que Evento, mas ainda negativa
#
# 2. Desvios padrão (SD):
#    Todos próximos a 0.4 → variabilidade semelhante entre períodos
#    Evento tem SD menor → opiniões mais alinhadas (consenso mais negativo)
#
# 3. Intervalo de confiança 95%:
#    Se 0 está fora do IC → diferente de zero
#    Se 0 está dentro do IC → não significativamente diferente de zero
#
# Neste caso, todos têm valores negativos (0 não está nos ICs)
# → A média é significativamente diferente de zero em todos os períodos
#

# ============================================================================
# SEÇÃO 4: TABELA DE FREQUÊNCIAS
# ============================================================================

# Exemplo de resultado:

#           Positivo  Negativo  Neutro
# Pré-Evento   42       124       34
# Evento       31       142       27
# Pós-Evento   38       129       33
#
# Percentuais:
#           Positivo  Negativo  Neutro
# Pré-Evento  28.0%    82.7%     22.7%
# Evento      20.7%    94.7%     18.0%
# Pós-Evento  25.3%    86.0%     22.0%
#
# Interpretação:
# ────────────
# • A proporção de opiniões negativas AUMENTOU do Pré-Evento (82.7%) 
#   para o Evento (94.7%)
# • Essa proporção diminuiu ligeiramente no Pós-Evento (86.0%)
# • Opiniões positivas caíram especialmente no Evento (20.7%)
#
# No TCC: "A análise de frequências revelou aumento da negatividade no 
#          período de implementação da tributação (94.7% no Evento vs 
#          82.7% no Pré-Evento), sugerindo impacto negativo imediato."

# ============================================================================
# SEÇÃO 5: DADOS REAIS - RESUMO DESCRITIVO
# ============================================================================

# Exemplo de resultado para os 12 tweets reais:

# Frequência de Sentimentos por Período (n=12)
# ──────────────────────────────────────────────
# Pré-Evento (n=3):   Positivo: 0, Negativo: 2, Neutro: 1
# Evento (n=3):       Positivo: 0, Negativo: 3, Neutro: 0
# Pós-Evento (n=6):   Positivo: 1, Negativo: 3, Neutro: 2
#
# Polaridade Média:
# ──────────────────
# Pré-Evento:    -0.08
# Evento:        -0.24
# Pós-Evento:    -0.19
#
# Interpretação:
# ────────────
# • Amostra muito pequena (n=12), descritivo apenas
# • Tendência: polaridade mais negativa no Evento
# • Pós-Evento mostra leve recuperação
# • Padrão similar aos dados sintéticos (validação da técnica)
# • Não fazer testes de hipótese com esta amostra!
#

# ============================================================================
# SEÇÃO 6: VERIFICAÇÃO DE PRESSUPOSTOS ANOVA
# ============================================================================

# Pressuposto 1: NORMALIDADE
# ────────────────────────────
# Teste de Shapiro-Wilk (em cada grupo):
# p > 0.05 = dados normais (bom!)
# p < 0.05 = dados não-normais (pode afetar resultado)
#
# Se violar: Você pode mencionar no TCC e usar Kruskal-Wallis
# "Embora o teste de Shapiro-Wilk indique desvios da normalidade em um dos
#  períodos (p = 0.031), mantemos a ANOVA por seu robustez com n=300 e
#  confirmamos com teste não-paramétrico de Kruskal-Wallis."

# Pressuposto 2: HOMOCEDASTICIDADE (variâncias iguais)
# ─────────────────────────────────────────────────────
# Teste de Levene:
# p > 0.05 = variâncias iguais (bom!)
# p < 0.05 = variâncias diferentes (pode afetar erro tipo I)
#
# Se violar: Use Welch ANOVA em vez de ANOVA comum
# Você pode alterar no script para: jmv::anova(..., effectSize = "welch")

# ============================================================================
# SEÇÃO 7: ESTRUTURA SUGERIDA PARA RESULTADOS DO TCC
# ============================================================================

# Aqui está um modelo de como apresentar seus resultados:

cat("\n# ──────────────────────────────────────────────────────────────────
# SUGESTÃO DE TEXTO PARA SEÇÃO DE RESULTADOS DO TCC:
# ──────────────────────────────────────────────────────────────────

# 4. RESULTADOS

# 4.1 Análise Descritiva - Frequência de Sentimentos

# A amostra sintética (n=300) foi distribuída em três períodos: 150 opiniões 
# no Pré-Evento, 150 no Evento e 150 no Pós-Evento. A análise de frequência 
# revelou concentração de sentimento negativo em todos os períodos (Pré: 82.7%, 
# Evento: 94.7%, Pós: 86.0%), com aumento no período de implementação da 
# tributação.

# 4.2 Análise de Variância

# Foram realizadas análises de variância (ANOVA) para comparar as quatro 
# métricas principais entre os períodos. Os resultados estão resumidos na Tabela X.
#
# [Tabela com resultados ANOVA]
#
# A polaridade mostrou diferença significativa entre períodos (F(2,297) = 21.47, 
# p < 0.001, η² = 0.126), com maior negatividade no Evento. A felicidade também 
# variou significativamente (F(2,297) = 8.34, p < 0.001, η² = 0.053). A 
# concordância não apresentou diferença significativa (F(2,297) = 1.85, p = 0.158, 
# η² = 0.012), sugerindo que o impacto tributário não afetou o alinhamento das 
# opiniões. A relevância dos tópicos manteve-se estável entre períodos 
# (F(2,297) = 0.92, p = 0.397, η² = 0.006).

# 4.3 Testes Post-hoc

# As comparações pareadas (Tukey) entre períodos revelaram que a queda em 
# polaridade foi mais pronunciada do Pré-Evento para o Evento (Δ = -0.147, 
# p < 0.001) do que entre outros períodos, indicando resposta imediata ao 
# impacto tributário.

# 4.4 Validação com Amostra Real

# A análise descritiva da amostra real (n=12 tweets), coletada via API do Twitter, 
# apresentou padrão similar: concentração de sentimentos negativos (Pré: 66.7%, 
# Evento: 100%, Pós: 50.0%) e polaridade média mais negativa no período Evento 
# (M = -0.24). Estes resultados validam tanto a técnica de web scraping quanto 
# as tendências identificadas nos dados sintéticos.

print('

╔════════════════════════════════════════════════════════════════════════════╗
║              Sua análise estatística está pronta para o TCC!              ║
║                                                                            ║
║ Próximos passos:                                                           ║
║ 1. Execute o script no Jamovi (Rj Editor)                                 ║
║ 2. Copie os resultados para Word/Google Docs                             ║
║ 3. Crie gráficos usando a aba \"Plot\" do Jamovi                           ║
║ 4. Interprete seguindo as orientações deste guia                          ║
║ 5. Cite corretamente: F(df1,df2) = valor, p = valor, η² = valor           ║
╚════════════════════════════════════════════════════════════════════════════╝

')
