
/*********************************************************************************\

PROGRAM:      		BSA_Inpatient_Claims_PUF_2008.sas

DESCRIPTION:  		To read csv format inpatient PUF to SAS dataset
 	
INPUT FILES:   		2008_BSA_Inpatient_Claims_PUF.csv

OUTPUT FILES:       BSA_Inpatient_Claims_PUF_2008.sas7bdat

OTHER OUTPUT:		Contents, proc print and freq distribution

                       
\*********************************************************************************/
              
FOOTNOTE 'BSA_Inpatient_Claims_PUF_2008.sas';

* Log/List Options *;
options ls=120 ps=42 missing=' ' nocenter validvarname=upcase compress=binary;

* Input File Reference *;
filename in "INSERT_INPUT_DIRECTORY_NAME\2008_BSA_Inpatient_Claims_PUF.csv" ;  * <-- Place Input File Path Here *;

* Output SAS Library *;
libname PUF 'INSERT_OUTPUT_DIRECTORY_NAME'; * <-- Place Output Library Path Here *;
 

*Formats Code : Uncomment the following if want to include formats *;
/*
Proc format;

Value SEXF
	1 = 'MALE '
	2 = 'FEMALE'
;

Value AGEF
	1	= 'Under  65 '
	2	= '65 - 69 '
	3	= '70 - 74 '
	4	= '75 - 79 '
	5	= '80 - 84 '
	6	= '85 & Older'

;



Value LOSF
	1 =  '1 day'
	2 =  '2-3 days'
	3 =  '4-7 days'
	4 =  '8 or more days'
;

Value DRGF

1     	 =  "Heart transplant or implant of heart assist system"
2    	 =  "ECMO or trach w MV 96+ hrs or PDX exc face, mouth & neck w maj O.R."
3    	 =  "Trach w MV 96+ hrs or PDX exc face, mouth & neck w/o maj O.R."
4    	 =  "Liver transplant"
5    	 =  "Lung transplant"
6    	 =  "Simultaneous pancreas/kidney transplant"
7    	 =  "Bone marrow transplant"
8    	 =  "Pancreas transplant"
9    	 =  "Tracheostomy for face,mouth & neck diagnoses"
10     	 =  "Intracranial vascular procedures w PDX hemorrhage"
11     	 =  "Cranio w major dev impl/acute complex CNS PDX"
12     	 =  "Craniotomy & endovascular intracranial procedures"
13     	 =  "Spinal procedures"
14     	 =  "Ventricular shunt procedures"
15     	 =  "Carotid artery stent procedure"
16     	 =  "Extracranial procedures"
17     	 =  "Periph/cranial nerve & other nerv syst"
18     	 =  "Spinal disorders & injuries"
19     	 =  "Nervous system neoplasms"
20     	 =  "Degenerative nervous system disorders"
21     	 =  "Multiple sclerosis & cerebellar ataxia"
22     	 =  "Acute ischemic stroke w use of thrombolytic agent"
23     	 =  "Intracranial hemorrhage or cerebral infarction"
24     	 =  "Nonspecific cva & precerebral occlusion w/o infarct"
25     	 =  "Transient ischemia"
26     	 =  "Nonspecific cerebrovascular disorders"
27     	 =  "Cranial & peripheral nerve disorders"
28     	 =  "Viral meningitis"
29     	 =  "Hypertensive encephalopathy"
30     	 =  "Nontraumatic stupor & coma"
31     	 =  "Traumatic stupor & coma, coma >1 hr"
32     	 =  "Traumatic stupor & coma"
33     	 =  "Concussion"
34     	 =  "Other disorders of nervous system"
35     	 =  "Bacterial & tuberculous infections of nervous system"
36     	 =  "Non-bacterial infect of nervous sys exc viral meningitis"
37     	 =  "Seizures"
38     	 =  "Headaches"
39     	 =  "Orbital procedures"
40     	 =  "Intraocular procedures"
41     	 =  "Acute major eye infections"
42     	 =  "Neurological eye disorders"
43     	 =  "Other disorders of the eye"
44     	 =  "Major head & neck procedures"
45     	 =  "Cranial/facial procedures"
46     	 =  "Other ear, nose, mouth & throat O.R. procedures"
47     	 =  "Mouth procedures"
48     	 =  "Salivary gland procedures"
49     	 =  "Ear, nose, mouth & throat malignancy"
50     	 =  "Dysequilibrium"
51     	 =  "Epistaxis"
52     	 =  "Otitis media & URI"
53     	 =  "Nasal trauma & deformity"
54     	 =  "Dental & Oral Diseases"
55     	 =  "Major chest procedures"
56     	 =  "Other resp system O.R."
57     	 =  "Pulmonary embolism"
58     	 =  "Respiratory infections & inflammations"
59     	 =  "Respiratory neoplasms"
60     	 =  "Major chest trauma"
61     	 =  "Pleural effusion"
62     	 =  "Pulmonary edema & respiratory failure"
63     	 =  "Chronic obstructive pulmonary disease"
64     	 =  "Simple pneumonia & pleurisy"
65     	 =  "Interstitial lung disease"
66     	 =  "Pneumothorax"
67     	 =  "Bronchitis & asthma"
68     	 =  "Respiratory signs & symptoms"
69     	 =  "Other respiratory system diagnoses"
70     	 =  "Respiratory system diagnosis w ventilator support 96+ hours"
71     	 =  "Respiratory system diagnosis w ventilator support <96 hours"
72     	 =  "Cardiac valve & oth maj cardiothoracic proc w card cath"
73     	 =  "Cardiac valve & oth maj cardiothoracic proc w/o card cath"
74     	 =  "Cardiac defib implant w cardiac cath w AMI/HF/shock"
75     	 =  "Cardiac defib implant w cardiac cath w/o AMI/HF/shock"
76     	 =  "Cardiac defibrillator implant w/o cardiac cath"
77     	 =  "Other cardiothoracic procedures"
78     	 =  "Coronary bypass w PTCA"
79     	 =  "Coronary bypass w cardiac cath"
80     	 =  "Coronary bypass w/o cardiac cath"
81     	 =  "Major cardiovasc procedures"
82     	 =  "Amputation for circ sys disorders exc upper limb & toe"
83     	 =  "Permanent cardiac pacemaker implant"
84     	 =  "AICD lead & generator procedures"
85     	 =  "Perc cardiovasc proc w drug-eluting stent w MCC"
86     	 =  "Perc cardiovasc proc w non-drug-eluting stent"
87     	 =  "Perc cardiovasc proc w/o coronary artery stent or AMI"
88     	 =  "Other vascular procedures"
89     	 =  "Upper limb & toe amputation for circ system disorders"
90     	 =  "Cardiac pacemaker device replacement"
91     	 =  "Cardiac pacemaker revision except device replacement"
92     	 =  "Other circulatory system O.R. procedures"
93     	 =  "Acute myocardial infarction, discharged alive"
94     	 =  "Acute myocardial infarction, expired"
95     	 =  "Circulatory disorders except AMI, w card cath"
96     	 =  "Acute & subacute endocarditis"
97     	 =  "Heart failure & shock"
98     	 =  "Deep vein thrombophlebitis"
99     	 =  "Cardiac arrest, unexplained"
100      =  "Peripheral vascular disorders"
101      =  "Atherosclerosis"
102      =  "Hypertension"
103      =  "Cardiac congenital & valvular disorders"
104      =  "Cardiac arrhythmia & conduction disorders"
105      =  "Angina pectoris"
106      =  "Syncope & collapse"
107      =  "Chest pain"
108      =  "Other circulatory system diagnoses"
109      =  "Stomach, esophageal & duodenal proc"
110      =  "Major small & large bowel procedures"
111      =  "Rectal resection"
112      =  "Peritoneal adhesiolysis"
113      =  "Appendectomy w complicated principal diag"
114      =  "Appendectomy w/o complicated principal diag"
115      =  "Minor small & large bowel procedures"
116      =  "Anal & stomal procedures"
117      =  "Inguinal & femoral hernia procedures"
118      =  "Hernia procedures except inguinal & femoral"
119      =  "Other digestive system O.R. procedures"
120      =  "Major esophageal disorders"
121      =  "Major gastrointestinal disorders & peritoneal infections"
122      =  "Digestive malignancy"
123      =  "G.I. hemorrhage"
124      =  "Complicated peptic ulcer"
125      =  "Uncomplicated peptic ulcer"
126      =  "Inflammatory bowel disease"
127      =  "G.I. obstruction"
128      =  "Esophagitis, gastroent & misc digest disorders"
129      =  "Other digestive system diagnoses"
130      =  "Pancreas, liver & shunt procedures"
131      =  "Biliary tract proc except only cholecyst w or w/o c.d.e."
132      =  "Cholecystectomy w c.d.e."
133      =  "Cholecystectomy except by laparoscope w/o c.d.e."
134      =  "Laparoscopic cholecystectomy w/o c.d.e."
135      =  "Hepatobiliary diagnostic procedures"
136      =  "Other hepatobiliary or pancreas O.R. procedures"
137      =  "Cirrhosis & alcoholic hepatitis"
138      =  "Malignancy of hepatobiliary system or pancreas"
139      =  "Disorders of pancreas except malignancy"
140      =  "Disorders of liver except malig,cirr,alc hepa"
141      =  "Disorders of the biliary tract"
142      =  "Combined anterior/posterior spinal fusion"
143      =  "Spinal fus exc cerv w spinal curv/malig/infec or 9+ fus"
144      =  "Spinal fusion except cervical"
145      =  "Bilateral or multiple major joint procs of lower extremity"
146      =  "Wnd debrid & skn grft exc hand, for musculo-conn tiss dis"
147      =  "Revision of hip or knee replacement"
148      =  "Major joint replacement or reattachment of lower extremity"
149      =  "Cervical spinal fusion"
150      =  "Amputation for musculoskeletal sys & conn tissue dis"
151      =  "Biopsies of musculoskeletal system & connective tissue"
152      =  "Hip & femur procedures except major joint"
153      =  "Major joint & limb reattachment proc of upper extremity"
154      =  "Knee procedures w pdx of infection"
155      =  "Knee procedures w/o pdx of infection"
156      =  "Back & neck proc exc spinal fusion"
157      =  "Lower extrem & humer proc except hip,foot,femur"
158      =  "Local excision & removal int fix devices exc hip & femur"
159      =  "Local excision & removal int fix devices of hip & femur"
160      =  "Soft tissue procedures"
161      =  "Foot procedures"
162      =  "Major thumb or joint procedures"
163      =  "Major shoulder or elbow joint procedures"
164      =  "Shoulder,elbow or forearm proc,exc major joint proc"
165      =  "Hand or wrist proc, except major thumb or joint proc"
166      =  "Other musculoskelet sys & conn tiss O.R. proc"
167      =  "Fractures of femur"
168      =  "Fractures of hip & pelvis"
169      =  "Sprains, strains, & dislocations of hip, pelvis & thigh"
170      =  "Osteomyelitis"
171      =  "Pathological fractures & musculoskelet & conn tiss malig"
172      =  "Connective tissue disorders"
173      =  "Septic arthritis"
174      =  "Medical back problems"
175      =  "Bone diseases & arthropathies"
176      =  "Signs & symptoms of musculoskeletal system & conn tissue"
177      =  "Tendonitis, myositis & bursitis"
178      =  "Aftercare, musculoskeletal system & connective tissue"
179      =  "Fx, sprn, strn & disl except femur, hip, pelvis & thigh"
180      =  "Other musculoskeletal sys & connective tissue diagnoses"
181      =  "Skin graft &/or debrid for skn ulcer or cellulitis"
182      =  "Skin graft &/or debrid exc for skin ulcer or cellulitis"
183      =  "Other skin, subcut tiss & breast proc"
184      =  "Mastectomy for malignancy"
185      =  "Breast biopsy, local excision & other breast procedures"
186      =  "Skin ulcers"
187      =  "Major skin disorders"
188      =  "Malignant breast disorders"
189      =  "Non-malignant breast disorders"
190      =  "Cellulitis"
191      =  "Trauma to the skin, subcut tiss & breast"
192      =  "Minor skin disorders"
193      =  "Adrenal & pituitary procedures"
194      =  "Amputat of lower limb for endocrine,nutrit,& metabol dis"
195      =  "O.R. procedures for obesity"
196      =  "Skin grafts & wound debrid for endoc, nutrit & metab dis"
197      =  "Thyroid, parathyroid & thyroglossal procedures"
198      =  "Other endocrine, nutrit & metab O.R. proc"
199      =  "Diabetes"
200      =  "Nutritional & misc metabolic disorders"
201      =  "Inborn errors of metabolism"
202      =  "Endocrine disorders"
203      =  "Kidney transplant"
204      =  "Major bladder procedures"
205      =  "Kidney & ureter procedures for neoplasm"
206      =  "Kidney & ureter procedures for non-neoplasm"
207      =  "Minor bladder procedures"
208      =  "Prostatectomy"
209      =  "Transurethral procedures"
210      =  "Urethral procedures"
211      =  "Other kidney & urinary tract procedures"
212      =  "Renal failure"
213      =  "Admit for renal dialysis"
214      =  "Kidney & urinary tract neoplasms"
215      =  "Kidney & urinary tract infections"
216      =  "Urinary stones w esw lithotripsy"
217      =  "Urinary stones w/o esw lithotripsy"
218      =  "Kidney & urinary tract signs & symptoms"
219      =  "Other kidney & urinary tract diagnoses"
220      =  "Major male pelvic procedures"
221      =  "Penis procedures"
222      =  "Testes procedures"
223      =  "Transurethral prostatectomy"
224      =  "Other male reproductive system O.R. proc for malignancy"
225      =  "Other male reproductive system O.R. proc exc malignancy"
226      =  "Malignancy, male reproductive system"
227      =  "Benign prostatic hypertrophy"
228      =  "Inflammation of the male reproductive system"
229      =  "Other male reproductive system diagnoses"
230      =  "Pelvic evisceration, rad hysterectomy & rad vulvectomy"
231      =  "Uterine & adnexa proc for ovarian or adnexal malignancy"
232      =  "Uterine,adnexa proc for non-ovarian/adnexal malig"
233      =  "Uterine & adnexa proc for non-malignancy"
234      =  "D&C, conization, laparascopy & tubal interruption"
235      =  "Vagina, cervix & vulva procedures"
236      =  "Female reproductive system reconstructive procedures"
237      =  "Other female reproductive system O.R. procedures"
238      =  "Malignancy, female reproductive system"
239      =  "Infections, female reproductive system"
240      =  "Menstrual & other female reproductive system disorders"
241      =  "Cesarean section"
242      =  "Abortion w D&C, aspiration curettage or hysterotomy"
243      =  "Vaginal delivery w complicating diagnoses"
244      =  "Vaginal delivery w/o complicating diagnoses"
245      =  "Postpartum & post abortion diagnoses w/o O.R. procedure"
246      =  "Ectopic pregnancy"
247      =  "Threatened abortion"
248      =  "Other antepartum diagnoses w medical complications"
249      =  "Other antepartum diagnoses w/o medical complications"
250      =  "Splenectomy"
251      =  "Other O.R. proc of the blood & blood forming organs"
252      =  "Major hematol/immun diag exc sickle cell crisis & coagul"
253      =  "Red blood cell disorders"
254      =  "Coagulation disorders"
255      =  "Reticuloendothelial & immunity disorders"
256      =  "Lymphoma & leukemia w major O.R. procedure"
257      =  "Lymphoma & non-acute leukemia w other O.R. proc"
258      =  "Myeloprolif disord or poorly diff neopl w maj O.R. proc"
259      =  "Acute leukemia w/o major O.R. procedure"
260      =  "Chemo w acute leukemia as sdx"
261      =  "Lymphoma & non-acute leukemia"
262      =  "Other myeloprolif dis or poorly diff neopl diag"
263      =  "Chemotherapy w/o acute leukemia as secondary diagnosis"
264      =  "Radiotherapy"
265      =  "Infectious & parasitic diseases w O.R. procedure"
266      =  "Postoperative or post-traumatic infections w O.R. proc"
267      =  "Postoperative & post-traumatic infections"
268      =  "Fever of unknown origin"
269      =  "Viral illness"
270      =  "Other infectious & parasitic diseases diagnoses"
271      =  "Septicemia w MV 96+ hours"
272      =  "Septicemia w/o MV 96+ hours"
273      =  "O.R. procedure w principal diagnoses of mental illness"
274      =  "Acute adjustment reaction & psychosocial dysfunction"
275      =  "Depressive neuroses"
276      =  "Neuroses except depressive"
277      =  "Disorders of personality & impulse control"
278      =  "Organic disturbances & mental retardation"
279      =  "Psychoses"
280      =  "Behavioral & developmental disorders"
281      =  "Other mental disorder diagnoses"
282      =  "Alcohol/drug abuse or dependence, left ama"
283      =  "Alcohol/drug abuse or dependence w rehabilitation therapy"
284      =  "Alcohol/drug abuse or dependence w/o rehabilitation therapy"
285      =  "Wound debridements for injuries"
286      =  "Skin grafts for injuries"
287      =  "Hand procedures for injuries"
288      =  "Other O.R. procedures for injuries"
289      =  "Traumatic injury"
290      =  "Allergic reactions"
291      =  "Poisoning & toxic effects of drugs"
292      =  "Complications of treatment"
293      =  "Other injury, poisoning & toxic effect diag"
294      =  "Extensive burns or full thickness burns w MV 96+ hrs w skin graft"
295      =  "Full thickness burn w skin graft or inhal inj"
296      =  "Non-extensive burns"
297      =  "O.R. proc w diagnoses of other contact w health services"
298      =  "Rehabilitation"
299      =  "Signs & symptoms"
300      =  "Aftercare"
301      =  "Other factors influencing health status"
302      =  "Limb reattachment, hip & femur proc for multiple significant trauma"
303      =  "Other O.R. procedures for multiple significant trauma"
304      =  "Other multiple significant trauma"
305      =  "HIV w extensive O.R. procedure"
306      =  "HIV w major related condition"
307      =  "HIV w or w/o other related condition"
308      =  "Extensive O.R. procedure unrelated to principal diagnosis"
309      =  "Prostatic O.R. procedure unrelated to principal diagnosis"
310      =  "Non-extensive O.R. proc unrelated to principal diagnosis"
311      =  "Ungroupable"

;

Value  $ICDF
'' =  'No procedure performed'
'00' =  'Not elsewhere classified'
'01' =  'Incise-excis brain/skull'
'02' =  'Other skull/brain ops'
'03' =  'Spinal cord & canal ops'
'04' =  'Cran & periph nerve ops'
'05' =  'Sympathetic nerve ops'
'06' =  'Thyroid/parathyroid ops'
'07' =  'Oth endocrine glnd ops'
'08' =  'Eyelid operations'
'09' =  'Lacrimal system op'
'10' =  'Conjunctival operations'
'11' =  'Operations on cornea'
'12' =  'Anterior segment ops'
'13' =  'Operations on lens'
'14' =  'Posterior segment ops'
'15' =  'Extraocular muscle ops'
'16' =  'Orbit/eyeball ops'
'17' =  'Other miscellaneous procedures'
'18' =  'External ear operations'
'19' =  'Middle ear reconstruct'
'20' =  'Other mid & inner ear op'
'21' =  'Operations on nose'
'22' =  'Nasal sinus operations'
'23' =  'Tooth removal & restorat'
'24' =  'Oth ops on teeth & gums'
'25' =  'Operations on tongue'
'26' =  'Salivary gland operation'
'27' =  'Other mouth & face ops'
'28' =  'Tonsil & adenoid ops'
'29' =  'Operations on pharynx'
'30' =  'Excision of larynx'
'31' =  'Larynx trachea ops nec'
'32' =  'Lung & bronchus excision'
'33' =  'Other bronchial/lung ops'
'34' =  'Thorax ops except lung'
'35' =  'Heart valves & septa ops'
'36' =  'Ops on heart vessels'
'37' =  'Other heart/pericard ops'
'38' =  'Vessel inc/excis/occlus'
'39' =  'Other ops on vessels'
'40' =  'Lymphatic system ops'
'41' =  'Bone marrow & spleen ops'
'42' =  'Operations on esophagus'
'43' =  'Gastric incision/excis'
'44' =  'Other gastric operations'
'45' =  'Intest incis/excis/anast'
'46' =  'Other intestinal ops'
'47' =  'Operations on appendix'
'48' =  'Rectal & perirectal ops'
'49' =  'Operations on anus'
'50' =  'Operations on liver'
'51' =  'Biliary tract operation'
'52' =  'Operations on pancreas'
'53' =  'Repair of hernia'
'54' =  'Other abdomen region ops'
'55' =  'Operations on kidney'
'56' =  'Operations on ureter'
'57' =  'Urinary bladder ops'
'58' =  'Operations on urethra'
'59' =  'Other urinary tract ops'
'60' =  'Prostate & semin ves ops'
'61' =  'Scrotum & tunica vag ops'
'62' =  'Operations on testes'
'63' =  'Sperm cord/epid/vas ops'
'64' =  'Operations on penis'
'65' =  'Operations on ovary'
'66' =  'Fallopian tube operation'
'67' =  'Operations on cervix'
'68' =  'Other uterine incis/exc'
'69' =  'Other uterus/support ops'
'70' =  'Vagina & cul-de-sac ops'
'71' =  'Vulvar & perineal ops'
'72' =  'Forcep/vac/breech deliv'
'73' =  'Assist/induce deliv nec'
'74' =  'C-section/removal fetus'
'75' =  'Other obstetric ops'
'76' =  'Facial bone & joint ops'
'77' =  'Incis/excis/div bone nec'
'78' =  'Oth bone ops excpt face'
'79' =  'Reduction fx/dislocation'
'80' =  'Incision/excision joint'
'81' =  'Joint repair'
'82' =  'Hand muscl/tend/fasc ops'
'83' =  'Other mus/ten/fas/bur op'
'84' =  'Other musculoskelet proc'
'85' =  'Operations on the breast'
'86' =  'Skin & subq operations'
'87' =  'Diagnostic radiology'
'88' =  'Other dx radiology'
'89' =  'Interview/consult/exam'
'90' =  'Microscopic exam--i'
'91' =  'Microscopic exam--ii'
'92' =  'Nuclear medicine'
'93' =  'Pt, rehab & related proc'
'94' =  'Psyche related procedure'
'95' =  'Eye & ear dx/treatment'
'96' =  'Non-op intubat & irrigat'
'97' =  'Replace & remov devices'
'98' =  'Nonop remove foreign bod'
'99' =  'Other nonoperative proc'
;
run;

*/
 

data PUF.BSA_Inpatient_Claims_PUF_2008(label='INPATIENT CLAIMS PUBLIC USE FILE');

infile in dlm = ',' dsd missover truncover firstobs = 2;
 
  * Input Record *;
  input IP_CLM_ID 						   :$19.	
       	BENE_SEX_IDENT_CD                   
        BENE_AGE_CAT_CD                     
        IP_CLM_BASE_DRG_CD                  
        IP_CLM_ICD9_PRCDR_CD               :$2.               
        IP_CLM_DAYS_CD 
        IP_DRG_QUINT_PMT_AVG 
		IP_DRG_QUINT_PMT_CD 
  ;
  

 
  * Formats *;
 
*** Uncomment following to apply formats ;	/*
format  
	BENE_SEX_IDENT_CD                      SEXF.
    BENE_AGE_CAT_CD						   AGEF.
    IP_CLM_BASE_DRG_CD 					   DRGF.
  	IP_CLM_ICD9_PRCDR_CD 				   $ICDF.
    IP_CLM_DAYS_CD                     	   LOSF.
  ;	
*/
 
  * Labels *;
  label IP_CLM_ID                         = "Encrypted PUF ID"
  		BENE_SEX_IDENT_CD                 = "Beneficiary gender code "
		BENE_AGE_CAT_CD                   = "Beneficiary Age category code "
		IP_CLM_BASE_DRG_CD             = "Base DRG code "
		IP_CLM_ICD9_PRCDR_CD          = "ICD9 primary procedure code"
		IP_CLM_DAYS_CD                      = "Inpatient days code"
		IP_DRG_QUINT_PMT_AVG             = "DRG quintile average payment amount"
		IP_DRG_QUINT_PMT_CD          = "DRG quintile payment amount code"
                      
;
 
  
run;
 
title 'INPATIENT CLAIMS PUBLIC USE FILE';
proc contents data=PUF.BSA_Inpatient_Claims_PUF_2008 varnum;
proc print data=PUF.BSA_Inpatient_Claims_PUF_2008 (obs=10);
  title2 'Sample Listing - 10 Rows';
run;


proc freq data=PUF.BSA_Inpatient_Claims_PUF_2008;
  title2 'Freqs';
  table BENE_SEX_IDENT_CD                       
		BENE_AGE_CAT_CD               
        IP_CLM_BASE_DRG_CD  
		IP_CLM_ICD9_PRCDR_CD                          
        IP_CLM_DAYS_CD
        IP_DRG_QUINT_PMT_AVG              
		IP_DRG_QUINT_PMT_CD  /missing;
run;
 
* End of Program *;
