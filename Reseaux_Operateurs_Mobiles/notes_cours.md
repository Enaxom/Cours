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

Multipoint relays

*#170*
A is gonna broadcast the packet and everyone is going to forward it.
Reduce the number of transmissions necessary so that every station receive the link sent by A.

We want that when A transmits in broadcast, only C and E forward and that B,F and D know that it's unnecessary to forward.

C and E are **multipoint relays**.
Once we find who are the multipoint relays, we're going to ask only to them to forward.

When the machine wakes up, she sends a Hello message so everyone knows their neighbors.
A's gonna receive the hello message of B,C,D,E,F.

How to identify the multipoint relay?
We can add information is the hello packet.
Hello, name, neighbors. Now we can identify the multipoint relays.

When A receive a hello packet containing neighbors that are the same as him, then he knows they're not multipoint relays. If the packet contains a neighbor which is not one of his neighbor then he knows that's a multipoint relays.

*#173*
Summary OLSR

### IoT

*#174*
Definitions

*29*
Basic IoT Architecture
Wireless communication to a GateWay.
5G, 4G or ethernet.
When it's connected to the Internet, it's gonna communicate with the information system.

Issues to store and process data.

*30*
Sensors can be very different. 
Scale in number of device. 

LPWAN - Low Power Wireless Area Network (LoRa, Sigfox, small sensor)
Need to design protocoles that allow those types of device to last a long time while sending data.

WPAN - Wireless Personal Area Network (IEEE, BLE, Wifi)

*32 - #200*
**Bluetooth**
Low power, low cost, short range

*33 - #202*
**WPAN**

*#204*
Bluetooth defines up to application layer.

*#206*
Use of ISM (free frequency) so there can be interferences.

*#207*
Bluetooth designed for cable replacement. Design protocole which is deterministic, master/slave.

*#209*

| Bluetooth protocol stack |
|---|
| Application group |
| Middleware protocol group |
| Transport protocol group |

*#214*
**Baseband** - Layer 2

MAC layer, protocol for multiple channel access.

*#220*
Take a band of 2.4MHz and split in bands of 1MHz.
-> 79 sub channels

Always jumping to another frequency.
If all the machine use the same seed and pseudo random generator then the'll all jump to the same frequency.

To communicate we need the same seed but how to decide the seed if we can't communicate.

*#221*
Change of frequency every 625 µs.
Every packet is transmitted and received on different frequencies. Need of very good clocks.
This reduices the exposure to interference.

*#223*
Time divided
Masters controls everything.

Jitter difference of delay.

*#224*
Example transmissions

*#226*
**Piconet**

*#227*
Certain frequencies for the purposes.

*#228*
Inquire sent to send a request.

*#42*
If all of them respond and transmit a packet, there will be collisions.

Train sequence of seeds.

*#43*
They can't all respond. Need a kind of backoff.
We'd like to transmit on all frequencies and still have the chance to receive.

---

Wednesday, 12. February 2020 10:15AM 

---

*#Transmitting Inquiry Messages - 2*
Two steps process

- neighbor discovery
- connection establishment

Stations are gonna transmit on one slot and receive on the next slot.
They stay the duration of one train in the frequency so that every station can communicate.
No matter which frequency are the other stations, they are going to hear from the master.

Errors are inevitable. Need to deal with failures due to collision and error.

-> Need to do a backoff.
Cannot do a backoff on a particulary slot. 
Doind a backoff on the window (the train) is gonna work. Backoff on the number of train.

The station has a X backoff and is gonna wait X train transmissions before transmitting.

How to find the contention window, 0 to which number.
Bluetooth uses **127**. Random number from [0-127].

Don't adapt the window when broadcast because he can't see if it failed so can't adapt the window.

Can't have a mechanism with exponential backoff because the master is transmitting broadcast messages and the stations that speak to him won't receive an ack.

The inquiry to the master is going to be transmitted 4 times. 

*#What about noise?*

*#Inquiry Scan*

*#Inquiry response*
The response packet to the inquiry contains the machine id.

*#236*
10.24 seconds -> Worst case contains 10 seconds for bluetooth devices to discover each other.

*#237*
**Paging**
Try now to establish connection.
The device starting the paging become the master of the piconet.

*#Step 1: Page scanning*
Same as before except that this time we send a packet to station A first then B so they can response right away.

*#Paging: Step 2 & 3*
The master sends the synchronisation packet so that every stations are gonna synchronized with the master's clock.

*#Paging: Step 4*
The station is going to use the seed to generate the frequency hopping.

*#Paging: Step 5*
The slave has an Active Member Address.
The master sends a packet to be sure the station is synchronized.

*#Paging: Step 6*
The new synchronized connection is established.

*#244*
**Transport Protocol Group Stack: Link Manager**
Limite interferences.

*#Link Manager*
Can create two types of connection with different quality of service.

*#Asynchronous Connection*

*#Synchronous Connection Oriented*

*#249*
Provide some slaves with transmission slots. Every six slots, he transmits, it's perfectly period.

*#250*
Power Management is very importent in IoT.
For wifi we didn't care about this. Equipments with big batteries, access point plugged in.
Power consuption is a major concern for bluetooth.

Only time to optimize when the device does nothing.
Radio is always trying to detect packet, consumes a lot of energy. Half as when he receives a packet.

Idea to sleep when we don't receive or transmit.
If we're a receiver, how to know when someone is trying to transmit us a packet.

*#Link Manager Operation*
*Active* -> machine fully awake, max power
Others different mode from high power to low.

*#Active Mode*

*#Hold Mode*
Keep the AMA. Time after which the slave revives and synchronized with the traffic.
Reduce energy consuption.

*#Sniff Mode*
Come back to sleep and weke up periodically.

*#Park Mode*
Still in frequency hoping. Able to reconnect.

*#264*
Bluetooth slotted system of 625 µs slot.

**L2CAP**

*#L2CAP*
*#Segmentation/Reassembly*
*#Quality of service*
Can implement it on the layer L2CAP.

*#270*

*#SDP*
*#Summary*
Works even if the line of sight is not clear.

*#LoRaWAN*
- WPAN -> short range
- LPWAN -> long range
- Cellular -> long range

Designed for application that generates little traffic. Very small data rate.

*#LoRaWAN Architecture*
Gateway connected to the Internet. Uses power most of the time.
Application server to collect all the data. With LoRa we can build all the application service we want.

AS -> hw to store, process the data.

*#End devices*
The gateway can receive from all frequencies in parallel.
Simplify the protocol.
The lower the frequencies are the better. Cannot transmit more than 1% of the time on high frequencies (800-900).

*#End device classes*
*#Class A*
Wake up when they have a data to transmit and transmits.
LoRa, when they transmit, open 2 slots to receive. Stake wake up a little.
Best in term of energy consuption. But GW will have to wait if it has to clean the sensor.

*#Class B*
Scheduled receive slots.
Weke up periodically to receive but need to be synchronized, sophisticated protocole, gonna ocnsume energy.

*#Class C*
Also optional.
The device is always awake and the only time he doesn't receive is when he transmits.
Worst in term of power consuption.

*#The ED Classes Tradeoff*










