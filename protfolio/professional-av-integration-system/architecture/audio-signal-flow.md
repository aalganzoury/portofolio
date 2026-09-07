# Audio Signal Flow

## Overview

This document describes the complete audio signal flow through the AV system, from microphone inputs through DSP processing to speaker outputs.

---

## Audio Signal Flow Diagram

```
┌─────────────────────────────────────────────────────────────────────┐
│                         AUDIO SOURCES                               │
├─────────────────┬─────────────────┬─────────────────┬───────────────┤
│  Televic        │  Shure          │  Beyerdynamic   │  Program      │
│  Conference     │  Handheld       │  Handheld       │  Audio        │
│  Microphones    │  Mics ×6        │  Mic ×1         │  (Media)      │
└────────┬────────┴────────┬────────┴────────┬────────┴───────┬───────┘
         │                 │                 │                │
         ▼                 ▼                 ▼                ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    TELEVIC CONFERENCE SYSTEM                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                  Conference Processing                       │   │
│  ├─────────────────────────────────────────────────────────────┤   │
│  │  • Microphone management (on/off, priority)                │   │
│  │  • Delegate / Chairman assignment                           │   │
│  │  • Conference audio mixing                                  │   │
│  │  • Interpretation channel routing                           │   │
│  └──────────────────────────┬──────────────────────────────────┘   │
│                              │                                      │
│                    ┌─────────┴─────────┐                           │
│                    ▼                   ▼                           │
│           ┌──────────────┐     ┌──────────────┐                   │
│           │  Floor Audio  │     │ Interpretation│                   │
│           │  Output       │     │ Outputs       │                   │
│           └──────┬───────┘     └──────┬───────┘                   │
└──────────────────┼────────────────────┼────────────────────────────┘
                   │                    │
                   ▼                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    BOSE CONTROLSPACE DSP                            │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌─────────────────────────────────────────────────────────────┐   │
│  │                  DSP Processing                             │   │
│  ├─────────────────────────────────────────────────────────────┤   │
│  │  • Input gain staging                                      │   │
│  │  • Equalization (parametric EQ)                            │   │
│  │  • Dynamic processing (compression, limiting)              │   │
│  │  • Feedback suppression                                    │   │
│  │  • Noise gating                                            │   │
│  │  • Audio matrix routing                                    │   │
│  └──────────────────────────┬──────────────────────────────────┘   │
│                              │                                      │
│                    ┌─────────┴─────────┐                           │
│                    ▼                   ▼                           │
│           ┌──────────────┐     ┌──────────────┐                   │
│           │  Amplifier   │     │  Amplifier   │                   │
│           │  Output 1    │     │  Output 2    │                   │
│           └──────┬───────┘     └──────┬───────┘                   │
└──────────────────┼────────────────────┼────────────────────────────┘
                   │                    │
                   ▼                    ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    AMPLIFICATION                                    │
├─────────────────────────┬───────────────────────────────────────────┤
│                         │                                           │
│  ┌──────────────────┐   │   ┌──────────────────┐                   │
│  │  JBL Amplifier   │   │   │  Crown Amplifier  │                   │
│  │                  │   │   │                   │                   │
│  │  • Power amp     │   │   │  • Power amp      │                   │
│  │  • Channel mix   │   │   │  • Channel mix    │                   │
│  └────────┬─────────┘   │   └────────┬──────────┘                   │
│           │             │            │                               │
└───────────┼─────────────┼────────────┼──────────────────────────────┘
            │             │            │
            ▼             ▼            ▼
┌─────────────────────────────────────────────────────────────────────┐
│                    SPEAKERS                                        │
├─────────────────────────────────────────────────────────────────────┤
│                                                                     │
│  ┌────────────┐  ┌────────────┐  ┌────────────┐  ┌────────────┐  │
│  │  Speaker   │  │  Speaker   │  │  Speaker   │  │  Speaker   │  │
│  │  Zone 1    │  │  Zone 2    │  │  Zone 3    │  │  Zone N    │  │
│  └────────────┘  └────────────┘  └────────────┘  └────────────┘  │
│                                                                     │
└─────────────────────────────────────────────────────────────────────┘
```

---

## Channel Breakdown

### Input Channels

| Channel | Source | Type | Processing |
|---------|--------|------|------------|
| 1–12 | Televic Conference Mics | Digital | Conference DSP |
| 13–18 | Shure Handheld Mics | Wireless | Gain, EQ, Comp |
| 19 | Beyerdynamic Handheld | Wireless | Gain, EQ, Comp |
| 20–24 | Program Audio | Line | Level, routing |

### Output Channels

| Output | Destination | Zone |
|--------|-------------|------|
| 1–2 | JBL Amplifier | Main coverage |
| 3–4 | Crown Amplifier | Fill / delay |
| 5–6 | Recording feed | Matrox input |
| 7–8 | Interpretation | Televic return |

---

## DSP Processing Chain

```
Input → Gain → Gate → EQ → Compressor → Limiter → Matrix → Output
```

### Stage Descriptions

| Stage | Purpose |
|-------|---------|
| Gain | Match input levels |
| Gate | Remove background noise |
| EQ | Tone shaping, feedback prevention |
| Compressor | Dynamic range control |
| Limiter | Protect amplifiers/speakers |
| Matrix | Route to output destinations |

---

## Gain Structure

```
Mic Level (-60 dBu to -20 dBu)
    │
    ▼
Preamp / Gain Stage (0 dB to +40 dB)
    │
    ▼
DSP Processing (unity gain with headroom)
    │
    ▼
Output Level (-20 dBu to +4 dBu)
    │
    ▼
Amplifier Input Sensitivity
    │
    ▼
Speaker Output (watts)
```

---

## Integration Points

| Interface | From | To | Signal |
|-----------|------|-----|--------|
| Analog Output | Televic | Bose ControlSpace | Floor audio |
| Digital Network | Bose ControlSpace | Amplifiers | Processed audio |
| Analog Output | Amplifiers | Speakers | Power audio |
| Digital | Bose ControlSpace | Matrox | Recording feed |
| Analog | Televic | Interpretation receivers | Language channels |

---

## File References

- [System Architecture](system-architecture.md)
- [Control Architecture](control-architecture.md)
- [Conference System](conference-system.md)
