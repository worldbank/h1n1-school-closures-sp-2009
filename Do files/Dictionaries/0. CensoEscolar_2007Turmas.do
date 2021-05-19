clear
set more off
#delimit ;
infix
str	ANO_CENSO	1	 - 	4
str	PK_COD_TURMA	5	 - 	14
str	NO_TURMA	15	 - 	94
str	HR_INICIAL	95	 - 	96
str	HR_INICIAL_MINUTO	97	 - 	98
str	NU_DURACAO_TURMA	99	 - 	101
str	NUM_MATRICULAS	102	 - 	104
str	FK_COD_MOD_ENSINO	105	 - 	106
str	FK_COD_ETAPA_ENSINO	107	 - 	109
str	FK_COD_CURSO_PROF	110	 - 	117
str	FK_COD_TIPO_TURMA	118	 - 	119
str	ID_QUIMICA	120	 - 	120
str	ID_FISICA	121	 - 	121
str	ID_MATEMATICA	122	 - 	122
str	ID_BIOLOGIA	123	 - 	123
str	ID_CIENCIAS	124	 - 	124
str	ID_LINGUA_LITERAT_PORTUGUESA	125	 - 	125
str	ID_LINGUA_LITERAT_INGLES	126	 - 	126
str	ID_LINGUA_LITERAT_ESPANHOL	127	 - 	127
str	ID_LINGUA_LITERAT_OUTRA	128	 - 	128
str	ID_ARTES	129	 - 	129
str	ID_EDUCACAO_FISICA	130	 - 	130
str	ID_HISTORIA	131	 - 	131
str	ID_GEOGRAFIA	132	 - 	132
str	ID_FILOSOFIA	133	 - 	133
str	ID_ESTUDOS_SOCIAIS	134	 - 	134
str	ID_INFORMATICA_COMPUTACAO	135	 - 	135
str	ID_PROFISSIONALIZANTE	136	 - 	136
str	ID_DIDATICA_METODOLOGIA	137	 - 	137
str	ID_FUNDAMENTOS_EDUCACAO	138	 - 	138
str	ID_DISC_ATENDIMENTO_ESPECIAIS	139	 - 	139
str	ID_DISC_DIVERSIDADE_SOCIO_CULT	140	 - 	140
str	ID_OUTRAS_DISCIPLINAS_PEDAG	141	 - 	141
str	ID_LIBRAS	142	 - 	142
str	ID_OUTRAS_DISCIPLINAS	143	 - 	143
str	PK_COD_ENTIDADE	144	 - 	151
str	FK_COD_ESTADO	152	 - 	153
str	SIGLA	154	 - 	155
str	FK_COD_MUNICIPIO	156	 - 	162
str	ID_LOCALIZACAO	163	 - 	163
str	ID_DEPENDENCIA_ADM	164	 - 	164
str	DESC_CATEGORIA_ESCOLA_PRIVADA	165	 - 	165
str	ID_CONVENIADA_PP	166	 - 	166
str	ID_MANT_ESCOLA_PRIVADA_EMP	167	 - 	167
str	ID_MANT_ESCOLA_PRIVADA_ONG	168	 - 	168
str	ID_MANT_ESCOLA_PRIVADA_SIND	169	 - 	169
str	ID_MANT_ESCOLA_PRIVADA_APAE	170	 - 	170
str	ID_DOCUMENTO_REGULAMENTACAO	171	 - 	171
str	ID_LOCALIZACAO_DIFERENCIADA	172	 - 	172
str	ID_EDUCACAO_INDIGENA	173	 - 	173
using "$raw/Censo Escolar/2007/DADOS/TS_TURMA.TXT";
save "$inter/Turmas2007.dta", replace;
clear;

