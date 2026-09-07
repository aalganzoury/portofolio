# Extron Equipment

## Extron 16×16 Video Matrix Switcher

| Parameter | Details |
|-----------|---------|
| Quantity | 1 |
| Configuration | 16 inputs × 16 outputs |
| Role | Primary video routing |
| Status | Operational |

---

## Extron ShareLink Wireless Presentation

| Parameter | Details |
|-----------|---------|
| Quantity | 2 |
| Role | Wireless presentation / BYOD |
| Status | Operational |

---

## 16×16 Matrix Overview

The Extron 16×16 matrix switcher serves as the primary video routing hub for the entire AV system.

---

## Input Configuration

| Input | Source | Signal Type |
|-------|--------|-------------|
| 1 | Cisco Camera 1 | IP/SDI |
| 2 | Cisco Camera 2 | IP/SDI |
| 3 | Cisco Camera 3 | IP/SDI |
| 4 | Cisco Camera 4 | IP/SDI |
| 5 | ShareLink 1 | HDMI/IP |
| 6 | ShareLink 2 | HDMI/IP |
| 7–10 | Presenter Laptops | HDMI |
| 11–14 | Media Players | HDMI/SDI |
| 15–16 | Backup / Auxiliary | HDMI |

---

## Output Configuration

| Output | Destination | Purpose |
|--------|-------------|---------|
| 1–2 | Crestron 8×8 #1 | Distribution |
| 3–4 | Crestron 8×8 #2 | Distribution |
| 5–6 | RGBlink Q16 | LED Wall |
| 7–8 | Matrox Recorders | Recording |
| 9–10 | Primary Displays | Main viewing |
| 11–16 | Secondary / Backup | Overflow |

---

## Signal Flow

```
Sources ──► Extron 16×16 ──► Destinations
              │
              ├──► Crestron 8×8 Matrices
              ├──► RGBlink Q16 (LED)
              ├──► Matrox Recorders
              └──► Direct Displays
```

---

## ShareLink Integration

### ShareLink 1

| Parameter | Details |
|-----------|---------|
| Connected Devices | BYOD (laptops, phones) |
| Output | Matrix Input 5 |
| Purpose | Wireless presentation |

### ShareLink 2

| Parameter | Details |
|-----------|---------|
| Connected Devices | BYOD (laptops, phones) |
| Output | Matrix Input 6 |
| Purpose | Wireless presentation |

### ShareLink Flow
```
Mobile/Laptop → ShareLink → Matrix → Display/LED
```

---

## Control Interface

| Method | Protocol | Controller |
|--------|----------|------------|
| RS-232 | Serial | Crestron CP4 |
| IP | TCP | Crestron CP4 |

---

## Configuration Notes

- Exact model to be confirmed
- Firmware version to be confirmed
- Signal bandwidth: To be confirmed
- Supported resolutions: Up to 4K

---

## File References

- [Video Signal Flow](../architecture/video-signal-flow.md)
- [Configuration: Video Routing](../configuration/video-routing.md)
