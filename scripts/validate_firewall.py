"""Simple firewall validation helper for coursework reporting.

This script prints a checklist describing what should be tested after a firewall
configuration is applied. It does not modify system rules directly.
"""

from __future__ import annotations

COMMON_PORTS = {
    "http": 80,
    "https": 443,
    "ssh": 22,
    "dns": 53,
}


def print_validation_summary() -> None:
    print("Firewall validation checklist")
    print("-" * 32)
    print("1. Confirm default policy is deny inbound and allow outbound.")
    print("2. Verify required ports are open only for approved services.")
    print("3. Attempt a blocked connection to a denied port.")
    print("4. Test an allowed service and confirm it succeeds.")
    print("5. Record screenshots or command output as evidence.")
    print()
    print("Example service ports:")
    for name, port in COMMON_PORTS.items():
        print(f"  - {name}: {port}")


if __name__ == "__main__":
    print_validation_summary()
