# Video Signal Flow

## Overview

This document describes the complete video signal flow through the AV system, from source devices through matrix switching to display outputs.

---

## Video Signal Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         VIDEO SOURCES                               │
├───────────────┬───────────────┬───────────────┬─────────────────────┤
│  Cisco        │  Extron       │  Laptops /    │  Media              │
│  PTZ          │  ShareLink    │  Presenters   │  Players            │
│  Cameras ×4   │  ×2           │               │                     │
│  (IP/SDI)     │  (IP)         │  (HDMI)       │  (HDMI/SDI)        │
└───────┬───────┴───────┬───────┴───────┬───────┴──────────┬──────────┘
        │               │               │                  │
        ▼               ▼               ▼                  ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    EXTRON 16×16 VIDEO MATRIX                        │
│                    (Primary Routing)                                 │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  Inputs:                                                           │
│  ├── 1–4:   Cisco Cameras                                         │
│  ├── 5–6:   ShareLink Receivers                                   │
│  ├── 7–10:  Laptop / Presenter Inputs                             │
│  ├── 11–14: Media Players                                         │
│  └── 15–16: Backup / Auxiliary                                    │
│                                                                     │
│  Outputs:                                                          │
│  ├── 1–2:   To Crestron 8×8 Matrix #1                            │
│  ├── 3–4:   To Crestron 8×8 Matrix #2                            │
│  ├── 5–6:   To RGBlink Q16 (LED Wall)                            │
│  ├── 7–8:   To Matrox Recorders                                   │
│  ├── 9–10:  To Primary Displays                                   │
│  └── 11–16: To Secondary Displays / Backup                       │
│                                                                     │
└──────────┬──────────────┬──────────────┬──────────────┬────────────┘
           │              │              │              │
           ▼              ▼              ▼              ▼
┌──────────────────┐ ┌─────────────┐ ┌─────────────┐ ┌─────────────┐
│  Crestron 8×8   │ │ RGBlink Q16 │ │  Matrox     │ │  Displays   │
│  Matrix ×2      │ │ LED Proc.   │ │  Recorders  │ │  (Direct)   │
└────────┬─────────┘ └──────┬──────┘ └──────┬──────┘ └─────────────┘
         │                  │               │
         ▼                  ▼               ▼
┌──────────────────┐ ┌─────────────┐ ┌─────────────┐
│  Displays        │ │ LED Wall    │ │  Recording  │
│  (via Crestron)  │ │ 8m × 5m     │ │  Storage    │
│                  │ │ 40m²        │ │             │
└──────────────────┘ └─────────────┘ └─────────────┘
```

---

## Matrix Input Mapping

### Extron 16×16

| Input | Source | Signal Type | Resolution |
|-------|--------|-------------|------------|
| 1 | Cisco Camera 1 | IP/SDI | To be confirmed |
| 2 | Cisco Camera 2 | IP/SDI | To be confirmed |
| 3 | Cisco Camera 3 | IP/SDI | To be confirmed |
| 4 | Cisco Camera 4 | IP/SDI | To be confirmed |
| 5 | ShareLink 1 | IP/HDMI | Up to 1080p |
| 6 | ShareLink 2 | IP/HDMI | Up to 1080p |
| 7–10 | Presenter Laptops | HDMI | Variable |
| 11–14 | Media Players | HDMI/SDI | Up to 4K |
| 15–16 | Backup | HDMI | Variable |

### Extron 16×16 Output Mapping

| Output | Destination | Purpose |
|--------|-------------|---------|
| 1–2 | Crestron 8×8 #1 | Distribution |
| 3–4 | Crestron 8×8 #2 | Distribution |
| 5–6 | RGBlink Q16 | LED Wall |
| 7–8 | Matrox Recorders | Recording |
| 9–10 | Primary Displays | Main viewing |
| 11–16 | Secondary / Backup | Overflow |

---

## Crestron 8×8 Matrix Routing

### Matrix #1

| Input | Source | Output | Destination |
|-------|--------|--------|-------------|
| 1 | From Extron Out 1 | 1–4 | Room Displays |
| 2 | From Extron Out 2 | 5–8 | Confidence Monitors |
| 3–8 | Local sources | — | — |

### Matrix #2

| Input | Source | Output | Destination |
|-------|--------|--------|-------------|
| 1 | From Extron Out 3 | 1–4 | Overflow Displays |
| 2 | From Extron Out 4 | 5–8 | Recording Preview |
| 3–8 | Local sources | — | — |

---

## RGBlink Q16 Signal Path

```
Extron 16×16 Output 5–6
        │
        ▼
┌───────────────────┐
│  RGBlink Q16      │
│  LED Processor    │
├───────────────────┤
│  • Scaling        │
│  • Color correct  │
│  • Output config  │
└─────────┬─────────┘
          │
          ▼
┌───────────────────┐
│  LED Wall         │
│  8m × 5m (40m²)  │
└───────────────────┘
```

---

## ShareLink Integration

```
┌──────────────┐     ┌──────────────┐     ┌─────────────────┐
│  Laptop /    │────►│  Extron      │────►│  Video Matrix   │
│  Mobile      │  IP │  ShareLink   │ HDMI│  (Input 5–6)    │
│  Device      │     │  ×2          │     │                 │
└──────────────┘     └──────────────┘     └─────────────────┘
```

---

## Video Formats Supported

| Format | Max Resolution | Notes |
|--------|----------------|-------|
| HDMI | 4K (3840×2160) | Source dependent |
| SDI | 1080p | Camera feeds |
| IP (H.264/H.265) | 1080p | ShareLink, Cameras |
| HDBaseT | 4K | Long cable runs |

---

## File References

- [System Architecture](system-architecture.md)
- [Audio Signal Flow](audio-signal-flow.md)
- [Control Architecture](control-architecture.md)
