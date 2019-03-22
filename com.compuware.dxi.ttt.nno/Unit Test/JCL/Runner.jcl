${TOTALTEST_JOBCARD}
//*** SPECIFY JOBCARD IN TOTALTEST PREFERENCES TO SUBSTITUTE
//***
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH 
//*** AS NOTIFY=&SYSUID and also a REGION=0M parameter
//*
//********************************************************************
//* Execute Target Runner
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR
//*
//* You need to modify the following DD statements.
//*
//* The first DD statement should be changed to the ECC SLCXLOAD 
//* dataset that contains the Topaz for Total Test TTTRUNNR program.
//*
//* The second DD statement should be changed to the loadlib
//* containing the programs to run during the test.
//*
//* The third DD statement is only required if running the JCL 
//* from Topaz for Total Test CLI with Code Coverage support.
//* If testing an LE application it should be changed to the
//* loadlib containing the COBOL runtime(CEE.SCEERUN), otherwise 
//* it can be removed.
//*
//STEPLIB DD DISP=SHR,DSN=SYS1.ECC.SLCXLOAD
//*  where MLCXnnn is MLCX170 OR HIGHER
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI00       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI01       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI02       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI03       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI04       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI05       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI51       
//         DD DISP=SHR,DSN=CMNT.K.PROM21.LLI81       
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI01         
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI02         
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI03         
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI04         
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI05         
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI51         
//         DD DISP=SHR,DSN=CMNT.K.PROD.LLI99         
//         DD DISP=SHR,DSN=IMSTS.LIB.ITC.EXITLIB     
//         DD DISP=SHR,DSN=IMSTS.LIB.SAGITC.SDFSRESL 
//         DD DISP=SHR,DSN=IMSTS.TLS.IT.LOADLIB      
//         DD DISP=SHR,DSN=DB2TS.LIB.SAGDTC.SDSNEXIT 
//         DD DISP=SHR,DSN=DB2TS.LIB.SAGDTC.SDSNLOAD 
//         DD DISP=SHR,DSN=MQMTS.LIB.MTC2.USERAUTH   
//         DD DISP=SHR,DSN=SYS1.CEE.SCEERUN
//         DD DISP=SHR,DSN=SYS1.CEE.SCEERUN2
//*
//TRPARM DD *
*
*        Optionally set your custom exit program here:
* 
EXIT(NONE)
*
REPEAT(${TOTALTEST_REPEAT}),STUBS(${TOTALTEST_STUBS}),
DEBUG(OFF)
/* 
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD
//*
//*      Optionally add your custom DD statements
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR
//SYSPRINT DD SYSOUT=*
//*
