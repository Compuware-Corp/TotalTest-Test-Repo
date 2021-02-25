       Identification division.                                         00010000
       Program-id.   XaRisCal.                                          00020000
       Author.       Xact Consulting A/S.                               00030001
                                                                        00030105
      ***************************************************************** 00030205
      *                                                               * 00030307
      *                     XaTester by Compuware                     * 00030405
      *                           XARISCAL                            * 00030505
      *                                                               * 00030605
      ***************************************************************** 00030705
      *                                                               * 00030807
      * XaTester by Compuware sample                                  * 00030907
      *                                                               * 00031007
      ***************************************************************** 00031107
      * THESE MATERIALS CONTAIN CONFIDENTIAL INFORMATION AND          * 00031205
      * TRADE SECRETS OF COMPUWARE CORPORATION.  USING, DISCLOSING,   * 00031305
      * OR REPRODUCING THESE MATERIALS IS STRICTLY PROHIBITED UNLESS  * 00031405
      * REQUIRED BY OR AUTHORIZED BY LAW OR ADVANCE WRITTEN PERMISSION* 00031505
      * HAS BEEN GIVEN BY COMPUWARE CORPORATION.                      * 00031605
      *                                                               * 00031705
      * COPYRIGHT (C) 2018 COMPUWARE CORPORATION.                     * 00031806
      * ALL RIGHTS RESERVED.                                          * 00031905
      ***************************************************************** 00032005
      *                          Maintenance Log                        00032105
      *---------------------------------------------------------------- 00032205
      *              Description                       |   Date   | Who 00032305
      *---------------------------------------------------------------- 00032405
135969* Add Copyright and Maintenance Log              | 08/03/18 | DHR 00032505
      ***************************************************************** 00032605
                                                                        00032705
       environment division.                                            00040000
       Input-Output section.                                            00050000
       File-control.                                                    00060000
       Data Division.                                                   00070000
       File Section.                                                    00080000
       Working-Storage Section.                                         00090000
       linkage section.                                                 00230000
                                                                        00230100
       01 Import.                                                       00230200
          03 Customer.                                                  00230300
             05 Age                    pic 9(03).                       00230400
                                                                        00230500
       01 Export.                                                       00230600
          03 Risc                      pic 9(03).                       00230700
                                                                        00250000
       Procedure division using Import Export.                          00260000
                                                                        00270000
       Main section.                                                    00290000
                                                                        00300300
           Perform CalculateRisc.                                       00300403
                                                                        00300803
           Goback.                                                      00300903
                                                                        00301003
       CalculateRisc Section.                                           00301103
                                                                        00301203
           Move zero to Risc.                                           00301303
                                                                        00301403
           if Age < 18                                                  00301503
              compute Risc = Age * +2                                   00302000
              end-if                                                    00302100
                                                                        00302200
           if Age >= 18 and Age < 50                                    00304000
              compute Risc = Age * +3                                   00304100
              end-if                                                    00304200
                                                                        00304300
           if Age > 50                                                  00304400
              compute Risc = Age * +4                                   00304500
              end-if                                                    00309000
           .                                                            00309100
