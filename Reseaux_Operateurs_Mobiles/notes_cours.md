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

---

Wednesday, 05. February 2020 02:00PM 

---

Contention window: it choses from 0 to max
Congesion window: used by TCP. 

*#72*
Objective to have the best throughput.

Samplerate try all the bit rates and try to find the best one (the one with the best performance).
Use other bit rates, if one is better we switch else we stay with the base bitrate.

Only sample the best that are either perfect or can do better.

*#75*
If the lossless transmission time is greater thant the average transmission time, there is no point to use it as a sample.

*#77*
For 11 takes in average one transmission and one retry.

*#82*
Choose the rate while transmitting in broadcast.
For the broadcast, we send with the lowest rate so that everyone can receive it.

*#88*
By sending a packet to the access point, we can calculate the distance to it thanks to the speed light and how long it takes to get to the AP.

Obstacles can make the signal strength to drop.

*#91*
Base stations are localisation points.
On every black dot, we're going to measure the signal strength.

A database stores all the location and signal strength of the base stations.
We measure the ss of the base stations and compare the value to the database.


*#96*
Measurement in all directions to have a better measurement. (SS can be weaker if the BS is in the user's back).
We need to adapt is the building structure changes.

*#100*
Medium error distance of 2.94m (10m for GPS)

---

#### Ad-Hoc Architecture

*#107*
Every device become a host, they transmit and forward packets for other stations.

*#117*
**Routing**

*#120*
Two major protocoles:

- Proactive: independent of traffic pattern
- Reactive: calculates route only when there's traffic

With proactive, we know where to send the packet
For the users, Proactive is gonna look fast because all the routes were previously calculated.
Proactive is fast but we have to keep updating the database all the time.

Reactive less complicated to implement.
Flooding is going to find the best path but it's very costy and the network can collapse under the congestion.

*#128*
It's not a sustainable way to find the path.

---

Thursday, 06. February 2020 02:00PM 

---

The goal is to reduce the number of transmissions to deliver one packet. 

- First time: we transmit in broadcast to everyone to send a packet to D
- Every node transmit the packet to everyone
- When D receives the packet, he knows he's the destination and know the source.
- He sends a packet back to the last node (J) and every node do the same
- S receives the packet from E and knows that he has to send a packet to E if he wants to speak to D

If the structure is changing, the routing doesn't work. 

*#134*
**DSR**
When we receive a path, we use it a lot for data packets for a few minutes and then we floof again to find another path.

*#135*
The source floods a **Route Request**.
Each node forward the RREQ with their identifier.

*#142*
We respond to the first RREQ.
The route is saved by the source. Then it's used by putting it in the packet header when we transmit.

How long should the source use the path received in the RREQ packet?
Depends on the network. 1 min by default.

*#146*
Problem -> we need to add the full path in the head.

*#148*
**DSR disadvantages*
Random delays to avoid RREQ transmission collisions.

High header size problem:

Instead of relying on the head of the packet, every station has an ARP table that indicates a destination and the node to send the packet.

E

| Dst | GW|
|---|---|
| S | S |


F

| Dst | GW|
|---|---|
| S | E |

*#151*
Routing isn't included in the header anymore.

DIsadvantage because S only knows how to transmit to D and not to F,J. We loose the capability of reverse logic.

Problems: link breaks and loops.
With whole path, no loops possible. With AODV, there can be loops.

**DSR** and **AODV**

*#168*
To use Dijkstra to find a path between two machines on the internet, we need the size and the weights of the graph.
To know the topology, we've to ask our neighbots.
Every node send a "Hello" packet. 

LSU - Link State Update - packet. A is sending it's links information to B and C that are going to forward it.
LSU packets are flooded on the all network. Eventually, every one is going to have the whole graph and we can run Dijkstra.

OSPF separates into zones s it's only going to flood in the zone.
Need to reduce the cost of flooding.

*#169*
**OLSR - Optimized Link State Routing** 
Need to reduce the information

*#170*



