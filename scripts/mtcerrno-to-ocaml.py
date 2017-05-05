#!/usr/bin/env python

# Convert the MTC exit codes into a disjoint union type. Each line in the
# file looks like:

# errdef, MTC_EXIT_SUCCESS,                       0,  0,  "",

# Usage:
# cat ../xha.hg/include/mtcerrno.def | ./scripts/mtcerrno-to-ocaml.py >
# ocaml/xapi/xha_errno.ml

import sys


def parse(file):
    all = []
    while True:
        line = file.readline()
        if line == "":
            return all
        if line.startswith("errdef, MTC_EXIT"):
            bits = line.split(",")
            name = bits[1].strip()
            code = bits[2].strip()
            desc = bits[4].strip()
            this = {"name": name, "code": code, "desc": desc}
            all.append(this)


def ctor_name(x):
    ctor = x['name']
    return ctor[0].upper() + ctor[1:].lower()


def make_datatype(all):
    print "type code = "
    for x in all:
        print "| %s" % ctor_name(x)


def to_string(all):
    print "let to_string : code -> string = function"
    for x in all:
        print "| %s -> \"%s\"" % (ctor_name(x), x['name'])


def to_description_string(all):
    print "let to_description_string : code -> string = function"
    for x in all:
        print "| %s -> %s" % (ctor_name(x), x['desc'])


def of_int(all):
    print "let of_int : int -> code = function"
    for x in all:
        print "| %s -> %s" % (x['code'], ctor_name(x))
    print "| x -> failwith (Printf.sprintf \"Unrecognised MTC exit code: %d\" x)"

if __name__ == "__main__":
    all = parse(sys.stdin)
    print "(* Autogenerated by %s -- do not edit *)" % (sys.argv[0])
    make_datatype(all)
    to_string(all)
    to_description_string(all)
    of_int(all)
