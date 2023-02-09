#
# Generated Makefile - do not edit!
#
# Edit the Makefile in the project folder instead (../Makefile). Each target
# has a -pre and a -post target defined where you can add customized code.
#
# This makefile implements configuration specific macros and targets.


# Include project Makefile
ifeq "${IGNORE_LOCAL}" "TRUE"
# do not include local makefile. User is passing all local related variables already
else
include Makefile
# Include makefile containing local settings
ifeq "$(wildcard nbproject/Makefile-local-pic18f4550.mk)" "nbproject/Makefile-local-pic18f4550.mk"
include nbproject/Makefile-local-pic18f4550.mk
endif
endif

# Environment
MKDIR=gnumkdir -p
RM=rm -f 
MV=mv 
CP=cp 

# Macros
CND_CONF=pic18f4550
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
IMAGE_TYPE=debug
OUTPUT_SUFFIX=elf
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
else
IMAGE_TYPE=production
OUTPUT_SUFFIX=hex
DEBUGGABLE_SUFFIX=elf
FINAL_IMAGE=${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}
endif

ifeq ($(COMPARE_BUILD), true)
COMPARISON_BUILD=-mafrlcsj
else
COMPARISON_BUILD=
endif

# Object Directory
OBJECTDIR=build/${CND_CONF}/${IMAGE_TYPE}

# Distribution Directory
DISTDIR=dist/${CND_CONF}/${IMAGE_TYPE}

# Source Files Quoted if spaced
SOURCEFILES_QUOTED_IF_SPACED=../src/system_config/picdem_fs_usb/system.c ../src/app_device_cdc_basic.c ../src/app_led_usb_status.c ../src/main.c ../src/usb_descriptors.c ../src/framework/usb/src/usb_device.c ../src/framework/usb/src/usb_device_cdc.c ../src/pulse_gen_tasks.c ../src/pulse_gen_init.c ../src/pulse_gen_com_tasks.c

# Object Files Quoted if spaced
OBJECTFILES_QUOTED_IF_SPACED=${OBJECTDIR}/_ext/155687496/system.p1 ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1 ${OBJECTDIR}/_ext/1360937237/main.p1 ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1 ${OBJECTDIR}/_ext/1821419186/usb_device.p1 ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1 ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1 ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1
POSSIBLE_DEPFILES=${OBJECTDIR}/_ext/155687496/system.p1.d ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d ${OBJECTDIR}/_ext/1360937237/main.p1.d ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d

# Object Files
OBJECTFILES=${OBJECTDIR}/_ext/155687496/system.p1 ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1 ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1 ${OBJECTDIR}/_ext/1360937237/main.p1 ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1 ${OBJECTDIR}/_ext/1821419186/usb_device.p1 ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1 ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1 ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1 ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1

# Source Files
SOURCEFILES=../src/system_config/picdem_fs_usb/system.c ../src/app_device_cdc_basic.c ../src/app_led_usb_status.c ../src/main.c ../src/usb_descriptors.c ../src/framework/usb/src/usb_device.c ../src/framework/usb/src/usb_device_cdc.c ../src/pulse_gen_tasks.c ../src/pulse_gen_init.c ../src/pulse_gen_com_tasks.c



CFLAGS=
ASFLAGS=
LDLIBSOPTIONS=

############# Tool locations ##########################################
# If you copy a project from one host to another, the path where the  #
# compiler is installed may be different.                             #
# If you open this project with MPLAB X in the new host, this         #
# makefile will be regenerated and the paths will be corrected.       #
#######################################################################
# fixDeps replaces a bunch of sed/cat/printf statements that slow down the build
FIXDEPS=fixDeps

.build-conf:  ${BUILD_SUBPROJECTS}
ifneq ($(INFORMATION_MESSAGE), )
	@echo $(INFORMATION_MESSAGE)
endif
	${MAKE}  -f nbproject/Makefile-pic18f4550.mk ${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}

MP_PROCESSOR_OPTION=18F4550
# ------------------------------------------------------------------------------------
# Rules for buildStep: compile
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${OBJECTDIR}/_ext/155687496/system.p1: ../src/system_config/picdem_fs_usb/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/155687496" 
	@${RM} ${OBJECTDIR}/_ext/155687496/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/155687496/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/155687496/system.p1 ../src/system_config/picdem_fs_usb/system.c 
	@-${MV} ${OBJECTDIR}/_ext/155687496/system.d ${OBJECTDIR}/_ext/155687496/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/155687496/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1: ../src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1 ../src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.d ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1: ../src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1 ../src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.d ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/main.p1: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/main.p1 ../src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/main.d ${OBJECTDIR}/_ext/1360937237/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1: ../src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1 ../src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.d ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1821419186/usb_device.p1: ../src/framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1821419186" 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1821419186/usb_device.p1 ../src/framework/usb/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1821419186/usb_device.d ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1: ../src/framework/usb/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1821419186" 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1 ../src/framework/usb/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.d ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1: ../src/pulse_gen_tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1 ../src/pulse_gen_tasks.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1: ../src/pulse_gen_init.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1 ../src/pulse_gen_init.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1: ../src/pulse_gen_com_tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c  -D__DEBUG=1  -mdebugger=none   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1 ../src/pulse_gen_com_tasks.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
else
${OBJECTDIR}/_ext/155687496/system.p1: ../src/system_config/picdem_fs_usb/system.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/155687496" 
	@${RM} ${OBJECTDIR}/_ext/155687496/system.p1.d 
	@${RM} ${OBJECTDIR}/_ext/155687496/system.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/155687496/system.p1 ../src/system_config/picdem_fs_usb/system.c 
	@-${MV} ${OBJECTDIR}/_ext/155687496/system.d ${OBJECTDIR}/_ext/155687496/system.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/155687496/system.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1: ../src/app_device_cdc_basic.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1 ../src/app_device_cdc_basic.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.d ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/app_device_cdc_basic.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1: ../src/app_led_usb_status.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1 ../src/app_led_usb_status.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.d ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/app_led_usb_status.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/main.p1: ../src/main.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/main.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/main.p1 ../src/main.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/main.d ${OBJECTDIR}/_ext/1360937237/main.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/main.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1: ../src/usb_descriptors.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1 ../src/usb_descriptors.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.d ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/usb_descriptors.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1821419186/usb_device.p1: ../src/framework/usb/src/usb_device.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1821419186" 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1821419186/usb_device.p1 ../src/framework/usb/src/usb_device.c 
	@-${MV} ${OBJECTDIR}/_ext/1821419186/usb_device.d ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1821419186/usb_device.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1: ../src/framework/usb/src/usb_device_cdc.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1821419186" 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1 ../src/framework/usb/src/usb_device_cdc.c 
	@-${MV} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.d ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1821419186/usb_device_cdc.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1: ../src/pulse_gen_tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1 ../src/pulse_gen_tasks.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/pulse_gen_tasks.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1: ../src/pulse_gen_init.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1 ../src/pulse_gen_init.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/pulse_gen_init.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1: ../src/pulse_gen_com_tasks.c  nbproject/Makefile-${CND_CONF}.mk 
	@${MKDIR} "${OBJECTDIR}/_ext/1360937237" 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d 
	@${RM} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1 
	${MP_CC} $(MP_EXTRA_CC_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -c   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -DXPRJ_pic18f4550=$(CND_CONF)  -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits $(COMPARISON_BUILD)  -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -o ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1 ../src/pulse_gen_com_tasks.c 
	@-${MV} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.d ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d 
	@${FIXDEPS} ${OBJECTDIR}/_ext/1360937237/pulse_gen_com_tasks.p1.d $(SILENT) -rsi ${MP_CC_DIR}../  
	
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assemble
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: assembleWithPreprocess
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
else
endif

# ------------------------------------------------------------------------------------
# Rules for buildStep: link
ifeq ($(TYPE_IMAGE), DEBUG_RUN)
${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk    
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.map  -D__DEBUG=1  -mdebugger=none  -DXPRJ_pic18f4550=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     -mrom=default,-7dc0-7fff -mram=default,-3f4-3ff,-f9c-f9c,-fd4-fd4,-fdb-fdf,-fe3-fe7,-feb-fef,-ffd-fff  $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	@${RM} ${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.hex 
	
else
${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${OUTPUT_SUFFIX}: ${OBJECTFILES}  nbproject/Makefile-${CND_CONF}.mk   
	@${MKDIR} ${DISTDIR} 
	${MP_CC} $(MP_EXTRA_LD_PRE) -mcpu=$(MP_PROCESSOR_OPTION) -Wl,-Map=${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.map  -DXPRJ_pic18f4550=$(CND_CONF)  -Wl,--defsym=__MPLAB_BUILD=1   -mdfp="${DFP_DIR}/xc8"  -fno-short-double -fno-short-float -memi=wordwrite -maddrqual=ignore -xassembler-with-cpp -I"../src" -I"../src/framework" -I"../src/bsp/picdem_fs_usb" -I"../src/system_config/picdem_fs_usb" -mwarn=0 -Wa,-a -msummary=-psect,-class,+mem,-hex,-file  -ginhx32 -Wl,--data-init -mno-keep-startup -mno-download -mdefault-config-bits -std=c99 -gdwarf-3 -mstack=compiled:auto:auto:auto     $(COMPARISON_BUILD) -Wl,--memorysummary,${DISTDIR}/memoryfile.xml -o ${DISTDIR}/TRAIN_SIMULATOR_FW.X.${IMAGE_TYPE}.${DEBUGGABLE_SUFFIX}  ${OBJECTFILES_QUOTED_IF_SPACED}     
	
endif


# Subprojects
.build-subprojects:


# Subprojects
.clean-subprojects:

# Clean Targets
.clean-conf: ${CLEAN_SUBPROJECTS}
	${RM} -r ${OBJECTDIR}
	${RM} -r ${DISTDIR}

# Enable dependency checking
.dep.inc: .depcheck-impl

DEPFILES=$(wildcard ${POSSIBLE_DEPFILES})
ifneq (${DEPFILES},)
include ${DEPFILES}
endif
