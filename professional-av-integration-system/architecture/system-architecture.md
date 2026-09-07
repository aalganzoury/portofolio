# System Architecture

## Overview

This document describes the high-level architecture of the large-scale AV integration system, showing how all components interconnect to form a complete professional AV environment.

---

## Architecture Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                           AV SOURCES                                    │
├──────────────┬──────────────┬──────────────┬───────────────────────────┤
│  Televic     │  Shure       │  Beyer       │  Cisco                    │
│  Conference  │  Handheld    │  Handheld    │  PTZ                      │
│  Mics        │  Mics ×6     │  Mic ×1      │  Cameras ×4               │
├──────────────┼──────────────┼──────────────┼───────────────────────────┤
│  Extron      │  Laptops /   │  Media       │  Other                    │
│  ShareLink   │  Presenters  │  Players     │  Sources                  │
│  ×2          │              │              │                           │
└──────┬───────┴──────┬───────┴──────┬───────┴────────────┬──────────────┘
       │              │              │                     │
       ▼              ▼              ▼                     ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                      CONTROL & ROUTING LAYER                           │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────────┐    ┌──────────────────┐    ┌──────────────────┐      │
│  │  Crestron    │    │  Extron 16×16    │    │  Crestron 8×8   │      │
│  │  CP4  #1     │◄──►│  Video Matrix    │◄──►│  Video Matrix ×2│      │
│  │  (Primary)   │    │  (Primary)       │    │  (Secondary)    │      │
│  └──────┬───────┘    └────────┬─────────┘    └────────┬─────────┘      │
│         │                     │                       │                 │
│  ┌──────┴───────┐             │                       │                 │
│  │  Crestron    │             │                       │                 │
│  │  CP4  #2     │◄────────────┼───────────────────────┘                 │
│  │  (Secondary) │             │                                         │
│  └──────────────┘             │                                         │
└───────────────────────────────┼─────────────────────────────────────────┘
                                │
            ┌───────────────────┼───────────────────┐
            │                   │                   │
            ▼                   ▼                   ▼
┌───────────────────┐ ┌───────────────────┐ ┌───────────────────────┐
│  AUDIO PROCESSING │ │ VIDEO PROCESSING  │ │ CONFERENCE SYSTEM     │
│                   │ │                   │ │                       │
│  Bose             │ │  RGBlink Q16      │ │  Televic Conference   │
│  ControlSpace     │ │  LED Processor    │ │  System               │
│                   │ │                   │ │                       │
│  JBL Amplifier    │ │  Matrox Recorder  │ │  • Mic Management     │
│  Crown Amplifier  │ │  ×2               │ │  • Interpretation     │
│                   │ │                   │ │  • Translation        │
└─────────┬─────────┘ └─────────┬─────────┘ └─────────────┬───────────┘
          │                     │                         │
          ▼                     ▼                         ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                           OUTPUTS                                        │
├──────────────┬──────────────┬──────────────┬───────────────────────────┤
│  LED Wall    │  Displays    │  Speakers    │  Recording                │
│  8m × 5m     │  (various)  │  (distributed)│  Storage                  │
│  40m²        │              │              │                           │
└──────────────┴──────────────┴──────────────┴───────────────────────────┘
```

---

## Layer Description

### 1. Source Layer

All input devices that generate audio, video, or control signals.

| Source Type | Equipment | Signal |
|-------------|-----------|--------|
| Conference Microphones | Televic | Audio + Control |
| Handheld Microphones | Shure ×6, Beyerdynamic ×1 | Audio (Wireless) |
| PTZ Cameras | Cisco ×4 | Video (IP/SDI) |
| Wireless Presentation | Extron ShareLink ×2 | Video (IP) |
| External Sources | Laptops, Media Players | Video + Audio |

### 2. Control & Routing Layer

Centralized control and signal distribution.

| Component | Role | Quantity |
|-----------|------|----------|
| Crestron CP4 | Centralized system control | 2 |
| Extron 16×16 Matrix | Primary video routing | 1 |
| Crestron 8×8 Matrix | Secondary video routing | 2 |

### 3. Processing Layer

Audio DSP, video processing, and conference management.

| Component | Role |
|-----------|------|
| Bose ControlSpace | Audio DSP and routing |
| RGBlink Q16 | LED wall signal processing |
| Televic Conference | Mic management, interpretation |
| Matrox Recorders | Video capture and recording |

### 4. Output Layer

All destination devices.

| Output | Equipment |
|--------|-----------|
| LED Display | 8m × 5m wall (40m²) |
| Speakers | Distributed audio |
| Recording | Matrox capture to storage |
| Displays | Various presentation displays |

---

## Signal Flow Summary

### Video Flow
```
Sources → Extron 16×16 → Crestron 8×8 → Displays
                             │
                             ├──→ RGBlink Q16 → LED Wall
                             │
                             └──→ Matrox → Recording
```

### Audio Flow
```
Microphones → Televic Conference → Bose ControlSpace → Amplifiers → Speakers
                    │
                    └──→ Interpretation Channels
```

### Control Flow
```
Crestron CP4 #1 ◄──► Crestron CP4 #2
        │
        ├──→ Matrix Control
        ├──→ Display Control
        ├──→ Camera Control (PTZ)
        ├──→ Audio Control
        └──→ Recording Control
```

---

## Redundancy

The system includes redundancy in critical areas:

- **Control**: Dual Crestron CP4 controllers
- **Video Routing**: Multiple matrix switchers
- **Recording**: Dual Matrox recorders

---

## Network Considerations

| Traffic Type | Priority | Protocol |
|-------------|----------|----------|
| Crestron Control | High | Cresnet/IP |
| Camera Video | High | IP/SDI |
| ShareLink | Medium | IP |
| Recording | Medium | IP |
| General AV | Standard | Various |

---

## File References

- [Audio Signal Flow](audio-signal-flow.md)
- [Video Signal Flow](video-signal-flow.md)
- [Control Architecture](control-architecture.md)
- [Conference System](conference-system.md)
- [Recording Workflow](recording-workflow.md)
