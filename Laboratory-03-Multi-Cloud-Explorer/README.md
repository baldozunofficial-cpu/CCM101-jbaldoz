
---

## Checkpoint 7 – Linux Server Investigation

### System Information (collected via KillerCoda Playground)

**Operating System:**

**CPU Information:**

**Memory:**

**Disk Space:**

### Cloud Migration Recommendation
If this Linux server were migrated to the cloud, it could be hosted using:
- **AWS:** Amazon EC2 — a burstable instance type such as **t3.medium** (2 vCPU, 4 GB RAM) closely matches this server's specs at low cost.
- **Azure:** Azure Virtual Machines — the **B2s** or **B2ms** burstable series offers comparable 2 vCPU / 4 GB RAM configurations.
- **GCP:** Compute Engine — an **e2-medium** instance (2 vCPU, 4 GB RAM) is the equivalent cost-efficient option.

Given the modest CPU, memory, and disk footprint of this server, a small, burstable, cost-optimized instance type from any of the three providers would comfortably host this workload. Since this is a lightweight Ubuntu server with no unusual GPU or high-throughput demands, cost-efficiency (burstable/spot instances) would be the primary deciding factor rather than raw performance, making all three platforms equally viable — the final choice would likely come down to whichever ecosystem the rest of the client's infrastructure already lives in.
