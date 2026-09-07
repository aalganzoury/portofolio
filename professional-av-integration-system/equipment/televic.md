# Televic Conference System

## Overview

| Parameter | Details |
|-----------|---------|
| Type | Conference Microphone & Interpretation System |
| Role | Mic management, interpretation, translation |
| Status | Operational |

---

## System Components

### Microphone Units

| Type | Features |
|------|----------|
| Delegate Units | Gooseneck mic, speaker, channel select |
| Chairman Units | Priority override, voting capability |
| Interpreter Units | Headset mic, language monitoring |

### Central Unit

| Function | Description |
|----------|-------------|
| Mic Management | On/off, priority, queue |
| Audio Routing | Floor, language, recording |
| Interpretation | Multi-language translation |
| Voting | Motion voting (if equipped) |

---

## System Architecture

```
┌─────────────────────────────────────────────────────┐
│              TELEVIC CONFERENCE SYSTEM              │
├─────────────────────────────────────────────────────┤
│                                                     │
│  ┌─────────┐  ┌─────────┐  ┌─────────┐           │
│  │Delegate │  │Delegate │  │Chairman │           │
│  │Unit 1   │  │Unit 2   │  │Unit     │           │
│  └────┬────┘  └────┬────┘  └────┬────┘           │
│       │            │            │                  │
│       └────────────┼────────────┘                  │
│                    │                               │
│                    ▼                               │
│  ┌─────────────────────────────────────────────┐  │
│  │           Televic Central Unit              │  │
│  ├─────────────────────────────────────────────┤  │
│  │  • Microphone management                   │  │
│  │  • Audio routing                           │  │
│  │  • Interpretation engine                   │  │
│  │  • Language distribution                   │  │
│  └──────────────────┬──────────────────────────┘  │
│                     │                              │
└─────────────────────┼──────────────────────────────┘
                      │
          ┌───────────┼───────────┐
          ▼           ▼           ▼
   ┌───────────┐ ┌───────────┐ ┌───────────┐
   │Bose DSP   │ │Matrox     │ │Wireless   │
   │(Audio)    │ │(Record)   │ │(Interp.)  │
   └───────────┘ └───────────┘ └───────────┘
```

---

## Interpretation Flow

```
Floor Audio → Interpreter Booth → Language Channel → Delegate Headphones
```

### Language Distribution

| Channel | Language |
|---------|----------|
| 1 | Floor (Original) |
| 2 | Language A (To be confirmed) |
| 3 | Language B (To be confirmed) |
| N | Language N (Scalable) |

---

## Integration Points

| Interface | Connection |
|-----------|------------|
| Audio Output | Bose ControlSpace |
| Recording | Matrox Recorders |
| Control | Crestron CP4 |
| Wireless | Interpretation receivers |

---

## Conference Modes

| Mode | Description |
|------|-------------|
| Open Mic | All delegate mics active |
| Request-to-Speak | Approval required |
| Chairman Override | Priority control |
| Voting | Motion voting |
| Interview | Single mic active |

---

## Configuration Notes

- Exact Televic model to be confirmed
- Number of delegate units to be confirmed
- Number of interpretation channels to be confirmed
- Language assignments to be confirmed

---

## File References

- [Conference System Architecture](../architecture/conference-system.md)
- [Audio Signal Flow](../architecture/audio-signal-flow.md)
