# Recording Workflow

## Overview

This document describes the video and audio recording workflow using the Matrox recording system.

---

## Recording Architecture

```
┌─────────────────────────────────────────────────────────────────────────┐
│                         VIDEO SOURCES                                   │
├───────────────┬───────────────┬───────────────┬─────────────────────────┤
│  Cisco        │  ShareLink    │  Media        │  Televic                │
│  Cameras      │  (BYOD)       │  Players      │  Conference Audio       │
│  ×4           │  ×2           │               │                         │
└───────┬───────┴───────┬───────┴───────┬───────┴────────────┬────────────┘
        │               │               │                    │
        ▼               ▼               ▼                    │
┌───────────────────────────────────────────────────┐       │
│              EXTRON 16×16 MATRIX                  │       │
│              (Source Selection)                    │       │
└───────────────────────────┬───────────────────────┘       │
                            │                               │
                    ┌───────┴───────┐                       │
                    ▼               ▼                       │
            ┌──────────────┐ ┌──────────────┐              │
            │   Output 7   │ │   Output 8   │              │
            │   (Matrox 1) │ │   (Matrox 2) │              │
            └──────┬───────┘ └──────┬───────┘              │
                   │                │                       │
                   ▼                ▼                       ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                      MATROX RECORDING SYSTEM                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌───────────────────────┐         ┌───────────────────────┐           │
│  │    Matrox Recorder 1  │         │    Matrox Recorder 2  │           │
│  │    (Primary)          │         │    (Backup)           │           │
│  │                       │         │                       │           │
│  │  • Video capture      │         │  • Redundant record   │           │
│  │  • Encoding           │         │  • Backup capture     │           │
│  │  • Storage            │         │  • Alternative angle  │           │
│  └───────────┬───────────┘         └───────────┬───────────┘           │
│              │                                 │                       │
│              ▼                                 ▼                       │
│  ┌───────────────────────┐         ┌───────────────────────┐           │
│  │  Local Storage        │         │  Network Storage      │           │
│  │  (SSD/HDD)            │         │  (NAS/SAN)            │           │
│  └───────────────────────┘         └───────────────────────┘           │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Recording Signal Flow

### Video Recording Path
```
Video Source → Matrix Selection → Matrox Input → Encode → Storage
```

### Audio Recording Path
```
Audio Source (Bose/Televic) → Matrox Audio Input → Mux with Video → Storage
```

### Combined Recording Path
```
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│  Video       │────►│  Matrox      │────►│  Recording   │
│  (HDMI/SDI)  │     │  Recorder    │     │  File        │
└──────────────┘     ├──────────────┤     └──────────────┘
                     │  Audio       │
┌──────────────┐     │  (Analog/    │
│  Audio       │────►│   Digital)   │
│  (from DSP)  │     └──────────────┘
└──────────────┘
```

---

## Recording Modes

| Mode | Description | Use Case |
|------|-------------|----------|
| Continuous | Always recording | All meetings |
| Scheduled | Timer-based start/stop | Planned events |
| Triggered | Event-activated | On-demand |
| Dual-Stream | Two simultaneous recordings | Redundancy |

---

## Storage Management

| Parameter | Consideration |
|-----------|---------------|
| File Format | To be confirmed |
| Compression | To be confirmed |
| Retention | Client policy dependent |
| Backup | Network storage copy |
| Archival | Long-term storage plan |

---

## Integration Points

| Interface | From | To | Purpose |
|-----------|------|-----|---------|
| Video Input | Extron Matrix Out 7 | Matrox 1 | Primary video |
| Video Input | Extron Matrix Out 8 | Matrox 2 | Backup video |
| Audio Input | Bose ControlSpace | Matrox | Conference audio |
| Control | Crestron CP4 | Matrox | Start/stop/Status |
| Storage | Matrox | NAS/File Server | Recording archive |

---

## Recording Workflow

```
1. Pre-Meeting
   ├── Verify storage available
   ├── Check Matrox status
   └── Set recording source

2. Meeting Start
   ├── Trigger recording (manual/auto)
   ├── Monitor recording status
   └── Verify audio/video quality

3. During Meeting
   ├── Monitor storage space
   ├── Check recording integrity
   └── Handle source switching if needed

4. Meeting End
   ├── Stop recording
   ├── Verify file integrity
   └── Archive to network storage

5. Post-Meeting
   ├── Transfer to long-term storage
   ├── Verify backup copy
   └── Update recording log
```

---

## File References

- [System Architecture](system-architecture.md)
- [Video Signal Flow](video-signal-flow.md)
- [Audio Signal Flow](audio-signal-flow.md)
- [Configuration: Recording](../configuration/recording.md)
