*------------------------------------------------Do File para correr regresiones------------------------------------------------
clear all
set more off


* !! CAMBIAR DIRECTORIO !!
* directorio donde esta base de datos
global data = "blog-movilidad-social-mexico/data/"

*directorio donde queremos exportar resultados
global output = "blog-movilidad-social-mexico/outputs/"


/*#########################################
  BASE DE DATOS
  #######################################*/
use "$data/clean_data.dta"

* elegimos variables que queremos
  keep 	p134e p18 edad rururb factor LatitudGP LongitudGP region 					///
		Estado cdmx  mujer educ educ_padre educ_madre iriq_or quintil_or iriq_des 	///
		quintil_des clases clases_padre clases_madre anesc_ent anesc_pad anesc_mad p151	
		
* renombrar preguntas
gen inseguridad =.
replace inseguridad = 1 if p134e !=1
replace inseguridad = 0 if p134e ==1
 
label define inseguridad 1 "SI" 2 "NO"
label value inseguridad "inseguridad"
label variable inseguridad "inseguridad"
 
rename p151 color

* variable que indica si persona esta casada
gen casado =.
replace casado = 1 if p18==6
replace casado = 0 if p18!=6

* Edad ^2
*gen edad2 = edad^2, ya no fue necesario, es mejor usar c.edad#c.edad para que Stata nos de los cambios correctos al usar margins

* definimos años de educación para entrevistado, padre y madre
global anesc "anesc_ent anesc_pad anesc_mad"

* color de piel // 3 categorías: negro moreno blanco
gen color_piel =.
replace color_piel = 1 if color <= 5
replace color_piel = 2 if inrange(color,6,8)
replace color_piel = 3 if color > 8

label define color_piel 1 "negro" 2 "moreno" 3 "blanco"
label value color_piel "color_piel"

* etiquetas de variables
label variable quintil_des "q_riqueza"
label variable anesc_ent "educ"
label variable anesc_pad "educ_padre"
label variable anesc_mad "educ_madre"
label variable edad "edad"
*label variable edad2 "edad^2"
label variable rururb "loc_rural"
label variable quintil_or "q_riqueza_origen"

/*#########################################
  ESTADÍSTICA DESCRIPTIVA
  #######################################*/
  cd "$output"
* Tabla de est. descriptiva
* OJO: requiere Stata v15 o más reciente. comando summtab, por eso se deja como comentario

*summtab , cont(anesc_ent anesc_pad anesc_mad edad) catvars(quintil_des mujer rururb inseguridad color_piel quintil_or region casado) mean excel excelname(descr_catego1) replace wts(factor) by(educ) total

* histograma años de educación de entrevistado
twoway  (hist anesc_ent, bin(10) lcolor(none) legend()) 

* histograma años de educación de padres
twoway  (hist anesc_pad, bin(10) fcolor(blue%60) lcolor(none) legend()) (hist anesc_mad, bin(10) lcolor(none) fcolor(red%50))


* Matrices de transición y gráficas
tab quintil_or quintil_des[aw=factor], row nofreq, if educ==1
tab quintil_or quintil_des[aw=factor], row nofreq, if educ==2
tab quintil_or quintil_des[aw=factor], row nofreq, if educ==3
tab quintil_or quintil_des[aw=factor], row nofreq, if educ==4
tab quintil_or quintil_des[aw=factor], row nofreq, if educ==5
tab quintil_or quintil_des[aw=factor], row nofreq, if educ==6

graph bar (sum) quintil_or[pw=factor], over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_general.pdf,replace

graph bar (sum) quintil_or[pw=factor] if educ==1, over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_sineduc.pdf,replace
 
graph bar (sum) quintil_or[pw=factor] if educ==2, over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_primaria_incompleta.pdf,replace

graph bar (sum) quintil_or[pw=factor] if educ==3, over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_primaria.pdf,replace

graph bar (sum) quintil_or[pw=factor] if educ==4, over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_secundaria.pdf,replace

graph bar (sum) quintil_or[pw=factor] if educ==5, over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_prepa.pdf,replace

graph bar (sum) quintil_or[pw=factor] if educ==6, over (quintil_des) asyvar by(quintil_or, cols(5) plotregion(fcolor(white)) graphregion(fcolor(white)) ) stack percent ytitle ("%") blabel(bar, format(%12.1f) size(2) position(center)) bar(1,color(ebg)) bar(2,color(emidblue)) bar(3,color(sandb)) bar(4,color(eltgreen)) bar(5,color(orange)) legend(label(1 "Q 1 (más bajo)") label (2 "Q 2") label (3 "Q 3") label (4 "Q 4") label (5 "Q 5 (más alto)")) name(sin_educ,replace) subtitle(,fcolor(white)) legend(region(lstyle(none)) size(vsmall) cols(5) title(Destino,size(small)))
graph export grafica_transicion_profesional.pdf,replace


/*#########################################
  REGRESIONES PROBIT ORDENADO
  #######################################*/
* sin controles
oprobit quintil_des
dis "La probabilidad de estar en el primer quintil es: " (normal(_b[/cut1]))
dis "La probabilidad de estar en el segundo quintil es : " (normal(_b[/cut2])-normal(_b[/cut1]))
dis "La probabilidad de estar en el tercero quintil es: " (normal(_b[/cut3])-normal(_b[/cut2]))
dis "La probabilidad de estar en el cuarto quintil es: " (normal(_b[/cut4])-normal(_b[/cut3]))
dis "La probabilidad de estar en el último quintil es: " (1-normal(_b[/cut4]))
 
* 1: Probit ordenado años de escolaridad entrevistado
oprobit quintil_des anesc_ent [aw=factor], vce(robust)
estimates store m1

* 2: Probit ordenado años de escolaridad entrevistado + padres
oprobit quintil_des $anesc mujer casado [aw=factor], vce(robust)
estimates store m2

* 3: Probit ordenado años de escolaridad entrevistado + padres + mujer + edad
oprobit quintil_des $anesc mujer casado edad c.edad#c.edad [aw=factor], vce(robust)
estimates store m3

/* 4: Probit ordenado años de escolaridad entrevistado + padres + mujer + edad + urbano
	 + seguridad + color de piel + quintil de origen */
oprobit quintil_des $anesc mujer casado edad c.edad#c.edad rururb inseguridad b3.color_piel i.quintil_or [aw=factor], vce(robust)
estimates store m4

/* 5: Probit ordenado años de escolaridad entrevistado + padres + mujer + edad + urbano
	 + seguridad + color de piel + quintil de origen + region */
oprobit quintil_des $anesc mujer casado edad c.edad#c.edad rururb inseguridad b3.color_piel i.quintil_or b4.region [aw=factor], vce(robust)
estimates store m5

* Guardamos el modelo 5, como es el más completo será nuestra base para analizar efectos marginales
global mod5 anesc_ent anesc_pad anesc_mad mujer casado edad c.edad#c.edad rururb inseguridad b3.color_piel i.quintil_or b4.region

* TABLA CON RESULTADOS DE REGRESIONES
esttab m*, nobaselevels label

esttab m* using "$output\regresiones.html",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01) interaction(" * ")
esttab m* using "$output\regresiones1.csv",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01) interaction(" * ")

* Guardamos base de datos
save "$data\data_regresiones.dta",replace


/*#########################################
  ÁNALISIS DE CAMBIOS MARGINALES PARA PERSONAS CON CIERTO PERFIL
  #######################################*/
esttab m* using "$output\efectos_mg1.csv",se nobaselevels replace label nostar

* variables de interés
br quintil_des $anesc mujer casado edad rururb inseguridad color_piel quintil_or region


* Perfil 1: JUANA ----------------------------------------------------------
* Volvemos a correr modelo 5:
oprobit quintil_des $mod5 [aw=factor], vce(robust)

margins, post dydx(*) predict (outcome(#1)) ///
at(anesc_ent=6 anesc_pad=3 anesc_mad=3 mujer=1 casado=0 edad=25 ///
rururb=1 inseguridad=1 color_piel=2 quintil_or=1 region=5) 


* Perfil 2: MIGUEL ----------------------------------------------------------
* Volvemos a correr modelo 5:
oprobit quintil_des $mod5 [aw=factor], vce(robust)

margins, post dydx(*) predict (outcome(#5)) ///
at(anesc_ent=20 anesc_pad=20 anesc_mad=24 mujer=0 casado=1 edad=40 ///
rururb=0 inseguridad=0 color_piel=3 quintil_or=5 region=4) 


/*#########################################
  TABLA DE EFECTOS MARGINALES para la persona promedio
  #######################################*/


/* EPX: efecto marginal en las medias usando el comando margins */
* <<- EL QUE REPORTAMOS EN EL BLOG
quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#1)) atmeans 
estimates store at1

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#2)) atmeans
estimates store at2

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#3)) atmeans 
estimates store at3

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#4)) atmeans
estimates store at4

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#5)) atmeans
estimates store at5

esttab m5 at* using "$output\epx_probit_modelo5.html",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01)
esttab m5 at* using "$output\epx_probit_modelo5.csv",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01)
esttab m5 at* using "$output\epx_probit_modelo5.tex",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01)

/* EPP: media de efecto parcial usando el comando margins */
quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#1))
estimates store epp1

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#2))
estimates store epp2

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#3))
estimates store epp3

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#4))
estimates store epp4

quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
margins,post dydx(*) predict (outcome(#5))
estimates store epp5


* TABLA CON MODELO 5 MÁS EFECTOS MARGINALES
esttab m5 epp* using "$output\epp_probit_modelo5.html",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01)
esttab m5 epp* using "$output\epp_probit_modelo5.csv",se nobaselevels replace label star(* 0.10 ** 0.05 *** 0.01)


* Como generamos todas las predicciones de probabilidades para cada observación*
quietly oprobit quintil_des $mod5 [aw=factor], vce(robust)
predict pr1 pr2 pr3 pr4 pr5


