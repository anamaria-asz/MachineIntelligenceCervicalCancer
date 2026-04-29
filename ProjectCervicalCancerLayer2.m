%% 1. InfectionAndSexualRisk
% Crear el sistema difuso
fisIRR = mamfis('Name', 'InfectionAndSexualRisk');

% --------- Entradas ---------
% 1. Biological & Infectious Risk
fisIRR = addInput(fisIRR, [0 1], 'Name', 'BiologicalInfectiousRisk');
fisIRR = addMF(fisIRR, 'BiologicalInfectiousRisk', 'trapmf', [-0.1 0 0.25 0.5], 'Name', 'Low');
fisIRR = addMF(fisIRR, 'BiologicalInfectiousRisk', 'trimf', [0.2 0.5 0.8], 'Name', 'Moderate');
fisIRR = addMF(fisIRR, 'BiologicalInfectiousRisk', 'trapmf', [0.4 0.75 1 1.1], 'Name', 'High');

% 2. Sexual Behavior & Reproductive History
fisIRR = addInput(fisIRR, [0 1], 'Name', 'SexualBehavior');
fisIRR = addMF(fisIRR, 'SexualBehavior', 'trapmf', [-0.1 0 0.25 0.5], 'Name', 'Low');
fisIRR = addMF(fisIRR, 'SexualBehavior', 'trimf', [0.2 0.5 0.8], 'Name', 'Moderate');
fisIRR = addMF(fisIRR, 'SexualBehavior', 'trapmf', [0.5 0.75 1 1.1], 'Name', 'High');

% --------- Salida ---------
% Infection and Sexual Risk
fisIRR = addOutput(fisIRR, [0 10], 'Name', 'InfectionSexualRisk');
fisIRR = addMF(fisIRR, 'InfectionSexualRisk', 'trapmf', [0 0 2 4], 'Name', 'Low');
fisIRR = addMF(fisIRR, 'InfectionSexualRisk', 'trimf', [2.5 5 7.5], 'Name', 'Medium');
fisIRR = addMF(fisIRR, 'InfectionSexualRisk', 'trapmf', [5.5 8 10 10], 'Name', 'High');

% --------- Reglas ---------
ruleList = [
    1 1 1 1 1;  % Low BIR AND Low SBRH => Low IRR
    1 2 2 1 1;  % Low BIR AND Medium SBRH => Medium IRR
    2 1 2 1 1;  % Medium BIR AND Low SBRH => Medium IRR
    2 2 2 1 1;  % Medium BIR AND Medium SBRH => Medium IRR
    2 3 3 1 1;  % Medium BIR AND High SBRH => High IRR
    3 2 3 1 1;  % High BIR AND Medium SBRH => High IRR
    3 3 3 1 1;  % High BIR AND High SBRH => High IRR
    1 3 2 1 1;  % Low BIR AND High SBRH => Medium IRR
    3 1 2 1 1;  % High BIR AND Low SBRH => Medium IRR
];

fisIRR = addRule(fisIRR, ruleList);
gensurf(fisIRR)
% --------- Visualizar ---------
% opcional para revisar las superficies y reglas
% plotfis(fisIRR)
% surfview(fisIRR)

%% 2. Hormonal and Metabolic Risk
% Crear el sistema difuso
fisHMRR = mamfis('Name', 'HormonalAndMetabolicRisk');

% --------- Entradas ---------
% 1. Hormonal Exposure
fisHMRR = addInput(fisHMRR, [0 1], 'Name', 'HormonalExposure');
% HormonalExposure (0–1)
fisHMRR = addMF(fisHMRR,'HormonalExposure','trapmf',[-0.1 0 0.2 0.5],'Name','Low');
fisHMRR = addMF(fisHMRR,'HormonalExposure','trimf',[0.3 0.5 0.7],'Name','Medium');
fisHMRR = addMF(fisHMRR,'HormonalExposure','trapmf',[0.5 0.8 1 1.1],'Name','High');


% 2. Behavioral Factors (Smoking and Obesity)
fisHMRR = addInput(fisHMRR, [0 1], 'Name', 'BehavioralFactors');
fisHMRR = addMF(fisHMRR,'BehavioralFactors','trapmf',[-0.1 0 0.2 0.5],'Name','Low');
fisHMRR = addMF(fisHMRR,'BehavioralFactors','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisHMRR = addMF(fisHMRR,'BehavioralFactors','trapmf',[0.5 0.8 1 1.1],'Name','High');

% --------- Salida ---------
% Hormonal and Metabolic Risk
fisHMRR = addOutput(fisHMRR, [0 10], 'Name', 'HormonalMetabolicRisk');
fisHMRR = addMF(fisHMRR,'HormonalMetabolicRisk','trapmf',[0 0 2 4.5],'Name','Low');
fisHMRR = addMF(fisHMRR,'HormonalMetabolicRisk','trimf',[3 4.5 7.5],'Name','Medium');
fisHMRR = addMF(fisHMRR,'HormonalMetabolicRisk','trapmf',[5.5 8 10 10],'Name','High');
% --------- Reglas ---------
ruleList = [
  % HE  BF  Output  Weight  Op
   1   1    1      0.6     1;  % Low HE & Low BF → Low (menos influencia)
   1   2    2      0.6     1;  % Low HE & Med BF → Medium
   2   1    2      0.8     1;  % Med HE & Low BF → Medium
   2   2    2      0.8     1;  % Med HE & Med BF → Medium
   2   3    3      0.8     1;  % Med HE & High BF → High
   3   1    2      1.0     1;  % High HE & Low BF → Medium (hormonal domina)
   3   2    3      1.0     1;  % High HE & Med BF → High
   3   3    3      1.0     1;  % High HE & High BF → High
   1   3    2      0.6     1;  % Low HE & High BF → Medium
];
fisHMRR = addRule(fisHMRR, ruleList);

fisHMRR = addRule(fisHMRR, ruleList);
gensurf(fisHMRR)
% --------- Visualizar ---------
% plotfis(fisHMRR)
% surfview(fisHMRR)
%% 3. NutritionalAndImmuneRisk
% Crear el sistema difuso
fisNIR = mamfis('Name', 'NutritionalAndImmuneRisk');

% --------- Entradas ---------
% 1. Nutrition & Antioxidants
fisNIR = addInput(fisNIR, [0 1], 'Name', 'NutritionAntioxidants');
% Nutrition & Antioxidants (0–1)
fisNIR = addMF(fisNIR,'NutritionAntioxidants','trapmf',[-0.1 0 0.15 0.5],'Name','LowNutrition');
fisNIR = addMF(fisNIR,'NutritionAntioxidants','trimf',[0.35 0.5 0.65],'Name','ModerateNutrition');
fisNIR = addMF(fisNIR,'NutritionAntioxidants','trapmf',[0.5 0.85 1 1.1],'Name','HighNutrition');


% 2. Immunological Status
fisNIR = addInput(fisNIR, [0 1], 'Name', 'ImmunologicalStatus');
fisNIR = addMF(fisNIR,'ImmunologicalStatus','trapmf',[-0.1 0 0.15 0.5],'Name','LowImmune');
fisNIR = addMF(fisNIR,'ImmunologicalStatus','trimf',[0.35 0.5 0.65],'Name','ModerateImmune');
fisNIR = addMF(fisNIR,'ImmunologicalStatus','trapmf',[0.5 0.85 1 1.1],'Name','HighImmune');


% 3. Host Factors (Genetic heritability)
fisNIR = addInput(fisNIR, [0 1], 'Name', 'HostFactors');
fisNIR = addMF(fisNIR,'HostFactors','trapmf',[-0.1 0 0.15 0.5],'Name','LowGenetic');
fisNIR = addMF(fisNIR,'HostFactors','trimf',[0.35 0.5 0.65],'Name','ModerateGenetic');
fisNIR = addMF(fisNIR,'HostFactors','trapmf',[0.5 0.85 1 1.1],'Name','HighGenetic');

% --------- Salida ---------
% Nutritional and Immune Risk
fisNIR = addOutput(fisNIR, [0 10], 'Name', 'NutritionalImmuneRisk');
fisNIR = addMF(fisNIR,'NutritionalImmuneRisk','trapmf',[0 0 2 4.5],'Name','LowRisk');
fisNIR = addMF(fisNIR,'NutritionalImmuneRisk','trimf',[3 4.5 7.5],'Name','MediumRisk');
fisNIR = addMF(fisNIR,'NutritionalImmuneRisk','trapmf',[5.5 8 10 10],'Name','HighRisk');


ruleList = [
    % Casos de alto riesgo
    3 -1 -1 3 1.0 1;   % Alta nutrición sola → Alto riesgo si demás incierto
    -1 3 -1 3 1.0 1;   % Alta inmunidad sola → Alto riesgo
    -1 -1 3 3 1.0 1;   % Factores genéticos altos → Alto riesgo
    3 3 -1 3 1.0 1;    % Alta nutrición + Alta inmunidad → Alto riesgo
    3 -1 3 3 1.0 1;    % Alta nutrición + Factores genéticos altos → Alto riesgo
    -1 3 3 3 1.0 1;    % Alta inmunidad + Factores genéticos altos → Alto riesgo
    3 3 3 3 1.0 1;     % Todo alto → Alto riesgo

    % Casos de riesgo medio
    2 -1 -1 2 0.8 1;   % Nutrición moderada sola
    -1 2 -1 2 0.8 1;   % Inmunidad moderada sola
    -1 -1 2 2 0.8 1;   % Factores genéticos moderados solos
    2 2 -1 2 0.8 1;    % Nutrición e inmunidad moderadas
    2 -1 2 2 0.8 1;    % Nutrición y genética moderadas
    -1 2 2 2 0.8 1;    % Inmunidad y genética moderadas
    2 2 2 2 0.8 1;     % Todo medio → Medio riesgo

    % Casos de bajo riesgo
    1 -1 -1 1 0.9 1;   % Nutrición baja sola → Bajo riesgo
    -1 1 -1 1 0.9 1;   % Inmunidad baja sola
    -1 -1 1 1 0.9 1;   % Factores genéticos bajos
    1 1 -1 1 0.9 1;    % Nutrición baja + inmunidad baja
    1 -1 1 1 0.9 1;    % Nutrición baja + genética baja
    -1 1 1 1 0.9 1;    % Inmunidad baja + genética baja
    1 1 1 1 1.0 1;     % Todo bajo → Bajo riesgo
];


fisNIR = addRule(fisNIR, ruleList);
gensurf(fisNIR)
% --------- Visualizar ---------
% plotfis(fisNIR)
% surfview(fisNIR)

%% 4. HygieneRiskFinal
% Crear el sistema difuso
fisHR = mamfis('Name', 'HygieneRiskFinal');

% --------- Entrada ---------
fisHR = addInput(fisHR, [0 1], 'Name', 'HygienePractices');
% HygienePractices (0–1)
fisHR = addMF(fisHR,'HygienePractices','trapmf',[-0.1 0 0.15 0.5],'Name','Low');
fisHR = addMF(fisHR,'HygienePractices','trimf',[0.35 0.5 0.65],'Name','Moderate');
fisHR = addMF(fisHR,'HygienePractices','trapmf',[0.5 0.85 1 1.1],'Name','High');


% --------- Salida ---------
fisHR = addOutput(fisHR, [0 10], 'Name', 'HygieneRiskLevel');
% HygieneRiskLevel (0–10)
fisHR = addMF(fisHR,'HygieneRiskLevel','trapmf',[0 0 2 4],'Name','Low');
fisHR = addMF(fisHR,'HygieneRiskLevel','trimf',[3 5 7],'Name','Moderate');
fisHR = addMF(fisHR,'HygieneRiskLevel','trapmf',[6 8 10 10],'Name','High');


% --------- Reglas (1 entrada, 1 salida, así que 4 elementos por regla) ---------
ruleList = [
  1   1   1   1;   % Low HygienePractices → Low HygieneRiskLevel
  2   2   1   1;   % Moderate HygienePractices → Moderate HygieneRiskLevel
  3   3   1   1;   % High HygienePractices → High HygieneRiskLevel
];



fisHR = addRule(fisHR, ruleList);
gensurf(fisHR)
% --------- Visualizar ---------
% plotfis(fisHR)
% surfview(fisHR)

%% 5. SocioStructuralRisk

% Crear el sistema difuso
fisSSRR = mamfis('Name', 'SocioStructuralRisk');

% --------- Entradas ---------

% 1. SocioeconomicRisk
fisSSRR = addInput(fisSSRR, [0 1], 'Name', 'SocioeconomicRisk');
fisSSRR = addMF(fisSSRR,'SocioeconomicRisk','trapmf',[0 0 0.2 0.4],'Name','High');
fisSSRR = addMF(fisSSRR,'SocioeconomicRisk','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisSSRR = addMF(fisSSRR,'SocioeconomicRisk','trapmf',[0.6 0.8 1 1],'Name','Low');

% 2. HealthAccessRisk
fisSSRR = addInput(fisSSRR, [0 1], 'Name', 'HealthAccessRisk');
fisSSRR = addMF(fisSSRR,'HealthAccessRisk','trapmf',[0 0 0.2 0.4],'Name','High');
fisSSRR = addMF(fisSSRR,'HealthAccessRisk','trimf',[0.3 0.5 0.7],'Name','Moderate');
fisSSRR = addMF(fisSSRR,'HealthAccessRisk','trapmf',[0.6 0.8 1 1],'Name','Low');

% 3. DemographicRisk
fisSSRR = addInput(fisSSRR, [0 1], 'Name', 'DemographicRisk');
fisSSRR = addMF(fisSSRR, 'DemographicRisk', 'trapmf', [0 0 0.2 0.4], 'Name', 'Low');
fisSSRR = addMF(fisSSRR, 'DemographicRisk', 'trimf', [0.3 0.5 0.7], 'Name', 'Moderate');
fisSSRR = addMF(fisSSRR, 'DemographicRisk', 'trapmf', [0.6 0.8 1 1], 'Name', 'High');

% --------- Salida ---------
fisSSRR = addOutput(fisSSRR, [0 10], 'Name', 'SocioStructuralRisk');
fisSSRR = addMF(fisSSRR,'SocioStructuralRisk','trapmf',[0 0 2 4],'Name','Low');
fisSSRR = addMF(fisSSRR,'SocioStructuralRisk','trimf',[3 5 7],'Name','Moderate');
fisSSRR = addMF(fisSSRR,'SocioStructuralRisk','trapmf',[6 8 10 10],'Name','High');

% --------- Reglas (m=3, n=1 => 6 columnas) ---------
ruleList = [
    1 1 1 1 1 1;  % Alta vulnerabilidad en todo => Bajo resultado (alto riesgo)
    1 2 1 1 1 1;  % Socioeconómica alta + Acceso medio + Demografía baja => Bajo
    2 2 2 2 1 1;  % Todo moderado => Moderado
    3 3 1 3 1 1;  % Buen acceso + buena socioeconómica + baja demografía => Alto
    3 2 3 3 1 1;  % Socioeconómica buena + acceso medio + edad alta => Alto
    2 3 2 3 1 1;  % Buen acceso y otros moderados => Alto
    2 1 2 2 1 1;  % Bajo acceso con moderados => Moderado
    3 1 1 2 1 1;  % Buena socioeconómica pero pobre acceso => Moderado
];

fisSSRR = addRule(fisSSRR, ruleList);

% --------- Visualizar ---------
% plotfis(fisSSRR)
% surfview(fisSSRR)
gensurf(fisSSRR)

