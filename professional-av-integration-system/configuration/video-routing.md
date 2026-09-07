# Video Routing Configuration

## Matrix Switching Overview

This document describes the video routing configuration across the Extron and Crestron matrix switchers.

---

## Extron 16×16 Routing Table

### Input Assignment

| Input | Source | Signal | Resolution |
|-------|--------|--------|------------|
| 1 | Cisco Camera 1 | IP/SDI | To be confirmed |
| 2 | Cisco Camera 2 | IP/SDI | To be confirmed |
| 3 | Cisco Camera 3 | IP/SDI | To be confirmed |
| 4 | Cisco Camera 4 | IP/SDI | To be confirmed |
| 5 | ShareLink 1 | HDMI/IP | Up to 1080p |
| 6 | ShareLink 2 | HDMI/IP | Up to 1080p |
| 7 | Laptop Input 1 | HDMI | Variable |
| 8 | Laptop Input 2 | HDMI | Variable |
| 9 | Laptop Input 3 | HDMI | Variable |
| 10 | Laptop Input 4 | HDMI | Variable |
| 11 | Media Player 1 | HDMI/SDI | Up to 4K |
| 12 | Media Player 2 | HDMI/SDI | Up to 4K |
| 13 | Media Player 3 | HDMI/SDI | Up to 4K |
| 14 | Media Player 4 | HDMI/SDI | Up to 4K |
| 15 | Backup Input 1 | HDMI | Variable |
| 16 | Backup Input 2 | HDMI | Variable |

### Output Assignment

| Output | Destination | Purpose |
|--------|-------------|---------|
| 1 | Crestron 8×8 #1 Input 1 | Distribution |
| 2 | Crestron 8×8 #1 Input 2 | Distribution |
| 3 | Crestron 8×8 #2 Input 1 | Distribution |
| 4 | Crestron 8×8 #2 Input 2 | Distribution |
| 5 | RGBlink Q16 Input 1 | LED Wall |
| 6 | RGBlink Q16 Input 2 | LED Wall |
| 7 | Matrox Recorder 1 | Primary Record |
| 8 | Matrox Recorder 2 | Backup Record |
| 9 | Primary Display 1 | Main viewing |
| 10 | Primary Display 2 | Main viewing |
| 11 | Secondary Display 1 | Overflow |
| 12 | Secondary Display 2 | Overflow |
| 13 | Confidence Monitor | Stage |
| 14 | Overflow Display 3 | Overflow |
| 15 | Backup Output 1 | Redundancy |
| 16 | Backup Output 2 | Redundancy |

---

## Crestron 8×8 Matrix #1

| Input | Source | Output | Destination |
|-------|--------|--------|-------------|
| 1 | Extron Out 1 | 1–4 | Room Displays |
| 2 | Extron Out 2 | 5–8 | Confidence Monitors |
| 3–8 | Local sources | — | — |

---

## Crestron 8×8 Matrix #2

| Input | Source | Output | Destination |
|-------|--------|--------|-------------|
| 1 | Extron Out 3 | 1–4 | Overflow Displays |
| 2 | Extron Out 4 | 5–8 | Recording Preview |
| 3–8 | Local sources | — | — |

---

## Preset Routing

### Preset: Conference

| Source | Destination |
|--------|-------------|
| Camera 1 (Presenter) | LED Wall |
| Camera 2 (Wide) | Display 1 |
| Camera 3 (Audience) | Recording |
| Conference Audio | All speakers |

### Preset: Presentation

| Source | Destination |
|--------|-------------|
| ShareLink (Presenter Laptop) | LED Wall |
| Camera 1 | Display 1 |
| Program Audio | All speakers |

### Preset: Video Call

| Source | Destination |
|--------|-------------|
| Camera 1 (Speaker) | Display 1 |
| Remote Video | LED Wall |
| Conference Audio | All speakers |

---

## Signal Format Considerations

| Format | Max Resolution | Cable Length |
|--------|----------------|--------------|
| HDMI | 4K (3840×2160) | 15m (standard) |
| SDI | 1080p | 100m+ |
| HDBaseT | 4K | 100m |
| IP (H.264) | 1080p | Network dependent |

---

## File References

- [Video Signal Flow](../architecture/video-signal-flow.md)
- [Extron Equipment](../equipment/extron.md)
- [Crestron Equipment](../equipment/crestron.md)
