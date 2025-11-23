# 📉 AdTech Fraud Model Evaluation: Precision & Business Impact

## Overview

In the high-stakes world of AdTech, blocking a bot saves budget, but blocking a legitimate user kills revenue. This Proof of Concept (PoC) simulates a **False Positive Analysis** workflow within Snowflake.

Unlike standard detection pipelines, this project focuses on **Model Evaluation**. By generating a dataset with a known "Ground Truth" (Labeled Data), I compared a standard heuristic rule against reality to calculate the financial impact of classification errors (False Positives vs. False Negatives).

## 🎯 The Business Challenge

A common heuristic in fraud detection is blocking high-volume IPs (e.g., `TOTAL_CLICKS > 50`). However, applying this rule blindly can lead to two critical errors:

1.  **False Positives (The "Revenue Killer"):** Blocking "Power Users" (e.g., Gamers, Heavy Shoppers) who look like bots but generate high value.
2.  **False Negatives (The "Silent Drain"):** Missing "Smart Bots" that intentionally stay just under the threshold (e.g., 49 clicks).

## 🛠️ Tech Stack & Methodology

* **Platform:** Snowflake (Data Warehouse)
* **Language:** SQL (Advanced Logic & Aggregation)
* **Technique:** Confusion Matrix Calculation (TP, TN, FP, FN)

### The Workflow

The project is structured into two distinct phases to simulate a real-world DataOps environment:

1.  **Data Generation (Ground Truth):**
    * Simulated a labeled dataset (`TRAFFIC_EVALUATION`) containing 4 distinct user personas: *Script Bots, Normal Users, Power Users (Gamers), and Low-and-Slow Bots*.
2.  **Model Performance Analysis:**
    * Applied the detection logic (`CLICKS > 50`).
    * Compared the **Prediction** vs. **Reality**.
    * Categorized every IP into the Confusion Matrix.

## 📊 Key Results & Business Interpretation

The pipeline automatically aggregates the results into actionable business metrics:

| Classification | Technical Meaning | Business Impact |
| :--- | :--- | :--- |
| **TRUE POSITIVE** | Correctly blocked High-Vol Bot | ✅ **Fraud Prevention** (Budget Saved) |
| **TRUE NEGATIVE** | Correctly ignored Normal User | ✅ **Clean Traffic** (Valid Impressions) |
| **FALSE POSITIVE** | Incorrectly blocked Human | ❌ **Revenue Loss** (Angry Users/Churn) |
| **FALSE NEGATIVE** | Missed Low-Vol Bot | ⚠️ **Fraud Leakage** (Wasted Budget) |

## 📁 Repository Structure

The code is organized to separate data engineering from analysis:

AdTech-Fraud-Model-Precision-PoC/ ├── src/ │ ├── 1_setup_and_data_generation.sql # Sets up the environment and inserts "Ground Truth" data. │ └── 2_model_evaluation_metrics.sql # Applies the rule, calculates Confusion Matrix, and aggregates business impact. ├── docs/ │ └── confusion_matrix_results.png # Screenshot of the final Snowflake output. ├── README.md └── .gitignore


## 🚀 How to Run This Project

1.  Open a new Worksheet in Snowflake.
2.  Run the script `1_setup_and_data_generation.sql` to create the `TRAFFIC_EVALUATION` table with the mock dataset.
3.  Run the script `2_model_evaluation_metrics.sql` to generate the `MODEL_PERFORMANCE_ANALYSIS` table.
4.  View the final output to see the breakdown of **Lost Revenue** vs. **Wasted Budget**.

---

*This project demonstrates the importance of balancing Precision and Recall in fraud detection algorithms to maximize publisher revenue while minimizing advertiser risk.*
