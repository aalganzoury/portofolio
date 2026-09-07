# Large-Scale AV Control, Video Distribution & Conference System

> Professional AV Integration & Control System — Extron, Crestron, Televic, RGBlink, Cisco, JBL, Crown, Bose, Shure, Beyerdynamic & Matrox

---

## Project Overview

This project documents a large-scale professional Audio Visual (AV) integration system designed for meetings, conferences, presentations, video distribution, interpretation/translation, recording, camera control, audio amplification, and large-format LED display management.

The system integrates multiple AV manufacturers and technologies into one coordinated environment, demonstrating real-world multi-vendor AV engineering at scale.

### Primary Objectives

| Objective | Description |
|-----------|-------------|
| Centralized Control | Unified AV system management via Crestron CP4 controllers |
| Video Distribution | Multi-matrix video routing across Extron and Crestron switchers |
| Audio Processing | Professional DSP, amplification, and speaker distribution |
| Conference Management | Televic microphone and interpretation/translation system |
| Video Recording | Matrox-based meeting and conference recording |
| Camera Integration | Cisco PTZ camera control and video production |
| LED Display | 40 m² large-format LED wall with RGBlink processing |
| Wireless Presentation | Extron ShareLink for BYOD content sharing |

---

## System Architecture

```
┌─────────────────────────────────────────────────────────────────────┐
│                        SOURCES                                       │
├─────────────────────────────────────────────────────────────────────┤
│  Conference Mics │ Shure Mics │ Beyer Mics │ Cisco Cameras         │
│  ShareLink │ Laptops │ Media Players │ Other AV Sources             │
└───────────────────────────┬─────────────────────────────────────────┘
                            │
                            ▼
┌─────────────────────────────────────────────────────────────────────┐
│                     CONTROL & ROUTING                               │
├─────────────────────────────────────────────────────────────────────┤
│  Crestron CP4 ×2  │  Extron 16×16 Matrix  │  Crestron 8×8 ×2      │
└──────────┬────────┴───────────┬────────────┴──────────┬────────────┘
           │                    │                       │
           ▼                    ▼                       ▼
┌──────────────────┐ ┌──────────────────┐ ┌──────────────────────────┐
│  AUDIO PROCESSING│ │ VIDEO PROCESSING │ │    CONFERENCE SYSTEM     │
│  Bose ControlSp. │ │ RGBlink Q16      │ │    Televic Conference    │
│  JBL Amplifier   │ │ Matrox ×2        │ │    Interpretation        │
│  Crown Amplifier │ │                  │ │    Translation           │
└────────┬─────────┘ └────────┬─────────┘ └────────────┬─────────────┘
         │                    │                        │
         ▼                    ▼                        ▼
┌─────────────────────────────────────────────────────────────────────┐
│                          OUTPUTS                                     │
├─────────────────────────────────────────────────────────────────────┤
│  LED Wall 8m×5m (40m²)  │  Displays  │  Speakers  │  Recording     │
└─────────────────────────────────────────────────────────────────────┘
```

For detailed architecture documentation, see:
- [System Architecture](architecture/system-architecture.md)
- [Audio Signal Flow](architecture/audio-signal-flow.md)
- [Video Signal Flow](architecture/video-signal-flow.md)
- [Control Architecture](architecture/control-architecture.md)
- [Conference System](architecture/conference-system.md)
- [Recording Workflow](architecture/recording-workflow.md)

---

## Equipment List

| Category | Equipment | Quantity | Role |
|----------|-----------|----------|------|
| **Control** | Crestron CP4 | 2 | Centralized AV control |
| **Video Matrix** | Extron 16×16 | 1 | Primary video routing |
| **Video Matrix** | Crestron 8×8 | 2 | Secondary video routing |
| **Audio DSP** | Bose ControlSpace | 1 | Audio processing |
| **Amplifier** | JBL | 1 | Speaker amplification |
| **Amplifier** | Crown | 1 | Speaker amplification |
| **Conference** | Televic | 1 | Mics, interpretation, translation |
| **Wireless** | Extron ShareLink | 2 | Wireless presentation |
| **Recording** | Matrox | 2 | Video recording |
| **Cameras** | Cisco | 4 | PTZ camera control |
| **Microphones** | Shure | 6 | Handheld wireless |
| **Microphones** | Beyerdynamic | 1 | Handheld microphone |
| **LED Processor** | RGBlink Q16 | 1 | LED wall processing |
| **LED Wall** | — | 1 | 8m × 5m (40m²) display |

For detailed equipment documentation, see the [equipment/](equipment/) directory.

---

## Audio Architecture

```
Microphones (Shure, Beyerdynamic, Televic)
        │
        ▼
┌─────────────────────┐
│ Televic Conference  │──→ Interpretation / Translation
│ System              │
└─────────┬───────────┘
          │
          ▼
┌─────────────────────┐
│ Bose ControlSpace   │
│ DSP Processing      │
└─────────┬───────────┘
          │
    ┌─────┴─────┐
    ▼           ▼
┌────────┐ ┌────────┐
│  JBL   │ │ Crown  │
│  Amp   │ │  Amp   │
└───┬────┘ └───┬────┘
    │          │
    ▼          ▼
┌─────────────────────┐
│  Speakers           │
│  ( distributed )    │
└─────────────────────┘
```

See [Audio Signal Flow](architecture/audio-signal-flow.md) for full documentation.

---

## Video Architecture

```
Sources (Cameras, Laptops, ShareLink, Media)
                │
                ▼
┌───────────────────────────┐
│  Extron 16×16 Matrix      │
│  (Primary Routing)        │
└──────────┬────────────────┘
           │
     ┌─────┴─────┐
     ▼           ▼
┌──────────┐ ┌──────────────────┐
│ Crestron │ │ RGBlink Q16      │
│ 8×8 ×2   │ │ LED Processing   │
└────┬─────┘ └────────┬─────────┘
     │                │
     ▼                ▼
┌──────────┐ ┌──────────────────┐
│ Displays │ │ LED Wall         │
│          │ │ 8m × 5m (40m²)  │
└──────────┘ └──────────────────┘
                │
                ▼
         ┌──────────────┐
         │ Matrox ×2    │
         │ Recording    │
         └──────────────┘
```

See [Video Signal Flow](architecture/video-signal-flow.md) for full documentation.

---

## Control Architecture

```
┌──────────────────────────────────────────────────┐
│              CRESTRON CONTROL SYSTEM              │
├──────────────────────────────────────────────────┤
│                                                   │
│   ┌─────────────┐         ┌─────────────┐        │
│   │ Crestron    │◄───────►│ Crestron    │        │
│   │ CP4  #1     │         │ CP4  #2     │        │
│   └──────┬──────┘         └──────┬──────┘        │
│          │                       │                │
│          ▼                       ▼                │
│   ┌──────────────────────────────────────┐       │
│   │         Device Control Bus           │       │
│   ├──────────────────────────────────────┤       │
│   │ • Matrix switching control           │       │
│   │ • Display on/off / input select      │       │
│   │ • Camera PTZ control                 │       │
│   │ • Audio level control                │       │
│   │ • Recording start/stop               │       │
│   │ • System preset recall               │       │
│   └──────────────────────────────────────┘       │
│                                                   │
│   ┌──────────────────────────────────────┐       │
│   │         User Interface               │       │
│   ├──────────────────────────────────────┤       │
│   │ • Touch panel control                │       │
│   │ • Room presets                       │       │
│   │ • Volume control                     │       │
│   │ • Source selection                   │       │
│   │ • System status monitoring           │       │
│   └──────────────────────────────────────┘       │
└──────────────────────────────────────────────────┘
```

See [Control Architecture](architecture/control-architecture.md) for full documentation.

---

## Conference / Televic Architecture

```
┌─────────────────────────────────────────────────┐
│           TELEVIC CONFERENCE SYSTEM              │
├─────────────────────────────────────────────────┤
│                                                  │
│  ┌──────────────┐    ┌──────────────────────┐   │
│  │ Delegate     │    │ Chairman Units       │   │
│  │ Microphones  │    │                      │   │
│  └──────┬───────┘    └──────────┬───────────┘   │
│         │                       │                │
│         ▼                       ▼                │
│  ┌──────────────────────────────────────────┐   │
│  │         Televic Central Unit             │   │
│  ├──────────────────────────────────────────┤   │
│  │ • Microphone management                 │   │
│  │ • Speaker priority / voting              │   │
│  │ • Audio routing                          │   │
│  └──────────────────┬───────────────────────┘   │
│                     │                            │
│         ┌───────────┴───────────┐               │
│         ▼                       ▼               │
│  ┌──────────────┐      ┌──────────────────┐    │
│  │ Interpretation│      │ Audio Output      │    │
│  │ Channels      │      │ to DSP/Speakers   │    │
│  └──────────────┘      └──────────────────┘    │
└─────────────────────────────────────────────────┘
```

See [Conference System](architecture/conference-system.md) for full documentation.

---

## Recording Architecture

```
Video Source (Camera / Presentation / Mixed)
        │
        ▼
┌───────────────────┐
│ Video Matrix      │
│ (Select Source)   │
└─────────┬─────────┘
          │
    ┌─────┴─────┐
    ▼           ▼
┌────────┐ ┌────────┐
│ Matrox │ │ Matrox │
│ Rec #1 │ │ Rec #2 │
└───┬────┘ └───┬────┘
    │          │
    ▼          ▼
┌─────────────────────┐
│ Recording / Storage  │
│ (Local / Network)    │
└─────────────────────┘
```

See [Recording Workflow](architecture/recording-workflow.md) for full documentation.

---

## Troubleshooting Approach

| Domain | Approach |
|--------|----------|
| Video | Signal path verification, matrix routing checks, cable testing |
| Audio | DSP monitoring, gain structure, speaker impedance checks |
| Control | Crestron processor logs, device communication verification |
| Cameras | Network connectivity, PTZ response, video feed validation |
| Recording | Storage availability, encoding status, source verification |

See [troubleshooting/](troubleshooting/) directory for detailed guides.

---

## Testing & Commissioning

The system was tested and commissioned following these stages:

1. **Pre-installation** — Equipment verification, cable labeling
2. **Infrastructure** — Cable installation, conduit, rack mounting
3. **Individual device** — Each component tested independently
4. **Subsystem integration** — Audio, video, control subsystems verified
5. **Full system integration** — All subsystems tested together
6. **User acceptance** — Client walkthrough and sign-off

See [documentation/](documentation/) for detailed procedures.

---

## Skills Demonstrated

| Skill | Application |
|-------|-------------|
| AV System Integration | Multi-vendor system design and deployment |
| AV Troubleshooting | Systematic fault isolation across subsystems |
| Video Signal Routing | Matrix switching, signal distribution |
| Audio Signal Routing | DSP configuration, amplification chains |
| Matrix Switching | Extron 16×16, Crestron 8×8 configuration |
| Crestron Control Systems | CP4 programming, device automation |
| Extron AV Systems | Video matrix, ShareLink integration |
| Bose DSP / ControlSpace | Audio processing, routing, EQ |
| Televic Conference Systems | Mic management, interpretation |
| LED Video Processing | RGBlink Q16, large-format displays |
| Professional Audio | JBL & Crown amplification |
| Camera Integration | Cisco PTZ, video production |
| Video Recording | Matrox capture, meeting documentation |
| Wireless Presentation | ShareLink BYOD integration |
| AV Commissioning | Testing, sign-off procedures |
| System Documentation | Technical diagrams, signal flows |
| Multi-vendor Integration | Cross-manufacturer compatibility |

---

## Technologies Used

| Category | Technologies |
|----------|-------------|
| Control | Crestron CP4, Crestron Programming |
| Video | Extron Matrix, Crestron Matrix, RGBlink Q16 |
| Audio | Bose ControlSpace, JBL, Crown |
| Conference | Televic Conference, Interpretation System |
| Recording | Matrox |
| Cameras | Cisco PTZ |
| Wireless | Extron ShareLink |
| Microphones | Shure, Beyerdynamic |
| Display | LED Wall (8m × 5m) |
| Documentation | Markdown, Mermaid, ASCII Diagrams |

---

## Project Challenges

- **Multi-vendor compatibility** — Ensuring seamless communication between Extron, Crestron, Bose, Televic, and other manufacturers
- **Signal routing complexity** — Managing video and audio paths across multiple matrices and processors
- **Conference interpretation** — Integrating Televic interpretation channels with the broader audio system
- **Scale** — Coordinating a 40m² LED wall with proper processing and content distribution
- **Reliability** — Designing redundant control paths for mission-critical conference operations

---

## Lessons Learned

- Thorough pre-installation documentation prevents costly rework
- Standardized cable labeling saves hours during troubleshooting
- Cross-manufacturer integration requires careful protocol verification
- Redundant control processors are essential for large-scale systems
- User training is as important as technical commissioning

---

## Professional Disclaimer

This documentation is created for portfolio and educational purposes. All technical details are generalized to protect client confidentiality. No proprietary source code, network credentials, or sensitive configuration data is included.

---

## About the Engineer

**Ahmed El Ganzoury** — AV Specialist & AWS Cloud Engineer

Experienced in professional AV systems integration, combining hands-on expertise with large-scale audio visual installations and cloud infrastructure engineering. My background spans AV control systems, video distribution, professional audio, conference management, and networked AV — paired with AWS cloud engineering skills in EC2, S3, IAM, VPC, Lambda, and CloudFormation.

This project demonstrates the ability to integrate audio, video, control, conference, camera, recording, and LED processing systems into one complete professional AV environment.

- **Portfolio**: [Cloud Engineer Portfolio](../cloud-engineer-portfolio.html)
- **Email**: a.alganzoury@gmail.com
- **LinkedIn**: [linkedin.com/in/ahmed-el-ganzoury](https://www.linkedin.com/in/ahmed-el-ganzoury-47a233427/)

---

## License

This project is licensed under the MIT License — see [LICENSE](LICENSE) for details.
