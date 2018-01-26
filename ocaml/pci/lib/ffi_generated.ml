module CI = Cstubs_internals

external libpci_stub_1_pci_alloc : unit -> CI.voidp
  = "libpci_stub_1_pci_alloc" 

external libpci_stub_2_pci_init : _ CI.fatptr -> unit
  = "libpci_stub_2_pci_init" 

external libpci_stub_3_pci_cleanup : _ CI.fatptr -> unit
  = "libpci_stub_3_pci_cleanup" 

external libpci_stub_4_pci_scan_bus : _ CI.fatptr -> unit
  = "libpci_stub_4_pci_scan_bus" 

external libpci_stub_5_pci_get_dev
  : _ CI.fatptr -> int -> int -> int -> int -> CI.voidp
  = "libpci_stub_5_pci_get_dev" 

external libpci_stub_6_pci_free_dev : _ CI.fatptr -> unit
  = "libpci_stub_6_pci_free_dev" 

external libpci_stub_7_pci_lookup_method : _ CI.fatptr -> int
  = "libpci_stub_7_pci_lookup_method" 

external libpci_stub_8_pci_get_method_name : int -> CI.voidp
  = "libpci_stub_8_pci_get_method_name" 

external libpci_stub_9_pci_get_param : _ CI.fatptr -> _ CI.fatptr -> CI.voidp
  = "libpci_stub_9_pci_get_param" 

external libpci_stub_10_pci_set_param
  : _ CI.fatptr -> _ CI.fatptr -> _ CI.fatptr -> int
  = "libpci_stub_10_pci_set_param" 

external libpci_stub_11_pci_walk_params
  : _ CI.fatptr -> _ CI.fatptr -> CI.voidp = "libpci_stub_11_pci_walk_params" 

external libpci_stub_12_pci_read_byte : _ CI.fatptr -> int -> Unsigned.uint8
  = "libpci_stub_12_pci_read_byte" 

external libpci_stub_13_pci_read_word : _ CI.fatptr -> int -> Unsigned.uint16
  = "libpci_stub_13_pci_read_word" 

external libpci_stub_14_pci_read_long : _ CI.fatptr -> int -> Unsigned.uint32
  = "libpci_stub_14_pci_read_long" 

external libpci_stub_15_pci_read_block
  : _ CI.fatptr -> int -> _ CI.fatptr -> int -> int
  = "libpci_stub_15_pci_read_block" 

external libpci_stub_16_pci_read_vpd
  : _ CI.fatptr -> int -> _ CI.fatptr -> int -> int
  = "libpci_stub_16_pci_read_vpd" 

external libpci_stub_17_pci_write_byte
  : _ CI.fatptr -> int -> Unsigned.uint8 -> int
  = "libpci_stub_17_pci_write_byte" 

external libpci_stub_18_pci_write_long
  : _ CI.fatptr -> int -> Unsigned.uint16 -> int
  = "libpci_stub_18_pci_write_long" 

external libpci_stub_19_pci_write_block
  : _ CI.fatptr -> int -> _ CI.fatptr -> int -> int
  = "libpci_stub_19_pci_write_block" 

external libpci_stub_20_pci_fill_info : _ CI.fatptr -> int -> int
  = "libpci_stub_20_pci_fill_info" 

external libpci_stub_21_pci_setup_cache
  : _ CI.fatptr -> _ CI.fatptr -> int -> unit
  = "libpci_stub_21_pci_setup_cache" 

external libpci_stub_22_pci_find_cap
  : _ CI.fatptr -> Unsigned.uint -> Unsigned.uint -> CI.voidp
  = "libpci_stub_22_pci_find_cap" 

external libpci_stub_23_pci_filter_init : _ CI.fatptr -> _ CI.fatptr -> unit
  = "libpci_stub_23_pci_filter_init" 

external libpci_stub_24_pci_filter_parse_slot
  : _ CI.fatptr -> _ CI.fatptr -> CI.voidp
  = "libpci_stub_24_pci_filter_parse_slot" 

external libpci_stub_25_pci_filter_parse_id
  : _ CI.fatptr -> _ CI.fatptr -> CI.voidp
  = "libpci_stub_25_pci_filter_parse_id" 

external libpci_stub_26_pci_filter_match : _ CI.fatptr -> _ CI.fatptr -> int
  = "libpci_stub_26_pci_filter_match" 

external libpci_stub_27_pci_lookup_name
  : _ CI.fatptr -> _ CI.fatptr -> int -> int -> int -> CI.voidp
  = "libpci_stub_27_pci_lookup_name" 

external libpci_stub_28_pci_lookup_name
  : _ CI.fatptr -> _ CI.fatptr -> int -> int -> int -> int -> CI.voidp
  = "libpci_stub_28_pci_lookup_name_byte6" "libpci_stub_28_pci_lookup_name" 

external libpci_stub_29_pci_lookup_name
  : _ CI.fatptr -> _ CI.fatptr -> int -> int -> int -> int -> int -> 
    int -> CI.voidp
  = "libpci_stub_29_pci_lookup_name_byte8" "libpci_stub_29_pci_lookup_name" 

external libpci_stub_30_pci_load_name_list : _ CI.fatptr -> int
  = "libpci_stub_30_pci_load_name_list" 

external libpci_stub_31_pci_free_name_list : _ CI.fatptr -> unit
  = "libpci_stub_31_pci_free_name_list" 

external libpci_stub_32_pci_set_name_list_path
  : _ CI.fatptr -> _ CI.fatptr -> int -> unit
  = "libpci_stub_32_pci_set_name_list_path" 

external libpci_stub_33_pci_id_cache_flush : _ CI.fatptr -> unit
  = "libpci_stub_33_pci_id_cache_flush" 

type 'a result = 'a
type 'a return = 'a
type 'a fn =
 | Returns  : 'a CI.typ   -> 'a return fn
 | Function : 'a CI.typ * 'b fn  -> ('a -> 'b) fn
let map_result f x = f x
let returning t = Returns t
let (@->) f p = Function (f, p)
let foreign : type a b. string -> (a -> b) fn -> (a -> b) =
  fun name t -> match t, name with
| Function (CI.Pointer _, Returns CI.Void), "pci_id_cache_flush" ->
  (fun x1 -> libpci_stub_33_pci_id_cache_flush (CI.cptr x1))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x4; _},
        Function (CI.Primitive CI.Int, Returns CI.Void))),
  "pci_set_name_list_path" ->
  (fun x2 x3 x6 ->
    let x5 = CI.cptr (x4 x3) in
    libpci_stub_32_pci_set_name_list_path (CI.cptr x2) x5 x6)
| Function (CI.Pointer _, Returns CI.Void), "pci_free_name_list" ->
  (fun x7 -> libpci_stub_31_pci_free_name_list (CI.cptr x7))
| Function (CI.Pointer _, Returns (CI.Primitive CI.Int)),
  "pci_load_name_list" ->
  (fun x8 -> libpci_stub_30_pci_load_name_list (CI.cptr x8))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x11; _},
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function
                (CI.Primitive CI.Int,
                 Function
                   (CI.Primitive CI.Int,
                    Function
                      (CI.Primitive CI.Int,
                       Function
                         (CI.Primitive CI.Int,
                          Returns
                            (CI.View {CI.ty = CI.Pointer x19; read = x20; _}))))))))),
  "pci_lookup_name" ->
  (fun x9 x10 x13 x14 x15 x16 x17 x18 ->
    let x12 = CI.cptr (x11 x10) in
    x20
    (CI.make_ptr x19
       (libpci_stub_29_pci_lookup_name (CI.cptr x9) x12 x13 x14 x15 x16 x17
         x18)))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x23; _},
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function
                (CI.Primitive CI.Int,
                 Function
                   (CI.Primitive CI.Int,
                    Returns (CI.View {CI.ty = CI.Pointer x29; read = x30; _}))))))),
  "pci_lookup_name" ->
  (fun x21 x22 x25 x26 x27 x28 ->
    let x24 = CI.cptr (x23 x22) in
    x30
    (CI.make_ptr x29
       (libpci_stub_28_pci_lookup_name (CI.cptr x21) x24 x25 x26 x27 x28)))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x33; _},
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function
                (CI.Primitive CI.Int,
                 Returns (CI.View {CI.ty = CI.Pointer x38; read = x39; _})))))),
  "pci_lookup_name" ->
  (fun x31 x32 x35 x36 x37 ->
    let x34 = CI.cptr (x33 x32) in
    x39
    (CI.make_ptr x38
       (libpci_stub_27_pci_lookup_name (CI.cptr x31) x34 x35 x36 x37)))
| Function
    (CI.Pointer _, Function (CI.Pointer _, Returns (CI.Primitive CI.Int))),
  "pci_filter_match" ->
  (fun x40 x41 ->
    libpci_stub_26_pci_filter_match (CI.cptr x40) (CI.cptr x41))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x44; _},
        Returns (CI.View {CI.ty = CI.Pointer x46; read = x47; _}))),
  "pci_filter_parse_id" ->
  (fun x42 x43 ->
    let x45 = CI.cptr (x44 x43) in
    x47
    (CI.make_ptr x46 (libpci_stub_25_pci_filter_parse_id (CI.cptr x42) x45)))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x50; _},
        Returns (CI.View {CI.ty = CI.Pointer x52; read = x53; _}))),
  "pci_filter_parse_slot" ->
  (fun x48 x49 ->
    let x51 = CI.cptr (x50 x49) in
    x53
    (CI.make_ptr x52
       (libpci_stub_24_pci_filter_parse_slot (CI.cptr x48) x51)))
| Function (CI.Pointer _, Function (CI.Pointer _, Returns CI.Void)),
  "pci_filter_init" ->
  (fun x54 x55 -> libpci_stub_23_pci_filter_init (CI.cptr x54) (CI.cptr x55))
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Uint,
        Function (CI.Primitive CI.Uint, Returns (CI.Pointer x59)))),
  "pci_find_cap" ->
  (fun x56 x57 x58 ->
    CI.make_ptr x59 (libpci_stub_22_pci_find_cap (CI.cptr x56) x57 x58))
| Function
    (CI.Pointer _,
     Function (CI.Pointer _, Function (CI.Primitive CI.Int, Returns CI.Void))),
  "pci_setup_cache" ->
  (fun x60 x61 x62 ->
    libpci_stub_21_pci_setup_cache (CI.cptr x60) (CI.cptr x61) x62)
| Function
    (CI.Pointer _,
     Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Int))),
  "pci_fill_info" ->
  (fun x63 x64 -> libpci_stub_20_pci_fill_info (CI.cptr x63) x64)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Pointer _,
           Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Int))))),
  "pci_write_block" ->
  (fun x65 x66 x67 x68 ->
    libpci_stub_19_pci_write_block (CI.cptr x65) x66 (CI.cptr x67) x68)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function (CI.Primitive CI.Uint16_t, Returns (CI.Primitive CI.Int)))),
  "pci_write_long" ->
  (fun x69 x70 x71 -> libpci_stub_18_pci_write_long (CI.cptr x69) x70 x71)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function (CI.Primitive CI.Uint8_t, Returns (CI.Primitive CI.Int)))),
  "pci_write_byte" ->
  (fun x72 x73 x74 -> libpci_stub_17_pci_write_byte (CI.cptr x72) x73 x74)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Pointer _,
           Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Int))))),
  "pci_read_vpd" ->
  (fun x75 x76 x77 x78 ->
    libpci_stub_16_pci_read_vpd (CI.cptr x75) x76 (CI.cptr x77) x78)
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Pointer _,
           Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Int))))),
  "pci_read_block" ->
  (fun x79 x80 x81 x82 ->
    libpci_stub_15_pci_read_block (CI.cptr x79) x80 (CI.cptr x81) x82)
| Function
    (CI.Pointer _,
     Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Uint32_t))),
  "pci_read_long" ->
  (fun x83 x84 -> libpci_stub_14_pci_read_long (CI.cptr x83) x84)
| Function
    (CI.Pointer _,
     Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Uint16_t))),
  "pci_read_word" ->
  (fun x85 x86 -> libpci_stub_13_pci_read_word (CI.cptr x85) x86)
| Function
    (CI.Pointer _,
     Function (CI.Primitive CI.Int, Returns (CI.Primitive CI.Uint8_t))),
  "pci_read_byte" ->
  (fun x87 x88 -> libpci_stub_12_pci_read_byte (CI.cptr x87) x88)
| Function (CI.Pointer _, Function (CI.Pointer _, Returns (CI.Pointer x91))),
  "pci_walk_params" ->
  (fun x89 x90 ->
    CI.make_ptr x91
      (libpci_stub_11_pci_walk_params (CI.cptr x89) (CI.cptr x90)))
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x94; _},
        Function
          (CI.View {CI.ty = CI.Pointer _; write = x97; _},
           Returns (CI.Primitive CI.Int)))),
  "pci_set_param" ->
  (fun x92 x93 x96 ->
    let x95 = CI.cptr (x94 x93) in
    let x98 = CI.cptr (x97 x96) in
    libpci_stub_10_pci_set_param (CI.cptr x92) x95 x98)
| Function
    (CI.Pointer _,
     Function
       (CI.View {CI.ty = CI.Pointer _; write = x101; _},
        Returns (CI.View {CI.ty = CI.Pointer x103; read = x104; _}))),
  "pci_get_param" ->
  (fun x99 x100 ->
    let x102 = CI.cptr (x101 x100) in
    x104 (CI.make_ptr x103 (libpci_stub_9_pci_get_param (CI.cptr x99) x102)))
| Function
    (CI.Primitive CI.Int,
     Returns (CI.View {CI.ty = CI.Pointer x106; read = x107; _})),
  "pci_get_method_name" ->
  (fun x105 ->
    x107 (CI.make_ptr x106 (libpci_stub_8_pci_get_method_name x105)))
| Function
    (CI.View {CI.ty = CI.Pointer _; write = x109; _},
     Returns (CI.Primitive CI.Int)),
  "pci_lookup_method" ->
  (fun x108 ->
    let x110 = CI.cptr (x109 x108) in libpci_stub_7_pci_lookup_method x110)
| Function (CI.Pointer _, Returns CI.Void), "pci_free_dev" ->
  (fun x111 -> libpci_stub_6_pci_free_dev (CI.cptr x111))
| Function
    (CI.Pointer _,
     Function
       (CI.Primitive CI.Int,
        Function
          (CI.Primitive CI.Int,
           Function
             (CI.Primitive CI.Int,
              Function (CI.Primitive CI.Int, Returns (CI.Pointer x117)))))),
  "pci_get_dev" ->
  (fun x112 x113 x114 x115 x116 ->
    CI.make_ptr x117
      (libpci_stub_5_pci_get_dev (CI.cptr x112) x113 x114 x115 x116))
| Function (CI.Pointer _, Returns CI.Void), "pci_scan_bus" ->
  (fun x118 -> libpci_stub_4_pci_scan_bus (CI.cptr x118))
| Function (CI.Pointer _, Returns CI.Void), "pci_cleanup" ->
  (fun x119 -> libpci_stub_3_pci_cleanup (CI.cptr x119))
| Function (CI.Pointer _, Returns CI.Void), "pci_init" ->
  (fun x120 -> libpci_stub_2_pci_init (CI.cptr x120))
| Function (CI.Void, Returns (CI.Pointer x122)), "pci_alloc" ->
  (fun x121 -> CI.make_ptr x122 (libpci_stub_1_pci_alloc x121))
| _, s ->  Printf.ksprintf failwith "No match for %s" s


let foreign_value : type a. string -> a Ctypes.typ -> a Ctypes.ptr =
  fun name t -> match t, name with
| _, s ->  Printf.ksprintf failwith "No match for %s" s

