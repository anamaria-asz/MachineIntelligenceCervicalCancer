# Multi-Level Fuzzy Inference System for Cervical Cancer Risk Assessment

**Author:** Ana Maria Alvarez Suarez – DVOR2C  
**Tool:** MATLAB Fuzzy Logic Designer Toolbox + Simulink  
**Type:** Mamdani Type-1 Fuzzy Inference System (3-layer architecture)

---

## Overview

This project implements a three-layer Mamdani fuzzy inference system (FIS) to assess individual cervical cancer risk from clinical and sociodemographic data. Rather than applying hard diagnostic thresholds, the system uses overlapping membership functions to model the inherent uncertainty of multifactorial risk, producing a continuous risk score (0–10) classified as **Low**, **Medium**, or **High**.

Cervical cancer is the fourth most common cancer in women worldwide (~660,000 new cases in 2022), with over 80% of deaths occurring in low- and middle-income countries. The system is designed to capture the complex, interdependent web of biological, behavioral, and structural factors that drive this inequality.

---

## Architecture

```
Layer 1 (11 inputs)  →  Layer 2 (5 subsystems)  →  Layer 3 (final score)
```

### Layer 1 — Input Determinants

Each variable is fuzzified using trapezoidal or triangular membership functions anchored to published odds ratios (ORs) and relative risks (RRs) from epidemiological literature.

| Subsystem | Inputs |
|-----------|--------|
| **Biological & Infectious Risk** | HPV, HPV type, Chlamydia, HIV, HSV, Bacterial Vaginosis, Genital Warts |
| **Sexual & Reproductive History** | Number of sexual partners, age at first sexual activity, parity, age at first pregnancy |
| **Hormonal Exposure** | Use of oral contraceptives, years of OC use |
| **Behavioral Factors** | Years of smoking, pack-years, BMI |
| **Hygiene Practices** | Vaginal cleansers use, bath frequency, bath during menstruation, menstrual material, wash after intercourse |
| **Nutritional & Dietary Factors** | Balanced diet, vitamin C intake, vitamin E intake, antioxidant intake (CDAI) |
| **Immunological Status** | Rheumatoid arthritis, SLE, immunosuppressive agents (years), organ transplant |
| **Host Factors** | Genetic heritability |
| **Demographic Factors** | Age |
| **Socioeconomic Conditions** | Education level, housing type, place of residence, marital status, monthly income |
| **Health Access & Awareness** | Health facility access, utilized health services, vaccination awareness, Pap smear awareness |

### Layer 2 — Grouped Risk Subsystems

Aggregates Layer 1 outputs into five intermediate scores (range 0–10):

- `InfectionSexualRisk` — Biological/infectious + sexual reproductive history  
- `HormonalMetabolicRisk` — Hormonal exposure + behavioral factors  
- `NutritionalImmuneRisk` — Nutrition + immunological status + host genetics  
- `HygieneRiskLevel` — Hygiene practices  
- `SocioStructuralRisk` — Socioeconomic conditions + health access + demographics  

### Layer 3 — Cervical Cancer Risk (Final Output)

Fuses the five subsystem scores into a single **CervicalCancerRisk** index (0–10) using 11 rules. Any domain rated High elevates the overall risk; all domains Low yields a Low output.

---

## Membership Functions

All subsystems use **trapezoidal (trapmf)** and **triangular (trimf)** membership functions with 25–40% overlap to ensure smooth, gradual risk transitions without artificial cutoffs. Outputs are labeled **Low / Moderate / High** across a [0–1] or [0–10] range depending on the layer.

---

## Validation

Three test cases were run in Simulink:

| Scenario | Input Profile | Risk Score | Classification |
|----------|--------------|------------|----------------|
| Case 1 | All-low risk values | **1.902** | Low |
| Case 2 | Mid-range values | **5.000** | Medium |
| Case 3 | All-high risk values | **8.710** | High |

The system produced coherent, monotonic responses across all input combinations and smooth surface gradients in 3D control-surface plots.

---

## Files

```
/
├── FIS files (.fis)         # Layer 1 subsystem definitions
├── Simulink model (.slx)    # Full 3-layer architecture
├── MATLAB scripts           # Rule evaluation & surface plotting
└── README.md                # This file
```

---

## Key Design Decisions

- **Mamdani (not Sugeno):** chosen for interpretability — output membership functions are linguistically meaningful, not linear functions of inputs.
- **Odds-ratio anchoring:** membership function breakpoints (e.g., HPV type, HIV, smoking duration) are grounded in published clinical thresholds rather than arbitrary values.
- **Hierarchical abstraction:** Layer 2 reduces dimensionality from 11 raw inputs to 5 domain-level risks, improving rule tractability and interpretability at the final layer.
- **Genital warts exception:** HPV 6/11 (low-risk types) maps to *Low* infectious risk, correctly reflecting their negligible oncogenic potential.

---

## References

Key epidemiological sources used to calibrate membership functions and rules:

- CDC – *Basic Information about HPV and Cancer* (2024)  
- American Cancer Society – *Risk Factors for Cervical Cancer* (2020)  
- Stelzle et al. – *Global burden of cervical cancer associated with HIV*, Lancet Glob Health (2021)  
- Bovo et al. – *Combined Oral Contraceptive Use and Cervical Cancer Risk*, Rev Bras Ginecol Obstet (2023)  
- Moscicki et al. – *Cervical Cancer Screening in Immunosuppressed Women*, J Low Genit Tract Dis (2019)  

Full bibliography available in the project report (`ProjectDocumentation.pdf`).

---

## Notes

This system is intended as a **clinical decision support tool**, not a diagnostic instrument. Risk scores should be interpreted alongside clinical judgment and standard screening protocols (Pap smear, HPV testing, colposcopy).
