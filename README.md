# Mixed-Criticality OFDM Demo with USRP

This project demonstrates wireless transmission of two superposed data streams with different priorities: **HP (high priority)** and **LP (low priority)**. It includes configurable modulation, reception over one or two USRP receive channels, decoded-message displays, bit error rate (BER) measurements and signal-to-noise ratio (SNR) indicators.

The robotic-arm demonstration associates one arm with HP and the other with LP. Each arm moves according to the BER of its own stream and **stops when that BER exceeds 10%**.

The software is implemented in LabVIEW. The same project folder is used on the TX and RX computers; each computer opens the VI for its role and the selected demonstration.

## Contents

- [Demonstration versions](#demonstration-versions)
- [Project layout](#project-layout)
- [Requirements](#requirements)
- [Opening and running the demonstration](#opening-and-running-the-demonstration)
- [Transmitter controls](#transmitter-controls)
- [Receiver controls](#receiver-controls)
- [Signal processing and frame formats](#signal-processing-and-frame-formats)
- [Two-channel reception](#two-channel-reception)
- [BER, SNR and recording](#ber-snr-and-recording)
- [Robotic-arm demonstration](#robotic-arm-demonstration)
- [Troubleshooting](#troubleshooting)
- [Validation status](#validation-status)
- [Acknowledgement](#acknowledgement)

## Demonstration versions

Open **`Proyecto/Demo_USRP_TX_RX.lvproj`** on both computers. The following VI filenames are relative to `Proyecto/`.

| Demonstration | TX computer | RX computer | Use |
| --- | --- | --- | --- |
| Independent modulation choices | `Transmitter_Example_V4.vi` | `Receiver_Example - 2 Channel - Experiment_17.vi` | Selectable BPSK, QPSK, 16-QAM and 64-QAM. Uses the frame with SIG 2 and the receiver's V3 analysis paths. |
| Earlier single-SIG demonstration, including QPSK/4-QAM | `Transmitter_Example.vi` | `Receiver_Example - 2 Channel - Experiment_13.vi` | Uses the earlier frame format. Select the intended modulation in the front panel. |
| HP/LP robotic-arm demonstration | `Transmitter_Example.vi` | `Receiver_Example - 2 Channel - Experiment_13.vi` | Each arm responds to the BER of its corresponding HP or LP stream, stopping above 10%. |

`Transmitter_Example.vi` is the TX candidate for RX `_13` because their frame formats match. This pairing still requires confirmation on the lab hardware.

The Project Explorer contains the groups `01 - Varias modulaciones (SIG 2)`, `02 - Demo con brazos (un SIG)`, `03 - Receptor de referencia`, `Controles` and `SubVIs`.

For a QPSK demonstration, select QPSK/4-QAM in the relevant modulation controls. TX V4 continues to generate SIG 2 when QPSK is selected, so it must still be used with the matching receiver analysis.

## Project layout

Keep this README at the project root, alongside `Proyecto/`.

| Path | Purpose |
| --- | --- |
| `Proyecto/Demo_USRP_TX_RX.lvproj` | LabVIEW project to open on TX and RX. |
| `Proyecto/*.vi` | Transmitter, receiver and supporting signal-processing VIs. |
| `Proyecto/*.ctl` | Controls and type definitions used by the VIs. |
| `Proyecto/data/` | Measurement files and receiver recording directory. |
| `Abrir_RX.cmd` | Windows launcher that prepares the RX recording directory and opens the project. |
| `Herramientas/Preparar_RX.ps1` | Recording-directory preparation used by the launcher. |

Keep the folder structure intact so that the project and its supporting files remain together.

## Requirements

### Software

- LabVIEW development environment. The principal TX/RX files contain LabVIEW `22.3.x` version metadata; confirm the working version on the lab computers.
- NI-USRP support compatible with the installed LabVIEW version and the USRP hardware.
- LabVIEW Modulation Toolkit and the LabVIEW analysis libraries used by the signal-processing VIs.
- LabVIEW HTTP client support for the robotic-arm receiver.
- Windows PowerShell for `Abrir_RX.cmd`.

Use the LabVIEW development environment to open and compile the VIs. Record the working LabVIEW, toolkit and driver versions with the demonstration configuration.

### Hardware

- Two USRPs: one for TX and one for RX, with the corresponding computers and connections.
- Suitable antennas and RF ports for the intended carrier frequency.
- An RX device and configuration supporting channels `0,1` when using two receive channels.
- For the robotic-arm demonstration, two arms with their existing LabVIEW control connection available: one associated with HP and one with LP.

Carrier frequency, antenna selection, gain and IQ rate must match the actual lab equipment. Check the effective values returned by the USRP driver.

## Opening and running the demonstration

### Prepare the computers

1. Place the complete project folder on each computer and use the same project revision on TX and RX.
2. Install the required NI software and confirm that each USRP is detected by the NI configuration tools.
3. Keep `Proyecto/data/` available for recording.
4. Before a new recording, move previous files named `data_16QAM.txt`, `data_OneChannel.txt` and `data_TwoChannels.txt` to a separate measurement folder if the receiver reports that the target already exists.

### RX computer

With LabVIEW and the project closed, run **`Abrir_RX.cmd`** from the project root. It prepares the recording directory for RX `_13` and `_17` at the current folder location and opens `Proyecto/Demo_USRP_TX_RX.lvproj`.

Use a local Windows drive. Prepare the recording directory before the first LabVIEW opening at a new location. If the launcher reports that it requires the supplied source VI, use an unchanged project copy for that preparation; a VI compiled and saved by LabVIEW can contain resources the launcher does not support.

Open the RX VI for the selected demonstration from the table above.

### TX computer

Open **`Proyecto/Demo_USRP_TX_RX.lvproj`** and then the corresponding TX VI.

### Configure and run

1. Select the connected USRP in `device names` or `Device selection`.
2. Set matching carrier frequencies and compatible IQ rates on TX and RX.
3. Select the connected RF antenna ports. For two-channel reception, confirm the channel list and both antenna connections.
4. Choose the matching TX/RX pair and frame format.
5. Set the transmitted HP/LP text, modulation settings and `Alpha`. Match the RX reference-message controls to the transmitted payloads.
6. Start RX acquisition, then run TX.
7. Check the effective radio parameters, frame-valid indicators, decoded text and constellations.
8. Enable the intended BER display or recording controls after confirming reception of the expected messages.
9. Stop TX and RX using their front-panel `stop` controls and inspect the error indicators.

For the robotic-arm demonstration, have the existing arm control connection ready before enabling motion and use a **10% BER threshold** for each stream.

## Transmitter controls

Control labels differ slightly between the TX versions.

| Control or indicator | Purpose |
| --- | --- |
| `device names` | Selects the TX USRP resource. |
| `USRP ControledParameters` | Requested IQ rate, carrier frequency, gain and antenna settings. |
| `USRP CoercedParamters` | Effective radio parameters returned by the driver. |
| `String Critical Data`, `String Non Critical Data` | Payload text for the two superposed streams. |
| `Modulation parameter` | Modulation configuration in the earlier TX. |
| `Modulation parameter HP`, `Modulation parameter LP` | Separate modulation configurations in TX V4. |
| `Alpha` | Weighting parameter for the two superposed symbol streams. |
| `OFDM 4QAM / 16QAM` | Selects the corresponding superposition/reference branch in the earlier implementation. |
| `milliseconds to wait` | Pacing between transmitter iterations. |
| `Timer`, `Frames` | Frame-count stopping controls in TX V4 when Timer is enabled. |
| `Waveform Graph`, bit lengths and frame durations | Displays the generated waveform and payload/frame sizes. |

Check the payload-length requirements of the selected frame constructor when changing the HP/LP text or modulation combination. Keep the RF gain and waveform scaling fixed when comparing measurements.

## Receiver controls

In **`Receiver_Example - 2 Channel - Experiment_17.vi`**, the available modulation choices are **BPSK, QPSK, 16-QAM and 64-QAM**. Select the intended modulation in the receiver front panel and use compatible settings in TX V4.

| Control or indicator | Purpose |
| --- | --- |
| `Device selection`, `USRP ControledParameters` | Selects the RX USRP and requests its radio settings. |
| `Coerced Parameters` | Effective receive parameters returned by the driver. |
| Modulation selection in RX `_17` | Selects BPSK, QPSK, 16-QAM or 64-QAM. |
| `Trigger level` | Frame-capture detection threshold. |
| `Channel`, `CH0`, `CH1` and related controls | Selects the receive channel or displayed view. |
| Expected-message controls | Reference text for the bit-error comparison. |
| `Record BER`, `Record BER 2` | Enables the associated error/bit accumulation paths. |
| `Refresh Button`, `Refresh Button 2` | Refreshes or resets the associated measurement state. |
| Window-size controls | History length used by the BER display filters. |
| `Save data`, `Save data 1 channel`, `Save data 2 channels` | Enables the corresponding recording paths. |
| `SIG valid?`, constellation and decoded-text indicators | Shows frame interpretation and payload recovery. |
| `SNR dB`, `SNR dB HP`, `SNR dB LP` | SNR outputs in the V3 analysis used by RX `_17`. |
| `url`, `url 2` | Existing arm control destinations in RX `_13`. |
| `Threshold`, `Switch mode` | BER-dependent arm control settings in RX `_13`. The demonstrated stopping threshold is 10%. |

## Signal processing and frame formats

### Transmitter

The transmitter converts payload bytes to bits, scrambles them, applies BCC encoding and maps them to modulation symbols. The frame builders superpose the two symbol streams using weights based on the square roots of `Alpha` and `1 - Alpha`, then generate the OFDM waveform and add the training and signalling fields.

The modulation controls include BPSK, QPSK/4-QAM, 16-QAM and 64-QAM. The supported operating combinations must be confirmed with the selected TX/RX pair.

The OFDM implementation uses a 64-point transform, 48 data subcarriers, four pilots and a 16-sample cyclic prefix. Each data symbol occupies 80 samples; its duration depends on the IQ rate.

### Receiver

The receiver captures frames, estimates and corrects frequency offset, aligns the frame, estimates the subcarrier channel and decodes the signalling fields and payload.

The superposition detector estimates one symbol stream, reconstructs its contribution and detects the residual stream. BCC decoding, descrambling and byte reconstruction produce the recovered messages. The V3 analysis also reconstructs reference symbols for its error/SNR calculations.

### Frame compatibility

| Frame field | First sample: single SIG | First sample: V4 | Length |
| --- | ---: | ---: | --- |
| STF | 0 | 0 | 160 samples |
| LTF | 160 | 160 | 160 samples |
| SIG | 320 | 320 | 80 samples |
| SIG 2 | — | 400 | 80 samples |
| DATA | 400 | 480 | Depends on payload and modulation |

Offsets are zero-based.

TX V4 uses `WLAN_SuperposedFrameBuild_V4.vi` and `WLAN_SigBuild2.vi`. RX `_17` interprets this format through `WLAN_FrameAnalysisV3.vi`, `WLAN_FrameContentV2.vi` and `WLAN_SigContent2.vi`.

RX `_13` uses the single-SIG interpretation through `WLAN_FrameAnalysis.vi`. RX `_17` also contains a single-SIG comparison path; select its V3 analysis when receiving TX V4.

## Two-channel reception

**CH0 and CH1 are physical receive channels. HP and LP are payload layers decoded from a received signal.**

The two-channel paths use `USRP_RXInit.vi` and `WLAN_FrameCapture - 2 Channels.vi`. The capture VI processes two rows of complex IQ data. Both RX `_13` and `_17` contain two-channel paths.

To use the second antenna, enable channels `0,1` on a compatible RX device, connect the corresponding RF inputs and confirm that both IQ streams and frame-valid indicators respond. Record the antenna-to-channel mapping with the measurement settings.

## BER, SNR and recording

BER measures the fraction of compared bits that differ from the reference message. A BER of **10% corresponds to 0.10**, or approximately ten incorrect bits per hundred compared bits.

Use the intended HP and LP messages as references. The `ObtainExpectedString*.vi` helpers can derive a reference from repeated received data; check that the resulting reference matches what TX sends.

Instantaneous BER, accumulated BER and filtered BER use different measurement windows. Keep the selected metric and filter window fixed when comparing runs or observing the arm response.

Check the numerical scale used by the displayed, recorded and threshold values. File inspection identified percentage conversion in both the instantaneous and filter paths of RX `_13`; the effective scaling still needs verification in LabVIEW. The intended arm stopping threshold remains **10% BER**.

Missing or rejected frames are separate from the BER of bits that reach the comparison path. The SNR outputs in RX `_17` also require validation with known test data before they are used for quantitative conclusions.

### Measurement files

| File | Recorded content identified in RX `_13` |
| --- | --- |
| `data_16QAM.txt` | Filtered reference value labelled `BER 16QAM`. |
| `data_OneChannel.txt` | Filtered LP of CH0, followed by filtered HP of CH0. |
| `data_TwoChannels.txt` | Filtered LP of CH0, filtered HP of CH0, filtered HP of CH1 and the selected value `BER HP3`. |

The fourth two-channel column follows the selection logic involving `State` and `Counter`. Check the selected receiver's export wiring when interpreting this column.

The text files use tab-separated columns, three decimal places and locale-dependent decimal separators. Record the run settings separately: VI names, USRP identifiers, antenna/channel mapping, carrier frequency, effective IQ rate, gain, HP/LP payloads, modulation, `Alpha`, BER metric and filter window.

Use `Abrir_RX.cmd` to prepare the recording directory. If recording reports error 10 because a target file already exists, move that measurement file to a separate run folder before starting a new recording.

## Robotic-arm demonstration

One arm represents **HP** and the other represents **LP**. Their movement depends on the BER of the corresponding received stream.

| Arm | Associated stream | Stopping condition |
| --- | --- | --- |
| HP arm | HP | Stops when HP BER exceeds 10%. |
| LP arm | LP | Stops when LP BER exceeds 10%. |

This provides a visual indication of reception quality: each stream's BER determines the motion of its associated arm.

Use `Receiver_Example - 2 Channel - Experiment_13.vi` for this demonstration, with the matching single-SIG transmitter configuration described above.

## Troubleshooting

| Symptom | Check |
| --- | --- |
| LabVIEW requests a supporting VI or control | Open `Demo_USRP_TX_RX.lvproj` and keep the complete `Proyecto/` folder and its supporting files together. |
| An NI-USRP, modulation, analysis or HTTP library is missing | Check that the required NI component supports the installed LabVIEW version. |
| The USRP is unavailable | Check device selection, physical connection and detection in the NI configuration tools. |
| Frames are not detected | Check carrier frequency, effective IQ rate, antenna ports, gain and trigger level. |
| SIG decoding fails | Check the single-SIG/SIG 2 pairing and the active RX analysis path. |
| One receive channel has no frames | Check channels `0,1`, antenna connections and the RF port mapping. |
| Decoded text or BER is inconsistent | Check reference messages, modulation settings, frame format and BER scale. |
| An arm stops | Check the BER of its associated stream. Above 10%, stopping is the intended behaviour. If the BER does not explain the stop, check the existing arm control connection and RX error indicators. |
| Recording reports error 10 | Move the existing output file to a separate measurement folder before a new recording. |
| Recording reports a missing directory | Check `Proyecto/data/` and run the RX recording-directory preparation before opening the receiver. |
| The RX launcher requests the supplied source VI | Use an unchanged project copy for directory preparation before LabVIEW compiles and saves the receiver. |

## Validation status

The project structure, principal TX/RX frame formats and relevant file dependencies have been examined through file analysis. The HP/LP arm behaviour and 10% stopping threshold described here correspond to the demonstrated behaviour reported by the project author.

The current project revision still requires a complete LabVIEW load and hardware run to confirm:

- Loading the principal TX/RX VIs and controls on both lab computers, and preparing the recording directory on Windows.
- Payload recovery, BER scaling and SNR measurements with the selected USRP settings and modulation combinations.
- Single-SIG TX/RX operation and the response of each arm when its associated BER exceeds 10%.
- Both receive channels with the intended antenna arrangement.

Record the working project revision and hardware/software settings after this check so the demonstration can be reproduced.

## Acknowledgement

The signal-processing implementation builds on the [OFDM Framework for LabVIEW and USRP](https://github.com/xiaoyun94/OFDM-Framework-LabVIEW), extended here for superposed HP/LP streams, configurable modulation, two-channel reception and BER-dependent robotic-arm motion.
