# Firewall Test Plan

## Objective
The purpose of this test plan is to confirm that the firewall is allowing only the traffic it should and refusing everything else. The idea is to validate the policy under controlled conditions so the outcome is clear and easy to show in the report.

## Scope

- Local Windows or Linux host with firewall support
- Controlled traffic only
- No production network or public-facing environment

## Rules to document

- Rule name
- Action: allow or block
- Protocol
- Port
- Direction
- Scope
- Profile

## Example validation steps

1. Enable the firewall.
2. Check the default behavior for incoming and outgoing traffic.
3. Allow only the ports that are genuinely required.
4. Try access from the same machine and, if possible, from another device on the same network.
5. Confirm that blocked ports fail as expected.

## Evidence to keep

- Terminal output from the firewall configuration
- Screenshots of the active rules
- Screenshots or logs from allow/block checks
- Notes on what worked and what did not
