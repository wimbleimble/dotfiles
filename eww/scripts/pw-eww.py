#!/usr/bin/env python3
import subprocess
import argparse
import sys

def get_and_print_volume():
    wpctl_call = subprocess.run(["wpctl", "get-volume", "@DEFAULT_AUDIO_SINK@"],
                                capture_output=True) 
    volume = float(wpctl_call.stdout.split()[1])
    print(volume)
    sys.stdout.flush()

def get_volume_cmd(args):
    get_and_print_volume()

    if args.watch:
        pactl_call = ["stdbuf", "-o0", "-e0", "pactl", "subscribe"]
        with subprocess.Popen(pactl_call, bufsize= 1, stdout=subprocess.PIPE,
                              universal_newlines=True) as pactl:
            if pactl.stdout is None:
                return
            for line in iter(pactl.stdout.readline, ""):
                event = line.split()
                if event[1] == "'change'":
                    get_and_print_volume()


def create_parser():
    parser = argparse.ArgumentParser(prog="pw-eww")
    subparsers = parser.add_subparsers(title="subcommands", help="what do?")

    parser.add_argument("--watch", action="store_true", help="watch for changes")
    # subcommands
    get_parser = subparsers.add_parser("get-volume", help="get volume")
    get_parser.set_defaults(func=get_volume_cmd)

    return parser
    

def main():
    parser = create_parser()
    parsed = parser.parse_args()
    parsed.func(parsed)
    

if __name__ == "__main__":
    main()
