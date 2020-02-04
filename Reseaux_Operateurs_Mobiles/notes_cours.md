# Mobile wireless networks

Wednesday, 29. January 2020 04:20PM 

---

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

Thursday, 30. January 2020 02:00PM - TP (#40)

---

Monday, 03. February 2020 02:00PM 

---

*#48*
If we send multicast or broadcast, there are multiple destinations, if there is a hidden terminal it's gonna cause a collision.
If we send an RTS to a group, it impose to all of them to respond. If they all answer, there will be a collision. 

Unicast
If there is a loss, we have to transmit again the packet.

**Backoff**
When there is a failure, we're gonna calculate a backoff time:
`Backoff Time = Random() x SlotTime`
`Random() between [0,CW]`
When there is a success, we reset the window to CWmin.

Assumption made:
If there is no CTS or ACK, there is a collision.

**Backoff with broadcast trafic**
If you ask everyone to send CTS or ACK, everyone is going to collapse.

*#49*
No hidden terminals, sense the signal and defer because A is transmitting.
Other stations freeze their backoff when someone is transmitting to avoid collisions.
We have to backoff for every packet. 

*#52*
**Quality of service**
802.11 (Wifi) can provide different priorities to different applications, users, or data flows by using different backoff counters for different nodes.
We can implement different backoff size for different services. Voice, lower max value.

Wifi can't guarantee a certain level of performance to a data flow.
We're doing random access so we can't guarantee anything.

*#60*
If the signal is very weak we have to use a lower bit-rate

*#63*
**Auto Rate Fallback**
We start at the highest rate and then move to the next lower bitrate if a packet is dropped.
Moves to the next higher bitrate if 10 successive packets have occured without retransmissions.

4 retransmissions before a packet is dropped.
Important weakness.

*#64-66*
**Onoe**

*#70*
**Receiver Based Auto-Rate RBAR**
SNR: Signal to Noise Ratio

*Example*
SA -> AP - 18 Mbps
SB -> AP -   6 Mbps
A = 3B so B transmits 3 times more than A.
A - BBB - A - BBB - ...
*Throughput:* 1/4 * 18 + 3/4 * 6 = 9

When A has the access, it can transmit 3 packets and B only one so that the throughput would be 12 and each station speaks equally.

*#71*
**Opportunistic Auto-Rate**
*Example*
SA -> AP - 18 Mbps
SB -> AP -   6 Mbps
Default throughput 9 -> can go to 12
