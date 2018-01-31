include Ctypes
let lift x = x
open Ctypes_static

let rec field : type t a. t typ -> string -> a typ -> (a, t) field =
  fun s fname ftype -> match s, fname with
  | View { ty }, _ ->
    let { ftype; foffset; fname } = field ty fname ftype in
    { ftype; foffset; fname }
  | _ -> failwith ("Unexpected field "^ fname)

let rec seal : type a. a typ -> unit = function
  | Struct { tag; spec = Complete _ } ->
    raise (ModifyingSealedType tag)
  | Union { utag; uspec = Some _ } ->
    raise (ModifyingSealedType utag)
  | View { ty } -> seal ty
  | _ ->
    raise (Unsupported "Sealing a non-structured type")

type 'a const = 'a
let constant (type t) name (t : t typ) : t = match t, name with
  | Ctypes_static.Primitive Cstubs_internals.Uint, "PCI_ACCESS_DUMP" ->
    Unsigned.UInt.of_string "9"
  | Ctypes_static.Primitive Cstubs_internals.Uint, "PCI_ACCESS_AUTO" ->
    Unsigned.UInt.of_string "0"
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_CB_SUBSYSTEM_ID" ->
    66
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_CB_SUBSYSTEM_VENDOR_ID" ->
    64
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_HEADER_TYPE_CARDBUS" ->
    2
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_SUBSYSTEM_ID" ->
    46
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_SUBSYSTEM_VENDOR_ID" ->
    44
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_HEADER_TYPE_NORMAL" ->
    0
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_HEADER_TYPE" ->
    14
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_CLASS_OTHERS" ->
    255
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_SIGNAL" ->
    17
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_CRYPT" ->
    16
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_SATELLITE" ->
    15
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_INTELLIGENT" ->
    14
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_WIRELESS" ->
    13
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_SERIAL" ->
    12
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_PROCESSOR" ->
    11
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_DOCKING" ->
    10
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_INPUT" ->
    9
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_SYSTEM" ->
    8
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_COMMUNICATION" ->
    7
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_BRIDGE" ->
    6
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_MEMORY" ->
    5
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_MULTIMEDIA" ->
    4
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_DISPLAY" ->
    3
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_NETWORK" ->
    2
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_BASE_CLASS_STORAGE" ->
    1
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_CLASS_NOT_DEFINED" ->
    0
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_RESCAN" ->
    65536
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_MODULE_ALIAS" ->
    512
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_PHYS_SLOT" ->
    256
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_EXT_CAPS" ->
    128
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_CAPS" ->
    64
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_CLASS" ->
    32
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_SIZES" ->
    16
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_ROM_BASE" ->
    8
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_BASES" ->
    4
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_IRQ" ->
    2
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_FILL_IDENT" ->
    1
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_REFRESH_CACHE" ->
    4194304
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_CACHE" ->
    2097152
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_SKIP_LOCAL" ->
    1048576
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_NETWORK" ->
    524288
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_MIXED" ->
    262144
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_NO_NUMBERS" ->
    131072
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_NUMERIC" ->
    65536
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_PROGIF" ->
    16
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_SUBSYSTEM" ->
    8
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_CLASS" ->
    4
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_DEVICE" ->
    2
  | Ctypes_static.Primitive Cstubs_internals.Int, "PCI_LOOKUP_VENDOR" ->
    1
  | _, s -> failwith ("unmatched constant: "^ s)

let enum (type a) name ?typedef ?unexpected (alist : (a * int64) list) =
  match name with
  | s ->
    failwith ("unmatched enum: "^ s)
