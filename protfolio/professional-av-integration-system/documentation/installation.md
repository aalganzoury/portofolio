# Installation Guide

## Overview

This document outlines the installation process for the large-scale AV integration system.

---

## Pre-Installation

### Site Survey

| Task | Description |
|------|-------------|
| Room assessment | Verify room dimensions, layout |
| Infrastructure check | Power, network, conduit |
| Environmental check | Temperature, humidity |
| Acoustic assessment | Room acoustics baseline |

### Equipment Verification

| Task | Description |
|------|-------------|
| Inventory check | All equipment received |
| Damage inspection | Visual inspection |
| Firmware check | Verify firmware versions |
| Documentation | Verify manuals/specs |

---

## Installation Phases

### Phase 1: Infrastructure

| Task | Details |
|------|---------|
| Rack installation | Mount racks, verify placement |
| Cable installation | Video, audio, control cables |
| Conduit routing | Cable pathways |
| Labeling | All cables labeled |
| Cable testing | Continuity, signal test |

### Phase 2: Equipment Mounting

| Task | Details |
|------|---------|
| Rack mount equipment | All rack-mount devices |
| Display mounting | LED wall, displays |
| Speaker mounting | All speakers |
| Camera mounting | Cisco PTZ cameras |
| Microphone setup | Televic units |

### Phase 3: Connectivity

| Task | Details |
|------|---------|
| Video connections | All matrix I/O |
| Audio connections | DSP, amplifiers, speakers |
| Control connections | Crestron, serial, IP |
| Network connections | All IP devices |
| Power connections | All devices |

### Phase 4: Configuration

| Task | Details |
|------|---------|
| Device configuration | IP addresses, settings |
| Matrix routing | Input/output assignments |
| DSP configuration | Audio processing |
| Control programming | Crestron logic |
| Preset creation | All system presets |

---

## Cable Schedule

### Video Cables

| Cable | From | To | Type | Length |
|-------|------|-----|------|--------|
| V1–V4 | Cisco Cameras | Extron Matrix | To be confirmed | To be confirmed |
| V5–V6 | ShareLink | Extron Matrix | HDMI | To be confirmed |
| V7–V14 | Sources | Extron Matrix | HDMI | To be confirmed |
| V15–V16 | Extron | Crestron/RGBlink | To be confirmed | To be confirmed |

### Audio Cables

| Cable | From | To | Type | Length |
|-------|------|-----|------|--------|
| A1–A12 | Televic | Bose DSP | To be confirmed | To be confirmed |
| A13–A19 | Shure/Beyer RX | Bose DSP | XLR | To be confirmed |
| A20–A24 | Program sources | Bose DSP | Line | To be confirmed |
| A25–A28 | Bose DSP | Amplifiers | To be confirmed | To be confirmed |
| A29–A32 | Amplifiers | Speakers | Speaker cable | To be confirmed |

### Control Cables

| Cable | From | To | Type | Length |
|-------|------|-----|------|--------|
| C1 | Crestron CP4 #1 | Extron Matrix | RS-232 | To be confirmed |
| C2 | Crestron CP4 #1 | Crestron Matrices | Cresnet | To be confirmed |
| C3 | Crestron CP4 #1 | Bose DSP | Ethernet | To be confirmed |
| C4 | Crestron CP4 #1 | Cisco Cameras | Ethernet | To be confirmed |
| C5 | Crestron CP4 #1 | Matrox | Ethernet | To be confirmed |

---

## Power Requirements

| Equipment | Power | Circuit |
|-----------|-------|---------|
| Crestron CP4 ×2 | To be confirmed | Dedicated |
| Extron Matrix | To be confirmed | Dedicated |
| Bose ControlSpace | To be confirmed | Dedicated |
| Amplifiers | To be confirmed | Dedicated |
| LED Wall | To be confirmed | Dedicated |

---

## File References

- [Testing & Commissioning](testing.md)
- [Maintenance](maintenance.md)
- [System Architecture](../architecture/system-architecture.md)
