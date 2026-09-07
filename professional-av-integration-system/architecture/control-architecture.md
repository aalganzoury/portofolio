# Control Architecture

## Overview

This document describes the centralized AV control system architecture using Crestron CP4 controllers.

---

## Control System Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    CRESTRON CONTROL SYSTEM                              │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌─────────────────────┐         ┌─────────────────────┐              │
│  │   Crestron CP4 #1   │◄───────►│   Crestron CP4 #2   │              │
│  │   (Primary)         │  IP     │   (Secondary)       │              │
│  │                     │  Sync   │                     │              │
│  │  • Master control   │         │  • Backup control   │              │
│  │  • UI processing    │         │  • Redundancy       │              │
│  │  • Logic engine     │         │  • Failover         │              │
│  └──────────┬──────────┘         └──────────┬──────────┘              │
│             │                                │                         │
│             └──────────────┬─────────────────┘                         │
│                            │                                           │
└────────────────────────────┼───────────────────────────────────────────┘
                             │
                             ▼
┌─────────────────────────────────────────────────────────────────────────┐
│                      DEVICE CONTROL BUS                                 │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                 │
│  │   Extron     │  │   Crestron   │  │   Bose       │                 │
│  │   16×16      │  │   8×8 ×2     │  │   ControlSp. │                 │
│  │   Matrix     │  │   Matrices   │  │   DSP        │                 │
│  └──────────────┘  └──────────────┘  └──────────────┘                 │
│                                                                         │
│  ┌──────────────┐  ┌──────────────┐  ┌──────────────┐                 │
│  │   Cisco      │  │   Matrox     │  │   RGBlink    │                 │
│  │   Cameras    │  │   Recorders  │  │   Q16        │                 │
│  │   ×4         │  │   ×2         │  │              │                 │
│  └──────────────┘  └──────────────┘  └──────────────┘                 │
│                                                                         │
│  ┌──────────────┐  ┌──────────────┐                                   │
│  │   Displays   │  │   Televic    │                                   │
│  │   (on/off,   │  │   Conference │                                   │
│  │    input)    │  │              │                                   │
│  └──────────────┘  └──────────────┘                                   │
│                                                                         │
└─────────────────────────────────────────────────────────────────────────┘
```

---

## Control Functions

### Matrix Switching Control

| Function | Source | Destination | Method |
|----------|--------|-------------|--------|
| Route Camera 1 to LED Wall | Cisco Cam 1 | RGBlink Q16 | Extron Matrix |
| Route Presentation to Display | ShareLink | Crestron 8×8 | Extron Matrix |
| Route Camera to Recording | Cisco Cam 1 | Matrox | Extron Matrix |
| Full room preset | All sources | All displays | Macro |

### Display Control

| Function | Action |
|----------|--------|
| Power On/Off | RS-232 / IP command |
| Input Select | Switch to designated input |
| Volume Control | Audio level adjustment |
| Mute | Audio mute toggle |
| Preset Recall | Load display configuration |

### Camera Control (PTZ)

| Function | Action |
|----------|--------|
| Pan | Left / Right movement |
| Tilt | Up / Down movement |
| Zoom | In / Out |
| Preset Recall | Saved positions (1–10+) |
| Auto-Track | Following speaker (if supported) |

### Audio Control

| Function | Action |
|----------|--------|
| Volume | Master and zone levels |
| Mute | Per-zone and master mute |
| Source Select | Choose audio input |
| Preset | Recall audio configuration |

### Recording Control

| Function | Action |
|----------|--------|
| Start | Begin recording |
| Stop | End recording |
| Source Select | Choose recording source |
| Status | Monitor recording state |

---

## User Interface

### Touch Panel Layout

```
┌─────────────────────────────────────────┐
│  AV CONTROL SYSTEM                      │
│  ─────────────────────────────────────  │
│                                         │
│  ┌─────────┐  ┌─────────┐  ┌────────┐ │
│  │  ROOM   │  │ CAMERA  │  │ AUDIO  │ │
│  │ CONTROL │  │ CONTROL │  │ CONTROL│ │
│  └─────────┘  └─────────┘  └────────┘ │
│                                         │
│  ┌─────────┐  ┌─────────┐  ┌────────┐ │
│  │  VIDEO  │  │ RECORD  │  │ SYSTEM │ │
│  │ ROUTING │  │ CONTROL │  │ STATUS │ │
│  └─────────┘  └─────────┘  └────────┘ │
│                                         │
│  ┌─────────────────────────────────┐   │
│  │         QUICK PRESETS           │   │
│  │  [Conference] [Presentation]    │   │
│  │  [Meeting]    [Video Call]      │   │
│  └─────────────────────────────────┘   │
│                                         │
└─────────────────────────────────────────┘
```

### Preset Definitions

| Preset | Camera | Audio | Display | Recording |
|--------|--------|-------|---------|-----------|
| Conference | Presenter cam | Floor mics | Main LED | Standby |
| Presentation | Wide shot | Program | Main LED | Ready |
| Meeting | Auto-framing | Conference | Displays | Ready |
| Video Call | Speaker cam | Headset | Display | Recording |

---

## Communication Protocols

| Device | Protocol | Port | Notes |
|--------|----------|------|-------|
| Extron Matrix | RS-232 / IP | 23 / 4999 | Serial or TCP |
| Crestron Matrix | Cresnet / IP | — | Native protocol |
| Bose ControlSpace | IP | 10024 | TCP/UDP |
| Cisco Cameras | IP (HTTP API) | 80 / 443 | REST API |
| Matrox Recorders | IP | — | Proprietary |
| RGBlink Q16 | RS-232 / IP | — | Serial or TCP |
| Displays | RS-232 / IP | — | Manufacturer dependent |
| Televic | Proprietary | — | Conference protocol |

---

## Failover Behavior

| Failure | Response |
|---------|----------|
| CP4 #1 failure | CP4 #2 assumes master control |
| Matrix failure | Last state maintained |
| Camera failure | Preset skip to next camera |
| DSP failure | Bypass mode (if supported) |
| Display failure | Status alert on UI |

---

## File References

- [System Architecture](system-architecture.md)
- [Video Signal Flow](video-signal-flow.md)
- [Audio Signal Flow](audio-signal-flow.md)
- [Configuration: Control Logic](../configuration/control-logic.md)
