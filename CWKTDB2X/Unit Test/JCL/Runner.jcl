${TOTALTEST_JOBCARD}
//*
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the loadlib 
//* containing the Topaz for Total Test 'TTTRUNNR" program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//STEPLIB DD DSN=KT.TRUNK.HLD1.LOAD,DISP=SHR
//        DD DSN=CX.R170000.SMPE.SLCXLOAD,DISP=SHR
//*        DD DSN=KT.CW121512.COB42.LOAD,DISP=SHR
//        DD DSN=KT.CW121512.COB61.LOAD,DISP=SHR
//        DD DSN=ENTQA.TTT.PDSE.LOAD,DISP=SHR
//        DD DSN=KT.DB2SQL.DB210.COB51.LOAD,DISP=SHR
//        DD DSN=KT.DB2SQL.DB212.COB51.LOAD,DISP=SHR
//        DD DSN=KT.DB2SQL.DB210.LOAD,DISP=SHR
//        DD DSN=KT.DB2SQL.DB210.COB42.LOAD,DISP=SHR
//        DD DSN=KT.DB2SQL.DB211.COB51.LOAD,DISP=SHR
//        DD DSN=KT.DB2SQL.DB211.COB42.LOAD,DISP=SHR
//* ADD THE LOAD LIB YOUR TARGETS RESIDE IN:
//* DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR
//*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
* 
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(ON)
/* 
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//RPTFILE  DD SYSOUT=*
//CUSTMST  DD  DISP=SHR,DSN=ENTQA.TTT.CUSTMAST.KSDS.FILE
//RPTFILE2  DD SYSOUT=*
//REPORT   DD SYSOUT=*
//EMPFILE  DD  DISP=SHR,DSN=ENTQA.TTT.DATA(CWXTDATA)
//SYSUDUMP DD SYSOUT=*
//PRINTOUT DD SYSOUT=*
//OUTFILE DD SYSOUT=*
//ABNLDUMP DD DUMMY
//DUMPDD   DD SYSOUT=*
//*
//*      Optionally add your custom DD statements
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*


