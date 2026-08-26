
---

## Checkpoint 7 – Linux Server Investigation

### System Information (collected via KillerCoda Playground)

**Operating System:**

<img width="699" height="236" alt="Screenshot 2026-08-26 11 48 02 AM" src="https://github.com/user-attachments/assets/b59eda25-e554-47c4-b124-c55c84b96138" />

**CPU Information:**

<img width="934" height="723" alt="Screenshot 2026-08-26 11 48 46 AM" src="https://github.com/user-attachments/assets/8f0d34b3-8d1e-4ec1-9aae-2f8c88b30106" />

**Memory:**

<img width="934" height="71" alt="Screenshot 2026-08-26 11 49 03 AM" src="https://github.com/user-attachments/assets/aa9d94dd-bb16-45bb-986e-c5a6f38a5ce2" />

**Disk Space:**

<img width="934" height="723" alt="Screenshot 2026-08-26 11 48 46 AM" src="https://github.com/user-attachments/assets/5ef9cacb-d525-4398-9ff7-0b7735c2895f" />

### Cloud Migration Recommendation
If this Linux server were migrated to the cloud, it could be hosted using:
- **AWS:** Amazon EC2 — a burstable instance type such as **t3.medium** (2 vCPU, 4 GB RAM) closely matches this server's specs at low cost.
- **Azure:** Azure Virtual Machines — the **B2s** or **B2ms** burstable series offers comparable 2 vCPU / 4 GB RAM configurations.
- **GCP:** Compute Engine — an **e2-medium** instance (2 vCPU, 4 GB RAM) is the equivalent cost-efficient option.

Given the modest CPU, memory, and disk footprint of this server, a small, burstable, cost-optimized instance type from any of the three providers would comfortably host this workload. Since this is a lightweight Ubuntu server with no unusual GPU or high-throughput demands, cost-efficiency (burstable/spot instances) would be the primary deciding factor rather than raw performance, making all three platforms equally viable — the final choice would likely come down to whichever ecosystem the rest of the client's infrastructure already lives in.
