//EFHJNW0Z JOB ('OXTBAS17DEV'),'TESTER',       
//       CLASS=A,MSGCLASS=R,NOTIFY=&SYSUID,REGION=0M     
/*JOBPARM S=*
//* INSERT JOBCARD HERE                                               
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH               
//*** AS NOTIFY=&SYSUID AND ALSO A REGION=0M PARAMETER                
//*                                                                   
//********************************************************************
//* EXECUTE TARGET RUNNER FOR PROGRAM CWKTCOBX                        
//* COPY THIS JCL INTO A NEW RUNNER.JCL MEMBER IN A                   
//* TOPAZ FOR TOTAL TEST PROJECT JCL FOLDER                           
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR                                            
//*                                                                   
//********************************************************************
//*  UPDATE THE 1ST STEPLIB DD TO THE ECC SLCXCNTL DATASET            
//*  WHERE MLCXNNN IS MLCX170 OR HIGHER                               
//*  UPDATE THE 2ND DD TO THE LOADLIB THAT CONTAINS THE               
//*  CWKTCOBX TOPAZ FOR TOTAL TEST PROGRAM                            
//********************************************************************
//* 
//*STEPLIB DD DSN=KT.TRUNK.DEV9.LOAD,DISP=SHR
//*STEPLIB DD DSN=KT.TRUNK.HLD1.LOAD,DISP=SHR
//*        DD DSN=KT.TRUNK.PTFS.LOAD,DISP=SHR
//STEPLIB DD DISP=SHR,DSN=CX.R170000.SMPE.SLCXLOAD
//        DD DISP=SHR,DSN=ENTQA.TTT.PDSE.LOAD
//        DD  DISP=SHR,DSN=CEE.SCEERUN                         
//********************************************************************
//* NOTE THAT THE EMPFILE DD IS ONLY REQUIRED IF YOU WISH TO RUN      
//* THE TEST WITH USE STUBS = NO                                      
//* UPDATE THE EMPFILE DD TO THE ECC SLCXCNTL DATASET                 
//* WHERE MLCXNNN IS MLCX170 OR HIGHER                                
//********************************************************************
//EMPFILE DD DISP=SHR,DSN=ENTQA.TTT.CNTL.JUL2017(TTTDATH)             
//*                                                                   
//RPTFILE DD SYSOUT=*                                                 
//*                                                                   
//TRPARM DD *                                                         
*                                                                     
*        OPTIONALLY SET YOUR CUSTOM EXIT PROGRAM HERE:                
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
//*      OPTIONALLY ADD YOUR CUSTOM DD STATEMENTS         
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR               
//SYSPRINT DD SYSOUT=*                                    
//*                                                       
