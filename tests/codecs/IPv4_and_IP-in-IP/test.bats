#!/usr/bin/env bats

PCAP="fragged-teredo.pcap"
CFG="snort.lua"
OPTION="-A log_codecs -q"

@test "IP-in-IP and IPv4 - Fragged Teredo" {
    $snort -r $PCAP -c $CFG $OPTION > snort.out
    diff expected snort.out
}

teardown()
{
    rm -f snort.out
}
