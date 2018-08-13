${TOTALTEST_JOBCARD}
/*JOBPARM S=*
//* INSERT JOBCARD HERE                                               
//*** THE JOB CARD MUST INCLUDE A NOTIFY STATEMENT SUCH               
//*** AS NOTIFY=&SYSUID AND ALSO A REGION=0M PARAMETER                
//*                                                                   
//*******************************************************************
//* EXECUTE TARGET RUNNER FOR PROGRAM CWKTVSKS                        
//* COPY THIS JCL INTO A NEW RUNNER.JCL MEMBER IN A                   
//* TOPAZ FOR TOTAL TEST PROJECT JCL FOLDER                           
//********************************************************************
//RUNNER EXEC PGM=TTTRUNNR                                            
//*                                                                   
//********************************************************************
//*  UPDATE THE 1ST STEPLIB DD TO THE ECC SLCXCNTL DATASET            
//*  WHERE MLCXNNN IS MLCX170 OR HIGHER                               
//*  UPDATE THE 2ND DD TO THE LOADLIB THAT CONTAINS THE               
//*  CWKTVSKS TOPAZ FOR TOTAL TEST PROGRAM                            
//********************************************************************
//*                                                                   
//STEPLIB DD DISP=SHR,DSN=CX.R170000.SMPE.SLCXLOAD               
//        DD DISP=SHR,DSN=ENTQA.TTT.PDSE.LOAD                     
//********************************************************************
//* NOTE THAT THE EMPFILE DD IS ONLY REQUIRED IF YOU WISH TO RUN      
//* THE TEST WITH USE STUBS = NO                                      
//* UPDATE THE EMPFILE DD TO THE VSAM DATASET CREATED BY THE CWKTVSKS 
//* MEMBER IN THE ECC SLCXCNTL DATASET                                
//********************************************************************
//EMPFILE DD DISP=SHR,DSN=ENTQA.TTT.JULY.VSAM.KSDS.HRLY               
//*MPFILE DD DISP=SHR,DSN=CPWR.VSAM.KSDS.HRLY                         
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
DEBUG(ON)                                               
/*                                                       
//BININP DD DSN=${TOTALTEST_BININP},DISP=OLD             
//BINREF DD DSN=${TOTALTEST_BINREF},DISP=OLD             
//BINRES DD DSN=${TOTALTEST_BINRES},DISP=OLD             
//*                                                      
//*      OPTIONALLY ADD YOUR CUSTOM DD STATEMENTS        
//*DD1 DD DSN=HLQ.CUSTOM.TEST.LOAD,DISP=SHR              
//SYSPRINT DD SYSOUT=*                                   
//*                                                        
