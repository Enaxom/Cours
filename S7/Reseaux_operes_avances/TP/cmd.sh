ra-1 r-1 r-2 r-3 ra-2
ra-1 -> ping  -I 192.168.1.1 192.168.2.1 (ping ra-2 avec l'adresse de l'interface interne)
LSP aller diff de LPS retour

r-2 regarder ce qui arrive de fe0
tcpdump -i fe0

r-1 Quand ça marche on voit les messages arrivés sur r-2
Besoin de décrire une fec

Tables de routage /etc/iproute2/rt_tables

ip route add 192.168.60.0/24 encap mpls 100 via inet 192.168.20.1 table client1
	Label 100
	Route dans la table du client A et B

ip -f mpls route add 100 as 200 via inet 192.168.30.3 dev v0
	Ce qui arrive avec le numéro 100 part avec 200 (swap) à 30.3

Exercice 1
de r1 à r5
sysctl -w net.mpls.platform_labels=4096

pour r-1 sur fe2 et r-4 sur fe1
r-2 r-3 sur fe0 
r-5 sur fe1
sysctl -w net.mpls.conf.fe2.input=1
sysctl -w net.mpls.conf.fe1.input=1
sysctl -w net.mpls.conf.fe0.input=1
sysctl -w net.mpls.conf.fe1.input=1

Commande pour les routeurs de sortie
sysctl -w net.ipv4.conf.v1.rp_filter=0

r-1
ip rule add iif fe0 table clientA
ip route add 192.168.1.0/24 encap mpls 23 via inet 17.0.2.2 table clientA

r-2
ip -f mpls route add 23 as 42 via inet 17.0.3.3 dev fe0
ip -f mpls route add 23 as 42 via inet 17.0.4.3 dev fe0

ip -f mpls route add 23 as 42 via inet 17.0.41.10 dev fe1
ip -f mpls route del 23 as 42 via inet 17.0.41.10 dev fe1

ip -f mpls route del 23 as 42 via inet 17.0.3.3
ip -f mpls route add 23 as 42 via inet 192.168.2.1 dev fe1
ip -f mpls route add 23 as 42 via inet 17.0.3.3 dev fe0

ip -f mpls route add 23 as 42 via inet 17.0.3.3
