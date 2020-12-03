* ESTE DO FILE FUE CREADO POR EL CEEY
* nosotros hicimos ligeras adecuaciones

#delimit;
clear all;
set more off;

******************************************************************************
******************************************************************************
*****DO FILE PARA LA ESTIMACIÓN DE LAS VARIABLES PARA EL INFORME 2017 DEL
*****CENTRO DE ESTUDIOS ESPINOSA YGLESIAS
*****ENCUESTA ESRU DE MOVILIDAD SOCIAL EN MÉXICO 2017
******************************************************************************
******************************************************************************;

****CUALQUIER DUDA ESCRIBIR A: encuesta@ceey.org.mx;



****1. Se indican las carpeta en las cuales se encuentra las bases de entrevis-
****   tados y hogar, así como la bitácora;

gl data="blog-movilidad-social-mexico/data/";


****2. Se generan el archivo bitáctora y se abre la base a partir de la cual 
****   se generan las variables para la base de entrevistado;

use "$data\entrevistado_emovi17.dta", replace;

*****************************************
*****************************************
**VARIABLES EDUCATIVAS
*****************************************
*****************************************;

***Nivel educativo del entrevistado;
gen educ=.;
replace educ=1 if p13==97 ;
replace educ=1 if p13==1;

replace educ=2 if p13==2 & (p14>=1 & p14<=5);

replace educ=3 if p13==2 & p14==6;
replace educ=3 if p13==3 & (p14>=1 & p14<=2);
replace educ=3 if p13==4 & (p14>=1 & p14<=2);

replace educ=4 if p13==3 & (p14>=3 & p14!=.);
replace educ=4 if p13==4 & (p14>=3 & p14!=.);
replace educ=4 if p13==5 & (p14>=1 & p14<=2);
replace educ=4 if p13==6 & (p14>=1 & p14<=2);
replace educ=4 if p13==7 & (p14>=1 & p14<=2);
replace educ=4 if p13==9 & (p14>=1 & p14<=2);

replace educ=5 if p13==5 & (p14>=3 & p14!=.);
replace educ=5 if p13==6 & (p14>=3 & p14!=.);
replace educ=5 if p13==7 & (p14>=3 & p14!=.);
replace educ=5 if p13==8 & (p14>=1 & p14<=2);
replace educ=5 if p13==9 & (p14>=3 & p14!=.);
replace educ=5 if p13==10 & (p14>=1 & p14<=3);
replace educ=5 if p13==11 & (p14>=1 & p14<=3);

replace educ=6 if p13==8 & (p14>=3 & p14!=.);
replace educ=6 if p13==10 & (p14>=4 & p14!=.);
replace educ=6 if p13==11 & (p14>=4 & p14!=.);
replace educ=6 if p13==12;


***Nivel educativo del padre;
gen educ_padre=.;
replace educ_padre=1 if p42==2;
replace educ_padre=1 if p43==1;

replace educ_padre=2 if p43==2 & (p44>=1 & p44<=5);

replace educ_padre=3 if p43==2 & p44==6;
replace educ_padre=3 if p43==3 & (p44>=1 & p44<=2);
replace educ_padre=3 if p43==4 & (p44>=1 & p44<=2);

replace educ_padre=4 if p43==3 & (p44>=3 & p44!=.);
replace educ_padre=4 if p43==4 & (p44>=3 & p44!=.);
replace educ_padre=4 if p43==5 & (p44>=1 & p44<=2);
replace educ_padre=4 if p43==6 & (p44>=1 & p44<=2);
replace educ_padre=4 if p43==7 & (p44>=1 & p44<=2);
replace educ_padre=4 if p43==9 & (p44>=1 & p44<=2);

replace educ_padre=5 if p43==5 & (p44>=3 & p44!=.);
replace educ_padre=5 if p43==6 & (p44>=3 & p44!=.);
replace educ_padre=5 if p43==7 & (p44>=3 & p44!=.);
replace educ_padre=5 if p43==8 & (p44>=1 & p44<=2);
replace educ_padre=5 if p43==9 & (p44>=3 & p44!=.);
replace educ_padre=5 if p43==10 & (p44>=1 & p44<=3);
replace educ_padre=5 if p43==11 & (p44>=1 & p44<=3);

replace educ_padre=6 if p43==8 & (p44>=3 & p44!=.);
replace educ_padre=6 if p43==10 & (p44>=4 & p44!=.);
replace educ_padre=6 if p43==11 & (p44>=4 & p44!=.);
replace educ_padre=6 if p43==12;


***Nivel educativo de la madre;
gen educ_madre=.;

replace educ_madre=1 if p42m==2;
replace educ_madre=1 if p43m==1;

replace educ_madre=2 if p43m==2 & (p44m>=1 & p44m<=5);

replace educ_madre=3 if p43m==2 & p44m==6;
replace educ_madre=3 if p43m==3 & (p44m>=1 & p44m<=2);
replace educ_madre=3 if p43m==4 & (p44m>=1 & p44m<=2);

replace educ_madre=4 if p43m==3 & (p44m>=3 & p44m!=.);
replace educ_madre=4 if p43m==4 & (p44m>=3 & p44m!=.);
replace educ_madre=4 if p43m==5 & (p44m>=1 & p44m<=2);
replace educ_madre=4 if p43m==6 & (p44m>=1 & p44m<=2);
replace educ_madre=4 if p43m==7 & (p44m>=1 & p44m<=2);
replace educ_madre=4 if p43m==9 & (p44m>=1 & p44m<=2);

replace educ_madre=5 if p43m==5 & (p44m>=3 & p44m!=.);
replace educ_madre=5 if p43m==6 & (p44m>=3 & p44m!=.);
replace educ_madre=5 if p43m==7 & (p44m>=3 & p44m!=.);
replace educ_madre=5 if p43m==8 & (p44m>=1 & p44m<=2);
replace educ_madre=5 if p43m==9 & (p44m>=3 & p44m!=.);
replace educ_madre=5 if p43m==10 & (p44m>=1 & p44m<=3);
replace educ_madre=5 if p43m==11 & (p44m>=1 & p44m<=3);

replace educ_madre=6 if p43m==8 & (p44m>=3 & p44m!=.);
replace educ_madre=6 if p43m==10 & (p44m>=4 & p44m!=.);
replace educ_madre=6 if p43m==11 & (p44m>=4 & p44m!=.);
replace educ_madre=6 if p43m==12;


label var educ "Nivel educativo del entrevistado";
label var educ_padre "Nivel educativo del padre del entrevistado";
label var educ_madre "Nivel educativo de la madre del entrevistado";

label define educ	1 "Sin estudios"
					2 "Primaria incompleta"
					3 "Primaria"
					4 "Secundaria"
					5 "Preparatoria"
					6 "Profesional";
label value educ educ;
label value educ_padre educ;
label value educ_madre educ;



*****CLASIFICACIÓN AGRUPADA DE EDUCACIÓN DE LOS PADRES;

gen educ_padre_2=.;
replace educ_padre_2=1 if educ_padre==1 | educ_padre==2 | educ_padre==3;
replace educ_padre_2=2 if educ_padre==4;
replace educ_padre_2=3 if educ_padre==5;
replace educ_padre_2=4 if educ_padre==6;
label var educ_padre_2 "Segunda clasificación de educación del padre";

label define educ_2 1 "A lo más primaria"
					2 "Secundaria"
					3 "Preparatoria"
					4 "Profesional";
label value educ_padre_2 educ_2;



****************************************
****************************************
***ÍNDICE DE RIQUEZA
****************************************
****************************************;

***Hogar de origen;

gen piso=.;
replace piso=1 if p29==2 | p29==3;
replace piso=0 if p29==1;
label var piso "Piso de cemento o madera";

recode p30* p33* p34* (2=0) (8=.);

mca p30_a p30_b p30_c p30_d p30_e p33_a p33_b p33_c p33_d p33_e p33_f p33_g 
	p33_h p33_i p33_j p33_k p33_l p33_m p33_n, method(burt);

predict i_or if e(sample);
replace i_or=i_or*(-1);
sum i_or[iw=factor];
gen iriq_or=(i_or-r(mean))/r(sd);
label var iriq_or "Índice de riqueza del hogar de origen";
xtile quintil_or=iriq_or[aw=factor], nq(5);
	

***Hogar actual;

recode p125* p126* p128* p129* (2=0);

mca p125b p125d p125e p126a p126b p126c p126d p126e p126f p126g p126h p126i 
	p126j p126k p126l p126m p126n p126o p128c p128d p128e p129a, method(burt);

predict i_des if e(sample);
replace i_des=i_des*(-1);
sum i_des[iw=factor];
gen iriq_des=(i_des-r(mean))/r(sd);
label var iriq_des "Índice de riqueza del hogar de origen";
xtile quintil_des=iriq_des[aw=factor], nq(5);




****************************************
****************************************
***VARIABLES OCUPACION
****************************************
****************************************;

*Se agrupan los codigos de la CMO para generar la clasificación;

gen clases_padre=.;
replace clases_padre=1 if cmo1_2=="41";
replace clases_padre=2 if cmo1_2=="54" | cmo1_2=="72" | cmo1_2=="81" | 
						  cmo1_2=="82" | cmo1_2=="83";
replace clases_padre=3 if cmo1_2=="51" | cmo1_2=="52" | cmo1_2=="53" | cmo1_2=="55";
replace clases_padre=4 if cmo1_2=="71";
replace clases_padre=5 if cmo1_2=="12" | cmo1_2=="13" | cmo1_2=="14" | cmo1_2=="62";
replace clases_padre=6 if cmo1_2=="11" | cmo1_2=="21" | cmo1_2=="61";


gen clases_madre=.;
replace clases_madre=1 if cmo2_2=="41";
replace clases_madre=2 if cmo2_2=="54" | cmo2_2=="72" | cmo2_2=="81" | 
						  cmo2_2=="82" | cmo2_2=="83";
replace clases_madre=3 if cmo2_2=="51" | cmo2_2=="52" | cmo2_2=="53" | cmo2_2=="55";
replace clases_madre=4 if cmo2_2=="71";
replace clases_madre=5 if cmo2_2=="12" | cmo2_2=="13" | cmo2_2=="14" | cmo2_2=="62";
replace clases_madre=6 if cmo2_2=="11" | cmo2_2=="21" | cmo2_2=="61";


gen clases=.;
replace clases=1 if cmo3_2=="41";
replace clases=2 if cmo3_2=="54" | cmo3_2=="72" | cmo3_2=="81" | cmo3_2=="82" | 
					cmo3_2=="83";
replace clases=3 if cmo3_2=="51" | cmo3_2=="52" | cmo3_2=="53" | cmo3_2=="55";
replace clases=4 if cmo3_2=="71";
replace clases=5 if cmo3_2=="12" | cmo3_2=="13" | cmo3_2=="14" | cmo3_2=="62";
replace clases=6 if cmo3_2=="11" | cmo3_2=="21" | cmo3_2=="61";



label var clases "Clasificacion ocupacional del encuestado";
label var clases_padre "Clasificacion ocupacional del padre del encuestado";
label var clases_madre "Clasificacion ocupacional de la madre del encuestado";
label define clases 6 "No manual alta calif" 
					5 "No manual baja calif" 
					4 "Comercio" 
					3 "Manual alta calif" 
					2 "Manual baja calif" 
					1 "Agricolas";
label values clases clases_padre clases_madre clases;



****************************************
****************************************
***VARIABLES ÍNDICE SOCIOECONÓMICO
****************************************
****************************************;

***Niveles educativos de los padres de los entrevistados;
gen niveducp=1 if p42==2;
replace niveducp=2 if p43==1;
replace niveducp=3 if p43==2;
replace niveducp=4 if p43==3 | p43==4;
replace niveducp=5 if p43==5 | p43==6 | p43==7 | p43==9;
replace niveducp=6 if p43==8 | p43==10 | p43==11 | p43==12;


gen niveducm=1 if p42m==2;
replace niveducm=2 if p43m==1;
replace niveducm=3 if p43m==2;
replace niveducm=4 if p43m==3 | p43m==4;
replace niveducm=5 if p43m==5 | p43m==6 | p43m==7 | p43m==9;
replace niveducm=6 if p43m==8 | p43m==10 | p43m==11 | p43m==12;


gen niveduc=1 if p13==97;
replace niveduc=2 if p13==1;
replace niveduc=3 if p13==2;
replace niveduc=4 if p13==3 | p13==4;
replace niveduc=5 if p13==5 | p13==6 | p13==7 | p13==9;
replace niveduc=6 if p13==8 | p13==10 | p13==11 | p13==12;



***Años de educación del entrevistado y sus padres;
gen anesc_pad=.;
replace anesc_pad=0 if niveducp==1;
replace anesc_pad=p44 if niveducm==2;
replace anesc_pad=6+p44 if niveducp==3;
replace anesc_pad=9+p44 if niveducp==4;
replace anesc_pad=12+p44 if niveducp==5;
replace anesc_pad=16+p44 if niveducp==6;
label var anesc_pad "Años de escolaridad del padre";


gen anesc_mad=.;
replace anesc_mad=0 if niveducm==1;
replace anesc_mad=p44m if niveducm==2;
replace anesc_mad=6+p44m if niveducm==3;
replace anesc_mad=9+p44m if niveducm==4;
replace anesc_mad=12+p44m if niveducm==5;
replace anesc_mad=16+p44m if niveducm==6;
label var anesc_mad "Años de escolaridad de la madre";


egen anesc_padres=rowmean(anesc_pad anesc_mad);
label var anesc_padres "Años de escolaridad promedio de los padres";


gen anesc_ent=.;
replace anesc_ent=0 if niveduc==1;
replace anesc_ent=p14 if niveduc==2;
replace anesc_ent=6+p14 if niveduc==3;
replace anesc_ent=9+p14 if niveduc==4;
replace anesc_ent=12+p14 if niveduc==5;
replace anesc_ent=16+p14 if niveduc==6;
label var anesc_ent "Años de escolaridad del entrevistado";

drop niveduc*;

***Variable indicadora de hacinamiento del hogar de origen, así como del hogar 
***del entrevistado;

gen padres_hac=p27/p28_1;
label var padres_hac "Variable indicadora de hacinamiento hogar de origen";

gen hijo_hac=tamhog/p121;
label var hijo_hac "Variable indicador de hacinamiento hogar actual";


***Seleccion de de activos;

****Padres;
gen padres_agua=p30_a==1;
gen padres_estufa=p33_a==1;
gen padres_elect=p30_b==1;
gen padres_tv=p33_e==1;
gen padres_refri=p33_c==1;
gen padres_lavad=p33_b==1;
gen padres_telfijo=p33_d==1;
gen padres_compu=p33_k==1;
gen padres_videoc=p33_n==1;
gen padres_micro=p33_i==1;
gen padres_tvcable=p33_h==1;
gen padres_duenoviv=p34_a==1;
gen padres_duenolocal=p34_b==1;
gen padres_duenotierra=p34_c==1;
gen padres_duenootro=p34_d==1;
gen padres_auto=p34_e==1;
gen padres_tractor=p34_f==1;
gen padres_animales=p34_g==1;
gen padres_ganado=p34_h==1;
gen padres_banco=p32_b==1;
gen padres_tarjcredito=p32_c==1;
gen padres_boiler=p30_d==1;
gen padres_serv=p30_e==1;
gen padres_asp=p33_g==1;
gen padres_viv=1 if p31==3;
replace padres_viv=0 if p31==1 | p31==2 | p31==4 | p31==5;

****Hijos;

gen hijo_agua=p125a==1;
gen hijo_estufa=p126a==1;
gen hijo_elect=p125b==1;
gen hijo_refri=p126c==1;
gen hijo_lavad=p126b==1;
gen hijo_telfijo=p126k==1;
gen hijo_compu=p126o==1;
gen hijo_videoc=p126h==1;
gen hijo_micro=p126d==1;
gen hijo_tvcable=p126j==1;
gen hijo_duenoviv=p129a==1;
gen hijo_duenolocal=p129b==1;
gen hijo_duenotierra=p129d==1;
gen hijo_animales=p126p==1;
gen hijo_ganado=p126q==1;
gen hijo_banco=p128c==1;
gen hijo_tarjcredito=p128d==1;
gen hijo_internet=p126m==1;
gen hijo_boiler=p125d==1;
gen hijo_serv=p125e==1;
gen hijo_viv=1 if p123==1 | p124==5 | p124==3;
replace hijo_viv=0 if p124==1 | p124==4 | p124==6;

gen hijo_auto=1 if p131>=1 & p131!=.;
replace hijo_auto=0 if p131==0;

gen hijo_mattierra=1 if p120==1;
replace hijo_mattierra=0 if p120==2 | p120==3;


pca padres_* anesc_padres [aw=factor], me;
predict riq_padres;
xtile q_riq_padres=riq_padres [aw=factor], nq(5);

pca hijo_*  anesc_ent [aw=factor], me;
predict riq_hijo;
xtile q_riq_hijo=riq_hijo [aw=factor], nq(5);

* aquí dropeaban años de escolaridad, no sé por qué
drop padres_hac hijo_hac padres_agua
padres_estufa padres_elect padres_tv padres_refri padres_lavad padres_telfijo
padres_compu padres_videoc padres_micro padres_tvcable padres_duenoviv
padres_duenolocal padres_duenotierra padres_duenootro padres_auto padres_tractor
padres_animales padres_ganado padres_banco padres_tarjcredito padres_boiler
padres_serv padres_asp padres_viv hijo_agua hijo_estufa hijo_elect hijo_refri
hijo_lavad hijo_telfijo hijo_compu hijo_videoc hijo_micro hijo_tvcable
hijo_duenoviv hijo_duenolocal hijo_duenotierra hijo_animales hijo_ganado
hijo_banco hijo_tarjcredito hijo_internet hijo_boiler hijo_serv hijo_viv
hijo_auto hijo_mattierra;


****************************************
****************************************
***VARIABLES DE MOVILIDAD SUBJETIVA
****************************************
****************************************;

gen hogar_actual=.;
replace hogar_actual=1 if p147==1 | p147==2;
replace hogar_actual=2 if p147==3 | p147==4;
replace hogar_actual=3 if p147==5 | p147==6;
replace hogar_actual=4 if p147==7 | p147==8;
replace hogar_actual=5 if p147==9 | p147==10;

gen hogar_nin=.;
replace hogar_nin=1 if p148==1 | p148==2;
replace hogar_nin=2 if p148==3 | p148==4;
replace hogar_nin=3 if p148==5 | p148==6;
replace hogar_nin=4 if p148==7 | p148==8;
replace hogar_nin=5 if p148==9 | p148==10;

label var hogar_nin "Percepcion del hogar de origen comparado con todos los hogares de ese tiempo";
label var hogar_actual "Percepcion del hogar actual comparado con todos los hogares en este momento";




****************************************
****************************************
***OTRAS VARIABLES
****************************************
****************************************;

***Identificación de la población en quintil de origen socioeconómico 1 y 2;
gen pobre=.;
replace pobre=1 if (q_riq_padres==1 | q_riq_padres==2);
replace pobre=0 if (q_riq_padres>=3 & q_riq_padres<=5);
label var pobre "Población con quintil socioeconómico de origen 1 y 2";
label define pobre	1 "Quintil 1 y 2 de origen"
					0 "Quintil 3 a 5 de origen";
label value pobre pobre;

***La región donde en el entrevistado residen actualmente ya está considerada
***en la base de datos;

***Región en la que habitaba el entrevistado cuando tenían 14 años;
gen region_14=.;
replace region_14=0 if p23>33 & p23!=.;
replace region_14=1 if p23==2 | p23==26 | p23==8 | p23==5 | p23==19 | p23==28;
replace region_14=2 if p23==3 | p23==25 | p23==18 | p23==10 | p23==32; 
replace region_14=3 if p23==14 | p23==1 | p23==6 | p23==16 | p23==24;
replace region_14=4 if p23==11 | p23==22 | p23==13 | p23==15 | p23==17 | p23==29 | 
				       p23==21 | p23==9;
replace region_14=5 if p23==12 | p23==20 | p23==7 | p23==30 | p23==27 | p23==4 | 
					   p23==31 | p23==23;
label define region_14	0 "No vivía en México"
						1 "Norte"
						2 "Norte-occidente"
						3 "Centro-norte"
						4 "Centro"
						5 "Sur";
label value region_14 region_14;
label var region_14 "Región en la que vivía el entrevistado a los 14 años";

gen cdmx_14=.;
replace cdmx_14=1 if p23==9;
replace cdmx_14=0 if p23!=9;
label var cdmx_14 "Región en la que vivía el entrevistado a los 14 años";


***Regiones en las que han vivido los entrevistados;
gen region_norte=.;
replace region_norte=1 if region_14==1 & region==1;
replace region_norte=2 if region_14==1 & (region>=2 & region<=5);
replace region_norte=3 if (region_14>=2 & region_14<=5) & region==1;
label var region_norte "Vivió en algún momento en el norte";

gen region_norteocc=.;
replace region_norteocc=1 if region_14==2 & region==2;
replace region_norteocc=2 if region_14==2 & (region==1 | (region>=3 & region<=5));
replace region_norteocc=3 if (region_14==1 | (region_14>=3 & region_14<=5)) & region==2;
label var region_norteocc "Vivió en algún momento en el norte-occidente";

gen region_centronor=.;
replace region_centronor=1 if region_14==3 & region==3;
replace region_centronor=2 if region_14==3 & (region==1 | region==2 | region==4 | region==5);
replace region_centronor=3 if (region_14==1 | region_14==2 | region_14==4 | region_14==5) & region==3;
label var region_centronor "Vivió en algún momento en el centro-norte";

gen region_centro=.;
replace region_centro=1 if region_14==4 & region==4;
replace region_centro=2 if region_14==4 & (region==1 | region==2 | region==3 | region==5);
replace region_centro=3 if (region_14==1 | region_14==2 | region_14==3 | region_14==5) & region==4;
label var region_centro "Vivió en algún momento en el centro";

gen region_sur=.;
replace region_sur=1 if region_14==5 & region==5;
replace region_sur=2 if region_14==5 & (region==1 | region==2 | region==3 | region==4);
replace region_sur=3 if (region_14==1 | region_14==2 | region_14==3 | region_14==4) & region==5;
label var region_sur "Vivió en algún momento en el sur";


label define region_	1 "Vive en la region"
						2 "Vivió en la región a los 14 años"
						3 "No vivía a los 14 años en la región, ahora vive ahí";
label value region_norte region_;
label value region_norteocc region_;
label value region_centronor region_;
label value region_centro region_;
label value region_sur region_;


tab region_norte[aw=factor];
tab region_norteocc[aw=factor];
tab region_centronor[aw=factor];
tab region_centro[aw=factor];
tab region_sur[aw=factor];


gen mujer =. ;
replace mujer=1 if p06==2;
replace mujer=0 if p06==1;
drop p06;

rename p05 edad;

* exportar a dta y csv
outsheet using "$data\clean_data.csv" , comma nolabel ;
save "$data\clean_data" ;

*ssc install asdoc, replace
*sysuse auto, clear
*asdoc des, position type isnumeric format vallab replace

