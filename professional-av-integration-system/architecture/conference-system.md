# Conference System Architecture

## Overview

This document describes the Televic conference microphone and interpretation/translation system and its integration with the overall AV system.

---

## Conference System Diagram

```
┌─────────────────────────────────────────────────────────────────────────┐
│                    TELEVIC CONFERENCE SYSTEM                            │
├─────────────────────────────────────────────────────────────────────────┤
│                                                                         │
│  ┌───────────────────────────────────────────────────────────────────┐ │
│  │                    MICROPHONE UNITS                               │ │
│  ├───────────────────┬───────────────────┬───────────────────────────┤ │
│  │  Delegate Units   │  Chairman Units   │  Interpreter Units        │ │
│  │  (Table-mount)    │  (Priority)       │  (Booth)                  │ │
│  │                   │                   │                           │ │
│  │  • Gooseneck mic  │  • Gooseneck mic  │  • Headset mic            │ │
│  │  • Speaker        │  • Speaker        │  • Headphone out          │ │
│  │  • Channel select │  • Priority btn   │  • Channel select         │ │
│  │  • Request-to-speak│  • Override       │  • Volume control         │ │
│  └─────────┬─────────┴─────────┬─────────┴─────────────┬─────────────┘ │
│            │                   │                       │               │
│            ▼                   ▼                       ▼               │
│  ┌───────────────────────────────────────────────────────────────────┐ │
│  │                    TELEVIC CENTRAL UNIT                           │ │
│  ├───────────────────────────────────────────────────────────────────┤ │
│  │                                                                   │ │
│  │  ┌─────────────────┐  ┌─────────────────┐  ┌─────────────────┐  │ │
│  │  │  Mic Management │  │  Audio Routing  │  │  Interpretation │  │ │
│  │  │                 │  │                 │  │  Engine         │  │ │
│  │  │  • On/Off       │  │  • Floor audio  │  │                 │  │ │
│  │  │  • Priority     │  │  • Language ch  │  │  • Language 1   │  │ │
│  │  │  • Request queue│  │  • Recording    │  │  • Language 2   │  │ │
│  │  │  • Max speakers │  │  • Amplifier    │  │  • Language N   │  │ │
│  │  └─────────────────┘  └─────────────────┘  └─────────────────┘  │ │
│  │                                                                   │ │
│  │  ┌─────────────────┐  ┌─────────────────┐                       │ │
│  │  │  Voting System  │  │  Language       │                       │ │
│  │  │  (if equipped)  │  │  Distribution   │                       │ │
│  │  └─────────────────┘  └─────────────────┘                       │ │
│  └───────────────────────────┬───────────────────────────────────────┘ │
│                              │                                         │
└──────────────────────────────┼─────────────────────────────────────────┘
                               │
           ┌───────────────────┼───────────────────┐
           │                   │                   │
           ▼                   ▼                   ▼
┌──────────────────┐ ┌─────────────────┐ ┌─────────────────────┐
│  Bose            │ │  Recording      │ │  Wireless           │
│  ControlSpace    │ │  (Matrox)       │ │  Receivers          │
│  (Floor Audio)   │ │                 │ │  (Interpretation)   │
└──────────────────┘ └─────────────────┘ └─────────────────────┘
```

---

## Microphone Configuration

| Type | Quantity | Features |
|------|----------|----------|
| Delegate Units | To be confirmed | Gooseneck, speaker, channel select |
| Chairman Units | To be confirmed | Priority, override, voting |
| Interpreter Units | To be confirmed | Headset, language select |

---

## Interpretation / Translation Flow

```
Floor Audio (Source Language)
        │
        ▼
┌───────────────────────────────┐
│  Televic Central Unit         │
│                               │
│  Floor Audio Input            │
└───────────────┬───────────────┘
                │
        ┌───────┴───────┐
        ▼               ▼
┌───────────────┐ ┌───────────────┐
│  Interpreter  │ │  Interpreter  │
│  Booth 1      │ │  Booth 2      │
│  (Lang A)     │ │  (Lang B)     │
└───────┬───────┘ └───────┬───────┘
        │                 │
        ▼                 ▼
┌───────────────────────────────┐
│  Language Distribution        │
│                               │
│  Channel 1: Floor (Original) │
│  Channel 2: Language A       │
│  Channel 3: Language B       │
│  Channel N: Language N       │
└───────────────┬───────────────┘
                │
                ▼
┌───────────────────────────────┐
│  Delegate Unit Headphones     │
│                               │
│  Each delegate selects their  │
│  preferred language channel   │
└───────────────────────────────┘
```

---

## Audio Integration

| Interface | From | To | Signal |
|-----------|------|-----|--------|
| Floor Audio Out | Televic Central | Bose ControlSpace | Mixed conference audio |
| Interpretation Out | Televic Central | Wireless transmitters | Language channels |
| Program Audio In | Bose ControlSpace | Televic Central | Audio reinforcement |
| Recording Feed | Televic Central | Matrox | Conference recording |

---

## Signal Routing

### Floor Audio Path
```
Delegate Mic → Televic Central → Bose ControlSpace → Amplifiers → Speakers
```

### Interpretation Path
```
Floor Audio → Interpreter Booth → Language Channel → Wireless TX → Delegate Headphones
```

### Recording Path
```
Floor Audio + Interpretation → Televic Central → Matrox Recorder
```

---

## Conference Modes

| Mode | Description |
|------|-------------|
| Open Mic | Any delegate can speak |
| Request-to-Speak | Delegates request, chairman approves |
| Chairman Override | Chairman can override floor |
| Voting Mode | Delegates vote on motions |
| Interview Mode | One mic active at a time |
| All Open | All mics active simultaneously |

---

## File References

- [System Architecture](system-architecture.md)
- [Audio Signal Flow](audio-signal-flow.md)
- [Control Architecture](control-architecture.md)
- [Recording Workflow](recording-workflow.md)
