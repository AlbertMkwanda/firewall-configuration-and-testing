# Albert Mkwanda - Firewall Configuration and Testing

**Student:** Albert Mkwanda  
**Serial no.:** 1  
**Project title:** Firewall Configuration and Testing

## Project brief
This project is about setting up a firewall to control traffic in a controlled environment. I used the idea behind Windows Defender Firewall and Linux UFW to build a simple but practical setup that blocks unwanted traffic while allowing only the services that are actually needed.

The goal was not to make a production system, but to show how a basic firewall policy works, how it is documented, and how to test whether the rules behave as expected.

## What I focused on

- Keeping the default inbound policy strict.
- Allowing only the services that are required for normal use.
- Blocking everything else unless it is explicitly approved.
- Testing both allowed and denied traffic to confirm the rules are doing their job.
- Recording evidence so the project is easier to explain in the portfolio.

## Deliverables

- A script to configure the firewall rules.
- A validation script or checklist to test the firewall.
- A short report showing the policy, the testing steps, and the outcome.

## Folder structure

- `scripts/ufw_setup.sh` — Linux UFW example setup
- `scripts/windows_firewall_setup.ps1` — Windows Defender Firewall example
- `scripts/validate_firewall.py` — helper for validation and reporting
- `docs/firewall_report.md` — project report
- `docs/firewall_test_plan.md` — evidence and testing checklist

## Recommended workflow

1. Pick either Linux UFW or Windows Firewall.
2. Define a baseline policy before opening any ports.
3. Allow only the minimum required network services.
4. Keep inbound access restricted unless it is absolutely necessary.
5. Test both allowed and blocked connections.
6. Save the output and screenshots as proof.

## Example commands

Linux:

```bash
sudo ./scripts/ufw_setup.sh
sudo ufw status verbose
```

Windows PowerShell as administrator:

```powershell
Set-ExecutionPolicy -Scope Process Bypass
./scripts/windows_firewall_setup.ps1
Get-NetFirewallRule | Format-Table DisplayName, Enabled, Direction, Action
```

## Notes

This project is kept separate from the earlier fraud-detection work in the workspace, and it follows the task assigned in COMPREHENSION-1_121908.pdf.
