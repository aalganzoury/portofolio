# Camera Control Configuration

## Overview

This document describes the Cisco PTZ camera control configuration via the Crestron control system.

---

## Camera Assignment

| Camera | Position | Preset 1 | Preset 2 | Preset 3 |
|--------|----------|----------|----------|----------|
| Cam 1 | Front left | Presenter | Podium | Wide |
| Cam 2 | Front right | Co-presenter | Panel | Wide |
| Cam 3 | Rear center | Wide room | Stage | Audience |
| Cam 4 | Side | Audience | Alternate | Close-up |

---

## PTZ Control Mapping

### Pan/Tilt

| Direction | Command | Range |
|-----------|---------|-------|
| Left | PAN LEFT | 0–180° |
| Right | PAN RIGHT | 0–180° |
| Up | TILT UP | 0–90° |
| Down | TILT DOWN | 0–90° |

### Zoom

| Direction | Command | Range |
|-----------|---------|-------|
| In | ZOOM IN | 1x–20x (model dependent) |
| Out | ZOOM OUT | 1x–20x |

---

## Preset Positions

### Camera 1 Presets

| Preset | Pan | Tilt | Zoom | Use Case |
|--------|-----|------|------|----------|
| 1 | To be confirmed | To be confirmed | To be confirmed | Presenter close-up |
| 2 | To be confirmed | To be confirmed | To be confirmed | Podium shot |
| 3 | To be confirmed | To be confirmed | To be confirmed | Wide shot |
| 4 | To be confirmed | To be confirmed | To be confirmed | Audience |

### Camera 3 Presets

| Preset | Pan | Tilt | Zoom | Use Case |
|--------|-----|------|------|----------|
| 1 | To be confirmed | To be confirmed | To be confirmed | Full room |
| 2 | To be confirmed | To be confirmed | To be confirmed | Stage area |
| 3 | To be confirmed | To be confirmed | To be confirmed | Audience section |

---

## Control Interface

### From Crestron CP4

| Function | Protocol | Method |
|----------|----------|--------|
| Pan/Tilt | HTTP API | REST call |
| Zoom | HTTP API | REST call |
| Preset Recall | HTTP API | REST call |
| Status Query | HTTP API | REST call |

### API Endpoints (Reference)

| Endpoint | Method | Purpose |
|----------|--------|---------|
| /ptz/pan | POST | Pan control |
| /ptz/tilt | POST | Tilt control |
| /ptz/zoom | POST | Zoom control |
| /preset/recall | POST | Preset recall |
| /status | GET | Camera status |

---

## Integration with Video System

```
Crestron CP4 ──► Cisco Camera ──► Video Output ──► Extron Matrix
                    │                                     │
                    └── PTZ Control                       ├──► Displays
                                                          └──► Recording
```

---

## Preset Macros

### Conference Preset Macro

```
CAMERA 1: Preset 1 (Presenter)
CAMERA 2: Preset 4 (Panel)  
CAMERA 3: Preset 1 (Wide)
CAMERA 4: Preset 2 (Audience)
```

### Presentation Preset Macro

```
CAMERA 1: Preset 2 (Podium)
CAMERA 3: Preset 1 (Wide)
```

---

## File References

- [Control Architecture](../architecture/control-architecture.md)
- [Cisco Equipment](../equipment/cisco.md)
- [Video Signal Flow](../architecture/video-signal-flow.md)
