# Control Logic Configuration

## Overview

This document describes the Crestron CP4 control logic and automation configuration.

---

## Control System Architecture

```
┌─────────────────────────────────────────────────┐
│           CRESTRON CONTROL LOGIC                │
├─────────────────────────────────────────────────┤
│                                                  │
│  ┌──────────────────────────────────────────┐  │
│  │  INITIALIZATION                          │  │
│  │  ├── System boot sequence                │  │
│  │  ├── Device discovery                    │  │
│  │  ├── Status polling                      │  │
│  │  └── Preset loading                      │  │
│  └──────────────────────────────────────────┘  │
│                                                  │
│  ┌──────────────────────────────────────────┐  │
│  │  EVENT HANDLING                          │  │
│  │  ├── Button press events                 │  │
│  │  ├── Source change events                │  │
│  │  ├── Device status events                │  │
│  │  └── Error events                        │  │
│  └──────────────────────────────────────────┘  │
│                                                  │
│  ┌──────────────────────────────────────────┐  │
│  │  DEVICE CONTROL                          │  │
│  │  ├── Matrix switching                    │  │
│  │  ├── Display control                     │  │
│  │  ├── Camera PTZ                          │  │
│  │  ├── Audio level                         │  │
│  │  └── Recording control                   │  │
│  └──────────────────────────────────────────┘  │
│                                                  │
└─────────────────────────────────────────────────┘
```

---

## Preset Logic

### Conference Preset

```
ON ACTIVATE:
    // Video routing
    EXTRON "ROUTE 1,9"          // Camera 1 → Display
    EXTRON "ROUTE 3,5"          // Camera 3 → LED Wall
    
    // Audio
    BOSE "SET ZONE1 LEVEL 70"
    BOSE "MUTE INPUT 13,OFF"    // Shure unmuted
    BOSE "MUTE INPUT 1,ON"     // Televic muted
    
    // Cameras
    CISCO "PRESET 1,1"         // Camera 1 → Presenter
    CISCO "PRESET 3,3"         // Camera 3 → Wide
    
    // Displays
    DISPLAY "POWER ON,ALL"
    DISPLAY "INPUT HDMI1,ALL"
    
    // Recording
    MATROX "STANDBY"
```

### Presentation Preset

```
ON ACTIVATE:
    // Video routing
    EXTRON "ROUTE 5,9"          // ShareLink → Display
    EXTRON "ROUTE 5,5"          // ShareLink → LED Wall
    
    // Audio
    BOSE "SET ZONE1 LEVEL 75"
    BOSE "MUTE INPUT 1,ON"     // Televic muted
    BOSE "MUTE INPUT 13,OFF"    // Shure unmuted
    
    // Cameras
    CISCO "PRESET 2,1"         // Camera 1 → Podium
    
    // Displays
    DISPLAY "POWER ON,ALL"
    DISPLAY "INPUT HDMI2,ALL"
    
    // Recording
    MATROX "STANDBY"
```

---

## Device Communication

### Crestron to Extron

| Command | Protocol | Port |
|---------|----------|------|
| Route | RS-232 / TCP | 23 / 4999 |
| Status Query | RS-232 / TCP | 23 / 4999 |
| Save Preset | RS-232 / TCP | 23 / 4999 |

### Crestron to Bose

| Command | Protocol | Port |
|---------|----------|------|
| Volume Set | TCP | 10024 |
| Mute Toggle | TCP | 10024 |
| Preset Recall | TCP | 10024 |

### Crestron to Cisco

| Command | Protocol | Port |
|---------|----------|------|
| PTZ Control | HTTP API | 80/443 |
| Preset Recall | HTTP API | 80/443 |
| Status Query | HTTP API | 80/443 |

### Crestron to Matrox

| Command | Protocol |
|---------|----------|
| Start Record | IP |
| Stop Record | IP |
| Status | IP |

---

## Timer Functions

| Timer | Function |
|-------|----------|
| Auto-off | Display power off after timeout |
| Status poll | Device health check interval |
| Recording auto-stop | End recording after event |

---

## Error Handling

| Error | Response |
|-------|----------|
| Device no response | Retry, alert UI |
| Matrix busy | Queue command |
| Camera offline | Skip preset, alert |
| Recording fail | Switch to backup |

---

## File References

- [Control Architecture](../architecture/control-architecture.md)
- [Crestron Equipment](../equipment/crestron.md)
