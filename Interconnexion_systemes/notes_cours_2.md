# Internetworking networks

Tuesday, 11. February 2020 02:03PM 

---

*#Page_number*

*#1*
Key to internetworking -> **black boxes**

- Heterogeneity
- Scale

*#2*
Different black boxes by layers.

**Physical layer**
Hub/Repeater is the black box.
The repeater has several ports. He's gonna send what he received on one port to the other ports to amplify the signal.
Objective to make a ethernet network bigger.

*#3*
Repeaters can't handle heterogeneity between wifi (wave) and ethernet (electric signal).

Bridge more sophisticate interconnection box.

Bridges can understand the headers. It's a layer two (Data link) box.

A --- B --- Bridge --- C
 If A transmits to B, C won't receive it because Bridge know were is B (which port).
 
 Has this table:
 
 | Addr | Port |
 |---|---|
 | B | 1 |
 | A | 1 |
 
 *#4*
 Every bridge
 
 - forward
 - learn
 - filter
 
*Difference between forwarding and routing*
The routing is to find the path to the destination, to create the forwarding table. The forwarding is just look in the table and forward on the good port.

If we receive too much packet to forward, we buffer them before we can send it. We can drop packets (the ones with less priority).

*#7*
The MAC address has no structure, globally unique. IP address are classed, has location and can be grouped. 

Problem with bandwidth also when we have to flood.

The bridge can create loops because he's blinded but the spanning tree problem avoid it.

*#8*
The bridges can read header so he can translate it so the bridges can handle heterogeneity. 
The difference between wifi and ethernet is a layer two problem.
IP does scale very well but for him everyone is IP.

The bridges work better than hub and limit the broadcast transmissions of packer. In term of scale it does much better.
Bridges are also heterogene by translating. Processing cost nothing so there is no problem to do the translation.

The routers connect with different networks. 

*#9*
All the bridges send a packet with their identifier.
The bridge know that he's the smallest looking at all the other packets received.







