${TOTALTEST_JOBCARD}
/*JOBPARM S=*
//* INSERT JOBCARD HERE                                                
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH                
//*** AS NOTIFY=&SYSUID AND ALSO A REGION=0M PARAMETER                 
//*                                                                    
//******************************************************************** 
//* EXECUTE TARGET RUNNER FOR PROGRAM CWKTDB2X                         
//* COPY THIS JCL INTO A NEW RUNNER.JCL MEMBER IN A                    
//* TOPAZ FOR TOTAL TEST PROJECT JCL FOLDER                            
//******************************************************************** 
//RUNNER EXEC PGM=IKJEFT01    
//*                                                                    
//******************************************************************** 
//*  UPDATE THE 1ST STEPLIB DD TO THE ECC SLCXCNTL DATASET             
//*  WHERE MLCXNNN IS MLCX170 OR HIGHER                                
//*  UPDATE THE 2ND DD TO THE LOADLIB THAT CONTAINS THE                
//*  CWKTDB2X TOPAZ FOR TOTAL TEST PROGRAM                             
//*  UPDATE THE 3ND DD TO THE NAME OF YOUR DB2 SDSNLOAD               
//********************************************************************
//STEPLIB DD DISP=SHR,DSN=CX.R170000.SMPE.SLCXLOAD                    
//        DD DISP=SHR,DSN=ENTQA.TTT.PDSE.LOAD                         
//        DD DISP=SHR,DSN=DSNA10.SDSNLOAD                             
//*                                                                   
//********************************************************************
//* NOTE THAT THE EMPFILE DD IS ONLY REQUIRED IF YOU WISH TO RUN      
//* THE TEST WITH USE STUBS = NO                                      
//* UPDATE THE EMPFILE DD TO THE ECC SLCXCNTL DATASET                 
//* WHERE MLCXNNN IS MLCX170 OR HIGHER                                
//********************************************************************
//*EMPFILE DD DISP=SHR,DSN=ENTQA.TTT.CNTL.JUL2017(TTTDATD)  
//*EMPFILE DD DISP=SHR,DSN=ENTQA.TTT.CNTL.JUL2017(TTTDATE)
//*EMPFILE  DD  DISP=SHR,DSN=KT.DB2SQL.JCL(TTTDEM2)
//*                                                                   
//********************************************************************
//* ADD THE NAME OF YOUR DDIO OR SHARED DIRECTORY SOURCE FILE HERE    
//********************************************************************
//SLSF001 DD DISP=SHR,DSN=ENTQA.TTT.SHRDIR                            
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
//SYSTSPRT DD SYSOUT=*                                  
//SYSPRINT DD SYSOUT=*                                                 
//*********************************************************************
//*   UPDATE THE SYSTEM VALUE BELOW TO THAT USED IN THE                *
//*   CWKTCDB2 MEMBER IN THE ECC SLCXCNTL DATASET                      *
//*********************************************************************
//SYSTSIN  DD *                                                        
 DSN SYSTEM(DA01)                                                      
 RUN PROGRAM(TTTRUNNR) PLAN(CWKTDB2X) PARMS('00001')                   
 END
/*                                                                     
//                                                                     
