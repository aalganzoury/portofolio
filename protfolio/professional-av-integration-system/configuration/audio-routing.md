# Audio Routing Configuration

## Overview

This document describes the audio routing configuration through the Bose ControlSpace DSP and amplification system.

---

## Input Routing

| Input | Source | Level | Processing |
|-------|--------|-------|------------|
| 1–12 | Televic Conference | Digital | Conference DSP |
| 13–18 | Shure Wireless Mics | Wireless/RX | Gain, EQ, Comp |
| 19 | Beyerdynamic Wireless | Wireless/RX | Gain, EQ, Comp |
| 20–24 | Program Audio | Line | Level, routing |

---

## DSP Processing Configuration

### Input Processing

| Parameter | Setting |
|-----------|---------|
| Gain | Per channel, matched to source |
| Gate | Threshold to be confirmed |
| EQ | Parametric, per room tuning |
| Compressor | Ratio to be confirmed |
| Limiter | Threshold to protect amps |

### Matrix Routing

| Input | Output 1 | Output 2 | Output 3 | Output 4 |
|-------|----------|----------|----------|----------|
| 1 (Televic) | ✓ | ✓ | ✓ | — |
| 2 (Televic) | ✓ | ✓ | ✓ | — |
| ... | ... | ... | ... | ... |
| 13 (Shure) | ✓ | ✓ | — | — |
| 20 (Program) | ✓ | ✓ | — | — |

---

## Output Routing

| Output | Destination | Zone |
|--------|-------------|------|
| 1–2 | JBL Amplifier | Main coverage |
| 3–4 | Crown Amplifier | Fill/delay |
| 5–6 | Matrox Recorders | Recording feed |
| 7–8 | Televic Return | Interpretation |

---

## Speaker Zones

| Zone | Amplifier | Speakers | Coverage |
|------|-----------|----------|----------|
| 1 | JBL | Main L/R | Primary area |
| 2 | Crown | Fill | Secondary area |
| 3 | — | Delay | Far coverage |
| 4 | — | Recording | — |

---

## Level Structure

```
Mic Level (-60 to -20 dBu)
    │
    ▼
Preamp (0 to +40 dB gain)
    │
    ▼
DSP Processing (unity)
    │
    ▼
Output (-20 to +4 dBu)
    │
    ▼
Amplifier Input
    │
    ▼
Speaker Output (watts)
```

---

## Preset Configurations

### Preset: Conference

| Parameter | Setting |
|-----------|---------|
| Televic Mics | Active, floor level |
| Shure Mics | Muted |
| Program Audio | Low level |
| Speaker zones | All active |

### Preset: Presentation

| Parameter | Setting |
|-----------|---------|
| Televic Mics | Muted |
| Shure Mics | Presenter active |
| Program Audio | Active |
| Speaker zones | All active |

### Preset: Video Call

| Parameter | Setting |
|-----------|---------|
| Televic Mics | Active, reduced level |
| Shure Mics | Muted |
| Program Audio | Active |
| Speaker zones | Main only |

---

## File References

- [Audio Signal Flow](../architecture/audio-signal-flow.md)
- [Bose Equipment](../equipment/bose.md)
- [Conference System](../architecture/conference-system.md)
