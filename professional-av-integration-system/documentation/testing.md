# Testing & Commissioning

## Overview

This document describes the testing and commissioning process for the AV system.

---

## Testing Phases

### Phase 1: Individual Device Testing

| Device | Test | Pass Criteria |
|--------|------|---------------|
| Extron Matrix | Route all I/O | All routes verified |
| Crestron Matrices | Route all I/O | All routes verified |
| Crestron CP4 | Control all devices | All devices respond |
| Bose ControlSpace | Audio processing | Clean audio output |
| Amplifiers | Power output | Correct levels |
| Speakers | Audio output | All speakers functional |
| Televic System | Mic management | All mics operational |
| Cisco Cameras | PTZ control | All cameras respond |
| Matrox Recorders | Recording | Files created correctly |
| RGBlink Q16 | LED processing | LED wall displays |
| ShareLink | Wireless connect | Devices connect |
| Displays | Power/input | All displays functional |

### Phase 2: Subsystem Integration

| Subsystem | Test | Pass Criteria |
|-----------|------|---------------|
| Video routing | Matrix switching | All routes work |
| Audio processing | DSP chain | Clean audio chain |
| Control system | Preset recall | All presets work |
| Conference system | Mic + interpret | Full function |
| Recording system | Capture + storage | Files created |
| Camera system | PTZ + video | All cameras work |

### Phase 3: Full System Integration

| Test | Description | Pass Criteria |
|------|-------------|---------------|
| End-to-end video | Source → Display | Complete path |
| End-to-end audio | Mic → Speaker | Complete path |
| Preset operation | All presets | Correct behavior |
| Recording workflow | Full record | Files correct |
| Conference workflow | Full conference | All features work |
| Failover test | Redundancy | Backup works |

---

## Test Procedures

### Video Test

```
1. Connect source to matrix input
2. Route to each output
3. Verify display shows correct source
4. Check resolution, color, artifacts
5. Repeat for all inputs/outputs
```

### Audio Test

```
1. Connect mic to system
2. Verify signal through DSP
3. Check amplifier output
4. Verify speaker output
5. Check levels, EQ, dynamics
6. Repeat for all audio paths
```

### Control Test

```
1. Access touch panel
2. Test all button functions
3. Verify preset recall
4. Check device responses
5. Test all camera PTZ
6. Verify recording control
```

---

## Commissioning Checklist

### Pre-Commissioning

| Item | Verified |
|------|----------|
| All devices powered | □ |
| All cables connected | □ |
| All devices configured | □ |
| All routing set | □ |
| All presets created | □ |

### Commissioning

| Item | Verified |
|------|----------|
| Video quality verified | □ |
| Audio quality verified | □ |
| Control response verified | □ |
| Camera PTZ verified | □ |
| Recording verified | □ |
| LED wall verified | □ |
| Conference system verified | □ |
| Wireless presentation verified | □ |

### Sign-Off

| Item | Verified |
|------|----------|
| Client walkthrough | □ |
| All issues resolved | □ |
| Documentation complete | □ |
| Training provided | □ |
| Client approval | □ |

---

## Performance Metrics

| Metric | Target |
|--------|--------|
| Video switching time | < 2 seconds |
| Audio latency | < 50ms |
| Camera PTZ response | < 1 second |
| Preset recall time | < 3 seconds |
| Recording start time | < 5 seconds |

---

## File References

- [Installation Guide](installation.md)
- [Maintenance](maintenance.md)
- [System Architecture](../architecture/system-architecture.md)
