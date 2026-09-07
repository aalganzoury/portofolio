# Bose ControlSpace

## Overview

| Parameter | Details |
|-----------|---------|
| Type | Audio DSP Processor |
| Role | Audio signal processing and routing |
| Status | Operational |

---

## Functions

| Function | Description |
|----------|-------------|
| Input Processing | Gain, EQ, dynamics |
| Audio Routing | Matrix mixing |
| DSP | Feedback suppression, noise gating |
| Output Control | Level management |
| Integration | Conference system interface |

---

## Signal Flow

```
┌─────────────────────────────────────────────────┐
│              BOSE CONTROLSPACE                   │
├─────────────────────────────────────────────────┤
│                                                  │
│  INPUTS                                          │
│  ├── Televic Conference Audio                    │
│  ├── Shure Microphones                           │
│  ├── Beyerdynamic Microphone                     │
│  └── Program Audio                               │
│                                                  │
│  DSP PROCESSING                                  │
│  ├── Gain Staging                                │
│  ├── Parametric EQ                               │
│  ├── Compression / Limiting                      │
│  ├── Feedback Suppression                        │
│  ├── Noise Gating                                │
│  └── Matrix Routing                              │
│                                                  │
│  OUTPUTS                                         │
│  ├── JBL Amplifier                               │
│  ├── Crown Amplifier                             │
│  ├── Matrox Recorders (Audio Feed)               │
│  └── Interpretation Return                        │
│                                                  │
└─────────────────────────────────────────────────┘
```

---

## Processing Chain

```
Input → Gain → Gate → EQ → Compressor → Limiter → Matrix → Output
```

---

## Input Configuration

| Input | Source | Level |
|-------|--------|-------|
| 1–12 | Televic Conference | Digital |
| 13–18 | Shure Mics | Mic/Line |
| 19 | Beyerdynamic Mic | Mic/Line |
| 20–24 | Program Audio | Line |

---

## Output Configuration

| Output | Destination | Purpose |
|--------|-------------|---------|
| 1–2 | JBL Amplifier | Main speakers |
| 3–4 | Crown Amplifier | Fill/delay speakers |
| 5–6 | Matrox Recorders | Recording feed |
| 7–8 | Televic Return | Interpretation audio |

---

## Integration

| Interface | Device | Protocol |
|-----------|--------|----------|
| Audio I/O | Televic Conference | Analog/Digital |
| Audio I/O | Amplifiers | Analog |
| Control | Crestron CP4 | IP |
| Recording | Matrox | Audio feed |

---

## Configuration Notes

- Exact Bose ControlSpace model to be confirmed
- DSP configuration to be confirmed
- EQ settings to be confirmed per room acoustics
- Network configuration to be confirmed

---

## File References

- [Audio Signal Flow](../architecture/audio-signal-flow.md)
- [Configuration: Audio Routing](../configuration/audio-routing.md)
