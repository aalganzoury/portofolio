# Control Troubleshooting

## Common Control Issues

### No Response from Device

| Step | Action |
|------|--------|
| 1 | Verify device power |
| 2 | Check network/serial connection |
| 3 | Verify IP address/COM port |
| 4 | Test with direct connection |
| 5 | Restart device |

### Crestron CP4 Issues

| Symptom | Action |
|---------|--------|
| UI not responding | Restart processor |
| Commands failing | Check device communication |
| Presets not working | Verify preset storage |
| Slow response | Check network load |

---

## Communication Troubleshooting

### Serial (RS-232)

| Check | Action |
|-------|--------|
| Cable | Verify wiring (TX/RX/GND) |
| Baud rate | Match device settings |
| COM port | Verify correct port |
| Terminal | Check software settings |

### IP (TCP/UDP)

| Check | Action |
|-------|--------|
| IP address | Verify correct address |
| Port | Verify correct port |
| Network | Check connectivity |
| Firewall | Check port blocking |

---

## Device-Specific Issues

### Extron Matrix

| Symptom | Action |
|---------|--------|
| No switching | Check serial/IP connection |
| Wrong route | Verify routing table |
| No status | Check communication |

### Crestron Matrices

| Symptom | Action |
|---------|--------|
| No switching | Check Cresnet/IP |
| Wrong route | Verify configuration |
| No control | Check CP4 connection |

### Cisco Cameras

| Symptom | Action |
|---------|--------|
| No PTZ | Check IP connection |
| No video | Check network, power |
| Presets failing | Verify preset storage |

### Bose ControlSpace

| Symptom | Action |
|---------|--------|
| No control | Check IP connection |
| Wrong audio | Check matrix routing |
| No processing | Check DSP status |

---

## Preset Troubleshooting

| Issue | Action |
|-------|--------|
| Preset not recalling | Verify storage |
| Wrong result | Check preset configuration |
| Partial recall | Check all devices online |
| Slow recall | Check communication speed |

---

## File References

- [Control Architecture](../architecture/control-architecture.md)
- [Control Logic Configuration](../configuration/control-logic.md)
- [Crestron Equipment](../equipment/crestron.md)
