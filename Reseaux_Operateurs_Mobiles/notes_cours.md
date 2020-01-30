# Mobile wireless networks

Wednesday, 29. January 2020 04:20PM 

---

**TODO - slide 4**

### WiFi

*#7*
Wifi supports two network architectures:

- WLAN
- Ad-hoc

#### WLAN Architecture

*#8*
Access point wired to the Internet.
Wireless part -> multiple access channel.

*#9*
There is a collision if two stations transmit to the AP simustanously, there's a need for a protocol.
We need a minimal packet size for CSMA because we have to detect the collsion. To detect it, it take in the worst case two times the propagation delay (2Tp). 

Assumptions in the Internet
We have to know if the receiver can receive the packet we transmit.

CSMA/CD makes the assumption that if I hear nothing, the other stations don't hear something.

If I want to transmit and I don't hear network trafic, there's a high probability the receiver is also free.

Same question with wireless network to know if we can transmit to the access point (if the receiver is free). 

*pathloss:* the fact that the wireless signal get weaker with distance.

The assumption that we made for Ethernet doesn't work for wifi network -> all stations don't hear the others and can think the access point is free in the same time and have a collision.
=> Called hidden termial problem.

A transmits to AP saying he wants to transmit for 2ms: **RTS**. 
The AP (when free) is gonna send a packet saying to everyone that there will be a transmission for the next 2ms: **CTS**. 
B is gonna hear from the AP packet like everyone else around, seeing the destination address and B will know he'll the future receiver. All the stations that have receive the CTS know that they're not A and don't have to transmit for some time.
A sees he's free to transmit, B know that he has to differ during the duration indicated in the CTS.

If A transmits an RTS and B also at the approximately same tie, collision.

*Exposed terminal problem:* when a stations prevents itself to talk by fear to create a collision because another stations is talking, but this station is out of range and there wouldn't be a collision.

If a station hear a RTS and not a CTS, he can transmit because it means that the station that sent the CTS is too far away and if it transmits there won't be a collision. 
He then transmits a RTS.

*#30*
We cannot do collision detection in wireless connection, listening is useless.
=> CSMA/CA (Collision Avoidance)

*#37*
Wifi uses the ISM frequency.
Frequencies free to use for anyone.

Avoiding collisions isn't enough.

---

Thursday, 30. January 2020 02:00PM - TP

---


