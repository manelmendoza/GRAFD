*! docver: 2.0
*!  title: Analisis preliminar por  cir_v1_doppler==0
*!   html: yes
*!    log: yes
*!comment: 
version 9.1


htput	<meta charset="UTF-8">
version 13.1

htput <head>
htput <script src="toc.js" type="text/javascript"></script>
htput </head>

htput <body onload="generateTOC(document.getElementById('toc'));">
htput <IMG SRC="UEB_IR.png" ALT="UEB-IR" ALIGN=CENTER WIDTH="80%" height="100">
htput <DIV ALIGN="CENTER" class="RED" style="font-size:small"> 
htput  </DIV>
htput <HR>

htput <H1> $HTtitle </H1>
htput <p> <b> $description</b></p>
htput <BR>


htput<p><font size=" 3" color="blue"> <b>Versión $S_DATE</b></font></p>

htput <br>


htput <div id="toc"> </div>

htput	<meta charset="UTF-8">

local tab=300
local fig=300

use "$dta\ana_dades_GRAFD_final.dta", clear


local nreg=_N

count if itt==1
local nitt=r(N)
count if itt==0
local nexc=r(N)

count if per_protocol==1
local npp=r(N)

count if motivo_salida_estudio==2 & itt==0
local nperd=r(N)
local nret=r(N)


count if randomization_group==0
local ncontrol=r(N)

count if randomization_group==1
local nexp=r(N)
ren randomization_group random
keep if itt==1

#delimit ;

htput 


<h2> Análisis Final estudio GRAFD  por cir_v1_doppler==0 </h2>

<p> En este documento se presentan los mismos análisis  para la población por itt con cir_v1_doppler==NO</p>

;
#delimit cr



doglobal
keep if  cir_v1_doppler==0



doglobal	



doglobal	

*-----------------

local varlist1="i.global edad_mat eg_enrolled i.ethnicity peso_inicial talla imc i.ant_parto_termino i.num_parto37 i.tipo_parto37___0 i.tipo_parto37___1 i.tipo_parto37___2 i.tra i.ant_abortos num_abortos"
local varlist2=" i.antec_pp i.num_pp i.tipo_parto_prematuro___0 i.tipo_parto_prematuro___1 i.tipo_parto_prematuro___2 i.ante_cir i.ante_peg i.ante_obito i.ant_preeclampsia i.antec_ces num_cesareas i.dm1 i.dm2 "
local varlist3="i.hta_pregestacional i.saf i.autoinmune i.tabaco i.drogas i.drogas_tipo___1 i.drogas_tipo___2 i.drogas_tipo___3 i.drogas_tipo___4 i.drogas_tipo___5 i.drogas_tipo___6 i.drogas_tipo___7 "


****************** TABLA 1  Analisis descriptivos Randomization Group

set graph off
anadesc , varsgrup("random") vardesc1(" `varlist1' `varlist2' `varlist3'")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle(" Características basales según grupo de intervención ") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)


****************** TABLA 2  Característica variables de la visita 1


htput <h2> Características de las variables de la visita 1   según grupo de intervención </h2>

htput <p> En este caso se efectúan los mismos análisis que en la visita anterior pero al ser datos de seguimiento tiene sentido el p valor.  </p>

local tab=`tab'+1

*"Comparaciones variables visita 1 según grupo aleatorizado"


*-----------------

local varlist1="sflt1 plgf1 sflt_plgf1 tas1 tad1 prot1 peso1 dbp1 cc1 ca1 lf1 pfe1 percentil_pfe1 ip_umb1 p_umb1 "
local varlist2="ip_acm1 p_acm1 icp1 p_icp1 ip_utd1 ip_utiz1 ipm_uterinas1 p_ipm_ut1 i.nst1 "



set graph off
anadesc , varsgrup("random") vardesc1(" `varlist1' `varlist2' ")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle("Comparaciones variables visita 1 según grupo aleatorizado") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)


local tab=`tab'+1
printtab `tab' "Motivos de finalización antes de tiempo en visita 1"

unab lista:manejo1* 
ht_mrtab `lista' , by(random) nonames col  mtest(bonferroni)  




****************** TABLA3  Analisis del resultado gestacional descriptivos Randomization Group




htput <h2> Analisis del resultado gestacional según grupo de intervención </h2>

htput <p> En este caso se efectúan los mismos análisis que en las tablas anteriores. Se evalua el resultado gestacional y ///
el grupo de intervención. En este análisis simplemnte se efectúa un contraste de hipótesis  y para las variables adicionales /// 
se caculara el RR. </p>



*-----------------



* "Comparaciones variables gestacionales según grupo aleatorizado"


local varlist1="eg_parto dias_ing_madre i.parto_esp i.induccion_2 i.cervix_inducci_n i.metodo_induc" 
local varlist2=" i.via_parto i.instrument_nst i.ces_urgente  apgar1 apgar5 apgar10 pharteria i.eb_arteria i.signo_exceso_base"
local varlist3=" exceso_base   i.hta_gest i.preeclampsia eg_dx_pe i.preec_grave   i.eclampsia i.dppni "
local varlist4=" i.obito  i.eg_obito i.cid i.hemor_pparto i.hemor_cereb i.embolia i.tvp i.uci"
local varlist5=" dias_uci i.muerte_mat"

set graph off
anadesc , varsgrup("random") vardesc1(" `varlist1' `varlist2' `varlist3'")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle(" Comparaciones variables gestacionales según grupo aleatorizado") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)





/*
local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según resultados  gestacionales"



local listavar1=" parto_esp induccion_2 cervix_inducci_n metodo_induc" 
local listavar2=" via_parto instrument_nst ces_urgente  eb_arteria signo_exceso_base"
local listavar3="   hta_gest preeclampsia eg_dx_pe preec_grave  eclampsia dppni "
local listavar4=" obito  eg_obito cid hemor_pparto hemor_cereb embolia tvp uci"
local listavar5="  muerte_mat"
 
foreach var in `listavar1' `listavar2' `listavar3' `listavar4' `listavar5' {

local tag=""
disp   `"`var'"'
if  `"`var'"'=="parto_esp" local tag="head"
if `"`var'"'=="muerte_mat" local tag="close"

 ht_rr `var' random , `tag'  wilson
 }
 

foreach var in `listavar1' `listavar2' `listavar3' `listavar4' `listavar5' {
preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
	  local den1=`a' +`c'
        local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
	
			 
		   
if `rd' !=.{

	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  *post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
	disp in yellow "`grafname' $$$$$$"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' ">
    htput <BR>
    **************
	}
	restore
	}
	
*/



local tab=`tab'+1
printtab `tab' "Motivos de finalización antes de tiempo"

unab lista: motivo_fina* 
ht_mrtab `lista' , by(random) nonames col mtest(bonferroni)

local tab=`tab'+1
printtab `tab' "Motivos de cesàreas"
unab lista : motivo_ces*
ht_mrtab `lista', by(random) nonames col  mtest(bonferroni)


local tab=`tab'+1
printtab `tab' "Criterios de gravedad preeclampsia (solo en grupo casos en grupo control"
unab lista : criterio_grave_*
ht_mrtab `lista' if random==0 ,nonames 




* "Comparaciones variables neonatos según grupo aleatorizado"


 local varlist1="pesorn i.sexo dias_ingreso_nn i.ucin dias_ucin i.sdr i.taquipnea i.dbpulmonar i.surfactante i.o2 dias_o2"
  local varlist2="i.canula_nasal dias_canula i.cpap dias_cpap  i.vafo dias_vafo i.ventil_mec dias_vmi i.ecmo dias_ecmo"
local varlist3="i.asp_meconial i.ictericia i.fototerapia i.hipoglicemia" 
 local varlist4="i.nec i.sepsis i.neumonia i.meningitis i.convulsion i.hiv i.muerte_nn i.otras_causas_ucin "



set graph off
anadesc , varsgrup("random") vardesc1(" `varlist1' `varlist2' `varlist3'")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle(" Comparaciones variables resultado neonato según grupo aleatorizado") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)


*/



/*

local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según resultado del neonato"


 local listavar1="sexo  ucin  sdr taquipnea dbpulmonar surfactante o2 "
  local listavar2="canula_nasal cpap   vafo  ventil_mec  ecmo "
local listavar3="asp_meconial ictericia fototerapia hipoglicemia" 
 local listavar4="nec sepsis neumonia meningitis convulsion hiv muerte_nn otras_causas_ucin "

 
foreach var in `listavar1' `listavar2' `listavar3' `listavar4' {

local tag=""
disp   `"`var'"'
if  `"`var'"'=="sexo" local tag="head"
if `"`var'"'=="otras_causas_ucin" local tag="close"

 ht_rr `var' random , `tag'  wilson  
 }
 

foreach var in `listavar1' `listavar2' `listavar3' `listavar4'  {
preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
		  local den1=`a' +`c'
        local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
			 
		   

if `rd' !=.{
	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' ">
    htput <BR>
    **************
	}
	restore
	}
	

*/


htput <h2> Analisis de  Riesgos  </h3>

htput <p> En este caso se dispone de unas variables explicativas y outcomes que en primer lugar se analizan como el resto de variables ///
y que despues se calculará el porcentaje y su diferencia y se efectuará la representación gràfica. Los valores perdidos se han considerado que no se observa el fenómeno.  </p>


tempfile results
cap postclose  relrisk
postfile  relrisk   str60 variable  pyes pno rd lird lsrd rpp lirpp lsrpp   using `results'



******************  Adverse primary outcomes

replace ces_urgente=0 if ces_urgente==. & presenta_adv_pri_outc_dic!=.
replace acidosis=0 if acidosis==. & presenta_adv_pri_outc_dic!=.

*local listavar1="i.cir_v1_doppler i.cir_v1_ratio i.cir_v2_doppler i.cir_v2_ratio i.cir_v3_doppler i.cir_v3_ratio"
*local listavar2="i.ph_7_15 i.ph_7_10 i.ph_7_05 i.ph_7_00 i.eb_12 i.acidosis"


local listavar1= "i.acidosis i.ces_urgente  i.presenta_adv_pri_outc_dic"


set graph off
anadesc , varsgrup("random") vardesc1(" `listavar1'  ")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle(" Adverse primary outcome distribution") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)





local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según Adverses primary outcome"
local listavar1=subinstr("`listavar1'","i.","",.)
foreach var in `listavar1'  {

local tag=""
disp   `"`var'"'
if  `"`var'"'=="acidosis" local tag="head"
if `"`var'"'=="presenta_adv_pri_outc_dic" local tag="close"

 ht_rr `var' random , `tag'  wilson
 }
 



foreach var in `listavar1'  {
preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
    local den1=`a' +`c'
     local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
			 
		   
if `rd' !=.{

	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' "  width="300" height="200">
    htput <BR>
    **************
	}
	restore
	}
	


******************* Adverse perinatal outcome
local listavar3= " i.obito   i.apgar7_5min   i.ph_7_05 i.ucin i.peso_rn_lt2000  i.uci i.preeclampsia   i.composite_perinatal"





set graph off
anadesc , varsgrup("random") vardesc1(" `listavar3' ")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle("Adverse perintalta outcome distribution ") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)



local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según Adverse perinatal outcome"


local listavar3=subinstr("`listavar3'","i.","",.)
foreach var in `listavar3' {

local tag=""
disp   `"`var'"'
if  `"`var'"'=="obito" local tag="head"
if `"`var'"'=="composite_perinatal" local tag="close"

 ht_rr `var' random , `tag'  wilson
 }
 
 
 
 

foreach var in `listavar3' {
preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
	
	local den1=`a' +`c'
    local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
	
	
		   
	if `rd' !=.{


	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' "  width="300" height="200">
    htput <BR>
    **************
	}
	restore
	}
	


******************  Adverse neonatal outcome 


local listavar4= "i.sdr i.taquipnea i.ventil_mec   i.hiv i.sepsis i.hipoglicemia i.nec i.fototerapia i.convulsion i.neumonia i.meningitis i.muerte_nn i.composite_neonat"


set graph off
anadesc , varsgrup("random") vardesc1(" `listavar4'  ")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle(" Adverse neonatal outcome distribution") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)





local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según Adverses neonatal outcome "

local listavar4=subinstr("`listavar4'","i.","",.)

foreach var in `listavar4'  {



local tag=""
disp   `"`var'"'
if  `"`var'"'=="sdr" local tag="head"
if `"`var'"'=="composite_neonat" local tag="close"

 ht_rr `var' random , `tag' wilson
 } 
 



foreach var in   `listavar4'  {



preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
	
	local den1=`a' +`c'
    local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
		 
		   
	if `rd' !=.{


	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' "  width="300" height="200">
    htput <BR>
    **************
	}
	restore
	}
	







******************  Other placenta related outcome 


local listavar5= "i.dppni i.hta_gest i.preec_grave i.eclampsia i.hemor_cereb i.muerte_mat i.hemor_pparto i.composite_placenta  "


set graph off
anadesc , varsgrup("random") vardesc1(" `listavar5'  ")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle("Placental-related complications distribution") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)





local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según Placenta related complications "

local listavar5=subinstr("`listavar5'","i.","",.)

foreach var in `listavar5'  {



local tag=""
disp   `"`var'"'
if  `"`var'"'=="dppni" local tag="head"
if `"`var'"'=="composite_placenta" local tag="close"

 ht_rr `var' random , `tag' wilson
 }
 



foreach var in `listavar5'  {
preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
	local den1=`a' +`c'
    local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
	 
		   
if `rd' !=.{

	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' "  width="300" height="200">
    htput <BR>
    **************
	}
	restore
	}
	










******************  Other secondary outcomes


local listavar6= "i.part_38 i.part_39 i.part_40 i.parto_38_por_cir i.parto_39_por_cir i.parto_40_por_cir i.parto_esp  i.peso_rn_lt2500 i.ph_7_10 i.ces_ind_fallida  i.cesarea   i.instrument_nst "


set graph off
anadesc , varsgrup("random") vardesc1(" `listavar6'  ")  nototal  ci lang("eng")   gname("fig_") legsize("vsmall") ntab(`tab') nfig(`fig') addtitle("Placental-related complications distribution") 
set graph on
 

local tab=r(ntab)
local fig=r(nfig)





local tab=`tab'+1
printtab `tab' "Diferencia de riesgos y Razón de riesgos según Placenta related complications "



local listavar6=subinstr("`listavar6'","i.","",.)

foreach var in `listavar6'  {



local tag=""
disp   `"`var'"'
if  `"`var'"'=="part_38" local tag="head"
if `"`var'"'=="instrument_nst" local tag="close"

 ht_rr `var' random , `tag'  wilson
 }
 



foreach var in `listavar6'  {
preserve


local nomvar: var lab `var'
if "`nomvar'"=="" label var `var'"`var'"
if "`nomvar'"==""  local nomvar="`var'"






	   tabulate  `var'  random ,matcell(T)
	 	 
	local d=T[1,1]
    local c=T[1,2]
    local b=T[2,1]
    local a=T[2,2]    
	if "`a'"=="."   local a=0 
	if "`b'"=="."   local b=0 
	if "`c'"=="."   local c=0 
	if "`d'"=="."   local d=0 
	
	local den1=`a' +`c'
    local den2=`b' +`d'

 	qui csi   `a' `b' `c' `d'
	local rd=r(rd)*100
	local lb_rd=r(lb_rd) *100
	local ub_rd=r(ub_rd) *100
 if `rd'*100 <=0 {
		     rdiff `den2' `b' `den1' `a' 
			 
			 local ub_rd=-r(ll_w)*100 
			 local lb_rd=-r(ul_w)*100
			 }
		     
		else {
		      rdiff `den1' `a' `den2' `b' 
			 
			 local ub_rd=r(ul_w)*100 
			 local lb_rd=r(ll_w)*100
		
		}
	
		   
if `rd' !=.{

	
	gen rd=`rd'
	gen lird=`lb_rd'
	gen lsrd=`ub_rd'
	
	
	keep if _n==1
	
	
	gen  x=1
	gen xipp=1.1
	
	
	gen rpp=r(rr)
	gen lirpp=r(lb_rr)
	gen lsrpp=r(ub_rr)
	
 format rd %5.2f
 format lird %5.2f
 format lsrd %5.2f
 local rd: disp  %5.2f  rd[1]
 local lird:disp  %5.2f lird[1]
  local lsrd:disp  %5.2f lsrd[1]
  
  format rpp %5.2f
 format lirpp %5.2f
 format lsrpp %5.2f
 local rpp: disp  %5.2f  rpp[1]
 local lirpp:disp  %5.2f lirpp[1]
  local lsrpp:disp  %5.2f lsrpp[1]
      local pa: di %5.1f  (`a'/`den1')*100  
        local pb: di %5.1f  (`b'/`den2')*100  

  post  relrisk  ("`nomvar'") (`pa') (`pb') (`rd') (`lird') (`lsrd') (`rpp') (`lirpp') (`lsrpp') 
  
	 
	twoway rcap lsrd lird x,horizontal   color(red) ///
 	|| sc x  rd, xline( 0, lcolor(blue)   lpattern("dash")) xline(8.5,lcolor(blue))    msize(small) mcolor(blue) mlabel(rd) mlabposition(6)  ///
	   	text(1 `lird' "`lird'", place(s) color(red) size(small)) ///
		text(1 `lsrd' "`lsrd'", place(s) color(red) size(small)) ///
		text(1.2 .5 " Non inferiority margin ", place(n) color(red) size(small)) ///
	||	(scatteri 1.2 0  1.2 8.5, connect(line) mcolor(none)  lcolor(blue)) ///
     || , ytitle("") title(Rate Difference of preterm preeclampsia in the two study arms,size(medsmall)) ///
      xlab(0"0" 8.5 "{&Delta}=8.5", labsize(small)  ) legend(off)  ysc(range( .8 1.3)) ylab(none) 
	 
	local fig=`fig'+1
    printfig `fig' "Rate difference of `nomvar' " 
	local grafname= "fig_`fig'"
    
    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' "  width="300" height="200">
    htput <BR>
    **************
	}
	restore
	}


















	postclose relrisk
	preserve
	
	use `results', clear
	
   save "$dta\result_dop0.dta" ,replace

	restore 
	
	
	
***************************************************** Tiempo a parto 	
	
	
	htput <h2> Analisis de tiempo a parto con outcome primero adverso </h2>
	
gen entra=37



stset  eg_parto, f(presenta_adv_pri_outcome)   origin(entra)

*sts graph, f by(random)  xlabel( 0"37" 1"38" 2"39" 3"40"  4"41" 5"42")

local tab=`tab'+1

printtab `tab' "Tablas de tiempo a outcome en semanas desde la 37"
local var="random"
ht_spvlist , by(`var') f at(0 1 2 3 4 5 )





tab random

    local nomvar: var label `var' 
    if   `"`nomvar'"' == ""  local nomvar =  " `var' " 
    ** Funció per crear la llegenda del gràfic 
    crea_llegenda `var'
    local llegenda `r(txt)'
	local order_rtab `r(rtab)'
    ** Funció per crear el format de les línies de la corba de spv
	crea_lineopts `var'
	    local lopts `r(lopt)'
   
    sts graph, f  by(`var')    title("")      ///
	xtitle("Week of gestation at delivery") ytitle("Incidence of Incidencia de parto con primary outcome adverso(%)", size(vsmall)) ///
   legend(`llegenda'   size(vsmall) )  `lopts' title("")  ///
   risktable(,  order(`order_rtab') fail size(tiny) )  ylabel(,angle(h) labsize(vsmall)) ///
  xlabel( 0"37" 1"38" 2"39" 3"40"  4"41" 5"42",angle(h) labsize(vsmall))

  local fig=`fig'+1
   printfig `fig' "Incidencia de parto con primary outcome adverso" 
		
    local grafname= "fig_`fig'"

    ********** GUARDA ELS GRAFICS ******************************************
    graph export $htm\png\gr_`grafname'.png, replace
    graph export $gph\wmf\gr_`grafname'.wmf, replace
    graph save $gph\gph\gr_`grafname'.gph, replace
    htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' "  width="300" height="200">
    htput <BR>
    **************




use "$dta\result_dop0.dta", clear

 
  
 gen id=_N-_n
 gen ofline =-37
 gen ofline1 =-21
 gen ofline2 =-21
 gen ofline3 =-21

 gen ic1=""
 gen ic2=""
 gen ic3=""
local ncases=_N
forvalue i=1(1)`ncases' {
    local   ic1:   disp string(rd[`i'],"%6.2f") 
	local ic2: disp " [" string(lird[`i'],"%6.2f") " ; " string(lsrd[`i'],"%6.2f") "]"
	


	replace ic1="`ic1'" if `i'==_n
	replace ic2="`ic2'" if `i'==_n
	
	}
	
	local fig=`fig'+1
	printfig `fig' "Rate difference for each diference by random group " 
		
 ***************************************
 twoway sc id rd , msize(tiny) mcolor(orange) xscale( range (-10,10)) yscale(off)   ///
             ||  pcspike id  lird  id lsrd ||  ///
			 || sc id ofline, ms(i) mlabel(variable) mlabsize(1.2) mlabcolor(black) ///
			 || sc id ofline1, ms(i) mlabel(ic1) mlabsize(1.2) mlabposition(9) mlabcolor(black) ///
			 || sc id ofline2, ms(i) mlabel(ic2) mlabsize(1.2) mlabposition(3) mlabcolor(black) ///
			 ||, legend(off) xline(0,lpattern(dash) lcolor(green)) ///
                 xlabel( -20(5) 10 8.5 "{&Delta}=8.5" , labsize(tiny)) ytitle("")  yscale(range(0,`ncases') off )  ///
				 xline(8.5,lpattern(dash) lcolor(red))
				 
				  ********** GUARDA ELS GRAFICS ******************************************

local grafname="fig"+"`fig'"

graph export $htm\png\gr_`grafname'.png, replace
graph save $gph\gph\gr`grafname'.gph, replace
graph export $gph\wmf\gr_`grafname'.wmf, replace
htput <IMG SRC=png\gr_`grafname'.png ALT="grafic evolució `namegraf' ">
htput <BR>

	