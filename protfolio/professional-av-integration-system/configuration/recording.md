# Recording Configuration

## Overview

This document describes the Matrox recording system configuration and workflow.

---

## Recording System Setup

### Matrox Recorder 1 (Primary)

| Parameter | Configuration |
|-----------|---------------|
| Input Source | Extron Matrix Output 7 |
| Recording Mode | Continuous / Triggered |
| Storage | Local + Network |
| Status | Operational |

### Matrox Recorder 2 (Backup)

| Parameter | Configuration |
|-----------|---------------|
| Input Source | Extron Matrix Output 8 |
| Recording Mode | Mirror of Recorder 1 |
| Storage | Local + Network |
| Status | Operational |

---

## Recording Signal Flow

```
Video Source → Extron Matrix → Matrox Input → Encode → File → Storage
                                                       │
Audio Source → Bose DSP ──────────────────────────────►┘
```

---

## Recording Modes

### Continuous Mode

| Parameter | Value |
|-----------|-------|
| Start | System power on |
| Stop | System power off |
| File Split | Per event or time-based |
| Use Case | All-day recording |

### Triggered Mode

| Parameter | Value |
|-----------|-------|
| Start | Manual or Crestron trigger |
| Stop | Manual or timer |
| File Split | Per trigger |
| Use Case | On-demand recording |

### Scheduled Mode

| Parameter | Value |
|-----------|-------|
| Start | Pre-programmed time |
| Stop | Pre-programmed time |
| File Split | Per schedule |
| Use Case | Recurring events |

---

## File Management

### Naming Convention

```
[Date]_[Time]_[Source]_[Event].[ext]
Example: 20260907_1400_CAM1_Conference.mp4
```

### Storage Structure

```
/recordings
├── /2026
│   ├── /09
│   │   ├── /07
│   │   │   ├── 20260907_1400_CAM1_Conference.mp4
│   │   │   ├── 20260907_1400_CAM3_Backup.mp4
│   │   │   └── ...
│   │   └── ...
│   └── ...
└── /archive
```

---

## Recording Presets

### Conference Recording

| Setting | Value |
|---------|-------|
| Video Source | Camera 1 (Presenter) |
| Audio Source | Bose DSP Output |
| Quality | To be confirmed |
| Format | To be confirmed |

### Multi-Camera Recording

| Setting | Value |
|---------|-------|
| Video Source 1 | Camera 1 |
| Video Source 2 | Camera 3 |
| Audio Source | Bose DSP Output |
| Quality | To be confirmed |
| Format | To be confirmed |

---

## Storage Management

| Parameter | Consideration |
|-----------|---------------|
| Capacity | Per event size × retention |
| Backup | Network copy |
| Archive | Long-term storage |
| Purge | Auto-delete after retention |

---

## Integration with Control System

### Crestron Control Commands

| Command | Action |
|---------|--------|
| RECORD START | Begin recording |
| RECORD STOP | End recording |
| RECORD STATUS | Query status |
| RECORD SOURCE | Change source |

### Status Monitoring

| Parameter | Monitoring |
|-----------|------------|
| Recording State | Active / Stopped / Error |
| Storage Space | Available capacity |
| File Size | Current recording |
| Duration | Elapsed time |

---

## File References

- [Recording Workflow](../architecture/recording-workflow.md)
- [Matrox Equipment](../equipment/matrox.md)
- [Control Architecture](../architecture/control-architecture.md)
