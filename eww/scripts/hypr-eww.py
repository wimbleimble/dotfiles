#!/usr/bin/env python3
import subprocess
import argparse
import json
import socket
import os
import sys

workspace_names = {
    1: "",
    2: "",
    3: "",
    4: "",
    5: "",
    6: "",
    7: "",
    8: ""
}

HYPR_SOCKET = f"{os.getenv('XDG_RUNTIME_DIR')}/hypr/{os.getenv('HYPRLAND_INSTANCE_SIGNATURE')}/.socket2.sock"

def get_and_print_workspaces(args):
    hyprctl_call = subprocess.run(["hyprctl", "workspaces", "-j"], capture_output=True)
    workspaces = json.loads(hyprctl_call.stdout)
    relevant = [{"id": workspace["id"], "name":
                 workspace_names.get(workspace["id"]) if
                 workspace_names.get(workspace["id"]) is not None else
                 workspace["id"], "windows":
                 workspace["windows"]} for workspace in workspaces]

    ordered = sorted(relevant, key=lambda x: x["id"])
    print(json.dumps(ordered))
    sys.stdout.flush()


def get_workspaces_cmd(args):
    get_and_print_workspaces(args)    

    if args.watch:
        with socket.socket(socket.AF_UNIX) as sock:
            sock.connect(HYPR_SOCKET)
            while True:
                char = sock.recv(1)
                if char == b"\n":
                    get_and_print_workspaces(args)



def set_workspace(args):
    print("setting workspaces")

def inc_workspace(args):
    print("incrementing workspace")
    
def dec_workspace(args):
    print("decrement workspace")


def create_parser():
    parser = argparse.ArgumentParser(prog="hypr-eww")
    subparsers = parser.add_subparsers(title="subcommands", help="what do?")

    parser.add_argument("--watch", action="store_true", help="watch for changes")
    # subcommands
    get_parser = subparsers.add_parser("get", help="get workspaces")
    get_parser.add_argument("--urgent", action="store_true", help="return urgent workspaces")
    get_parser.set_defaults(func=get_workspaces_cmd)

    set_parser = subparsers.add_parser("set", help="set workspaces")
    set_parser.add_argument("id")
    set_parser.set_defaults(func=set_workspace)

    inc_parser = subparsers.add_parser("inc", help="increment workspaces")
    inc_parser.set_defaults(func=inc_workspace)

    dec_parser = subparsers.add_parser("dec", help="decrement workspaces")
    dec_parser.set_defaults(func=dec_workspace)

    return parser
    

def main():
    parser = create_parser()
    parsed = parser.parse_args()
    parsed.func(parsed)
    

if __name__ == "__main__":
    main()
