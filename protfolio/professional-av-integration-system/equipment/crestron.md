# Crestron Equipment

## Crestron CP4 Control Processor

| Parameter | Details |
|-----------|---------|
| Quantity | 2 |
| Model | CP4 |
| Role | Centralized AV control |
| Status | Operational |

---

## Overview

The Crestron CP4 is the central control processor for the AV system. Two units are deployed for redundancy and distributed control.

---

## Architecture

```
┌─────────────────────┐         ┌─────────────────────┐
│   Crestron CP4 #1   │◄───────►│   Crestron CP4 #2   │
│   (Primary)         │  IP     │   (Secondary)       │
└──────────┬──────────┘         └──────────┬──────────┘
           │                               │
           └───────────────┬───────────────┘
                           │
                           ▼
                ┌─────────────────────┐
                │   Device Control    │
                │   Bus               │
                └─────────────────────┘
```

---

## Functions

### Primary Controller (CP4 #1)

- Master system control
- User interface processing
- Matrix switching control
- Preset management
- System automation

### Secondary Controller (CP4 #2)

- Redundancy / failover
- Backup control path
- Distributed processing
- Secondary UI support

---

## Controlled Devices

| Device | Control Method | Protocol |
|--------|----------------|----------|
| Extron 16×16 Matrix | RS-232 / IP | Serial / TCP |
| Crestron 8×8 Matrices | Cresnet / IP | Native |
| Bose ControlSpace | IP | TCP |
| Cisco Cameras | IP | HTTP API |
| Matrox Recorders | IP | Proprietary |
| RGBlink Q16 | RS-232 | Serial |
| Displays | RS-232 / IP | Various |
| Televic Conference | Proprietary | Conference |

---

## User Interface

The CP4 serves touch panel interfaces for:

- Room control (presets, source selection)
- Camera control (PTZ, presets)
- Audio control (volume, mute)
- Video routing (matrix switching)
- Recording control (start, stop, status)
- System status monitoring

---

## Redundancy

| Scenario | Response |
|----------|----------|
| CP4 #1 failure | CP4 #2 assumes master |
| Network failure | Local control maintained |
| UI failure | Fallback to physical controls |

---

## Configuration Notes

- Model specification to be confirmed
- Programming environment: Crestron SIMPL Windows / HTML5
- Communication: IP network + serial connections
- Power: PoE or external supply

---

## File References

- [Control Architecture](../architecture/control-architecture.md)
- [Configuration: Control Logic](../configuration/control-logic.md)
