# 🛡️ ChainSentinel: Enterprise System Architecture & Workflow Pipeline
> **IBM Z Datathon 2026 | Team PingXero**  
> *AI-Powered Closed-Loop Supply-Chain Resilience on IBM LinuxONE (s390x) & IBM Db2 for z/OS*

---

## 1. High-Level System Architecture

```mermaid
graph TB
    subgraph DataTier["1. Mainframe Data & CDC Ingestion"]
        DB2["IBM Db2 for z/OS<br/>(Transaction Ledger)"]
        CDC["IBM Db2 Data Gate CDC<br/>(Change Data Capture)"]
        Cleaner["Zero-Leakage Ingestion Pipeline<br/>(Drops Post-Delivery Features)"]
        DB2 --> CDC
        CDC --> Cleaner
    end

    subgraph AccelTier["2. On-Chip ML Acceleration (IBM Telum)"]
        Cleaner --> Preprocessor["OneHotEncoder & StandardScaler<br/>(preprocessor.joblib)"]
        Preprocessor --> Telum["IBM Telum Processor (s390x)<br/>Matrix Multiply Assist (MMA)"]
        Telum --> Clf["Disruption Risk Classifier<br/>(RandomForest / XGBoost)"]
        Telum --> Reg["Duration Regressor<br/>(Multi-Output Fastest / Normal Days)"]
        Clf --> Metrics["Risk Probability & Dollar-at-Risk ($)"]
        Reg --> Metrics
    end

    subgraph AgentTier["3. LangGraph Multi-Agent Orchestration (IBM Granite 13B)"]
        Metrics --> DetectionAgent["Detection Agent<br/>(Flags Logistics Anomalies)"]
        DetectionAgent --> RiskAgent["Risk Assessment Agent<br/>(Evaluates Exposure & SLA Impact)"]
        RiskAgent --> ExplanationAgent["Explanation Agent<br/>(Tree SHAP + Granite Rationale)"]
        ExplanationAgent --> RecAgent["Recommendation Agent<br/>(Multi-Criteria Optimal Supplier Triage)"]
    end

    subgraph ExecutionTier["4. Closed-Loop Execution & Governance (IBM Z)"]
        RecAgent --> HumanLoop{"Operator Review<br/>or Auto-Trigger?"}
        HumanLoop -->|Approved| ZOS["IBM z/OS Connect EE<br/>(REST API Gateway)"]
        ZOS --> RACF["IBM RACF Security Suite<br/>(Role Authorization DSN.ADMIN)"]
        RACF --> TwoPC["Two-Phase Commit (2PC)<br/>(ACID Database Write RC=0)"]
        TwoPC --> DB2
        TwoPC --> Audit["Compliance Audit Dossier<br/>(Cryptographic SHA-256 Seal)"]
    end

    subgraph UITier["5. Command Center & Observability"]
        Cleaner -.-> LiveMap["Global Route Command Center<br/>(Leaflet Geospatial Map)"]
        ExplanationAgent -.-> TriageUI["Incident Triage Drawer<br/>(SHAP Attribution & Granite Summary)"]
        Audit -.-> AuditVault["Executive Governance Vault<br/>(JSON Dossier & Print Certificate)"]
        UITier -.-> Copilot["IBM Granite Copilot<br/>(Typo-Tolerant Natural Language Chat)"]
    end
```

---

## 2. Multi-Agent StateGraph Execution Flowchart

This flowchart illustrates the step-by-step cycle when a high-value shipment (e.g., Order #4471 with $1.9M Value at Risk) encounters a transit delay:

```mermaid
flowchart TD
    Start(["⚡ Live Db2 CDC Event Ingested"]) --> Step1["Step 1: Detection Agent<br/>• Ingests raw order attributes<br/>• Validates scheduled transit vs baseline<br/>• Anomaly Flag: Disruption Detected"]
    
    Step1 --> Step2["Step 2: Risk Assessment Agent<br/>• Transforms features via preprocessor.joblib<br/>• Executes Telum MMA inference (1.14ms)<br/>• Late Delivery Probability: 87.0%<br/>• Dollar-at-Risk: $1,653,000"]
    
    Step2 --> Decision1{"Is Risk > 70% (CRITICAL)?"}
    
    Decision1 -->|No| NormalLog["Log to Db2 as NORMAL / LOW RISK"]
    
    Decision1 -->|Yes| Step3["Step 3: Explanation Agent<br/>• Computes Tree SHAP feature contributions<br/>• Key Driver 1: Shipping Mode (+32%)<br/>• Key Driver 2: Order Region (+24%)<br/>• Key Driver 3: Scheduled Window (+18%)<br/>• Synthesizes IBM Granite 13B root cause"]
    
    Step3 --> Step4["Step 4: Recommendation Agent<br/>• Ranks alternative suppliers across Europe/US<br/>• Evaluates SLA penalty, freight cost, carbon<br/>• Recommends: Supplier B (Frankfurt)<br/>• Projected Savings: $1.7M Protected"]
    
    Step4 --> Step5["Step 5: Incident Command Center UI<br/>• Displays flashing high-risk corridor on map<br/>• Renders interactive mitigation card<br/>• Operator clicks 'Execute z/OS Action'"]
    
    Step5 --> Step6["Step 6: IBM z/OS Connect REST Commit<br/>• Dispatches POST /api/zos/execute-action<br/>• Attaches RACF credential header<br/>• Executes Two-Phase Commit with Db2<br/>• Mainframe Response: RC=0 (Success)"]
    
    Step6 --> Step7["Step 7: Immutable Audit Dossier<br/>• Cryptographic SHA-256 seal generated<br/>• Transaction ID: ZOS-TXN-90241-COMMIT<br/>• Ready for regulatory compliance download"]

    Step7 --> End(["✅ Mission Accomplished: Disruption Mitigated"])

    style Start fill:#0043ce,stroke:#002d9c,stroke-width:2px,color:#fff
    style Step2 fill:#8a3ffc,stroke:#6929c4,stroke-width:2px,color:#fff
    style Step4 fill:#0072c3,stroke:#00539a,stroke-width:2px,color:#fff
    style Step6 fill:#198038,stroke:#0e6027,stroke-width:2px,color:#fff
    style End fill:#24a148,stroke:#198038,stroke-width:2px,color:#fff
```

---

## 3. Component Details & Interface Specification

| Stage | Component | Technology / File | Primary Function | Output / SLA |
| :--- | :--- | :--- | :--- | :--- |
| **Ingestion** | Db2 Data Gate CDC | `src/stream_simulator.py` | Stream real-time purchase & shipment records | Zero-leakage sanitized schema |
| **Preprocessing** | Feature Pipeline | `src/data_pipeline.py` | One-hot encodes categories & scales numericals | Transformed dense tensor |
| **Inference** | Telum MMA Models | `src/predict_risk.py` | Predicts late delivery probability & days | **1.14 ms** inference latency |
| **Detection** | Anomaly Agent | `src/agents/detection_agent.py` | Flags orders exceeding standard deviation | Status flag (`DISRUPTED`) |
| **Attribution** | Tree SHAP + Granite | `src/agents/explanation_agent.py` | Computes feature attribution & LLM explanation | Explainable risk driver bars |
| **Mitigation** | Ranking Agent | `src/agents/recommendation_agent.py` | Multi-criteria optimization ranking | Supplier candidate recommendation |
| **Execution** | z/OS Connect API | `src/server.py` (`/api/zos/execute-action`) | 2-Phase Commit transaction to Db2 for z/OS | `RC=0` (ACID committed) |
| **Audit** | Compliance Vault | `src/server.py` (`/api/compliance/audit-dossier`) | Generates tamper-proof compliance report | SHA-256 sealed audit JSON/PDF |
