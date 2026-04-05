# ============================================================================
# SCRIPT DE ANÁLISE ESTATÍSTICA HÍBRIDA - IMPACTO TRIBUTÁRIO 
# Projeto de Iniciação Científica - Ciência de Dados
# Autor: Octávio Teodoro
# ============================================================================

# --- PREPARAÇÃO DOS DADOS ---
# No Jamovi, o dataset ativo é sempre chamado de 'data'
dados_sinteticos <- data
dados_reais <- data 

# Carregar biblioteca jmv
library(jmv)

cat("\n")
cat("================================================================================\n")
cat("PARTE 1: ANÁLISE DETALHADA DOS DADOS SINTÉTICOS (n=300)\n")
cat("================================================================================\n")

# --------------------------------------------------------------------------
# 1.1 ANÁLISE DE FREQUÊNCIA: Distribuição de Sentimentos por Período
# --------------------------------------------------------------------------
cat("\n1.1 ANÁLISE DE FREQUÊNCIA\n")
cat("--------------------------------------------------------------------------\n")

# Criar tabela de frequência cruzada
tabela_frequencia <- table(dados_sinteticos$periodo, dados_sinteticos$sentimento)
print("Contagem Absoluta (Sentimento x Período):")
print(tabela_frequencia)

cat("\n")

# Converter para percentuais por período
tabela_percentual <- prop.table(tabela_frequencia, margin = 1) * 100
print("Percentual (%) por Período:")
print(round(tabela_percentual, 2))

# --------------------------------------------------------------------------
# 1.2 ANÁLISE DE VARIÂNCIA (ANOVA) - TESTES DAS MÉTRICAS
# --------------------------------------------------------------------------
cat("\n\n1.2 TESTES DE HIPÓTESE (ANOVA)\n")
cat("--------------------------------------------------------------------------\n")

# Garantir que 'periodo' seja tratado como Fator
dados_sinteticos$periodo <- as.factor(dados_sinteticos$periodo)

# ANOVA 1: Polaridade
cat("\n>>> ANOVA: POLARIDADE (-1 a 1)\n")
jmv::anovaOneW(
  data = dados_sinteticos,
  deps = "polaridade",
  group = "periodo",
  fishers = TRUE,
  phMethod = "tukey",
  phTest = TRUE,
  desc = TRUE
)

# ANOVA 2: Felicidade (Ajustado para o nome da coluna no Jamovi: felicidade_.)
cat("\n\n>>> ANOVA: ÍNDICE DE FELICIDADE (%)\n")
tryCatch({
  jmv::anovaOneW(
    data = dados_sinteticos,
    deps = "felicidade_.",
    group = "periodo",
    phMethod = "tukey",
    phTest = TRUE,
    desc = TRUE
  )
}, error = function(e) { cat("Erro: Coluna 'felicidade_.' não encontrada. Verifique o nome no Jamovi.\n") })

# ANOVA 3: Concordância (Ajustado para o nome da coluna no Jamovi: concordancia_.)
cat("\n\n>>> ANOVA: GRAU DE CONCORDÂNCIA (%)\n")
tryCatch({
  jmv::anovaOneW(
    data = dados_sinteticos,
    deps = "concordancia_.",
    group = "periodo",
    phMethod = "tukey",
    phTest = TRUE,
    desc = TRUE
  )
}, error = function(e) { cat("Erro: Coluna 'concordancia_.' não encontrada.\n") })

# --------------------------------------------------------------------------
# 1.3 ESTATÍSTICAS DESCRITIVAS COMPLEMENTARES
# --------------------------------------------------------------------------
cat("\n\n1.3 RESUMO ESTATÍSTICO GERAL\n")
cat("--------------------------------------------------------------------------\n")

jmv::descriptives(
  data = dados_sinteticos,
  vars = c("polaridade", "relevancia_score"),
  split = "periodo",
  mean = TRUE,
  sd = TRUE,
  ci = TRUE
)

# ============================================================================
# PARTE 2: ANÁLISE DOS DADOS REAIS (Validação Técnica)
# ============================================================================
cat("\n\n")
cat("================================================================================\n")
cat("PARTE 2: ANÁLISE DOS DADOS REAIS (n=12)\n")
cat("================================================================================\n")

# Calcular polaridade média por período para os dados reais
cat("\nPolaridade Média por Período (Amostra Real):\n")
resumo_real <- aggregate(polaridade ~ periodo, data = dados_reais, FUN = mean)
print(resumo_real)

cat("\n================================================================================\n")
cat("ANÁLISE FINALIZADA COM SUCESSO\n")
cat("================================================================================\n")
