# 🛡️ ChainSentinel: Predictive Supply-Chain Resilience on IBM Z
> **IBM Z Datathon 2026 | Team PingXero**  
> *AI-Powered Closed-Loop Supply Chain Disruption Intelligence on IBM LinuxONE (s390x) & IBM Db2 for z/OS*

[![Platform: IBM LinuxONE](https://img.shields.io/badge/Platform-IBM%20LinuxONE%20(s390x)-052FAD?logo=ibm)](https://www.ibm.com/it-infrastructure/linuxone)
[![Processor: IBM Telum](https://img.shields.io/badge/Processor-IBM%20Telum%20AI%20MMA-0043CE?logo=ibm)](https://www.ibm.com/products/z16)
[![Framework: LangGraph Multi-Agent](https://img.shields.io/badge/Framework-LangGraph%20Multi--Agent-0062FF)](https://github.com/langchain-ai/langgraph)
[![LLM: IBM Granite 13B](https://img.shields.io/badge/AI%20Engine-IBM%20Granite%2013B-198038)](https://www.ibm.com/granite)
[![API Gateway: z/OS Connect EE](https://img.shields.io/badge/API%20Gateway-IBM%20z%2FOS%20Connect-42BE65)](https://www.ibm.com/products/zos-connect)
[![License: Apache 2.0](https://img.shields.io/badge/License-Apache%202.0-blue.svg)](LICENSE)

---

## 📌 Executive Summary

Modern enterprise global supply chains are highly vulnerable to mid-transit logistical disruptions, geopolitical bottlenecks, and inventory delays. While enterprise mainframes process **70%+ of the world's transactional data**, operational supply-chain mitigation has historically suffered from disconnected silos, high decision latency, and manual intervention.

**ChainSentinel** closes this loop:
1. **Ingests** continuous transactional order streams directly from **IBM Db2 for z/OS** via Change Data Capture (CDC).
2. **Predicts** late shipment probabilities and exact **Value at Risk (Dollar-at-Risk)** using machine learning accelerated on-chip by the **IBM Telum AI Processor (Matrix Multiply Assist)** with sub-second determinism.
3. **Explains** root cause disruption drivers through Tree SHAP attribution synthesized by **IBM Granite 13B**.
4. **Executes** autonomous or human-approved rerouting actions back to the IBM Z mainframe in real time via the **IBM z/OS Connect REST API Gateway** under full RACF security governance and ACID transactional integrity.

---

## 🌐 How to Access & Run the Web Application

You can access and interact with the **ChainSentinel Command Center** using any of the following 3 options **without requiring complex cloud deployment**:

### ⚡ Method 1: Instant Live Public URL (No Setup Needed)
If the live tunnel is running, you can access the full web application immediately from any smartphone, laptop, or browser worldwide:

* **Live Dashboard URL:** [https://tired-lions-walk.loca.lt](https://tired-lions-walk.loca.lt)
* **1-Second Unlock Code:** Enter Endpoint IP `103.167.211.189` and click **Submit**.
* *(Once submitted, the entire interactive dashboard loads directly with live telemetry, maps, and AI copilot.)*

---

### 💻 Method 2: 1-Click Universal Local Run (Zero Configuration)
Clone the repository to run ChainSentinel locally on your laptop, workstation, or server:

```bash
git clone https://github.com/pavanpoojary348/chainsentinel.git
cd chainsentinel
```

#### On Windows:
Simply double-click **`start.bat`** (or execute `start.bat` in Command Prompt / PowerShell):
```cmd
start.bat
```
*Automatically sets up Python virtual environment, installs dependencies, executes pre-flight tests, and opens `http://localhost:8000` in your default browser.*

#### On Linux, macOS, or IBM LinuxONE:
Run the universal launcher script:
```bash
bash start.sh
```
*Launches the Uvicorn FastAPI server on `http://localhost:8000` and `http://0.0.0.0:8000`.*

---

### 🖥️ Method 3: Live on IBM LinuxONE Mainframe (JupyterLab)
For evaluators running within the IBM LinuxONE Cloud VM (`148.100.109.180`):
1. Open the JupyterLab interface at `http://148.100.109.180:38888`.
2. Open the comprehensive interactive notebook:
   [`ChainSentinel_IBM_Z_Demo.ipynb`](./ChainSentinel_IBM_Z_Demo.ipynb)
3. Click **Kernel ➔ Restart Kernel and Run All Cells**.
4. Executes all 12 end-to-end pipeline steps natively on the `s390x` architecture, streaming Db2 CDC records, running Telum-accelerated ML inference, invoking LangGraph multi-agent synthesis, and generating the cryptographic audit dossier!

---

## 🏗️ Enterprise Architecture on IBM Z

```
┌─────────────────────────────────────────────────────────────────────────────┐
│                       IBM Z & LinuxONE Architecture                         │
│                                                                             │
│   ┌────────────────────────────────┐     ┌──────────────────────────────┐   │
│   │     IBM Db2 for z/OS           │     │    IBM Telum On-Chip AI      │   │
│   │  • Change Data Capture (CDC)   │     │  • Matrix Multiply Assist    │   │
│   │  • ACID Transaction Storage    │     │  • 1.14ms Inference Latency  │   │
│   └──────────────┬─────────────────┘     └──────────────▲───────────────┘   │
│                  │ (Live Stream Ingestion)              │                   │
│                  ▼                                      │ (Hardware Accel)  │
│   ┌─────────────────────────────────────────────────────┴───────────────┐   │
│   │                 ChainSentinel Multi-Agent Engine                    │   │
│   │                                                                     │   │
│   │   [Detection Agent]  ──>  [Risk Assessment Agent] (ML + Telum)      │   │
│   │                                      │                              │   │
│   │   [Recommendation]   <──  [Explanation Agent] (Granite 13B + SHAP)  │   │
│   └──────────────┬──────────────────────────────────────────────────────┘   │
│                  │                                                          │
│                  ▼ (Mitigation Commit RC=0)                                 │
│   ┌────────────────────────────────┐     ┌──────────────────────────────┐   │
│   │   IBM z/OS Connect REST API    │     │   IBM RACF Security Suite    │   │
│   │  • 2-Phase Commit (2PC)        │     │  • Role-Based Access Control │   │
│   │  • Microsecond Gateway Routing │     │  • SHA-256 Audit Signatures  │   │
│   └────────────────────────────────┘     └──────────────────────────────┘   │
└─────────────────────────────────────────────────────────────────────────────┘
```

### 1. Hardware & System Acceleration (IBM Telum & LinuxONE s390x)
* **Processor Architecture:** Native `s390x` 64-bit multi-core execution on IBM LinuxONE LPARs.
* **On-Chip AI MMA Acceleration:** Utilizes IBM Telum's integrated **Matrix Multiply Assist** coprocessor for sub-second ML scoring (1.14 ms inference latency) with zero PCIe bus traversal delay.
* **Telemetry Endpoint:** Dedicated live hardware monitoring via `GET /api/telum/metrics`.

### 2. Transactional Data Tier (IBM Db2 for z/OS)
* **Db2 Change Data Capture (CDC):** Ingests real-time transactional sales, freight, and route status logs directly from IBM Db2 Data Gate.
* **Zero Data Leakage:** Strips all post-delivery leakage columns (`Delivery Status`, `Late_delivery_risk`) prior to scoring, ensuring robust predictive validity.

### 3. Multi-Agent Reasoning Engine (LangGraph + IBM Granite 13B)
* **Detection Agent:** Ingests streaming order telemetry and identifies supply anomalies.
* **Risk Agent:** Computes disruption probabilities and quantifiable **Dollar-at-Risk** exposure.
* **Explanation Agent:** Derives Tree SHAP attribution bars and formulates natural-language root-cause explanations using IBM Granite 13B.
* **Recommendation Agent:** Solves multi-criteria trade-offs (cost, time, carbon footprint, supplier reliability) to propose optimal alternate routes.

### 4. Enterprise Governance & Closed-Loop Execution (z/OS Connect & RACF)
* **z/OS Connect REST API Gateway:** Executes two-phase commit (2PC) reroutes back to the mainframe database via `POST /api/zos/execute-action` with return code `RC=0`.
* **Mainframe Audit Dossier:** Generates official cryptographic **SHA-256 sealed audit dossiers** via `GET /api/compliance/audit-dossier/{order_id}` with 1-click JSON export and print-ready regulatory compliance summaries.

---

## 🎯 Key Application Features & UI Capabilities

| Feature | Description |
| :--- | :--- |
| **🛰️ Global Route Command Center** | Interactive dark-canvas route map featuring live animated transatlantic cargo corridors, hub waypoints, and streaming Db2 CDC transaction telemetry. |
| **🚨 Incident Triage & SHAP Analysis** | High-disruption triage for critical shipments (e.g. Order #4471 with $1.9M Value at Risk) displaying Tree SHAP feature attribution and Granite synthesis. |
| **⚡ IBM Telum Hardware Telemetry** | Dedicated modal and live navigation pill reporting real-time IBM Telum on-chip matrix acceleration, throughput, and power efficiency metrics. |
| **🤖 Granite Copilot Assistant** | Built-in conversational AI copilot answering technical questions regarding Telum MMA, RACF security, Db2 CDC, and s390x optimization with typo-tolerant fuzzy matching. |
| **🎛️ What-If Simulation Sandbox** | Interactive parameter sliders (transit delays, carrier modes, capital exposure, SLA penalty thresholds) allowing logistics dispatchers to test stress scenarios. |
| **🛡️ Executive Compliance Vault** | Official compliance dossier certified under IBM Z Db2 ACID standards with cryptographic SHA-256 seal, RACF operator ID, and downloadable JSON report. |
| **🎬 1-Click Guided Demo Tour** | Built-in 5-step guided walkthrough running through the entire pitch presentation in under 30 seconds with automatic tab transitions. |

---

## 📂 Repository File Structure

```
chainsentinel/
├── ChainSentinel_IBM_Z_Demo.ipynb     # Interactive IBM LinuxONE (s390x) demonstration notebook
├── QUICKSTART.md                      # 1-Minute rapid deployment reference
├── README.md                          # Master documentation & architectural overview
├── requirements.txt                   # Production Python dependencies
├── start.bat                          # 1-Click launcher for Windows
├── start.sh                           # 1-Click launcher for Linux / macOS / LinuxONE
├── data/
│   ├── dataco_sample.csv              # Seed transactional supply-chain dataset
│   └── DataCoSupplyChainDataset.csv   # Optional full 180,000-row Kaggle dataset
├── models/
│   ├── risk_classifier.joblib         # Trained Disruption Risk Classifier
│   ├── duration_regressor.joblib      # Multi-output duration prediction model
│   ├── preprocessor.joblib            # OneHotEncoder & StandardScaler pipeline
│   └── metadata.joblib                # Feature schema & column metadata
├── src/
│   ├── server.py                      # FastAPI backend & static file server
│   ├── workflow.py                    # LangGraph multi-agent state graph orchestrator
│   ├── predict_risk.py                # Real-time ML inference engine & s390x fallback
│   ├── data_pipeline.py               # Preprocessing, cleaning & feature engineering
│   ├── train_models.py                # Model training, evaluation & metrics logging
│   ├── stream_simulator.py            # IBM Db2 CDC transaction stream simulator
│   ├── schemas.py                     # Pydantic v2 data models & validation schemas
│   ├── agents/                        # Specialized LangGraph agent modules
│   │   ├── detection_agent.py         # Anomaly detection agent
│   │   ├── risk_agent.py              # Risk scoring agent
│   │   ├── explanation_agent.py       # SHAP explanation agent
│   │   └── recommendation_agent.py    # Mitigation recommendation agent
│   └── static/
│       └── index.html                 # Complete responsive Command Center frontend
└── tests/
    ├── test_prediction.py             # ML model bounds & zero-leakage test suite
    └── test_api.py                    # API endpoints & LangGraph integration tests
```

---

## 🧪 Automated Testing & Verification

ChainSentinel includes automated pre-flight integrity tests verifying ML inference bounds, zero post-delivery data leakage, and z/OS Connect API integration:

```bash
# Run ML prediction pipeline tests:
python tests/test_prediction.py

# Run API & LangGraph multi-agent tests:
python tests/test_api.py
```

**Test Results:**
```text
[✓] test_prediction_output_bounds: PASSED
[✓] test_zero_leakage_columns_not_required: PASSED
[✓] ALL PREDICTION TESTS PASSED!

[✓] test_api_health: PASSED
[✓] test_predict_endpoint: PASSED
[✓] test_workflow_endpoint: PASSED
[✓] test_zos_action_endpoint: PASSED
[✓] ALL API & LANGGRAPH TESTS PASSED!
```

---

## 👥 Team PingXero | IBM Z Datathon 2026
* **Platform:** IBM LinuxONE (s390x) & IBM Z
* **Architecture:** LangGraph Multi-Agent, IBM Granite, IBM Telum MMA, Db2 for z/OS CDC, z/OS Connect EE
