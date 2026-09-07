# RGBlink LED Processing

## RGBlink Q16 LED Processor

| Parameter | Details |
|-----------|---------|
| Quantity | 1 |
| Model | Q16 |
| Role | LED wall signal processing |
| Status | Operational |

---

## Functions

| Function | Description |
|----------|-------------|
| Video Scaling | Input resolution adaptation |
| Signal Processing | Color correction, brightness |
| LED Control | Pixel mapping, output configuration |
| Source Selection | Input switching |

---

## Signal Flow

```
┌─────────────────────────────────────────────────┐
│              RGBlink Q16 SIGNAL PATH             │
├─────────────────────────────────────────────────┤
│                                                  │
│  INPUT                                           │
│  └── Extron 16×16 Matrix Output 5–6             │
│                                                  │
│  PROCESSING                                      │
│  ├── Input scaling                               │
│  ├── Color correction                            │
│  ├── Brightness control                          │
│  ├── Pixel mapping                               │
│  └── Output configuration                        │
│                                                  │
│  OUTPUT                                          │
│  └── LED Wall (8m × 5m / 40m²)                  │
│                                                  │
└─────────────────────────────────────────────────┘
```

---

## Integration

| Interface | From | To |
|-----------|------|-----|
| Video Input | Extron 16×16 Out 5–6 | RGBlink Q16 |
| Video Output | RGBlink Q16 | LED Wall |
| Control | Crestron CP4 | RS-232 / IP |

---

## Configuration Notes

- Exact Q16 model variant to be confirmed
- LED wall pixel pitch to be confirmed
- Output resolution to be confirmed
- Color calibration to be confirmed

---

## File References

- [Video Signal Flow](../architecture/video-signal-flow.md)
- [Configuration: Video Routing](../configuration/video-routing.md)
