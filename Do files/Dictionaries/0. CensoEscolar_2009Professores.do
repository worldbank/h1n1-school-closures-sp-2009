clear 
set more off
foreach i in SP {
#delimit ;
infix
str	ANO_CENSO	1	 - 	5
str	FK_COD_DOCENTE	6	 - 	18
str	NU_DIA	19	 - 	21
str	NU_MES	22	 - 	24
str	NU_ANO	25	 - 	29
str	NUM_IDADE	30	 - 	33
str	TP_SEXO	34	 - 	34
str	TP_COR_RACA	35	 - 	35
str	TP_NACIONALIDADE	36	 - 	36
str	FK_COD_PAIS_ORIGEM	37	 - 	40
str	FK_COD_ESTADO_DNASC	41	 - 	43
str	SIGLA_ESTADO_DNASC	44	 - 	45
str	FK_COD_MUNICIPIO_DNASC	46	 - 	53
str	FK_COD_ESTADO_DEND	54	 - 	56
str	SIGLA_ESTADO_DEND	57	 - 	58
str	FK_COD_MUNICIPIO_DEND	59	 - 	66
str	FK_COD_ESCOLARIDADE	67	 - 	68
str	FK_CLASSE_CURSO_1	69	 - 	72
str	FK_COD_AREA_OCDE_1	73	 - 	78
str	ID_LICENCIATURA_1	79	 - 	80
str	NU_ANO_CONCLUSAO_1	81	 - 	85
str	ID_TIPO_INSTITUICAO_1	86	 - 	87
str	ID_NOME_INSTITUICAO_1	88	 - 	187
str	FK_COD_IES_1	188	 - 	196
str	FK_CLASSE_CURSO_2	197	 - 	200
str	FK_COD_AREA_OCDE_2	201	 - 	206
str	ID_LICENCIATURA_2	207	 - 	208
str	NU_ANO_CONCLUSAO_2	209	 - 	213
str	ID_TIPO_INSTITUICAO_2	214	 - 	215
str	ID_NOME_INSTITUICAO_2	216	 - 	315
str	FK_COD_IES_2	316	 - 	324
str	FK_CLASSE_CURSO_3	325	 - 	328
str	FK_COD_AREA_OCDE_3	329	 - 	334
str	ID_LICENCIATURA_3	335	 - 	336
str	NU_ANO_CONCLUSAO_3	337	 - 	341
str	ID_TIPO_INSTITUICAO_3	342	 - 	343
str	ID_NOME_INSTITUICAO_3	344	 - 	443
str	FK_COD_IES_3	444	 - 	452
str	ID_QUIMICA	453	 - 	453
str	ID_FISICA	454	 - 	454
str	ID_MATEMATICA	455	 - 	455
str	ID_BIOLOGIA	456	 - 	456
str	ID_CIENCIAS	457	 - 	457
str	ID_LINGUA_LITERAT_PORTUGUESA	458	 - 	458
str	ID_LINGUA_LITERAT_INGLES	459	 - 	459
str	ID_LINGUA_LITERAT_ESPANHOL	460	 - 	460
str	ID_LINGUA_LITERAT_OUTRA	461	 - 	461
str	ID_LINGUA_LITERAT_INDIGENA	462	 - 	462
str	ID_ARTES	463	 - 	463
str	ID_EDUCACAO_FISICA	464	 - 	464
str	ID_HISTORIA	465	 - 	465
str	ID_GEOGRAFIA	466	 - 	466
str	ID_FILOSOFIA	467	 - 	467
str	ID_ENSINO_RELIGIOSO	468	 - 	468
str	ID_ESTUDOS_SOCIAIS	469	 - 	469
str	ID_INFORMATICA_COMPUTACAO	470	 - 	470
str	ID_PROFISSIONALIZANTE	471	 - 	471
str	ID_DISC_ATENDIMENTO_ESPECIAIS	472	 - 	472
str	ID_DISC_DIVERSIDADE_SOCIO_CULT	473	 - 	473
str	ID_LIBRAS	474	 - 	474
str	ID_DISCIPLINAS_PEDAG	475	 - 	475
str	ID_OUTRAS_DISCIPLINAS	476	 - 	476
str	ID_ESPECIALIZACAO	477	 - 	477
str	ID_MESTRADO	478	 - 	478
str	ID_DOUTORADO	479	 - 	479
str	ID_POS_GRADUACAO_NENHUM	480	 - 	480
str	ID_ESPECIFICO_CRECHE	481	 - 	481
str	ID_ESPECIFICO_PRE_ESCOLA	482	 - 	482
str	ID_ESPECIFICO_NEC_ESP	483	 - 	483
str	ID_ESPECIFICO_ED_INDIGENA	484	 - 	484
str	ID_INTERCULTURAL_OUTROS	485	 - 	485
str	ID_ESPECIFICO_NENHUM	486	 - 	486
str	ID_TIPO_DOCENTE	487	 - 	487
str	PK_COD_TURMA	488	 - 	498
str	FK_COD_TIPO_TURMA	499	 - 	501
str	FK_COD_MOD_ENSINO	502	 - 	504
str	FK_COD_ETAPA_ENSINO	505	 - 	508
str	FK_COD_CURSO_PROF	509	 - 	517
str	PK_COD_ENTIDADE	518	 - 	526
str	FK_COD_ESTADO	527	 - 	529
str	SIGLA	530	 - 	531
str	FK_COD_MUNICIPIO	532	 - 	539
str	ID_LOCALIZACAO	540	 - 	540
str	ID_DEPENDENCIA_ADM	541	 - 	541
str	DESC_CATEGORIA_ESCOLA_PRIVADA	542	 - 	542
str	ID_CONVENIADA_PP	543	 - 	543
str	ID_TIPO_CONVENIO_PODER_PUBLICO	544	 - 	545
str	ID_MANT_ESCOLA_PRIVADA_EMP	546	 - 	546
str	ID_MANT_ESCOLA_PRIVADA_ONG	547	 - 	547
str	ID_MANT_ESCOLA_PRIVADA_SIND	548	 - 	548
str	ID_MANT_ESCOLA_PRIVADA_S_FINS	549	 - 	549
str	ID_DOCUMENTO_REGULAMENTACAO	550	 - 	550
str	ID_LOCALIZACAO_DIFERENCIADA	551	 - 	551
str	ID_EDUCACAO_INDIGENA	552	 - 	552
using "$raw/Censo Escolar/2009/DADOS/TS_DOCENTES_`i'.txt";
save "$inter/Professores2009`i'.dta", replace;
clear; 
};
