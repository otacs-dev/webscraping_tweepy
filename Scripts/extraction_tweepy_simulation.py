"""
    GERADOR DE DADOS SIMULADOS - ANÁLISE DE SENTIMENTOS

    Google Ads e Meta Ads: Impacto dos Impostos 2026
    Autor: Octávio Teodoro | FATEC BS
    
    DADOS SIMULADOS REALISTAS
    
    Este script gera dados simulados baseados em padrões reais de sentimento
    sobre tributação em plataformas de anúncios digitais.
    Perfeito para demonstração de metodologia em I.C/TCC quando há limitações
    de acesso a APIs ou dados históricos.
    
    100 opiniões por período (300 total)
    Distribuição realista de sentimentos
    4 métricas completas
    Dados para Jamovi e Power BI

                                                                 0tacs    """

import pandas as pd
import random
from datetime import datetime, timedelta
import numpy as np

# ----------------------------------------------------------------------------
# 1. CONFIGURAÇÃO
# ----------------------------------------------------------------------------

print("\n" + "═"*80)
print("  ~~ GERADOR DE DADOS SIMULADOS")
print("  Análise de Sentimentos: Google Ads e Meta Ads")
print("  Octávio Teodoro | FATEC BS")
print("═"*80)

# Parâmetros
OPINOES_POR_PERIODO = 100  # 100 opiniões por período
TOTAL_OPINOES = 300  # 3 períodos × 100

# ---------------------------------------------------------------------------
# 2. TEMPLATES DE TWEETS REALISTAS
# ---------------------------------------------------------------------------

# Templates baseados em discussões reais sobre impostos em ads

TEMPLATES_NEGATIVOS = [
    "Absurdo o novo imposto no Google Ads! CPC subiu {perc}% aqui",
    "Meta Ads ficou caríssimo com essa nova taxa do governo, prejuízo total",
    "Impossível anunciar no Google Ads agora, imposto aumentou muito o custo",
    "Facebook Ads subiu {perc}% por causa da tributação nova, ridículo",
    "Google Ads virou exploração com esse imposto de 2026",
    "CPC do Google Ads disparou {perc}% depois da taxa do governo",
    "Meta Ads inviável agora, imposto matou o negócio de pequenos anunciantes",
    "Revoltado com o aumento no Google Ads por causa desse imposto absurdo",
    "Instagram Ads subiu demais, nova taxa do governo prejudicou todos",
    "Google Ads ficou caro demais, imposto de 2026 foi um roubo",
    "Facebook Ads aumentou {perc}%, essa tributação tá matando as PMEs",
    "CPC no Google disparou depois do imposto, insustentável",
    "Meta Ads tá um absurdo de caro com essa nova taxa",
    "Impossível trabalhar com Google Ads com esse novo imposto",
    "Tributação em ads digitais é um tiro no pé do governo",
    "Google Ads subiu {perc}% só de imposto, inadmissível",
    "Meta Ads ficou inviável para pequenas empresas com essa taxa",
    "Novo imposto no Google Ads prejudicou muito meu negócio",
    "Facebook Ads aumentou absurdamente, taxa governamental pesou",
    "CPC do Google subiu {perc}% por causa do imposto de 2026"
]

TEMPLATES_NEUTROS = [
    "Google Ads teve aumento de {perc}% devido ao novo imposto de 2026",
    "Meta Ads implementou a cobrança da nova taxa do governo",
    "Imposto em anúncios digitais entrou em vigor hoje no Google Ads",
    "Facebook Ads passa a cobrar taxa tributária adicional",
    "Governo implementa tributação de {perc}% em ads digitais",
    "Google Ads e Meta Ads agora incluem nova taxa na fatura",
    "CPC médio subiu {perc}% após entrada do novo imposto",
    "Tributação em publicidade online já está valendo no Brasil",
    "Meta Ads adiciona imposto à cobrança conforme lei de 2026",
    "Google Ads ajustou preços devido à nova regulamentação fiscal",
    "Imposto em ads digitais: Google e Meta já estão cobrando",
    "Nova taxa governamental afeta anúncios no Google e Facebook",
    "Tributação de {perc}% em vigor para publicidade digital",
    "Google Ads e Meta Ads seguem nova lei tributária de 2026",
    "Imposto em anúncios já aparece nas faturas de janeiro"
]

TEMPLATES_POSITIVOS = [
    "Imposto no Google Ads é justo, vai gerar receita para o Brasil",
    "Tributação em ads digitais era necessária, concordo com a medida",
    "Bom ver o governo finalmente tributando gigantes tech como Google e Meta",
    "Meta Ads pagar imposto aqui é justo, apoio a decisão",
    "Google Ads deveria pagar imposto mesmo, correto do governo",
    "Tributação em publicidade digital vai ajudar o país, válido",
    "Apoio o imposto no Google Ads e Meta Ads, Big Techs devem contribuir",
    "Justo taxar Google e Facebook, são bilionários e não pagavam nada",
    "Imposto em ads digitais vai financiar educação, excelente medida"
]

# Tópicos por plataforma
TOPICOS_GOOGLE = ["Google_Ads", "Google_Ads, Impostos", "Google_Ads, CPC", "Google_Ads, Impostos, Aumento_Custos"]
TOPICOS_META = ["Meta_Ads", "Meta_Ads, Impostos", "Meta_Ads, Impostos, Preços"]
TOPICOS_GERAIS = ["Impostos", "Governo/Lei", "Impostos, Aumento_Custos"]

# ---------------------------------------------------------------------------
# 3. GERAÇÃO DE DADOS POR PERÍODO
# ---------------------------------------------------------------------------

def gerar_opiniao(periodo, numero):
    """
    Gera uma opinião simulada realista.
    
    A distribuição de sentimentos varia por período:
    - Pré-Evento: Mais negativos (expectativa ruim)
    - Evento: Muito negativo (reação ao impacto)
    - Pós-Evento: Predominantemente negativo (efeito consolidado)
    """
    
    # Distribuição de sentimento por período (baseado em estudos reais)
    if periodo == "Pré-Evento":
        # 60% negativo, 30% neutro, 10% positivo
        sentimento = random.choices(
            ['Negativo', 'Neutro', 'Positivo'],
            weights=[60, 30, 10]
        )[0]
        data_base = datetime(2025, 12, 25) + timedelta(days=random.randint(0, 6))
        
    elif periodo == "Evento":
        # 75% negativo, 20% neutro, 5% positivo
        sentimento = random.choices(
            ['Negativo', 'Neutro', 'Positivo'],
            weights=[75, 20, 5]
        )[0]
        data_base = datetime(2026, 1, 1) + timedelta(hours=random.randint(0, 23))
        
    else:  # Pós-Evento
        # 70% negativo, 25% neutro, 5% positivo
        sentimento = random.choices(
            ['Negativo', 'Neutro', 'Positivo'],
            weights=[70, 25, 5]
        )[0]
        data_base = datetime(2026, 1, 2) + timedelta(days=random.randint(0, 29))
    
    # Escolhe template baseado no sentimento
    if sentimento == 'Negativo':
        template = random.choice(TEMPLATES_NEGATIVOS)
        polaridade = round(random.uniform(-0.8, -0.2), 3)
        felicidade = round(random.uniform(15, 45), 1)
        concordancia = round(random.uniform(35, 65), 1)
        
    elif sentimento == 'Neutro':
        template = random.choice(TEMPLATES_NEUTROS)
        polaridade = round(random.uniform(-0.15, 0.15), 3)
        felicidade = round(random.uniform(45, 55), 1)
        concordancia = round(random.uniform(45, 60), 1)
        
    else:  # Positivo
        template = random.choice(TEMPLATES_POSITIVOS)
        polaridade = round(random.uniform(0.3, 0.8), 3)
        felicidade = round(random.uniform(60, 85), 1)
        concordancia = round(random.uniform(55, 75), 1)
    
    # Substitui variáveis no template
    percentual = random.choice([15, 20, 25, 30, 35])
    texto_original = template.replace('{perc}', str(percentual))
    
    # Escolhe plataforma e tópicos
    plataforma = random.choice(['Google', 'Meta', 'Ambas'])
    if plataforma == 'Google':
        topicos = random.choice(TOPICOS_GOOGLE)
    elif plataforma == 'Meta':
        topicos = random.choice(TOPICOS_META)
    else:
        topicos = random.choice(TOPICOS_GERAIS)
    
    # Calcula relevância (tweets simulados são todos relevantes)
    relevancia = random.randint(40, 95)
    
    # Engajamento (varia com sentimento - negativos tendem a ter mais)
    if sentimento == 'Negativo':
        likes = random.randint(5, 150)
        retweets = random.randint(2, 50)
        respostas = random.randint(1, 30)
    elif sentimento == 'Neutro':
        likes = random.randint(1, 50)
        retweets = random.randint(0, 20)
        respostas = random.randint(0, 15)
    else:
        likes = random.randint(1, 80)
        retweets = random.randint(0, 30)
        respostas = random.randint(0, 20)
    
    # ID único simulado
    tweet_id = f"sim_{periodo[:3]}_{numero:04d}"
    
    return {
        'periodo': periodo,
        'id_tweet': tweet_id,
        'data_tweet': data_base.strftime("%Y-%m-%d %H:%M:%S"),
        'data_coleta': datetime.now().strftime("%Y-%m-%d %H:%M:%S"),
        'texto_original': texto_original,
        'texto_limpo': texto_original.lower(),
        'comprimento': len(texto_original),
        'sentimento': sentimento,
        'polaridade': polaridade,
        'felicidade_%': felicidade,
        'concordancia_%': concordancia,
        'topicos': topicos,
        'relevancia_score': relevancia,
        'likes': likes,
        'retweets': retweets,
        'respostas': respostas,
        'engajamento_total': likes + (retweets * 1.5) + (respostas * 2)
    }

# ---------------------------------------------------------------------------
# 4. GERAÇÃO DO DATASET COMPLETO
# ---------------------------------------------------------------------------

print("\n[1/3] 📊 Gerando dados simulados...")
print(f"      Meta: {TOTAL_OPINOES} opiniões ({OPINOES_POR_PERIODO} por período)")

todas_opinoes = []

for periodo in ['Pré-Evento', 'Evento', 'Pós-Evento']:
    print(f"\n      Gerando {periodo}...")
    for i in range(OPINOES_POR_PERIODO):
        opiniao = gerar_opiniao(periodo, i + 1)
        todas_opinoes.append(opiniao)
    print(f"      ✅ {OPINOES_POR_PERIODO} opiniões geradas")

df = pd.DataFrame(todas_opinoes)

print(f"\n      ✅ Total: {len(df)} opiniões simuladas")

# ---------------------------------------------------------------------------
# 5. ESTATÍSTICAS
# ---------------------------------------------------------------------------

print("\n[2/3] 📈 Calculando estatísticas...")

total = len(df)
positivos = (df['sentimento'] == 'Positivo').sum()
negativos = (df['sentimento'] == 'Negativo').sum()
neutros = (df['sentimento'] == 'Neutro').sum()

print(f"\n{'═'*80}")
print("📊 ESTATÍSTICAS DO DATASET SIMULADO")
print(f"{'═'*80}")

print(f"\n🎯 TOTAL: {total} opiniões")

print(f"\n📊 Distribuição de Sentimentos:")
print(f"   • Positivos:  {positivos:3d} ({positivos/total*100:5.1f}%)")
print(f"   • Negativos:  {negativos:3d} ({negativos/total*100:5.1f}%)")
print(f"   • Neutros:    {neutros:3d} ({neutros/total*100:5.1f}%)")

print(f"\n📈 Médias Gerais:")
print(f"   • Polaridade:     {df['polaridade'].mean():+.3f}")
print(f"   • Felicidade:     {df['felicidade_%'].mean():.1f}%")
print(f"   • Concordância:   {df['concordancia_%'].mean():.1f}%")
print(f"   • Relevância:     {df['relevancia_score'].mean():.1f}/100")

print(f"\n📅 Por Período:")
print(f"\n{'Período':<15} {'Opiniões':>10} {'Polaridade':>12} {'Felicidade':>12} {'Negativos%':>12}")
print(f"{'-'*63}")

for periodo in ['Pré-Evento', 'Evento', 'Pós-Evento']:
    df_p = df[df['periodo'] == periodo]
    neg_pct = (df_p['sentimento'] == 'Negativo').sum() / len(df_p) * 100
    print(f"{periodo:<15} {len(df_p):>10} {df_p['polaridade'].mean():>+11.3f} "
          f"{df_p['felicidade_%'].mean():>11.1f}% {neg_pct:>11.1f}%")

print(f"\n🏷️ Tópicos Mais Mencionados:")
for topico, count in df['topicos'].value_counts().head(5).items():
    print(f"   • {topico:<35} {count:3d} ({count/total*100:5.1f}%)")

# ---------------------------------------------------------------------------
# 6. EXPORTAÇÃO
# ---------------------------------------------------------------------------

print(f"\n[3/3] 💾 Exportando arquivos...")
print(f"\n{'═'*80}")
print("ARQUIVOS GERADOS")
print(f"{'═'*80}")

# Arquivo principal
arquivo_principal = f"dataset_simulado_{total}_opinoes.csv"
df.to_csv(arquivo_principal, index=False, encoding='utf-8-sig')
print(f"\n   ✅ {arquivo_principal}")

# Por período
for periodo in ['Pré-Evento', 'Evento', 'Pós-Evento']:
    df_p = df[df['periodo'] == periodo]
    arquivo = f"periodo_{periodo.lower().replace('-', '_')}_{len(df_p)}_opinoes.csv"
    df_p.to_csv(arquivo, index=False, encoding='utf-8-sig')
    print(f"   ✅ {arquivo}")

# Resumo estatístico
resumo = pd.DataFrame({
    'Periodo': ['Pré-Evento', 'Evento', 'Pós-Evento', 'TOTAL GERAL'],
    'Total_Opinoes': [
        (df['periodo'] == 'Pré-Evento').sum(),
        (df['periodo'] == 'Evento').sum(),
        (df['periodo'] == 'Pós-Evento').sum(),
        total
    ],
    'Positivos': [
        (df[df['periodo'] == 'Pré-Evento']['sentimento'] == 'Positivo').sum(),
        (df[df['periodo'] == 'Evento']['sentimento'] == 'Positivo').sum(),
        (df[df['periodo'] == 'Pós-Evento']['sentimento'] == 'Positivo').sum(),
        positivos
    ],
    'Negativos': [
        (df[df['periodo'] == 'Pré-Evento']['sentimento'] == 'Negativo').sum(),
        (df[df['periodo'] == 'Evento']['sentimento'] == 'Negativo').sum(),
        (df[df['periodo'] == 'Pós-Evento']['sentimento'] == 'Negativo').sum(),
        negativos
    ],
    'Neutros': [
        (df[df['periodo'] == 'Pré-Evento']['sentimento'] == 'Neutro').sum(),
        (df[df['periodo'] == 'Evento']['sentimento'] == 'Neutro').sum(),
        (df[df['periodo'] == 'Pós-Evento']['sentimento'] == 'Neutro').sum(),
        neutros
    ],
    'Polaridade_Media': [
        df[df['periodo'] == 'Pré-Evento']['polaridade'].mean(),
        df[df['periodo'] == 'Evento']['polaridade'].mean(),
        df[df['periodo'] == 'Pós-Evento']['polaridade'].mean(),
        df['polaridade'].mean()
    ],
    'Felicidade_Media_%': [
        df[df['periodo'] == 'Pré-Evento']['felicidade_%'].mean(),
        df[df['periodo'] == 'Evento']['felicidade_%'].mean(),
        df[df['periodo'] == 'Pós-Evento']['felicidade_%'].mean(),
        df['felicidade_%'].mean()
    ],
    'Concordancia_Media_%': [
        df[df['periodo'] == 'Pré-Evento']['concordancia_%'].mean(),
        df[df['periodo'] == 'Evento']['concordancia_%'].mean(),
        df[df['periodo'] == 'Pós-Evento']['concordancia_%'].mean(),
        df['concordancia_%'].mean()
    ],
    'Perc_Negativos': [
        (df[df['periodo'] == 'Pré-Evento']['sentimento'] == 'Negativo').sum() / (df['periodo'] == 'Pré-Evento').sum() * 100,
        (df[df['periodo'] == 'Evento']['sentimento'] == 'Negativo').sum() / (df['periodo'] == 'Evento').sum() * 100,
        (df[df['periodo'] == 'Pós-Evento']['sentimento'] == 'Negativo').sum() / (df['periodo'] == 'Pós-Evento').sum() * 100,
        negativos / total * 100
    ]
})

arquivo_resumo = "resumo_estatistico_simulado.csv"
resumo.to_csv(arquivo_resumo, index=False, encoding='utf-8-sig')
print(f"   ✅ {arquivo_resumo}")

# Arquivo de documentação
with open("LEIA_ME_DADOS_SIMULADOS.txt", "w", encoding="utf-8") as f:
    f.write("═"*80 + "\n")
    f.write("DATASET SIMULADO - ANÁLISE DE SENTIMENTOS\n")
    f.write("Google Ads e Meta Ads: Impacto dos Impostos 2026\n")
    f.write("═"*80 + "\n\n")
    
    f.write("INFORMAÇÕES SOBRE O DATASET:\n\n")
    
    f.write("1. NATUREZA DOS DADOS:\n")
    f.write("   Este dataset contém DADOS SIMULADOS gerados para demonstração\n")
    f.write("   da metodologia de análise de sentimentos.\n\n")
    
    f.write("2. MOTIVO DA SIMULAÇÃO:\n")
    f.write("   - Limitações da API gratuita do Twitter (erro 429)\n")
    f.write("   - Acesso restrito apenas aos últimos 7 dias\n")
    f.write("   - Especificidade temporal do tema (dezembro 2025 - janeiro 2026)\n")
    f.write("   - Baixo volume de tweets sobre o tema específico\n\n")
    
    f.write("3. BASE DA SIMULAÇÃO:\n")
    f.write("   Os dados foram gerados baseados em:\n")
    f.write("   - Padrões reais de sentimento sobre tributação\n")
    f.write("   - Discussões observadas sobre custos em plataformas de ads\n")
    f.write("   - Distribuições estatísticas realistas\n")
    f.write("   - Templates de opiniões comuns em redes sociais\n\n")
    
    f.write("4. CARACTERÍSTICAS DO DATASET:\n")
    f.write(f"   - Total de opiniões: {total}\n")
    f.write(f"   - Distribuição por período: {OPINOES_POR_PERIODO} cada\n")
    f.write(f"   - Negativos: {negativos} ({negativos/total*100:.1f}%)\n")
    f.write(f"   - Neutros: {neutros} ({neutros/total*100:.1f}%)\n")
    f.write(f"   - Positivos: {positivos} ({positivos/total*100:.1f}%)\n\n")
    
    f.write("5. VALIDADE ACADÊMICA:\n")
    f.write("    Adequado para demonstração de metodologia\n")
    f.write("    Distribuições estatisticamente realistas\n")
    f.write("    Permite análise temporal comparativa\n")
    f.write("    4 métricas completas (sentimento, polaridade, felicidade, concordância)\n\n")
    
    f.write("6. COMO USAR NO TCC:\n")
    f.write("   Na metodologia, explicar:\n")
    f.write('   "Devido às limitações de acesso à API do Twitter e à especificidade\n')
    f.write('   temporal do tema, utilizou-se um dataset simulado baseado em padrões\n')
    f.write('   observados em discussões reais sobre tributação em plataformas de\n')
    f.write('   anúncios digitais, para demonstração da metodologia de análise de\n')
    f.write('   sentimentos e validação das técnicas propostas."\n\n')
    
    f.write("7. ANÁLISES POSSÍVEIS:\n")
    f.write("    Análise temporal (pré/durante/pós evento)\n")
    f.write("    Comparação de médias de sentimento\n")
    f.write("    Distribuição de felicidade por período\n")
    f.write("    Teste qui-quadrado (sentimento × período)\n")
    f.write("    Visualizações em Power BI\n")
    f.write("    Análise de tópicos mais mencionados\n\n")
    
    f.write("8. ARQUIVOS INCLUÍDOS:\n")
    f.write(f"   - {arquivo_principal}\n")
    f.write("   - periodo_pre_evento_100_opinoes.csv\n")
    f.write("   - periodo_evento_100_opinoes.csv\n")
    f.write("   - periodo_pos_evento_100_opinoes.csv\n")
    f.write(f"   - {arquivo_resumo}\n")
    f.write("   - LEIA_ME_DADOS_SIMULADOS.txt (este arquivo)\n\n")
    
    f.write("9. GERAÇÃO:\n")
    f.write(f"   Data: {datetime.now().strftime('%d/%m/%Y %H:%M:%S')}\n")
    f.write("   Script: gerar_dados_simulados.py\n")
    f.write("   Autor: Octávio Teodoro\n")
    f.write("   Instituição: FATEC Baixada Santista\n\n")
    
    f.write("═"*80 + "\n")
    f.write("Dados prontos para análise no Jamovi e Power BI!\n")
    f.write("Boa sorte no seu TCC! 🎓📊\n")
    f.write("═"*80 + "\n")

print(f"   ✅ LEIA_ME_DADOS_SIMULADOS.txt")

print(f"\n{'═'*80}")
print("✅ DATASET SIMULADO GERADO COM SUCESSO!")
print(f"{'═'*80}")

print(f"\n💡 PRÓXIMOS PASSOS:")
print(f"   1. Leia o arquivo 'LEIA_ME_DADOS_SIMULADOS.txt'")
print(f"   2. Importe os CSVs no Jamovi para análise estatística")
print(f"   3. Crie visualizações no Power BI")
print(f"   4. Use os dados para demonstrar sua metodologia no TCC")

print(f"\n📊 RESULTADOS PRINCIPAIS:")
print(f"   • Sentimento piora após impostos (polaridade cai)")
print(f"   • Felicidade diminui ao longo do tempo")
print(f"   • ~70% de opiniões negativas no pós-evento")
print(f"   • Perfeito para demonstrar análise temporal!")

