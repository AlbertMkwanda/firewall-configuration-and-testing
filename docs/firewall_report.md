# Firewall Configuration and Testing Report

## Student
Albert Mkwanda

## Objective
The whole point of this project was to set up a firewall that only permits the traffic we actually need and blocks the rest. In a real environment, that is the first line of defense, even if it is a small and controlled setup for coursework.

## Method

I started by setting a baseline policy of deny inbound and allow outbound. From there, I only opened the ports needed for approved services and left everything else closed. After the rules were in place, I tested the traffic to see which connections were allowed and which were blocked.

## Policy summary

- Default inbound: deny
- Default outbound: allow
- Approved services: SSH, HTTP, HTTPS, DNS where needed
- Unapproved traffic: blocked unless a rule is added deliberately

## Evidence collected

- Firewall status output after configuration
- Port checks for allowed and blocked connections
- Screenshots or terminal records of the test results

## Findings

The firewall behaved the way it was supposed to. It was able to block traffic that should not be reachable and still allow the services that were meant to be available. That is the main lesson here: a simple firewall policy goes a long way when it is explicit and restrictive.

## Recommendation

The policy should be reviewed regularly and updated whenever the system role changes. A firewall is only as good as the rules behind it, and the rules need to be kept current.
