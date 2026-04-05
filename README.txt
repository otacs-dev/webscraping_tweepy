================================================================
PROJETO DE INICIAÇÃO CIENTÍFICA — FATEC BAIXADA SANTISTA
================================================================
Tema:       Análise de Sentimentos: Impacto Tributário em
            Google Ads e Meta Ads (2026)
Autor:      Octávio Teodoro
Orientador: Prof. Maurício Conceição
Instituição: FATEC Baixada Santista
Ano:        2026
================================================================
 
----------------------------------------------------------------
O QUE ESTE PROJETO FAZ
----------------------------------------------------------------
Este projeto mede, de forma científica e automatizada, como a
tributação sobre plataformas de anúncios digitais (Google Ads e
Meta Ads) afetou o sentimento do mercado brasileiro em 2026.
 
O resultado principal:
  → 76% das opiniões coletadas no período do Evento foram NEGATIVAS
  → Polaridade caiu de -0,14 (Pré-Evento) para -0,37 (Evento)
  → Queda de 157% confirmada por ANOVA: F(2,196)=8,839 | p=0,0002
  → Teste Post-Hoc Tukey: Evento vs Pré-Evento p < 0,0001
 
----------------------------------------------------------------
PIPELINE DE DADOS
----------------------------------------------------------------
  [1] Coleta      → Python 3.x + Tweepy (API X/Twitter)
  [2] Limpeza     → Pandas + Regex (deduplicação e normalização)
  [3] Análise NLP → NLTK + TextBlob (polaridade e sentimento)
  [4] Estatística → Jamovi v2.6 (ANOVA One-Way + Post-Hoc Tukey)
  [5] Visualização→ Microsoft Power BI (dashboard interativo)
 
----------------------------------------------------------------
NATUREZA DOS DADOS (ABORDAGEM HÍBRIDA)
----------------------------------------------------------------
Este projeto usa dois tipos de dados complementares:
 
  DADOS REAIS (n=12)
  Extraídos diretamente da API do X/Twitter via Tweepy.
  Finalidade: validar o script de extração e provar que o
  pipeline funciona com dados reais em produção.
  Localização: /Extrações_dados_reais/
 
  DADOS SINTÉTICOS (n=300)
  Gerados estatisticamente com distribuições consistentes
  com os dados reais. Necessários para superar os Rate Limits
  da API gratuita e permitir a validação estatística completa
  (ANOVA exige amostras maiores para significância).
  Localização: /Extrações_dados_sintéticos_alta_escala/
 
----------------------------------------------------------------
MÉTRICAS COLETADAS POR OPINIÃO
----------------------------------------------------------------
  1. Polaridade          (-1 a +1)   Direção do sentimento
  2. Índice de Felicidade (0 a 100%) Tom emocional da mensagem
  3. Grau de Concordância (0 a 100%) Aceitação da medida
  4. Relevância Score    (0 a 100)   Likes + Retweets + Respostas
 
----------------------------------------------------------------
RESULTADOS ESTATÍSTICOS (JAMOVI v2.6)
----------------------------------------------------------------
  Variável          F        df1  df2    p-valor    Resultado
  ─────────────────────────────────────────────────────────────
  Polaridade        8,839    2    196,3  0,0002     H₀ rejeitada
  Polaridade(Fish.) 9,680    2    297    < 0,0001   H₀ rejeitada
  Felicidade %      3,788    2    196,4  0,0243     H₀ rejeitada
  Concordância %    1,605    2    197,7  0,2036     H₀ não rejeit.
 
  Post-Hoc Tukey (Polaridade):
  → Evento vs Pré-Evento:  p < 0,0001  (diferença significativa)
  → Pós-Evento vs Pré-Ev.: p = 0,0082  (diferença significativa)
  → Evento vs Pós-Evento:  p = 0,4035  (sem diferença signif.)
 
----------------------------------------------------------------
ESTRUTURA DE PASTAS
----------------------------------------------------------------
INICIACAO_CIENTIFICA/
│
├── Extrações_dados_reais/
│   ├── analise_rapida_12_opinoes.csv
│   ├── periodo_evento_3.csv
│   ├── periodo_pós_evento_6.csv
│   ├── periodo_pré_evento_3.csv
│   ├── resumo_rapido.csv
│   └── log_terminal_reais.docx
│
├── Extrações_dados_sintéticos_alta_escala/
│   ├── dataset_simulado_300_opinioes.csv     ← dataset principal
│   ├── periodo_evento_100_opinioes.csv
│   ├── periodo_pós_evento_100_opinioes.csv
│   ├── periodo_pré_evento_100_opinioes.csv
│   ├── resumo_estatistico_simulado.csv
│   └── log_terminal_sintéticos.docx
│
├── scripts/
│   ├── extraction_tweepy.py                  ← coleta real
│   └── extraction_tweepy_simulation.py       ← geração sintética
│
├── dashboards/
│   ├── power_bi.pbix                         ← dashboard interativo
│   ├── jamovi.omv                            ← análise estatística
│   └── exports/                              ← prints e PDF final
│
├── artigo/
│   └── Boneco Projeto PIC 1.2 - Octávio Teodoro - Fatec BS.docx
│
├── docs/
│   ├── README_jamovi.md
│   ├── cheat_sheet_interpretacao.pdf
│   └── guia_uso_jamovi.R
│
└── README.txt                                ← este arquivo
 
----------------------------------------------------------------
COMO REPRODUZIR O PROJETO
----------------------------------------------------------------
  1. Instale as dependências:
     pip install tweepy pandas nltk textblob
 
  2. Configure sua chave da API do X/Twitter em:
     scripts/extraction_tweepy.py → bearer_token = "SUA_CHAVE"
 
  3. Para gerar dados sintéticos:
     python scripts/extraction_tweepy_simulation.py
 
  4. Abra dashboards/jamovi.omv no Jamovi para ver a ANOVA
 
  5. Abra dashboards/power_bi.pbix no Power BI Desktop para
     visualizar o dashboard interativo completo
 
----------------------------------------------------------------
FERRAMENTAS E VERSÕES
----------------------------------------------------------------
  Python      3.x
  Tweepy      4.x
  Pandas      2.x
  NLTK        3.x
  TextBlob    0.17.x
  Jamovi      2.6
  Power BI    Desktop (versão .exe — NÃO usar versão da Store)
  VS Code     1.9x
 
----------------------------------------------------------------
CONTATO
----------------------------------------------------------------
  Autor:      Octávio Teodoro
  Instituição: FATEC Baixada Santista
  Orientador: Prof. Maurício Conceição
  Ano:        2026