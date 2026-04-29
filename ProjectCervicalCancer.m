%% BiologicalInfectiousRisk
% Create a new Mamdani FIS
fisBIR = mamfis('Name', 'BiologicalInfectiousRisk');

% === INPUTS ===
% 1. HPV
fisBIR = addInput(fisBIR, [0 1], 'Name', 'HPV');
fisBIR = addMF(fisBIR, 'HPV', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Absent');
fisBIR = addMF(fisBIR, 'HPV', 'trapmf', [0.4 1 1 1.1], 'Name', 'Present');

% 2. HPV_Type
fisBIR = addInput(fisBIR, [0 1], 'Name', 'HPV_Type');
fisBIR = addMF(fisBIR, 'HPV_Type', 'trapmf', [-0.1 0 0 0.6], 'Name', 'LowRisk');
fisBIR = addMF(fisBIR, 'HPV_Type', 'trapmf', [0.4 1 1 1.1], 'Name', 'HighRisk');


% 3. Chlamydia
fisBIR = addInput(fisBIR, [0 1], 'Name', 'Chlamydia');
fisBIR = addMF(fisBIR, 'Chlamydia', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Absent');
fisBIR = addMF(fisBIR, 'Chlamydia', 'trapmf', [0.4 1 1 1.1], 'Name', 'Present');

% 4. HIV
fisBIR = addInput(fisBIR, [0 1], 'Name', 'HIV');
fisBIR = addMF(fisBIR, 'HIV', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Absent');
fisBIR = addMF(fisBIR, 'HIV', 'trapmf', [0.4 1 1 1.1], 'Name', 'Present');

% 5. HSV
fisBIR = addInput(fisBIR, [0 1], 'Name', 'HSV');
fisBIR = addMF(fisBIR, 'HSV', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Absent');
fisBIR = addMF(fisBIR, 'HSV', 'trapmf', [0.4 1 1 1.1], 'Name', 'Present');

% 6. BacterialVaginosis
fisBIR = addInput(fisBIR, [0 1], 'Name', 'BacterialVaginosis');
fisBIR = addMF(fisBIR, 'BacterialVaginosis', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Absent');
fisBIR = addMF(fisBIR, 'BacterialVaginosis', 'trapmf', [0.4 1 1 1.1], 'Name', 'Present');

% 7. GenitalWarts
fisBIR = addInput(fisBIR, [0 1], 'Name', 'GenitalWarts');
fisBIR = addMF(fisBIR, 'GenitalWarts', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Absent');
fisBIR = addMF(fisBIR, 'GenitalWarts', 'trapmf', [0.4 1 1 1.1], 'Name', 'Present');

% === OUTPUT ===
fisBIR = addOutput(fisBIR, [0 1], 'Name', 'InfectiousRisk');
fisBIR = addMF(fisBIR, 'InfectiousRisk', 'trapmf', [-0.1 0 0 0.4], 'Name', 'Low');
fisBIR = addMF(fisBIR, 'InfectiousRisk', 'trimf', [0.3 0.5 0.7], 'Name', 'Moderate');
fisBIR = addMF(fisBIR, 'InfectiousRisk', 'trapmf', [0.6 1 1 1.1], 'Name', 'High');

% === RULES ===
ruleList = [
    2 2 0 0 0 0 0 3 1 1;  % HPV present & high-risk type => High risk
    0 0 2 0 0 0 0 2 1 1;  % Chlamydia present => Moderate risk
    0 0 0 2 0 0 0 3 1 1;  % HIV present => High risk
    0 0 0 0 2 0 0 3 1 1;  % HSV present => High risk  (ajustada)
    0 0 0 0 0 2 0 2 1 1;  % BV present => Moderate risk (ajustada)
    0 0 0 0 0 0 2 1 1 1;  % Genital warts => Low risk
];
fisBIR = addRule(fisBIR, ruleList);

% === Save FIS ===
writeFIS(fisBIR, 'BiologicalInfectiousRisk');
%agensurf(fisBIR)

%% SexualReproductiveRisk
% Create a new Mamdani FIS
fisSBRH = mamfis('Name', 'SexualReproductiveRisk');

% === INPUTS ===
% 1. Number of Sexual Partners
fisSBRH = addInput(fisSBRH, [0 10], 'Name', 'NumberOfSexualPartners');
fisSBRH = addMF(fisSBRH, 'NumberOfSexualPartners', 'trapmf', [0 0 1 1.5], 'Name', 'Low');
fisSBRH = addMF(fisSBRH, 'NumberOfSexualPartners', 'trimf', [1 2.5 4.5], 'Name', 'Medium');
fisSBRH = addMF(fisSBRH, 'NumberOfSexualPartners', 'trapmf', [3.5 6 10 10], 'Name', 'High');

% 2. Age at First Sexual Activity
fisSBRH = addInput(fisSBRH, [10 30], 'Name', 'AgeAtFirstSexualActivity');
fisSBRH = addMF(fisSBRH, 'AgeAtFirstSexualActivity', 'trapmf', [10 10 10 18], 'Name', 'Early');
fisSBRH = addMF(fisSBRH, 'AgeAtFirstSexualActivity', 'trimf', [15 18.5 24], 'Name', 'Medium');
fisSBRH = addMF(fisSBRH, 'AgeAtFirstSexualActivity', 'trapmf', [20 23 30 30], 'Name', 'Late');

% 3. Parity
fisSBRH = addInput(fisSBRH, [0 10], 'Name', 'Parity');
fisSBRH = addMF(fisSBRH, 'Parity', 'trapmf', [0 0 1 1.5], 'Name', 'Low');
fisSBRH = addMF(fisSBRH, 'Parity', 'trimf', [1 2.5 3.5], 'Name', 'Medium');
fisSBRH = addMF(fisSBRH, 'Parity', 'trapmf', [3 5 10 10], 'Name', 'High');

% 4. Age at First Pregnancy
fisSBRH = addInput(fisSBRH, [10 35], 'Name', 'AgeAtFirstPregnancy');
fisSBRH = addMF(fisSBRH, 'AgeAtFirstPregnancy', 'trapmf', [10 10 10 17], 'Name', 'Early');
fisSBRH = addMF(fisSBRH, 'AgeAtFirstPregnancy', 'trimf', [15 18 21], 'Name', 'Medium');
fisSBRH = addMF(fisSBRH, 'AgeAtFirstPregnancy', 'trapmf', [20 25 35 35], 'Name', 'Late');

% === OUTPUT ===
fisSBRH = addOutput(fisSBRH, [0 1], 'Name', 'SexualReproductiveRisk');
fisSBRH = addMF(fisSBRH, 'SexualReproductiveRisk', 'trapmf', [-0.1 0 0.25 0.5], 'Name', 'Low');
fisSBRH = addMF(fisSBRH, 'SexualReproductiveRisk', 'trimf', [0.3 0.5 0.7], 'Name', 'Moderate');
fisSBRH = addMF(fisSBRH, 'SexualReproductiveRisk', 'trapmf', [0.6 0.75 1 1.1], 'Name', 'High');

% === RULES ===
ruleList = [
    3 1 0 0 3 1 1; % Many partners + early sexual debut => High
    0 0 3 1 3 1 1; % High parity + early pregnancy => High
    2 2 0 0 2 1 1; % Medium partners + medium debut => Moderate
    1 3 1 3 1 1 1; % Low parity + late pregnancy => Low
    2 1 0 0 2 1 1;  % Medium partners + Early debut → Moderate
    0 1 0 0 2 1 1;  % Early debut alone → Moderate
    0 0 2 2 2 1 1;  % Medium parity + Early pregnancy → Moderate
];

fisSBRH = addRule(fisSBRH, ruleList);

% === Save the FIS ===
writeFIS(fisSBRH, 'SexualReproductiveRisk');
%gensurf(fisSBRH)

%% HormonalExposureRisk
% Create a new Mamdani FIS
fisHE = mamfis('Name', 'HormonalExposureRisk');

% === INPUTS ===
% 1. Use of Oral Contraceptives (binary: 0 = No, 1 = Yes)
fisHE = addInput(fisHE, [0 1], 'Name', 'UseOfOralContraceptives');
fisHE = addMF(fisHE,'UseOfOralContraceptives','trapmf',[-0.1 0 0 0.6],'Name','No');
fisHE = addMF(fisHE,'UseOfOralContraceptives','trapmf',[0.4 1 1 1.1],'Name','Yes');

% 2. Years using Oral Contraceptives
fisHE = addInput(fisHE, [0 20], 'Name', 'YearsUsingOralContraceptives');
% ShortTerm: riesgo bajo hasta ~5 años
fisHE = addMF(fisHE,'YearsUsingOralContraceptives','trapmf',[-1 0 0 5],'Name','ShortTerm');
% MediumTerm: riesgo moderado 4–10 años
fisHE = addMF(fisHE,'YearsUsingOralContraceptives','trimf',[4 7.5 10],'Name','MediumTerm');
% LongTerm: riesgo alto ≥9 años
fisHE = addMF(fisHE,'YearsUsingOralContraceptives','trapmf',[9 12 20 21],'Name','LongTerm');


% === OUTPUT ===
fisHE = addOutput(fisHE, [0 1], 'Name', 'HormonalRisk');
fisHE = addMF(fisHE,'HormonalRisk','trapmf',[-0.1 0 0.25 0.5],'Name','Low');
fisHE = addMF(fisHE,'HormonalRisk','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisHE = addMF(fisHE,'HormonalRisk','trapmf',[0.6 0.75 1 1.1],'Name','High');

% === RULES ===
ruleList = [
    2 3 3 1 1;   % Yes + LongTerm → High
    2 2 2 1 1;   % Yes + MediumTerm → High
    2 1 1 1 1;   % Yes + ShortTerm → Moderate
    1 0 1 1 1;   % No OC use → Low
];

fisHE = addRule(fisHE, ruleList);

% === Save the FIS ===
writeFIS(fisHE, 'HormonalExposureRisk');
%gensurf(fisHE)

%% BehavioralRisk
% Create a new Mamdani FIS
fisBF = mamfis('Name', 'BehavioralRisk');

% === INPUTS ===
% 1. Years of Smoking
fisBF = addInput(fisBF, [0 30], 'Name', 'YearsOfSmoking');
fisBF = addMF(fisBF,'YearsOfSmoking','trapmf',[0 0 3.5 5],'Name','ShortTerm');    % <5 años 
fisBF = addMF(fisBF,'YearsOfSmoking','trimf',[3.5 7.5 11.5],'Name','MediumTerm');  % 5–10 años 
fisBF = addMF(fisBF,'YearsOfSmoking','trapmf',[8.5 11.5 30 30],'Name','LongTerm'); % >10 años 

% Renombrado y nuevo universo de discurso
fisBF = addInput(fisBF, [0 40], 'Name', 'PackYears');
% Low: 0–10 pack-years
fisBF = addMF(fisBF,'PackYears','trapmf',[0 0 7 10],'Name','Low');
% Medium: 8–20 pack-years
fisBF = addMF(fisBF,'PackYears','trimf',[7 13 23],'Name','Medium');
% High: ≥18 pack-years
fisBF = addMF(fisBF,'PackYears','trapmf',[17 23 40 40],'Name','High');

% 3. Obesity (BMI-based)
fisBF = addInput(fisBF, [15 45], 'Name', 'BMI');
% Normal: 18.5–24.9
fisBF = addMF(fisBF,'BMI','trapmf',[15 15 18.5 24.9],'Name','Normal');
% Overweight: 23–29.9 (solapamiento)
fisBF = addMF(fisBF,'BMI','trimf',[22 27.5 32],'Name','Overweight');
% Obese: ≥29.9
fisBF = addMF(fisBF,'BMI','trapmf',[28 32 45 45],'Name','Obese');

% === OUTPUT ===
fisBF = addOutput(fisBF, [0 1], 'Name', 'BehavioralRisk');
fisBF = addMF(fisBF, 'BehavioralRisk', 'trapmf', [-0.1 0 0.25 0.5], 'Name', 'Low');
fisBF = addMF(fisBF, 'BehavioralRisk', 'trimf', [0.3 0.5 0.7], 'Name', 'Moderate');
fisBF = addMF(fisBF, 'BehavioralRisk', 'trapmf', [0.6 0.75 1 1.1], 'Name', 'High');

% === RULES ===
ruleList = [
    3 3 3 3 1 1;
    2 2 2 2 1 1;
    1 1 1 1 1 1;
    2 3 1 3 1 1;
    3 1 1 2 1 1;
    1 1 3 2 1 1;
];

fisBF = addRule(fisBF, ruleList);

% === Save the FIS ===
writeFIS(fisBF, 'BehavioralRisk');
%gensurf(fisBF)

%% HygienePracticesRisk
% Crear un nuevo sistema difuso tipo Mamdani
fisHP = mamfis('Name', 'HygienePracticesRisk');

% === ENTRADAS ===

% 1. Uso de limpiadores vaginales (0 = No, 1 = Sí)
fisHP = addInput(fisHP, [0 1], 'Name', 'UseOfVaginalCleansers');
fisHP = addMF(fisHP,'UseOfVaginalCleansers','trapmf',[-0.1 0 0 0.6],'Name','No');
fisHP = addMF(fisHP,'UseOfVaginalCleansers','trapmf',[0.4 1 1 1.1],'Name','Yes');
% Lo mismo para BathFrequency, BathDuringMenstruation, MenstrualMaterialUsed, WashAfterIntercourse


% 2. Frecuencia de baño (0 = Diario, 1 = Menos que diario)
fisHP = addInput(fisHP, [0 1], 'Name', 'BathFrequency');
fisHP = addMF(fisHP, 'BathFrequency', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Daily');
fisHP = addMF(fisHP, 'BathFrequency', 'trapmf', [0.4 1 1 1.1], 'Name', 'LessThanDaily');

% 3. Baño durante la menstruación (0 = Sí, 1 = No)
fisHP = addInput(fisHP, [0 1], 'Name', 'BathDuringMenstruation');
fisHP = addMF(fisHP, 'BathDuringMenstruation', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Yes');
fisHP = addMF(fisHP, 'BathDuringMenstruation', 'trapmf', [0.4 1 1 1.1], 'Name', 'No');

% 4. Material utilizado durante la menstruación (0 = Toalla sanitaria, 1 = Tela vieja)
fisHP = addInput(fisHP, [0 1], 'Name', 'MenstrualMaterialUsed');
fisHP = addMF(fisHP, 'MenstrualMaterialUsed', 'trapmf', [-0.1 0 0 0.6], 'Name', 'SanitaryPad');
fisHP = addMF(fisHP, 'MenstrualMaterialUsed', 'trapmf', [0.4 1 1 1.1], 'Name', 'OldCloth');

% 5. Lavado genital después del coito (0 = Sí, 1 = No)
fisHP = addInput(fisHP, [0 1], 'Name', 'WashAfterIntercourse');
fisHP = addMF(fisHP, 'WashAfterIntercourse', 'trapmf', [-0.1 0 0 0.6], 'Name', 'Yes');
fisHP = addMF(fisHP, 'WashAfterIntercourse', 'trapmf', [0.4 1 1 1.1], 'Name', 'No');

% === SALIDA ===
fisHP = addOutput(fisHP, [0 1], 'Name', 'HygieneRisk');
fisHP = addMF(fisHP,'HygieneRisk','trapmf',[-0.1 0 0.25 0.5],'Name','Low');
fisHP = addMF(fisHP,'HygieneRisk','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisHP = addMF(fisHP,'HygieneRisk','trapmf',[0.6 0.75 1 1.1],'Name','High');

% === REGLAS ===
ruleList = [
  2 2 2 2 2 3 1 1;
  1 1 1 1 1 1 1 1;
  2 1 1 1 1 2 1 1;
  1 2 1 2 2 3 1 1;
  1 1 1 1 2 2 1 1;
  1 1 1 2 1 2 1 1;
];
fisHP = addRule(fisHP, ruleList);

fisHP = addRule(fisHP, ruleList);

% === Guardar el FIS ===
writeFIS(fisHP, 'HygienePracticesRisk');
%gensurf(fisHP)

%% NutritionalRisk - Sistema Difuso Mamdani
fisNAF = mamfis('Name', 'NutritionalRisk');

% === ENTRADAS ===

% 1. Dieta Balanceada (0 = No, 1 = Sí)
fisNAF = addInput(fisNAF, [0 1], 'Name', 'BalancedDiet');
fisNAF = addMF(fisNAF,'BalancedDiet','trapmf',[-0.1 0 0 0.6],'Name','No');
fisNAF = addMF(fisNAF,'BalancedDiet','trapmf',[0.4 1 1 1.1],'Name','Yes');

% 2. Ingesta de Vitamina C (mg/día)
fisNAF = addInput(fisNAF, [0 200], 'Name', 'VitaminCIntake');
% Solapamiento 30 %
fisNAF = addMF(fisNAF,'VitaminCIntake','trapmf',[-10 0 35 50],'Name','Low');
fisNAF = addMF(fisNAF,'VitaminCIntake','trimf',[35 100 165],'Name','Medium');
fisNAF = addMF(fisNAF,'VitaminCIntake','trapmf',[135 165 200 210],'Name','High');

% 3. Ingesta de Vitamina E (mg/día)
fisNAF = addInput(fisNAF, [0 30], 'Name', 'VitaminEIntake');
fisNAF = addMF(fisNAF,'VitaminEIntake','trapmf',[-1 0 5 7],'Name','Low');
fisNAF = addMF(fisNAF,'VitaminEIntake','trimf',[5 11 17],'Name','Medium');
fisNAF = addMF(fisNAF,'VitaminEIntake','trapmf',[13 17 30 32],'Name','High');

% 4. Índice de Ingesta de Antioxidantes (escala 0–100)
fisNAF = addInput(fisNAF, [0 100], 'Name', 'AntioxidantIntake');
fisNAF = addMF(fisNAF,'AntioxidantIntake','trapmf',[-10 0 21 30],'Name','Low');
fisNAF = addMF(fisNAF,'AntioxidantIntake','trimf',[21 50 79],'Name','Medium');
fisNAF = addMF(fisNAF,'AntioxidantIntake','trapmf',[70 85 100 110],'Name','High');

% === SALIDA ===
fisNAF = addOutput(fisNAF, [0 1], 'Name', 'NutritionalRisk');
fisNAF = addMF(fisNAF,'NutritionalRisk','trapmf',[-0.1 0 0.25 0.5],'Name','High');
fisNAF = addMF(fisNAF,'NutritionalRisk','trimf',[0.35 0.55 0.75],'Name','Moderate');
fisNAF = addMF(fisNAF,'NutritionalRisk','trapmf',[0.65 0.85 1 1.1],'Name','Low');

ruleList = [
  1 1 1 1 1 1 1;   % Poor diet + all low → High risk
  1 2 2 2 2 1 1;   % Poor diet + medium nutrients → Moderate
  1 3 3 3 3 1 1;   % Poor diet + high nutrients → Low
  2 1 1 1 2 1 1;   % Good diet + low nutrients → Moderate
  2 2 2 2 3 1 1;   % Good diet + medium nutrients → Low
  2 3 3 3 3 1 1;   % Good diet + high nutrients → Low
];
fisNAF = addRule(fisNAF, ruleList);


% === Guardar el Sistema Difuso ===
writeFIS(fisNAF, 'NutritionalRisk');
%gensurf(fisNAF)
%% ImmunologicalRisk
% Create new Mamdani fuzzy inference system
fisIS = mamfis('Name', 'ImmunologicalRisk');

% === INPUTS ===

% 1. Rheumatoid Arthritis (0 = No, 1 = Yes)
fisIS = addInput(fisIS, [0 1], 'Name', 'RheumatoidArthritis');
fisIS = addMF(fisIS,'RheumatoidArthritis','trapmf',[-0.1 0 0 0.6],'Name','No');
fisIS = addMF(fisIS,'RheumatoidArthritis','trapmf',[0.4 1 1 1.1],'Name','Yes');
% Repetir igual para SystemicLupusErythematosus y OrganTransplant

% 2. Systemic Lupus Erythematosus (0 = No, 1 = Yes)
fisIS = addInput(fisIS, [0 1], 'Name', 'SystemicLupusErythematosus');
fisIS = addMF(fisIS, 'SystemicLupusErythematosus', 'trapmf', [-0.1 0 0 0.6], 'Name', 'No');
fisIS = addMF(fisIS, 'SystemicLupusErythematosus', 'trapmf', [0.4 1 1 1.1], 'Name', 'Yes');

% 3. Use of Immunosuppressive Agents (years)
fisIS = addInput(fisIS, [0 10], 'Name', 'ImmunosuppressiveAgents');
fisIS = addMF(fisIS,'ImmunosuppressiveAgents','trapmf',[-1 0 0 0.9],'Name','None');
fisIS = addMF(fisIS,'ImmunosuppressiveAgents','trimf',[0.6 2 3.4],'Name','ShortTerm');
fisIS = addMF(fisIS,'ImmunosuppressiveAgents','trapmf',[2.8 4 10 11],'Name','LongTerm');

% 4. Organ Transplant (0 = No, 1 = Yes)
fisIS = addInput(fisIS, [0 1], 'Name', 'OrganTransplant');
fisIS = addMF(fisIS, 'OrganTransplant', 'trapmf', [-0.1 0 0 0.6], 'Name', 'No');
fisIS = addMF(fisIS, 'OrganTransplant', 'trapmf', [0.3 1 1 1.1], 'Name', 'Yes');

% === OUTPUT ===
fisIS = addOutput(fisIS, [0 1], 'Name', 'ImmunologicalRisk');
fisIS = addMF(fisIS, 'ImmunologicalRisk', 'trapmf', [-0.1 0 0.25 0.5], 'Name', 'Low');
fisIS = addMF(fisIS, 'ImmunologicalRisk', 'trimf', [0.3 0.5 0.7], 'Name', 'Moderate');
fisIS = addMF(fisIS, 'ImmunologicalRisk', 'trapmf', [0.6 0.75 1 1.1], 'Name', 'High');

% === RULES ===
ruleList = [
  2 2 3 2 3 1 1;
  2 2 2 1 2 1 1;
  1 1 1 1 1 1 1;
  1 2 2 1 2 1 1;
  1 1 3 1 3 1 1;
  2 1 1 1 2 1 1;
];
fisIS = addRule(fisIS, ruleList);


% === Save FIS ===
writeFIS(fisIS, 'ImmunologicalRisk');
%gensurf(fisIS);
%% HostFactorsRisk - Sistema Difuso Mamdani
fisHF = mamfis('Name', 'HostFactorsRisk');

% === ENTRADA ===

% 1. Heredabilidad Genética (escala de 0 a 1)
% Basado en estudios de asociación genómica, se han identificado loci de susceptibilidad genética al cáncer cervical, como el locus HLA en 6p21.3, 2q14 (PAX8), 17q12 (GSDMB) y 5p15.33 (CLPTM1L). Aunque la heredabilidad genética no es el principal factor de riesgo, ciertas variantes genéticas pueden aumentar la susceptibilidad.
% Referencia: [PMC8533931](https://pmc.ncbi.nlm.nih.gov/articles/PMC8533931/)

fisHF = addInput(fisHF, [0 1], 'Name', 'GeneticHeritability');
% GeneticHeritability en [0 1]
fisHF = addMF(fisHF,'GeneticHeritability','trapmf',[-0.1 0 0 0.3],'Name','Low');      % Low hasta ~0.3
fisHF = addMF(fisHF,'GeneticHeritability','trimf',[0.2 0.5 0.8],'Name','Medium');   % Centro en 0.5
fisHF = addMF(fisHF,'GeneticHeritability','trapmf',[0.7 0.85 1 1.1],'Name','High');   % High desde ~0.7


% === SALIDA ===
fisHF = addOutput(fisHF, [0 1], 'Name', 'HostRisk');
fisHF = addMF(fisHF,'HostRisk','trapmf',[-0.1 0 0.25 0.5],'Name','Low');
fisHF = addMF(fisHF,'HostRisk','trimf',[0.4 0.6 0.8],'Name','Moderate');
fisHF = addMF(fisHF,'HostRisk','trapmf',[0.7 0.85 1 1.1],'Name','High');

% === REGLAS ===
% Las reglas se basan en la relación directa entre la heredabilidad genética y el riesgo del huésped.
% Dado que solo hay una entrada y una salida, cada regla tiene 4 elementos: [entrada salida peso operador]

ruleList = [
    1 1 1 1;  % Heredabilidad genética baja → Riesgo bajo
    2 2 1 1;  % Heredabilidad genética media → Riesgo moderado
    3 3 1 1;  % Heredabilidad genética alta → Riesgo alto
];

fisHF = addRule(fisHF, ruleList);

% === Guardar el Sistema Difuso ===
writeFIS(fisHF, 'HostFactorsRisk');
gensurf(fisHF)
%% DemographicRisk - Sistema Difuso Mamdani
fisDF = mamfis('Name', 'DemographicRisk');

% === ENTRADA ===

% 1. Edad (en años)
% Basado en datos epidemiológicos, la incidencia del cáncer cervical aumenta a partir de los 25 años, con un pico entre los 35 y 44 años, y una disminución después de los 65 años.
% Referencias:
% - SEER: https://seer.cancer.gov/statfacts/html/cervix.html
% - CDC: https://www.cdc.gov/cancer/hpv/diagnosis-by-age.html

% Universo de discurso: 15–85 años
fisDF = addInput(fisDF, [15 85], 'Name', 'Age');

% Young: 15–25 años, solapamiento ≈30 % (base 10 años → solap. 3 años)
fisDF = addMF(fisDF,'Age','trapmf',[15 15 22 28],'Name','Young');

% MiddleAged: 25–45 años, centro 35, base 20 años → solap. 6 años
fisDF = addMF(fisDF,'Age','trimf',[22 35 48],'Name','MiddleAged');

% Older: 45–65 años, centro 55, base 20 años → solap. 6 años
fisDF = addMF(fisDF,'Age','trapmf',[42 52 65 75],'Name','Older');

% Elderly: > 60 años, solap. con Older en 6 años
fisDF = addMF(fisDF,'Age','trapmf',[60 70 85 85],'Name','Elderly');


% === SALIDA ===
fisDF = addOutput(fisDF, [0 1], 'Name', 'DemographicRisk');
fisDF = addMF(fisDF, 'DemographicRisk', 'trapmf', [-0.1 0 0.25 0.5], 'Name', 'Low');
fisDF = addMF(fisDF, 'DemographicRisk', 'trimf', [0.3 0.5 0.7], 'Name', 'Moderate');
fisDF = addMF(fisDF, 'DemographicRisk', 'trapmf', [0.6 0.75 1 1.1], 'Name', 'High');

% === REGLAS ===
% Las reglas se basan en la relación entre la edad y el riesgo demográfico de cáncer cervical.
% Dado que solo hay una entrada y una salida, cada regla tiene 4 elementos: [entrada salida peso operador]

ruleList = [
    1 1 1 1;  % Young → Low
    2 3 1 1;  % MiddleAged → High
    3 2 1 1;  % Older → Moderate
    4 1 1 1;  % Elderly → Low
];
fisDF = addRule(fisDF, ruleList);


% === Guardar el Sistema Difuso ===
writeFIS(fisDF, 'DemographicRisk');
gensurf(fisDF)
%% SocioeconomicRisk - Sistema Difuso Mamdani
fisSEC = mamfis('Name', 'SocioeconomicRisk');

% === ENTRADAS ===

% 1. Nivel Educativo (años)
fisSEC = addInput(fisSEC, [0 20], 'Name', 'EducationLevel');
fisSEC = addMF(fisSEC,'EducationLevel','trapmf',[0 0 5 8],'Name','Low');
fisSEC = addMF(fisSEC,'EducationLevel','trimf',[6 10 14],'Name','Medium');
fisSEC = addMF(fisSEC,'EducationLevel','trapmf',[12 16 20 20],'Name','High');

% 2. Tipo de Vivienda (escala de índice: 0–5)
fisSEC = addInput(fisSEC, [0 5], 'Name', 'HousingType');
fisSEC = addMF(fisSEC,'HousingType','trapmf',[0 0 1 2],'Name','Poor');
fisSEC = addMF(fisSEC,'HousingType','trimf',[1.5 2.5 3.5],'Name','Average');
fisSEC = addMF(fisSEC,'HousingType','trapmf',[3 4 5 5],'Name','Good');

% 3. Lugar de Residencia (escala de índice: 0–5)
fisSEC = addInput(fisSEC, [0 5], 'Name', 'PlaceOfResidence');
fisSEC = addMF(fisSEC,'PlaceOfResidence','trapmf',[0 0 1 2],'Name','Rural');
fisSEC = addMF(fisSEC,'PlaceOfResidence','trimf',[1.5 2.5 3.5],'Name','Suburban');
fisSEC = addMF(fisSEC,'PlaceOfResidence','trapmf',[3 4 5 5],'Name','Urban');

% 4. Estado Civil (escala de índice: 0–5)
fisSEC = addInput(fisSEC, [0 5], 'Name', 'MaritalStatus');
fisSEC = addMF(fisSEC,'MaritalStatus','trapmf',[0 0 1 2],'Name','Single');
fisSEC = addMF(fisSEC,'MaritalStatus','trimf',[1.5 2.5 3.5],'Name','Married');
fisSEC = addMF(fisSEC,'MaritalStatus','trapmf',[3 4 5 5],'Name','Divorced');

% 5. Ingreso Mensual del Hogar (USD)
fisSEC = addInput(fisSEC, [0 6000], 'Name', 'MonthlyHouseholdIncome');
fisSEC = addMF(fisSEC,'MonthlyHouseholdIncome','trapmf',[0 0 1000 2000],'Name','Low');
fisSEC = addMF(fisSEC,'MonthlyHouseholdIncome','trimf',[1500 3000 4500],'Name','Medium');
fisSEC = addMF(fisSEC,'MonthlyHouseholdIncome','trapmf',[4000 5000 6000 6000],'Name','High');

% === SALIDA ===
fisSEC = addOutput(fisSEC, [0 1], 'Name', 'SocioeconomicRisk');
fisSEC = addMF(fisSEC,'SocioeconomicRisk','trapmf',[-0.1 0 0.25 0.5],'Name','High');
fisSEC = addMF(fisSEC,'SocioeconomicRisk','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisSEC = addMF(fisSEC,'SocioeconomicRisk','trapmf',[0.6 0.75 1 1.1],'Name','Low');

% === REGLAS ===
% Cada regla tiene 7 elementos: [EducationLevel HousingType PlaceOfResidence MaritalStatus MonthlyHouseholdIncome SocioeconomicRisk Weight Operator]

ruleList = [
  1 1 1 1 1 1 1 1;
  2 2 2 2 2 2 1 1;
  3 3 3 3 3 3 1 1;
  3 1 1 1 1 2 1 1;
  1 2 2 2 2 3 1 1;
  2 1 2 1 2 2 1 1;
  1 3 1 3 1 1 1 1;
];
fisSEC = addRule(fisSEC, ruleList);


% === Guardar el Sistema Difuso ===
writeFIS(fisSEC, 'SocioeconomicRisk');
%gensurf(fisSEC)
%% HealthAccessRisk
% Crear un nuevo sistema tipo Mamdani
fisHAA = mamfis('Name', 'HealthAccessRisk');

% === INPUTS ===

% 1. Access to Health Facility (index scale 0–5)
fisHAA = addInput(fisHAA, [0 5], 'Name', 'HealthFacilityAccess');
fisHAA = addMF(fisHAA,'HealthFacilityAccess','trapmf',[0 0 1.7 2.3],'Name','Poor');
fisHAA = addMF(fisHAA,'HealthFacilityAccess','trimf',[1.7 2.5 3.3],'Name','Moderate');
fisHAA = addMF(fisHAA,'HealthFacilityAccess','trapmf',[3 4 5 5],'Name','Good');


% 2. Utilized Health Services (binary)
fisHAA = addInput(fisHAA, [0 1], 'Name', 'UtilizedHealthServices');
fisHAA = addMF(fisHAA,'UtilizedHealthServices','trapmf',[-0.1 0 0 0.6],'Name','No');
fisHAA = addMF(fisHAA,'UtilizedHealthServices','trapmf',[0.4 1 1 1.1],'Name','Yes');

% 3. Awareness of HPV Vaccination (0–100%)
fisHAA = addInput(fisHAA, [0 100], 'Name', 'VaccinationAwareness');
fisHAA = addMF(fisHAA,'VaccinationAwareness','trapmf',[0 0 30 40],'Name','Low');
fisHAA = addMF(fisHAA,'VaccinationAwareness','trimf',[30 50 70],'Name','Medium');
fisHAA = addMF(fisHAA,'VaccinationAwareness','trapmf',[60 80 100 100],'Name','High');



% 4. Awareness of Pap Smear (0–100%)
fisHAA = addInput(fisHAA, [0 100], 'Name', 'PapSmearAwareness');
fisHAA = addMF(fisHAA,'PapSmearAwareness','trapmf',[0 0 30 40],'Name','Low');
fisHAA = addMF(fisHAA,'PapSmearAwareness','trimf',[35 55 75],'Name','Medium');
fisHAA = addMF(fisHAA,'PapSmearAwareness','trapmf',[60 80 100 100],'Name','High');


% === OUTPUT ===
fisHAA = addOutput(fisHAA, [0 1], 'Name', 'HealthAccessRisk');
fisHAA = addMF(fisHAA,'HealthAccessRisk','trapmf',[-0.1 0 0.25 0.5],'Name','High');
fisHAA = addMF(fisHAA,'HealthAccessRisk','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisHAA = addMF(fisHAA,'HealthAccessRisk','trapmf',[0.6 0.75 1 1.1],'Name','Low');

% === REGLAS ===
% Cada regla tiene m+n+2 = 4+1+2 = 7 columnas
ruleList = [
  1   1   1   1   1   1   1;   % Poor, No, Low, Low  → High
 -1   2   2   2   2   1   1;   % Cualquier access, Yes, Med, Med → Moderate
  3   2   3   3   3   1   1;   % Good, Yes, High, High → Low
  3   1  -1  -1   2   1   1;   % Good, No, cualquier awareness → Moderate
  2   1   1  -1   1   1   1;   % Moderate, No, Low, cualquier → High
  1   2   2  -1   1   1   1;   % Poor, Yes, Med, cualquier → High
];


fisHAA = addRule(fisHAA, ruleList);

% Guardar el sistema difuso
writeFIS(fisHAA, 'HealthAccessRisk');
%gensurf(fisHAA)