#include <pci/pci.h>
#include <stdio.h>
#include "ctypes_cstubs_internals.h"
value libpci_stub_1_pci_alloc(value x1)
{
   struct pci_access* x2 = pci_alloc();
   return CTYPES_FROM_PTR(x2);
}
value libpci_stub_2_pci_init(value x3)
{
   struct pci_access* x4 = CTYPES_ADDR_OF_FATPTR(x3);
   pci_init(x4);
   return Val_unit;
}
value libpci_stub_3_pci_cleanup(value x6)
{
   struct pci_access* x7 = CTYPES_ADDR_OF_FATPTR(x6);
   pci_cleanup(x7);
   return Val_unit;
}
value libpci_stub_4_pci_scan_bus(value x9)
{
   struct pci_access* x10 = CTYPES_ADDR_OF_FATPTR(x9);
   pci_scan_bus(x10);
   return Val_unit;
}
value libpci_stub_5_pci_get_dev(value x16, value x15, value x14, value x13,
                                value x12)
{
   struct pci_access* x17 = CTYPES_ADDR_OF_FATPTR(x16);
   int x18 = Long_val(x15);
   int x21 = Long_val(x14);
   int x24 = Long_val(x13);
   int x27 = Long_val(x12);
   struct pci_dev* x30 = pci_get_dev(x17, x18, x21, x24, x27);
   return CTYPES_FROM_PTR(x30);
}
value libpci_stub_6_pci_free_dev(value x31)
{
   struct pci_dev* x32 = CTYPES_ADDR_OF_FATPTR(x31);
   pci_free_dev(x32);
   return Val_unit;
}
value libpci_stub_7_pci_lookup_method(value x34)
{
   char* x35 = CTYPES_ADDR_OF_FATPTR(x34);
   int x36 = pci_lookup_method(x35);
   return Val_long(x36);
}
value libpci_stub_8_pci_get_method_name(value x37)
{
   int x38 = Long_val(x37);
   char* x41 = pci_get_method_name(x38);
   return CTYPES_FROM_PTR(x41);
}
value libpci_stub_9_pci_get_param(value x43, value x42)
{
   struct pci_access* x44 = CTYPES_ADDR_OF_FATPTR(x43);
   char* x45 = CTYPES_ADDR_OF_FATPTR(x42);
   char* x46 = pci_get_param(x44, x45);
   return CTYPES_FROM_PTR(x46);
}
value libpci_stub_10_pci_set_param(value x49, value x48, value x47)
{
   struct pci_access* x50 = CTYPES_ADDR_OF_FATPTR(x49);
   char* x51 = CTYPES_ADDR_OF_FATPTR(x48);
   char* x52 = CTYPES_ADDR_OF_FATPTR(x47);
   int x53 = pci_set_param(x50, x51, x52);
   return Val_long(x53);
}
value libpci_stub_11_pci_walk_params(value x55, value x54)
{
   struct pci_access* x56 = CTYPES_ADDR_OF_FATPTR(x55);
   struct pci_param* x57 = CTYPES_ADDR_OF_FATPTR(x54);
   struct pci_param* x58 = pci_walk_params(x56, x57);
   return CTYPES_FROM_PTR(x58);
}
value libpci_stub_12_pci_read_byte(value x60, value x59)
{
   struct pci_dev* x61 = CTYPES_ADDR_OF_FATPTR(x60);
   int x62 = Long_val(x59);
   uint8_t x65 = pci_read_byte(x61, x62);
   return Integers_val_uint8(x65);
}
value libpci_stub_13_pci_read_word(value x67, value x66)
{
   struct pci_dev* x68 = CTYPES_ADDR_OF_FATPTR(x67);
   int x69 = Long_val(x66);
   uint16_t x72 = pci_read_word(x68, x69);
   return Integers_val_uint16(x72);
}
value libpci_stub_14_pci_read_long(value x74, value x73)
{
   struct pci_dev* x75 = CTYPES_ADDR_OF_FATPTR(x74);
   int x76 = Long_val(x73);
   uint32_t x79 = pci_read_long(x75, x76);
   return integers_copy_uint32(x79);
}
value libpci_stub_15_pci_read_block(value x83, value x82, value x81,
                                    value x80)
{
   struct pci_dev* x84 = CTYPES_ADDR_OF_FATPTR(x83);
   int x85 = Long_val(x82);
   uint8_t* x88 = CTYPES_ADDR_OF_FATPTR(x81);
   int x89 = Long_val(x80);
   int x92 = pci_read_block(x84, x85, x88, x89);
   return Val_long(x92);
}
value libpci_stub_16_pci_read_vpd(value x96, value x95, value x94, value x93)
{
   struct pci_dev* x97 = CTYPES_ADDR_OF_FATPTR(x96);
   int x98 = Long_val(x95);
   uint8_t* x101 = CTYPES_ADDR_OF_FATPTR(x94);
   int x102 = Long_val(x93);
   int x105 = pci_read_vpd(x97, x98, x101, x102);
   return Val_long(x105);
}
value libpci_stub_17_pci_write_byte(value x108, value x107, value x106)
{
   struct pci_dev* x109 = CTYPES_ADDR_OF_FATPTR(x108);
   int x110 = Long_val(x107);
   uint8_t x113 = Uint8_val(x106);
   int x116 = pci_write_byte(x109, x110, x113);
   return Val_long(x116);
}
value libpci_stub_18_pci_write_long(value x119, value x118, value x117)
{
   struct pci_dev* x120 = CTYPES_ADDR_OF_FATPTR(x119);
   int x121 = Long_val(x118);
   uint16_t x124 = Uint16_val(x117);
   int x127 = pci_write_long(x120, x121, x124);
   return Val_long(x127);
}
value libpci_stub_19_pci_write_block(value x131, value x130, value x129,
                                     value x128)
{
   struct pci_dev* x132 = CTYPES_ADDR_OF_FATPTR(x131);
   int x133 = Long_val(x130);
   uint8_t* x136 = CTYPES_ADDR_OF_FATPTR(x129);
   int x137 = Long_val(x128);
   int x140 = pci_write_block(x132, x133, x136, x137);
   return Val_long(x140);
}
value libpci_stub_20_pci_fill_info(value x142, value x141)
{
   struct pci_dev* x143 = CTYPES_ADDR_OF_FATPTR(x142);
   int x144 = Long_val(x141);
   int x147 = pci_fill_info(x143, x144);
   return Val_long(x147);
}
value libpci_stub_21_pci_setup_cache(value x150, value x149, value x148)
{
   struct pci_dev* x151 = CTYPES_ADDR_OF_FATPTR(x150);
   uint8_t* x152 = CTYPES_ADDR_OF_FATPTR(x149);
   int x153 = Long_val(x148);
   pci_setup_cache(x151, x152, x153);
   return Val_unit;
}
value libpci_stub_22_pci_find_cap(value x159, value x158, value x157)
{
   struct pci_dev* x160 = CTYPES_ADDR_OF_FATPTR(x159);
   unsigned int x161 = ctypes_uint_val(x158);
   unsigned int x164 = ctypes_uint_val(x157);
   struct pci_cap* x167 = pci_find_cap(x160, x161, x164);
   return CTYPES_FROM_PTR(x167);
}
value libpci_stub_23_pci_filter_init(value x169, value x168)
{
   struct pci_access* x170 = CTYPES_ADDR_OF_FATPTR(x169);
   struct pci_filter* x171 = CTYPES_ADDR_OF_FATPTR(x168);
   pci_filter_init(x170, x171);
   return Val_unit;
}
value libpci_stub_24_pci_filter_parse_slot(value x174, value x173)
{
   struct pci_filter* x175 = CTYPES_ADDR_OF_FATPTR(x174);
   char* x176 = CTYPES_ADDR_OF_FATPTR(x173);
   char* x177 = pci_filter_parse_slot(x175, x176);
   return CTYPES_FROM_PTR(x177);
}
value libpci_stub_25_pci_filter_parse_id(value x179, value x178)
{
   struct pci_filter* x180 = CTYPES_ADDR_OF_FATPTR(x179);
   char* x181 = CTYPES_ADDR_OF_FATPTR(x178);
   char* x182 = pci_filter_parse_id(x180, x181);
   return CTYPES_FROM_PTR(x182);
}
value libpci_stub_26_pci_filter_match(value x184, value x183)
{
   struct pci_filter* x185 = CTYPES_ADDR_OF_FATPTR(x184);
   struct pci_dev* x186 = CTYPES_ADDR_OF_FATPTR(x183);
   int x187 = pci_filter_match(x185, x186);
   return Val_long(x187);
}
value libpci_stub_27_pci_lookup_name(value x192, value x191, value x190,
                                     value x189, value x188)
{
   struct pci_access* x193 = CTYPES_ADDR_OF_FATPTR(x192);
   char* x194 = CTYPES_ADDR_OF_FATPTR(x191);
   int x195 = Long_val(x190);
   int x198 = Long_val(x189);
   int x201 = Long_val(x188);
   char* x204 = pci_lookup_name(x193, x194, x195, x198, x201);
   if (x194 != x204) {
      fprintf(stderr, "Buffer address is 0x%x, but output address is 0x%x\n", x194, x204);
      fflush(stderr);
      // x204 = NULL;
   }
   return CTYPES_FROM_PTR(x204);
}
value libpci_stub_28_pci_lookup_name(value x210, value x209, value x208,
                                     value x207, value x206, value x205)
{
   struct pci_access* x211 = CTYPES_ADDR_OF_FATPTR(x210);
   char* x212 = CTYPES_ADDR_OF_FATPTR(x209);
   int x213 = Long_val(x208);
   int x216 = Long_val(x207);
   int x219 = Long_val(x206);
   int x222 = Long_val(x205);
   char* x225 = pci_lookup_name(x211, x212, x213, x216, x219, x222);
   return CTYPES_FROM_PTR(x225);
}
value libpci_stub_28_pci_lookup_name_byte6(value* argv, int argc)
{
   value x226 = argv[5];
   value x227 = argv[4];
   value x228 = argv[3];
   value x229 = argv[2];
   value x230 = argv[1];
   value x231 = argv[0];
   return libpci_stub_28_pci_lookup_name(x231, x230, x229, x228, x227, x226);
}
value libpci_stub_29_pci_lookup_name(value x239, value x238, value x237,
                                     value x236, value x235, value x234,
                                     value x233, value x232)
{
   struct pci_access* x240 = CTYPES_ADDR_OF_FATPTR(x239);
   char* x241 = CTYPES_ADDR_OF_FATPTR(x238);
   int x242 = Long_val(x237);
   int x245 = Long_val(x236);
   int x248 = Long_val(x235);
   int x251 = Long_val(x234);
   int x254 = Long_val(x233);
   int x257 = Long_val(x232);
   char* x260 =
   pci_lookup_name(x240, x241, x242, x245, x248, x251, x254, x257);
   return CTYPES_FROM_PTR(x260);
}
value libpci_stub_29_pci_lookup_name_byte8(value* argv, int argc)
{
   value x261 = argv[7];
   value x262 = argv[6];
   value x263 = argv[5];
   value x264 = argv[4];
   value x265 = argv[3];
   value x266 = argv[2];
   value x267 = argv[1];
   value x268 = argv[0];
   return
     libpci_stub_29_pci_lookup_name(x268, x267, x266, x265, x264, x263, 
                                    x262, x261);
}
value libpci_stub_30_pci_load_name_list(value x269)
{
   struct pci_access* x270 = CTYPES_ADDR_OF_FATPTR(x269);
   int x271 = pci_load_name_list(x270);
   return Val_long(x271);
}
value libpci_stub_31_pci_free_name_list(value x272)
{
   struct pci_access* x273 = CTYPES_ADDR_OF_FATPTR(x272);
   pci_free_name_list(x273);
   return Val_unit;
}
value libpci_stub_32_pci_set_name_list_path(value x277, value x276,
                                            value x275)
{
   struct pci_access* x278 = CTYPES_ADDR_OF_FATPTR(x277);
   char* x279 = CTYPES_ADDR_OF_FATPTR(x276);
   int x280 = Long_val(x275);
   pci_set_name_list_path(x278, x279, x280);
   return Val_unit;
}
value libpci_stub_33_pci_id_cache_flush(value x284)
{
   struct pci_access* x285 = CTYPES_ADDR_OF_FATPTR(x284);
   pci_id_cache_flush(x285);
   return Val_unit;
}
