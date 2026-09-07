# Cisco Cameras

## Overview

| Parameter | Details |
|-----------|---------|
| Quantity | 4 |
| Type | PTZ (Pan-Tilt-Zoom) |
| Role | Conference / video production |
| Status | Operational |

---

## Camera Deployment

| Camera | Position | Purpose |
|--------|----------|---------|
| Camera 1 | Front left | Presenter capture |
| Camera 2 | Front right | Presenter capture |
| Camera 3 | Rear center | Wide room shot |
| Camera 4 | Side position | Audience / alternate |

---

## Signal Flow

```
┌─────────────────────────────────────────────────┐
│              CISCO CAMERA SIGNAL FLOW           │
├─────────────────────────────────────────────────┤
│                                                  │
│  VIDEO OUTPUT                                    │
│  └──► Extron 16×16 Matrix (Inputs 1–4)         │
│                                                  │
│  CONTROL                                         │
│  └──► Crestron CP4 (PTZ, Presets)              │
│                                                  │
│  INTEGRATION                                     │
│  ├── Matrix switching to displays               │
│  ├── Recording via Matrox                        │
│  └── LED wall display                            │
│                                                  │
└─────────────────────────────────────────────────┘
```

---

## PTZ Control

| Function | Action |
|----------|--------|
| Pan | Left / Right rotation |
| Tilt | Up / Down movement |
| Zoom | In / Out lens control |
| Preset Recall | Saved positions (1–10+) |
| Auto-Track | Speaker following (if supported) |

---

## Preset Positions

| Preset | Position | Use Case |
|--------|----------|----------|
| 1 | Presenter close-up | Speaker focus |
| 2 | Podium shot | Presentation |
| 3 | Wide room | Full view |
| 4 | Audience | Reaction shots |
| 5–10 | Custom | Per event needs |

---

## Integration

| Interface | Device | Purpose |
|-----------|--------|---------|
| Video | Extron Matrix | Signal routing |
| Control | Crestron CP4 | PTZ commands |
| Recording | Matrox | Capture feed |
| Display | LED Wall / Screens | Live output |

---

## Configuration Notes

- Exact Cisco camera model to be confirmed
- Resolution / frame rate to be confirmed
- Network configuration to be confirmed
- Preset positions to be confirmed per installation

---

## File References

- [Video Signal Flow](../architecture/video-signal-flow.md)
- [Control Architecture](../architecture/control-architecture.md)
- [Configuration: Camera Control](../configuration/camera-control.md)
