# Matrox Recording System

## Overview

| Parameter | Details |
|-----------|---------|
| Quantity | 2 |
| Role | Video/audio recording |
| Status | Operational |

---

## Recording Units

### Matrox Recorder 1 (Primary)

| Parameter | Details |
|-----------|---------|
| Role | Primary recording |
| Input | Extron Matrix Output 7 |
| Storage | Local + Network |

### Matrox Recorder 2 (Backup)

| Parameter | Details |
|-----------|---------|
| Role | Backup recording |
| Input | Extron Matrix Output 8 |
| Storage | Local + Network |

---

## Signal Flow

```
┌─────────────────────────────────────────────────┐
│              MATROX RECORDING FLOW              │
├─────────────────────────────────────────────────┤
│                                                  │
│  VIDEO INPUT                                     │
│  └── Extron 16×16 Matrix Output 7/8            │
│                                                  │
│  AUDIO INPUT                                     │
│  └── Bose ControlSpace Output                   │
│                                                  │
│  RECORDING PROCESS                               │
│  ├── Video encoding                              │
│  ├── Audio encoding                              │
│  ├── Mux (combine A/V)                          │
│  └── File writing                                │
│                                                  │
│  STORAGE                                         │
│  ├── Local (SSD/HDD)                            │
│  └── Network (NAS/SAN)                          │
│                                                  │
└─────────────────────────────────────────────────┘
```

---

## Recording Modes

| Mode | Description |
|------|-------------|
| Continuous | Always recording during events |
| Scheduled | Timer-based start/stop |
| Triggered | Event-activated |
| Dual-Stream | Two simultaneous recordings |

---

## Integration

| Interface | From | To |
|-----------|------|-----|
| Video | Extron Matrix | Matrox Input |
| Audio | Bose ControlSpace | Matrox Input |
| Control | Crestron CP4 | Start/Stop/Status |
| Storage | Matrox | NAS/File Server |

---

## Configuration Notes

- Exact Matrox model to be confirmed
- Recording format to be confirmed
- Storage capacity to be confirmed
- Network storage path to be confirmed

---

## File References

- [Recording Workflow](../architecture/recording-workflow.md)
- [Configuration: Recording](../configuration/recording.md)
