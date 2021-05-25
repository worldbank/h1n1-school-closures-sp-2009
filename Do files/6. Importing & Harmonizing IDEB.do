	**
	*This do file imports and harmonizes IDEB
	**
	*___________________________________________________________________________________________________________________________________________________* 

	
	*___________________________________________________________________________________________________________________________________________________* 
	**
	**Program to format Datasets
	**
	*___________________________________________________________________________________________________________________________________________________* 
	cap program drop formatacao
	program define   formatacao
		
		drop uf
		destring, replace
	
		*Network
		*-----------------------------------------------------------------------------------------------------------------------------------------------*
		replace 	 network = "3" if network == "Municipal"
		replace 	 network = "2" if network == "Estadual"
		replace 	 network = "1" if network == "Federal"
		replace 	 network = "5" if network == "Pública"
		destring 	 network, replace

		*-----------------------------------------------------------------------------------------------------------------------------------------------*
		foreach var of varlist math* port* { 
			gen 	A`var' = length(`var')
			gen 	B`var' = substr(`var', -1, 1)
			gen 	C`var' = substr(`var', -2, 2)
			replace  `var' = substr(`var', 1, A`var'-1) if B`var' == "*" & C`var' ~= "**"
			replace  `var' = substr(`var', 1, A`var'-2) if C`var' == "**" 
			replace  `var' = subinstr(`var',",",".",.)
			drop A* B* C*
		}

		*-----------------------------------------------------------------------------------------------------------------------------------------------*
		foreach var of varlist math* port* sp* ideb* target* approval* flowindex* {
			replace `var' = "." if `var' == "ND" | `var' == "ND*" | `var' == "ND**" |`var' == "" |`var' == "-" |`var' == "--"
			destring `var', replace
		}

		*-----------------------------------------------------------------------------------------------------------------------------------------------*
		gen 	 coduf 		= substr(string(codmunic), 1, 2)
		destring coduf		, replace
		gen 	 codmunic2 	= substr(string(codmunic), 1,6)
		destring codmunic2	, replace

		
		#delimit ;
		gen 	uf = "RO" if coduf == 11; replace uf = "AC" if coduf == 12; replace uf = "AM" if coduf == 13; replace uf = "RR" if coduf == 14;
		replace uf = "PA" if coduf == 15; replace uf = "AP" if coduf == 16; replace uf = "TO" if coduf == 17; replace uf = "MA" if coduf == 21;
		replace uf = "PI" if coduf == 22; replace uf = "CE" if coduf == 23; replace uf = "RN" if coduf == 24; replace uf = "PB" if coduf == 25;
		replace uf = "PE" if coduf == 26; replace uf = "AL" if coduf == 27; replace uf = "SE" if coduf == 28; replace uf = "BA" if coduf == 29;
		replace uf = "MG" if coduf == 31; replace uf = "ES" if coduf == 32; replace uf = "RJ" if coduf == 33; replace uf = "SP" if coduf == 35;
		replace uf = "PR" if coduf == 41; replace uf = "SC" if coduf == 42; replace uf = "RS" if coduf == 43; replace uf = "MS" if coduf == 50;
		replace uf = "MT" if coduf == 51; replace uf = "GO" if coduf == 52; replace uf = "DF" if coduf == 53;
		#delimit cr
			
		label define state 11 "RO" 12 "AC" 13 "AM" 14 "RR" 15 "PA" 16 "AP" 17 "TO"  					///
						   21 "MA" 22 "PI" 23 "CE" 24 "RN" 25 "PB" 26 "PE" 27 "AL" 28 "SE" 29 "BA" 		///
						   31 "MG" 32 "ES" 33 "RJ" 35 "SP" 												///
						   41 "PR" 42 "SC" 43 "RS" 														///
						   50 "MS" 51 "MT" 52 "GO" 53 "DF"
		
		label 	  define network  1 "Federal"           2 "State" 			 3 "Municipal" 			4 "Private" 	5 "Public" 
		label 	  val 	 network  network
		label 	  val    coduf    state
		format	  target* flow* math* port* ideb* approval*  %4.2fc
		order  	  year coduf uf codmunic codmunic2 network
		
	end
	
	
	*___________________________________________________________________________________________________________________________________________________* 
	**
	**By School
	**
	*___________________________________________________________________________________________________________________________________________________* 

	**
	*1st to 5th grades
	*---------------------------------------------------------------------------------------------------------------------------------------------------*
	**
		import 	excel "$raw/IDEB/divulgacao_anos_iniciais_escolas_2019.xlsx", cellrange(A11:CX62148) allstring clear //adjust number of rows and columns if necessary

		rename 	(A-CX) (uf codmunic n_munic codschool school network approvalEF12005 approval12005 approval22005 approval32005 approval42005 approval52005 flowindexEF12005 ///
																	 approvalEF12007 approval12007 approval22007 approval32007 approval42007 approval52007 flowindexEF12007 ///
																	 approvalEF12009 approval12009 approval22009 approval32009 approval42009 approval52009 flowindexEF12009 ///
																	 approvalEF12011 approval12011 approval22011 approval32011 approval42011 approval52011 flowindexEF12011 ///
																	 approvalEF12013 approval12013 approval22013 approval32013 approval42013 approval52013 flowindexEF12013 ///
																	 approvalEF12015 approval12015 approval22015 approval32015 approval42015 approval52015 flowindexEF12015 ///
																	 approvalEF12017 approval12017 approval22017 approval32017 approval42017 approval52017 flowindexEF12017 ///
																	 approvalEF12019 approval12019 approval22019 approval32019 approval42019 approval52019 flowindexEF12019 ///
																	 M2005 P2005 NP2005 ///
																	 M2007 P2007 NP2007 ///
																	 M2009 P2009 NP2009 ///
																	 M2011 P2011 NP2011 ///
																	 M2013 P2013 NP2013 ///
																	 M2015 P2015 NP2015 ///
																	 M2017 P2017 NP2017 ///
																	 M2019 P2019 NP2019 ///
																	 IDEB2005 IDEB2007 IDEB2009 IDEB2011 IDEB2013 IDEB2015 IDEB2017 IDEB2019 ///
																	 META2007 META2009 META2011 META2013 META2015 META2017 META2019 META2021)

		reshape long M P NP IDEB META approvalEF1 approval1 approval2 approval3 approval4 approval5 flowindexEF1, i(uf codmunic n_munic network school codschool) j(year)

		rename 	(META-IDEB) (targetEF1 math5 port5 spEF1 idebEF1)
			
		tempfile 1st_5th
		save 	`1st_5th' 
	
	
	**
	*6th to 9th grades
	*---------------------------------------------------------------------------------------------------------------------------------------------------*
	**
		import  excel "$raw/IDEB/divulgacao_anos_finais_escolas_2019.xlsx", cellrange(A11:CP45175) allstring clear		//adjust number of rows and columns if necessary

		rename  (A-CP) (uf codmunic n_munic codschool school network approvalEF22005 approval62005 approval72005 approval82005 approval92005 flowindexEF22005 ///
																	 approvalEF22007 approval62007 approval72007 approval82007 approval92007 flowindexEF22007 ///
																	 approvalEF22009 approval62009 approval72009 approval82009 approval92009 flowindexEF22009 ///
																	 approvalEF22011 approval62011 approval72011 approval82011 approval92011 flowindexEF22011 ///
																	 approvalEF22013 approval62013 approval72013 approval82013 approval92013 flowindexEF22013 ///
																	 approvalEF22015 approval62015 approval72015 approval82015 approval92015 flowindexEF22015 ///
																	 approvalEF22017 approval62017 approval72017 approval82017 approval92017 flowindexEF22017 ///
																	 approvalEF22019 approval62019 approval72019 approval82019 approval92019 flowindexEF22019 ///
																	 M2005 P2005 NP2005 ///
																	 M2007 P2007 NP2007 ///
																	 M2009 P2009 NP2009 ///
																	 M2011 P2011 NP2011 ///
																	 M2013 P2013 NP2013 ///
																	 M2015 P2015 NP2015 ///
																	 M2017 P2017 NP2017 ///
																	 M2019 P2019 NP2019 ///
																	 IDEB2005 IDEB2007 IDEB2009 IDEB2011 IDEB2013 IDEB2015 IDEB2017 IDEB2019 ///
																	 META2007 META2009 META2011 META2013 META2015 META2017 META2019 META2021)

		reshape long M P NP IDEB META approvalEF2 approval6 approval7 approval8 approval9 flowindexEF2,  i(uf codmunic n_munic network school codschool) j(year)
		
		rename 	(META-IDEB) (targetEF2 math9 port9 spEF2 idebEF2)

		tempfile 6th_9th
		save 	`6th_9th' 


	**
	*Appending
	*---------------------------------------------------------------------------------------------------------------------------------------------------*
	**
		use `1st_5th', clear

		merge 1:1 codmunic network codschool year using `6th_9th' , nogen

		drop if uf == "SG_UF"
	
		formatacao
		drop if year == 2019 | year == 2021
		
		*==========================>
		keep if coduf == 35
		*==========================>
				
		compress
		save "$inter/IDEB by school.dta", replace
	
	
	
	*___________________________________________________________________________________________________________________________________________________* 
	**
	**By Municipality
	**
	*___________________________________________________________________________________________________________________________________________________* 
	
	
	**
	*1st to 5th grades
	*---------------------------------------------------------------------------------------------------------------------------------------------------*
	**
		import 	excel "$raw/IDEB/divulgacao_anos_iniciais_municipios_2019.xlsx", cellrange(A11:CV14476) allstring clear

		rename 	(A-CV) (uf codmunic n_munic network approvalEF12005 approval12005 approval22005 approval32005 approval42005 approval52005 flowindexEF12005 ///
													approvalEF12007 approval12007 approval22007 approval32007 approval42007 approval52007 flowindexEF12007 ///
													approvalEF12009 approval12009 approval22009 approval32009 approval42009 approval52009 flowindexEF12009 ///
													approvalEF12011 approval12011 approval22011 approval32011 approval42011 approval52011 flowindexEF12011 ///
													approvalEF12013 approval12013 approval22013 approval32013 approval42013 approval52013 flowindexEF12013 ///
													approvalEF12015 approval12015 approval22015 approval32015 approval42015 approval52015 flowindexEF12015 ///
													approvalEF12017 approval12017 approval22017 approval32017 approval42017 approval52017 flowindexEF12017 ///
													approvalEF12019 approval12019 approval22019 approval32019 approval42019 approval52019 flowindexEF12019 ///
													M2005 P2005 NP2005 ///
													M2007 P2007 NP2007 ///
													M2009 P2009 NP2009 ///
													M2011 P2011 NP2011 ///
													M2013 P2013 NP2013 ///
													M2015 P2015 NP2015 ///
													M2017 P2017 NP2017 ///
													M2019 P2019 NP2019 ///
													IDEB2005 IDEB2007 IDEB2009 IDEB2011 IDEB2013 IDEB2015 IDEB2017 IDEB2019 ///
													META2007 META2009 META2011 META2013 META2015 META2017 META2019 META2021)

		reshape long M P NP IDEB META approvalEF1 approval1 approval2 approval3 approval4 approval5 flowindexEF1, i(uf codmunic n_munic network) j(year)

		rename 	(META-IDEB) (targetEF1 math5 port5 spEF1 idebEF1)

		tempfile 1st_5th
		save 	`1st_5th' 

	**
	*6st to 9th grades
	*---------------------------------------------------------------------------------------------------------------------------------------------------*
	**
		import 	excel "$raw/IDEB/divulgacao_anos_finais_municipios_2019.xlsx", cellrange(A11:CN14383) allstring clear

		rename 	(A-CN) (uf codmunic n_munic network approvalEF22005 approval62005 approval72005 approval82005 approval92005 flowindexEF22005 ///
													approvalEF22007 approval62007 approval72007 approval82007 approval92007 flowindexEF22007 ///
													approvalEF22009 approval62009 approval72009 approval82009 approval92009 flowindexEF22009 ///
													approvalEF22011 approval62011 approval72011 approval82011 approval92011 flowindexEF22011 ///
													approvalEF22013 approval62013 approval72013 approval82013 approval92013 flowindexEF22013 ///
													approvalEF22015 approval62015 approval72015 approval82015 approval92015 flowindexEF22015 ///
													approvalEF22017 approval62017 approval72017 approval82017 approval92017 flowindexEF22017 ///
													approvalEF22019 approval62019 approval72019 approval82019 approval92019 flowindexEF22019 ///
													M2005 P2005 NP2005 /// 
													M2007 P2007 NP2007 ///
													M2009 P2009 NP2009 ///
													M2011 P2011 NP2011 ///
													M2013 P2013 NP2013 ///
													M2015 P2015 NP2015 ///
													M2017 P2017 NP2017 ///
													M2019 P2019 NP2019 ///
													IDEB2005 IDEB2007 IDEB2009 IDEB2011 IDEB2013 IDEB2015 IDEB2017 IDEB2019 ///
													META2007 META2009 META2011 META2013 META2015 META2017 META2019 META2021)

		reshape long M P NP IDEB META approvalEF2 approval6 approval7 approval8 approval9 flowindexEF2, 		 i(uf n_munic n_munic network) j(year)

		rename 	(META-IDEB) (targetEF2 math9 port9 spEF2 idebEF2)

		tempfile 6th_9th
		save 	`6th_9th' 


	**
	*Appending
	*---------------------------------------------------------------------------------------------------------------------------------------------------*
	**
		use `1st_5th', clear

		merge 1:1 codmunic network year using `6th_9th' , nogen

		formatacao
		drop if year == 2019 | year == 2021
		
		*==========================>
		keep if coduf == 35
		*==========================>
		compress
		
		gen T   				= .										//1 for closed schools, 0 otherwise
		gen G	  				= 1										//0 for the 13 municipalities that extended the winter break, 1 otherwise
		gen id_13_mun 			= 0										//1 for the 13 municipalities that extended the winter break, 0 otherwise
		foreach munic in $treated_municipalities {
			replace T   		= 1 		if codmunic == `munic' & network == 3
			replace id_13_mun 	= 1 		if codmunic == `munic'
			replace G	  	  	= 0 		if codmunic == `munic'
		}		
		replace T    			= 1 		if network == 2
		replace T    			= 0 		if T == .
		save "$inter/IDEB by municipality.dta", replace
		
		
		
		