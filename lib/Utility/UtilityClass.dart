// ignore_for_file: unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import '../ProductListData/ProductsListData.dart';
import 'package:theplugshop/Utility/CustomeColors.dart';

import '../ProductListData/Variants.dart';

String storeName = 'theno1plugshop';
String storeURL = '${storeName}.myshopify.com';
String storeAdminAPIAccessToken = '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';
String storefrontAPIAccessToken = '18b08ca37dc1de9fe56a50d734b0b56e';
String storeAPIkey = 'fc75f9670c25cf20a8c12cf314596818';
String storeAPISecretKey = 'd48053a1be3d5d10df78d55189f6a202';
String storeAPIVersion = '2022-10';
////https://theno1plugshop.myshopify.com/admin/api/2022-10/customers.json
String storeRequestURL = 'https://${storeURL}/admin/api/${storeAPIVersion}/';

String paymentCurrency = "£";

List<CollectionListItems> collectionListData = [
  CollectionListItems(
    cId: 1,
    cTitle: 'E-Liquids',
    cImageName: 'cat_eliquids.png',
    cLeftMenuImageName: 'cat_icon_white_bg_96.png',
    cCollectionID: '386351104222',
    cCollectionHandle: 'e-liquids',
    cCode: 'E-LIQUIDS',
    cProductType: 'E-LIQUIDS',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 111,
          scTitle: 'NIC SALTS',
          scImageName: 'nic_salts.png',
          scCollectionID: '386358214878',
          sCollectionHandle: 'nic-salts',
          scCode: 'nic-salts',
          sProductType: 'NIC SALT',
          sVandor: '',
        sTags: '',
      ),
      SubCollectionListItems(
          scId: 112,
          scTitle: 'NIC SHOTS',
          scImageName: 'nic_shots.png',
          scCollectionID: '386358247646',
          sCollectionHandle: 'nicotine-shot',
          scCode: 'nicotine-shot',
          sProductType: 'E-LIQUIDS',
          sVandor: '',
        sTags: 'Nic Shots'
      ),
      SubCollectionListItems(
          scId: 11,
          scTitle: '10ml',
          scImageName: '10ml_e_liquids.png',
          scCollectionID: '386358280414',
          sCollectionHandle: '10ml-e-liquids',
          scCode: '10ml-e-liquids',
          sProductType: 'E-LIQUIDS',
          sVandor: '',
      sTags: '10ml'),
      SubCollectionListItems(
          scId: 12,
          scTitle: '50ml',
          scImageName: '50ml_e_liquids.png',
          scCollectionID: '378473840862',
          sCollectionHandle: '50ml-shortfill',
          scCode: '50ml-e-liquids',
          sProductType: 'E-LIQUIDS',
          sVandor: '',
      sTags: '50ml'),
      SubCollectionListItems(
          scId: 13,
          scTitle: '100ml',
          scImageName: '100ml_e_liquids.png',
          scCollectionID: '378458964190',
          sCollectionHandle: '100ml-shortfill',
          scCode: '100ml-e-liquids',
          sProductType: 'E-LIQUIDS',
          sVandor: '',
      sTags: '100ml'),
      SubCollectionListItems(
          scId: 14,
          scTitle: '200ml',
          scImageName: '200ml_e_liquids.png',
          scCollectionID: '386358313182',
          sCollectionHandle: '200ml-e-liquids',
          scCode: '200ml-e-liquids',
          sProductType: 'E-LIQUIDS',
          sVandor: '',
      sTags: '200ml'),
      SubCollectionListItems(
          scId: 15,
          scTitle: '500ml',
          scImageName: '500ml_e_liquids.png',
          scCollectionID: '386358345950',
          sCollectionHandle: '500ml-e-liquids',
          scCode: '500ml-e-liquids',
          sProductType: 'E-LIQUIDS',
          sVandor: '',
      sTags: '500ml'),
    ],
  ),
  CollectionListItems(
    cId: 2,
    cTitle: 'Disposable Vape',
    cImageName: 'cat_disposable_pods.png',
    cLeftMenuImageName: 'cat_icon_disposable.png',
    cCollectionID: '378458734814',
    cCollectionHandle: 'disposable-pod',
    cCode: 'DISPOSABLE PODS',
    cProductType: 'Disposable Pod Kit',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 21,
          scTitle: 'Geek Bar',
          scImageName: 'disposable_geek_bar.png',
          scCollectionID: '399014461662',
          sCollectionHandle: 'geek-bar-disposable',
          scCode: 'geek-bar-disposable',
          sProductType: '',
          sVandor: 'Geek Bar',
      sTags: ''),
      SubCollectionListItems(
          scId: 22,
          scTitle: 'IVG Bar',
          scImageName: 'disposable_ivg_bar.png',
          scCollectionID: '402527125726',
          sCollectionHandle: 'ivg-disposable-pods',
          scCode: 'ivg-disposable-pods',
          sProductType: 'WHOLESALE',
          sVandor: 'IVG BAR',
      sTags: ''),
      SubCollectionListItems(
          scId: 23,
          scTitle: 'Juice Head',
          scImageName: 'disposable_juice_head.png',
          scCollectionID: '402527453406',
          sCollectionHandle: 'juice-head-disposable-bar',
          scCode: 'juice-head-disposable-bar',
          sProductType: '',
          sVandor: 'Juice Head',
      sTags: ''),
      SubCollectionListItems(
          scId: 24,
          scTitle: 'Magic Bar',
          scImageName: 'disposable_magic_bar.png',
          scCollectionID: '418108932318',
          sCollectionHandle: 'magic-bar-disposable-vape',
          scCode: 'magic-bar-disposable-vape',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Magic Bar',
      sTags: ''),
      SubCollectionListItems(
          scId: 25,
          scTitle: 'Lost Temple',
          scImageName: 'disposable_lost_temple.png',
          scCollectionID: '402528207070',
          sCollectionHandle: 'lost-mary-disposable-pods',
          scCode: 'lost-mary-disposable-pods',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Lost Temple',
      sTags: ''),
      SubCollectionListItems(
          scId: 26,
          scTitle: 'Nasty Juice',
          scImageName: 'disposable_nasty_juice.png',
          scCollectionID: '418108965086',
          sCollectionHandle: 'nasty-juice-disposable-vape',
          scCode: 'nasty-juice-disposable-vape',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Nasty Juice',
      sTags: ''),
      SubCollectionListItems(
          scId: 27,
          scTitle: 'R And M',
          scImageName: 'disposable_r_and_m.png',
          scCollectionID: '',
          sCollectionHandle: '',
          scCode: '',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'R & M Tornado',
      sTags: ''),
      SubCollectionListItems(
          scId: 28,
          scTitle: 'Reymont',
          scImageName: 'disposable_reymont.png',
          scCollectionID: '402527092958',
          sCollectionHandle: 'reymont-disposable-pods',
          scCode: 'reymont-disposable-pods',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Reymont',
      sTags: ''),
      SubCollectionListItems(
          scId: 29,
          scTitle: 'SKE Crystal',
          scImageName: 'disposable_ske_crystal_bar.png',
          scCollectionID: '409768198366',
          sCollectionHandle: 'ske-crystal-bar-disposable-pods',
          scCode: 'ske-crystal-bar-disposable-pods',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'SKE Crystal Bar',
      sTags: ''),
      SubCollectionListItems(
          scId: 210,
          scTitle: 'SKY Crystal',
          scImageName: 'disposable_sky_crystal.png',
          scCollectionID: '418108997854',
          sCollectionHandle: 'sky-crysyal-pro-disposable-vapes',
          scCode: 'sky-crysyal-pro-disposable-vapes',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Sky Crystal',
      sTags: ''),
      SubCollectionListItems(
          scId: 211,
          scTitle: 'Super Stix',
          scImageName: 'disposable_super_stix_bar.png',
          scCollectionID: '414972281054',
          sCollectionHandle: 'superstix-disposable-vape-pods-uk-online',
          scCode: 'superstix-disposable-vape-pods-uk-online',
          sProductType: 'DISPOSABLE PODS',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 212,
          scTitle: 'UltimaTe Bar',
          scImageName: 'disposable_ultim_te_bar.png',
          scCollectionID: '402527256798',
          sCollectionHandle: 'ultimate-disposable-bars',
          scCode: 'ultimate-disposable-bars',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Ultimate Bar',
      sTags: ''),
      SubCollectionListItems(
          scId: 213,
          scTitle: 'Vape Bars',
          scImageName: 'disposable_vape_bars.png',
          scCollectionID: '',
          sCollectionHandle: '',
          scCode: '',
          sProductType: 'DISPOSABLE PODS',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 214,
          scTitle: 'Aroma King',
          scImageName: 'disposable_aroma_king.png',
          scCollectionID: '402528141534',
          sCollectionHandle: 'aroma-king-disposable-pods',
          scCode: '36588190302430',
          sProductType: 'DISPOSABLE PODS',
          sVandor: 'Aroma King',
      sTags: ''),
      SubCollectionListItems(
          scId: 215,
          scTitle: 'ELF Bar',
          scImageName: 'disposable_elf_bar.png',
          scCollectionID: '402527027422',
          sCollectionHandle: 'elf-bar-disposable-pods',
          scCode: 'elf-bar-disposable-pods',
          sProductType: '',
          sVandor: 'ELF BAR',
      sTags: ''),
      SubCollectionListItems(
          scId: 216,
          scTitle: 'Elux',
          scImageName: 'disposable_elux.png',
          scCollectionID: '402527355102',
          sCollectionHandle: 'elux-disposable-bar',
          scCode: 'elux-disposable-bar',
          sProductType: '',
          sVandor: 'Elux',
      sTags: ''),
      SubCollectionListItems(
          scId: 217,
          scTitle: 'Fantasi Bar',
          scImageName: 'disposable_fantasi_bar.png',
          scCollectionID: '418109063390',
          sCollectionHandle: 'fantasi-bar-disposable-vapes',
          scCode: 'fantasi-bar-disposable-vapes',
          sProductType: '',
          sVandor: 'Fantasi Bar',
      sTags: ''),
      SubCollectionListItems(
          scId: 218,
          scTitle: 'Frunk Bar',
          scImageName: 'disposable_frunk_bar.png',
          scCollectionID: '402527060190',
          sCollectionHandle: 'frunk-bar-disposable-pod',
          scCode: 'frunk-bar-disposable-pods',
          sProductType: '',
          sVandor: 'Frunk Bar',
      sTags: ''),
    ],
  ),
  CollectionListItems(
    cId: 3,
    cTitle: 'Vape Kits',
    cImageName: 'cat_vape_kit.png',
    cLeftMenuImageName: 'cat_icon_wap_kit.png',
    cCollectionID: '386351136990',
    cCollectionHandle: 'vape-kits',
    cCode: 'vape kits',
    cProductType: 'VAPE KITS',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 31,
          scTitle: 'Aspire',
          scImageName: 'aspire.png',
          scCollectionID: '402527650014',
          sCollectionHandle: 'aspire-vape-kits',
          scCode: 'Aspire',
          sProductType: 'Vape Kits',
          sVandor: 'Aspire',
        sTags: 'kit'
      ),
      SubCollectionListItems(
          scId: 34,
          scTitle: 'Geek Vape',
          scImageName: 'geek_vape.png',
          scCollectionID: '402527748318',
          sCollectionHandle: 'geekavape-vape-kits',
          scCode: 'GeekVape',
          sProductType: 'Vape Kits',
          sVandor: 'GeekVape',
          sTags: 'kit'),
      SubCollectionListItems(
          scId: 36,
          scTitle: 'Innokin',
          scImageName: 'innokin.png',
          scCollectionID: '402527518942',
          sCollectionHandle: 'innokin-vape-kits',
          scCode: 'Innokin',
          sProductType: 'Vape Kits',
          sVandor: 'Innokin',
          sTags: 'kit'),
      SubCollectionListItems(
          scId: 311,
          scTitle: 'Uwell',
          scImageName: 'uwell.png',
          scCollectionID: '402527781086',
          sCollectionHandle: 'uwell-vape-kits',
          scCode: 'Uwell',
          sProductType: 'Vape Kits',
          sVandor: 'Uwell',
          sTags: 'kit'),
      SubCollectionListItems(
          scId: 312,
          scTitle: 'Vaporesso',
          scImageName: 'vaporesso.png',
          scCollectionID: '402527715550',
          sCollectionHandle: 'vaporesso-vape-kits',
          scCode: 'Vaporesso',
          sProductType: 'Vape Kits',
          sVandor: 'Vaporesso',
          sTags: 'kit'),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Voopoo',
          scImageName: 'voopoo.png',
          scCollectionID: '402527682782',
          sCollectionHandle: 'voopoo-vape-kits',
          scCode: 'Voopoo',
          sProductType: 'Vape Kits',
          sVandor: 'Voopoo',
          sTags: 'kit'),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Smok',
          scImageName: 'smok.png',
          scCollectionID: '402527584478',
          sCollectionHandle: 'smok-vape-kits',
          scCode: 'Smok',
          sProductType: 'Vape Kits',
          sVandor: 'Smok',
          sTags: 'kit'),
    ],
  ),
  CollectionListItems(
    cId: 4,
    cTitle: 'Pod Kits',
    cImageName: 'cat_podkits.png',
    cLeftMenuImageName: 'cat_icon_pod_kit.png',
    cCollectionID: '386351169758',
    cCollectionHandle: 'pod-kits',
    cCode: '',
    cProductType: 'POD KITS',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 31,
          scTitle: 'Aspire',
          scImageName: 'aspire.png',
          scCollectionID: '402527977694',
          sCollectionHandle: 'aspire-pod-kits',
          scCode: '',
          sProductType: 'POD KITS',
          sVandor: 'Aspire',
      sTags: ''),
      SubCollectionListItems(
          scId: 34,
          scTitle: 'Geek Vape',
          scImageName: 'geek_vape.png',
          scCollectionID: '402528075998',
          sCollectionHandle: 'geekvape-pod-kits',
          scCode: '',
          sProductType: 'POD KITS',
          sVandor: 'GeekVape',
      sTags: ''),
      SubCollectionListItems(
          scId: 36,
          scTitle: 'Innokin',
          scImageName: 'innokin.png',
          scCollectionID: '402527846622',
          sCollectionHandle: 'innokin-pod-kits',
          scCode: '',
          sProductType: 'POD KITS',
          sVandor: 'Innokin',
      sTags: ''),
      SubCollectionListItems(
          scId: 311,
          scTitle: 'Uwell',
          scImageName: 'uwell.png',
          scCollectionID: '402528108766',
          sCollectionHandle: 'uwell-pod-kits',
          scCode: '',
          sProductType: 'POD KITS',
          sVandor: 'Uwell',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Voopoo',
          scImageName: 'voopoo.png',
          scCollectionID: '402528010462',
          sCollectionHandle: 'voopoo-pod-kits',
          scCode: '',
          sProductType: 'POD KITS',
          sVandor: 'Voopoo',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Smok',
          scImageName: 'smok.png',
          scCollectionID: '402527944926',
          sCollectionHandle: 'smok-pod-kits',
          scCode: '',
          sProductType: 'POD KITS',
          sVandor: 'Smok',
      sTags: ''),
    ],
  ),
  CollectionListItems(
    cId: 4,
    cTitle: 'Pods',
    cImageName: 'bc_cat_pods.png',
    cLeftMenuImageName: 'cat_icon_pods.png', // 'cat_icon_pod_kit.png',
    cCollectionID: '386351268062',
    cCollectionHandle: 'replacement-pods',
    cCode: '',
    cProductType: 'PODS',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 31,
          scTitle: 'Aspire',
          scImageName: 'aspire.png',
          scCollectionID: '402527977694',
          sCollectionHandle: 'aspire-pod-kits',
          scCode: 'aspire-pod-kits',
          sProductType: 'PODS',
          sVandor: 'Aspire',
      sTags: ''),
      SubCollectionListItems(
          scId: 34,
          scTitle: 'Geek Vape',
          scImageName: 'geek_vape.png',
          scCollectionID: '418109161694',
          sCollectionHandle: 'geek-vape-pods',
          scCode: 'geek-vape-pods',
          sProductType: 'PODS',
          sVandor: 'Geek Vape',
      sTags: ''),
      SubCollectionListItems(
          scId: 36,
          scTitle: 'Innokin',
          scImageName: 'innokin.png',
          scCollectionID: '402527846622',
          sCollectionHandle: 'innokin-pod-kits',
          scCode: 'innokin-pod-kits',
          sProductType: 'PODS',
          sVandor: 'Innokin',
      sTags: ''),
      SubCollectionListItems(
          scId: 311,
          scTitle: 'Uwell',
          scImageName: 'uwell.png',
          scCollectionID: '418109227230',
          sCollectionHandle: 'uwell-pods',
          scCode: 'uwell-pods',
          sProductType: 'PODS',
          sVandor: 'Uwell',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Voopoo',
          scImageName: 'voopoo.png',
          scCollectionID: '402528010462',
          sCollectionHandle: 'voopoo-pod-kits',
          scCode: 'voopoo-pod-kits',
          sProductType: 'PODS',
          sVandor: 'Voopoo',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Smok',
          scImageName: 'smok.png',
          scCollectionID: '402527944926',
          sCollectionHandle: 'smok-pod-kits',
          scCode: 'smok-pod-kits',
          sProductType: 'PODS',
          sVandor: 'Smok',
      sTags: ''),
    ],
  ),
  CollectionListItems(
    cId: 5,
    cTitle: 'Coils',
    cImageName: 'bc_cat_coils.png',
    cLeftMenuImageName: 'cat_icon_coils.png',
    cCollectionID: '386351235294',
    cCollectionHandle: '',
    cCode: '',
    cProductType: 'COILS',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 31,
          scTitle: 'Aspire',
          scImageName: 'aspire.png',
          scCollectionID: '418109391070',
          sCollectionHandle: 'aspire-coils',
          scCode: 'aspire-coils',
          sProductType: 'COILS',
          sVandor: 'Aspire',
      sTags: ''),
      SubCollectionListItems(
          scId: 33,
          scTitle: 'Freemax',
          scImageName: 'freemax.png',
          scCollectionID: '418109587678',
          sCollectionHandle: 'freemax-coils',
          scCode: 'freemax-coils',
          sProductType: 'COILS',
          sVandor: 'FreeMax',
      sTags: ''),
      SubCollectionListItems(
          scId: 34,
          scTitle: 'Geek Vape',
          scImageName: 'geek_vape.png',
          scCollectionID: '418109554910',
          sCollectionHandle: 'geek-vape-coils',
          scCode: 'geek-vape-coils',
          sProductType: 'COILS',
          sVandor: 'Geek Vape',
      sTags: ''),
      SubCollectionListItems(
          scId: 35,
          scTitle: 'Horizontech',
          scImageName: 'horizontech.png',
          scCollectionID: '418109653214',
          sCollectionHandle: 'horizontech-coils',
          scCode: 'horizontech-coils',
          sProductType: 'COILS',
          sVandor: 'HorizonTech',
      sTags: ''),
      SubCollectionListItems(
          scId: 36,
          scTitle: 'Innokin',
          scImageName: 'innokin.png',
          scCollectionID: '418109456606',
          sCollectionHandle: 'innokin-coils',
          scCode: 'innokin-coils',
          sProductType: 'COILS',
          sVandor: 'Innokin',
      sTags: ''),
      SubCollectionListItems(
          scId: 39,
          scTitle: 'OBS',
          scImageName: 'obs.png',
          scCollectionID: '418109685982',
          sCollectionHandle: 'obs-coils',
          scCode: 'obs-coils',
          sProductType: 'COILS',
          sVandor: 'OBS',
      sTags: ''),
      SubCollectionListItems(
          scId: 311,
          scTitle: 'Uwell',
          scImageName: 'uwell.png',
          scCollectionID: '418109620446',
          sCollectionHandle: 'uwell-coils',
          scCode: 'uwell-coils',
          sProductType: 'COILS',
          sVandor: 'Uwell',
      sTags: ''),
      SubCollectionListItems(
          scId: 312,
          scTitle: 'Vaporesso',
          scImageName: 'vaporesso.png',
          scCollectionID: '418109522142',
          sCollectionHandle: 'vaporesso-coils',
          scCode: 'vaporesso-coils',
          sProductType: 'COILS',
          sVandor: 'Vaporesso',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Voopoo',
          scImageName: 'voopoo.png',
          scCollectionID: '418109489374',
          sCollectionHandle: 'voopoo-coils',
          scCode: 'voopoo-coils',
          sProductType: 'COILS',
          sVandor: 'Voopoo',
      sTags: ''),
    ],
  ),
  CollectionListItems(
    cId: 6,
    cTitle: 'Tanks',
    cImageName: 'bc_cat_tanks.png',
    cLeftMenuImageName: 'cat_icon_tanks.png',
    cCollectionID: '386351300830',
    cCollectionHandle: 'tanks',
    cCode: '',
    cProductType: 'TANKS',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 31,
          scTitle: 'Aspire',
          scImageName: 'aspire.png',
          scCollectionID: '418109784286',
          sCollectionHandle: 'aspire-tanks',
          scCode: 'aspire-tanks',
          sProductType: 'TANKS',
          sVandor: 'Aspire',
      sTags: ''),
      SubCollectionListItems(
          scId: 33,
          scTitle: 'Freemax',
          scImageName: 'freemax.png',
          scCollectionID: '418110046430',
          sCollectionHandle: 'freemax-tanks',
          scCode: 'freemax-tanks',
          sProductType: 'TANKS',
          sVandor: 'FreeMax',
      sTags: ''),
      SubCollectionListItems(
          scId: 34,
          scTitle: 'Geek Vape',
          scImageName: 'geek_vape.png',
          scCollectionID: '418109882590',
          sCollectionHandle: 'geek-vape-tanks',
          scCode: 'geek-vape-tanks',
          sProductType: 'TANKS',
          sVandor: 'Geek Vape',
      sTags: ''),
      SubCollectionListItems(
          scId: 36,
          scTitle: 'Innokin',
          scImageName: 'innokin.png',
          scCollectionID: '418109849822',
          sCollectionHandle: 'innokin-tanks',
          scCode: 'innokin-tanks',
          sProductType: 'TANKS',
          sVandor: 'Innokin',
      sTags: ''),
      SubCollectionListItems(
          scId: 311,
          scTitle: 'Uwell',
          scImageName: 'uwell.png',
          scCollectionID: '418109948126',
          sCollectionHandle: 'uwell-tanks',
          scCode: 'uwell-tanks',
          sProductType: 'TANKS',
          sVandor: 'Uwell',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Voopoo',
          scImageName: 'voopoo.png',
          scCollectionID: '418109980894',
          sCollectionHandle: 'voopoo-tanks',
          scCode: 'voopoo-tanks',
          sProductType: 'TANKS',
          sVandor: 'Voopoo',
      sTags: ''),
    ],
  ),
  CollectionListItems(
    cId: 7,
    cTitle: 'Mods',
    cImageName: 'bc_cat_mods.png',
    cLeftMenuImageName: 'cat_icon_mod.png',
    cCollectionID: '386351333598',
    cCollectionHandle: 'mods',
    cCode: '',
    cProductType: 'MOD',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 32,
          scTitle: 'Eleaf',
          scImageName: 'eleaf.png',
          scCollectionID: '418110079198',
          sCollectionHandle: 'eleaf-box-mods',
          scCode: 'eleaf-box-mods',
          sProductType: 'MOD',
          sVandor: 'Eleaf',
      sTags: ''),
      SubCollectionListItems(
          scId: 36,
          scTitle: 'Innokin',
          scImageName: 'innokin.png',
          scCollectionID: '418110111966',
          sCollectionHandle: 'innokin-box-mods',
          scCode: '',
          sProductType: 'MOD',
          sVandor: 'Innokin',
      sTags: ''),
      SubCollectionListItems(
          scId: 313,
          scTitle: 'Smok',
          scImageName: 'smok.png',
          scCollectionID: '418110177502',
          sCollectionHandle: 'smok-mods',
          scCode: 'smok-mods',
          sProductType: 'MOD',
          sVandor: 'Smok',
      sTags: ''),
    ],
  ),
  CollectionListItems(
    cId: 9,
    cTitle: 'Accessories',
    cImageName: 'bc_cat_batteries.png',
    cLeftMenuImageName: 'cat_icon_battery.png',
    cCollectionID: '386351366366',
    cCollectionHandle: 'accessories',
    cCode: '',
    cProductType: 'ACCESSORIES',
    cSubCollectionListItems: [
      SubCollectionListItems(
          scId: 91,
          scTitle: 'Batteries',
          scImageName: 'Batteries.png',
          scCollectionID: '397635879134',
          sCollectionHandle: 'batteries',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: 'Unbranded',
      sTags: ''),
      SubCollectionListItems(
          scId: 92,
          scTitle: 'Chargers',
          scImageName: 'Chargers.png',
          scCollectionID: '418110210270',
          sCollectionHandle: 'battery-chargers',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: 'Golisi',
      sTags: ''),
      SubCollectionListItems(
          scId: 93,
          scTitle: 'Cotton',
          scImageName: 'Cotton.png',
          scCollectionID: '418110243038',
          sCollectionHandle: 'cotton',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: 'Wick N Vape',
      sTags: ''),
      SubCollectionListItems(
          scId: 94,
          scTitle: 'Drip Tips',
          scImageName: 'Drip_Tips.png',
          scCollectionID: '418110275806',
          sCollectionHandle: 'drip-tips',
          scCode: 'drip-tips',
          sProductType: 'ACCESSORIES',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 95,
          scTitle: 'iPhone Chargers',
          scImageName: 'iPhone_Chargers.png',
          scCollectionID: '410649854174',
          sCollectionHandle: 'iphone-usb-charger',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 96,
          scTitle: 'Micro USB Chargers',
          scImageName: 'Micro_USB_Chargers.png',
          scCollectionID: '410649886942',
          sCollectionHandle: 'micro-usb-chargers',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 97,
          scTitle: 'Replacement Glass',
          scImageName: 'Replacement_Glass.png',
          scCollectionID: '',
          sCollectionHandle: '',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 98,
          scTitle: 'Type C Chargers',
          scImageName: 'Type_C_Chargers.png',
          scCollectionID: '410649919710',
          sCollectionHandle: 'type-c-chargers',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: '',
      sTags: ''),
      SubCollectionListItems(
          scId: 99,
          scTitle: 'Wires',
          scImageName: 'Wires.png',
          scCollectionID: '418110341342',
          sCollectionHandle: 'wires',
          scCode: '',
          sProductType: 'ACCESSORIES',
          sVandor: '',
      sTags: ''),
    ],
  ),
];

bool isEmpty(String string) => string.isEmpty;
// Hypothetical unsound null safety:
requireStringNotNull(String definitelyString) {
  print('Android: ${definitelyString.length}');
}

Widget getComparePrice(Variants vx) {
  requireStringNotNull(vx.compareAtPrice.toString());
  final xPrice = vx.compareAtPrice ?? '';

  print('Android 11: $xPrice');

  if (xPrice.isNotEmpty) {
    return Text(
      '\ $paymentCurrency${xPrice}',
      style: TextStyle(
          decoration: TextDecoration.lineThrough,
          fontWeight: FontWeight.w600,
          color: CustomeColors.lighGray2,
          fontSize: productListComparePriceFontSize),
      //textAlign: TextAlign.center,
    );
  } else {
    return Text('');
  }
}

class CollectionListItems {
  final int cId;
  final String cTitle;
  final String cImageName;
  final String cLeftMenuImageName;
  final String cCollectionID;
  final String cCollectionHandle;
  final String cCode;
  final String cProductType;
  final List<SubCollectionListItems> cSubCollectionListItems;

  CollectionListItems(
      {required this.cId,
      required this.cTitle,
      required this.cImageName,
      required this.cLeftMenuImageName,
      required this.cCollectionID,
      required this.cCollectionHandle,
      required this.cCode,
      required this.cSubCollectionListItems,
      required this.cProductType});
}

class SubCollectionListItems {
  final int scId;
  final String scTitle;
  final String scImageName;
  final String scCollectionID;
  final String sCollectionHandle;
  final String scCode;
  final String sProductType;
  final String sVandor;
  final String sTags;

  SubCollectionListItems(
      {required this.scId,
      required this.scTitle,
      required this.scImageName,
      required this.scCollectionID,
      required this.sCollectionHandle,
      required this.scCode,
      required this.sProductType,
      required this.sVandor,
      required this.sTags});
}


/*
List<String> bestCollectionCategoryList = [
  "Pod Kits",
  "Vape Kits",
  "NIC SALT",
  "Short File",
  "DISPOSABLE PODS",
  "WHOLESALE",
];
*/


List<String> bestCollectionCategoryList = [
  "POD KITS",
  "VAPE KITS",
  "Nic Salt",
  "Short File",
  "Disposable POD",
  "Wholesale",
];




List<String> bestCollectionCategoryListImage = [
  "bc_cat_podkits_300x300.png",
  "bc_cat_vape_kit_300x300.png",
  "bc_cat_nic_salts_300x300.png",
  "bc_cat_short_file_300x300.png",
  "bc_cat_disposable_pod_300x300.png",
  "bc_cat_wholesale_300x300.png",
];

List<String> trandingCollectionCategoryList = [
  "ELF Bar",
  "Elux Legend 3500",
  "Geek Bar",
  "Jolly Ranger",
  "Reymont 3788",
  "Monster",
];

List<String> imagesCousal = [
  "slider_1.png",
  "slider_2.png",
  "slider_3.png",
  "slider_4.png",
];

List<String> socialmeadia = ["Facebook", "Instagram", "Twitter", "Linkedin"];
List<String> socialmeadiaImage = [
  "facebook_icon.png",
  "instagram _icon.png",
  "witter_icon.png",
  "linkedin_icon.png"
];

bool isValidEmail(String em) {
  String p =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp = new RegExp(p);
  return regExp.hasMatch(em);
}

const validEmailAddress = "Please enter the valid email id.";
const validPassword = "Please enter the valid valid password.";
const SomeThingWentWrong = "Something went wrong, pls try again.";
const ValidLastName = "Please enter your first name.";
const ValidFirstName = "Please enter your first name.";
const SuccessMsg = "Success";

const validCompanyName = "Please enter your company name.";
const validAdd1 = "Please enter your valid Address line 1.";
const validAdd2 = "Please enter your valid Address line 2.";
const validCity = "Please enter your valid city name.";
const validZip = "Please enter delivery zip code.";
const validPhoneNo = "please enter your phone No.";
const PlsLoginFrisr = "Please login first to checkout your order.";

void ShowTostMsg(String msg) {
  Fluttertoast.showToast(
      msg: "" + msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM // Also possible "TOP" and "CENTER"
      );
}

class UtilityClass {
  static String MyAppName = "TheNo1 Plug Shop";
}

class CartController extends GetxController {
  List<ProductsListData> cartProductListGlobal = <ProductsListData>[].obs;
  var totalCartQty = 0.obs;
  RxDouble totalPrice = 0.0.obs;

  void addToCart(ProductsListData productsListData) {
    cartProductListGlobal.add(productsListData);
    calculateCartQty();
  }

  void removeFromCart(int index) {
    cartProductListGlobal.removeAt(index);
    calculateCartQty();
  }

  void addMoreQtyFromCart(int index, int qty) {
    ProductsListData productsListData = cartProductListGlobal[index];
    productsListData.cartQty = productsListData.cartQty! + 1;
    //Write the logic for increase the items qty
    cartProductListGlobal[index] = productsListData;
    calculateCartQty();
  }

  void removeMoreQtyFromCart(int index, int qty) {
    ProductsListData productsListData = cartProductListGlobal[index];
    if (productsListData.cartQty! > 1) {
      productsListData.cartQty = productsListData.cartQty! - 1;
      //Write the logic for decrease the items qty
      cartProductListGlobal[index] = productsListData;
      calculateCartQty();
    } else {}
  }

  void calculateCartQty() {
    try {
      totalCartQty = RxInt(cartProductListGlobal.length ?? 0);
      calculateCartAmount();

      print("calculateCartQty : $totalCartQty");
    } catch (ex) {
      print("calculateCartQty catch $ex");
    }
  }

  void calculateCartAmount() {
    try {
      RxDouble totalPrice2 = 0.0.obs;
      for (var productsListData in cartProductListGlobal) {
        var pTemp = double.parse(productsListData.variants?[0].price ?? "0.0")
                .toDouble() *
            productsListData.cartQty!;

        totalPrice2 = totalPrice2 + pTemp as RxDouble;
        // totalPrice = totalPrice.toStringAsFixed(2) as RxDouble;
        print("calculateCartAmount : $totalPrice2");
      }
      totalPrice = totalPrice2;
    } catch (ex) {
      print("calculateCartAmount catch $ex");
    }
  }
}
