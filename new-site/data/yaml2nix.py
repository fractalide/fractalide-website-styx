#! /usr/bin/env nix-shell
#! nix-shell -i python3 -p python3 python3Packages.pyyaml

import sys
import yaml

def emit_list(list):
  return "[\n{}\n]".format("\n".join(emit(item) for item in list))

def emit_dict(d):
  return "{{\n{}\n}}".format("\n".join(
    '"{}" = {};'.format(k, emit(v)) for k, v in d.items()
  ))

def emit_str(s):
  return '"{}"'.format(s)

def emit_else(v):
  return repr(v)

def emit(v):
  if isinstance(v,dict):
    return emit_dict(v)
  elif isinstance(v,list):
    return emit_list(v)
  elif isinstance(v,str):
    return emit_str(v)
  elif v is None:
    return ""
  else:
    return emit_else(v)

def main(argv):
  if len(argv) > 0:
    exit("py2yaml takes no parameters. Just feed me yaml on stdin and you'll "
         "get your nix on stdout.")
  for data in yaml.safe_load_all(sys.stdin):
    print(emit(data))

if __name__ == "__main__":
  main(sys.argv[1:])
