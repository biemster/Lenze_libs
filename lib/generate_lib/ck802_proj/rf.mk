##
## Auto Generated makefile by CDK
## Do not modify this file, and any manual changes will be erased!!!   
##
## BuildSet
ProjectName            :=rf
ConfigurationName      :=BuildSet
WorkspacePath          :=./
ProjectPath            :=./
IntermediateDirectory  :=Obj
OutDir                 :=$(IntermediateDirectory)
User                   :=bingshuai.duanmu
Date                   :=12/20/21
CDKPath                :=../../../../../../C-Sky/CDK/
LinkerName             :=csky-elfabiv2-gcc
LinkerNameoption       :=
SIZE                   :=csky-elfabiv2-size
READELF                :=csky-elfabiv2-readelf
CHECKSUM               :=crc32
SharedObjectLinkerName :=
ObjectSuffix           :=.o
DependSuffix           :=.d
PreprocessSuffix       :=.i
DisassemSuffix         :=.asm
IHexSuffix             :=.ihex
BinSuffix              :=.bin
ExeSuffix              :=.elf
LibSuffix              :=.a
DebugSwitch            :=-g 
IncludeSwitch          :=-I
LibrarySwitch          :=-l
OutputSwitch           :=-o 
ElfInfoSwitch          :=-hlS
LibraryPathSwitch      :=-L
PreprocessorSwitch     :=-D
UnPreprocessorSwitch   :=-U
SourceSwitch           :=-c 
ObjdumpSwitch          :=-S
ObjcopySwitch          :=-O ihex
ObjcopyBinSwitch       :=-O binary
OutputFile             :=$(ProjectName)
ObjectSwitch           :=-o 
ArchiveOutputSwitch    := 
PreprocessOnlySwitch   :=-E
ObjectsFileList        :=rf.txt
MakeDirCommand         :=mkdir
LinkOptions            := -mcpu=ck802  -nostartfiles -Wl,--gc-sections -T"$(ProjectPath)/ck802/gcc_csky.ld"
LinkOtherFlagsOption   :=-u jump_table_base -u global_config -Wl,-zmax-page-size=1024 "$(ProjectPath)/../../../../misc/jack_rom_ck802.elf.ck802sym"
IncludePackagePath     :=
IncludeCPath           := $(IncludeSwitch). $(IncludeSwitch)../../../components/arch/ck802 $(IncludeSwitch)../../../components/ble/controller $(IncludeSwitch)../../../components/ble/hci $(IncludeSwitch)../../../components/ble/host $(IncludeSwitch)../../../components/ble/include $(IncludeSwitch)../../../components/driver/include $(IncludeSwitch)../../../components/inc $(IncludeSwitch)../../../components/libraries/crc16 $(IncludeSwitch)../../../components/libraries/dfl $(IncludeSwitch)../../../components/libraries/dwc $(IncludeSwitch)../../../components/libraries/secure $(IncludeSwitch)../../../components/osal/include $(IncludeSwitch)../../../misc $(IncludeSwitch)../src_patch $(IncludeSwitch)ck802/include  
IncludeAPath           := $(IncludeSwitch). $(IncludeSwitch)../source $(IncludeSwitch)driver_rom/include $(IncludeSwitch)include  
Libs                   := -Wl,--whole-archive  -Wl,--no-whole-archive $(LibrarySwitch)m  
ArLibs                 := "m" 
PackagesLibPath        :=
LibPath                := $(PackagesLibPath) 

##
## Common variables
## AR, CXX, CC, AS, CXXFLAGS and CFLAGS can be overriden using an environment variables
##
AR       :=csky-elfabiv2-ar rcu
CXX      :=csky-elfabiv2-g++
CC       :=csky-elfabiv2-gcc
AS       :=csky-elfabiv2-gcc
OBJDUMP  :=csky-elfabiv2-objdump
OBJCOPY  :=csky-elfabiv2-objcopy
CXXFLAGS := -mcpu=ck802   $(PreprocessorSwitch)_PHY_DEBUG  $(PreprocessorSwitch)SERV_GGS=0  $(PreprocessorSwitch)SERV_GATT_SERV=0  $(PreprocessorSwitch)SERV_DEV_INFO=0  $(PreprocessorSwitch)PHY_MCU_TYPE=MCU_BUMBEE_CK802  $(PreprocessorSwitch)MAIN_HAS_NOARGC  $(PreprocessorSwitch)MAIN_HAS_NORETURN  $(PreprocessorSwitch)OSAL_CBTIMER_NUM_TASKS=1  $(PreprocessorSwitch)HCI_TL_NONE=1  $(PreprocessorSwitch)OSALMEM_METRICS=0  $(PreprocessorSwitch)DEBUG_INFO=0  $(PreprocessorSwitch)CFG_SLEEP_MODE=PWR_MODE_SLEEP  $(PreprocessorSwitch)USE_ROMSYM_ALIAS=1  $(PreprocessorSwitch)HOST_CONFIG=6   -Os  -g3  -Wall  -ffunction-sections -ffunction-sections -fdata-sections -DADV_NCONN_CFG=0x01  -DADV_CONN_CFG=0x02  -DSCAN_CFG=0x04   -DINIT_CFG=0x08   -DBROADCASTER_CFG=0x01 -DOBSERVER_CFG=0x02  -DPERIPHERAL_CFG=0x04  -DCENTRAL_CFG=0x08  
CFLAGS   := -mcpu=ck802   $(PreprocessorSwitch)_PHY_DEBUG  $(PreprocessorSwitch)SERV_GGS=0  $(PreprocessorSwitch)SERV_GATT_SERV=0  $(PreprocessorSwitch)SERV_DEV_INFO=0  $(PreprocessorSwitch)PHY_MCU_TYPE=MCU_BUMBEE_CK802  $(PreprocessorSwitch)MAIN_HAS_NOARGC  $(PreprocessorSwitch)MAIN_HAS_NORETURN  $(PreprocessorSwitch)OSAL_CBTIMER_NUM_TASKS=1  $(PreprocessorSwitch)HCI_TL_NONE=1  $(PreprocessorSwitch)OSALMEM_METRICS=0  $(PreprocessorSwitch)DEBUG_INFO=0  $(PreprocessorSwitch)CFG_SLEEP_MODE=PWR_MODE_SLEEP  $(PreprocessorSwitch)USE_ROMSYM_ALIAS=1  $(PreprocessorSwitch)HOST_CONFIG=6   -Os  -g3  -Wall  -ffunction-sections -ffunction-sections -fdata-sections -DADV_NCONN_CFG=0x01  -DADV_CONN_CFG=0x02  -DSCAN_CFG=0x04   -DINIT_CFG=0x08   -DBROADCASTER_CFG=0x01 -DOBSERVER_CFG=0x02  -DPERIPHERAL_CFG=0x04  -DCENTRAL_CFG=0x08  
ASFLAGS  := -mcpu=ck802    -Wa,--gdwarf2  -ffunction-sections -fdata-sections  


Objects0=$(IntermediateDirectory)/src_patch_patch$(ObjectSuffix) $(IntermediateDirectory)/src_patch_rf_phy_driver$(ObjectSuffix) 



Objects=$(Objects0) 

##
## Main Build Targets 
##
.PHONY: all
all: $(IntermediateDirectory)/$(OutputFile)

$(IntermediateDirectory)/$(OutputFile):  $(Objects) Always_Link 
	$(AR) $(ArchiveOutputSwitch) $(IntermediateDirectory)/$(OutputFile)$(LibSuffix) @$(ObjectsFileList)
	@$(ProjectName).modify.bat $(IntermediateDirectory) $(OutputFile)$(LibSuffix) 

Always_Link:


##
## Objects
##
$(IntermediateDirectory)/src_patch_patch$(ObjectSuffix): ../src_patch/patch.c  Lst/src_patch_patch$(PreprocessSuffix)
	$(CC) $(SourceSwitch) ../src_patch/patch.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_patch_patch$(ObjectSuffix) -MF$(IntermediateDirectory)/src_patch_patch$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_patch_patch$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_patch_patch$(PreprocessSuffix): ../src_patch/patch.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_patch_patch$(PreprocessSuffix) ../src_patch/patch.c

$(IntermediateDirectory)/src_patch_rf_phy_driver$(ObjectSuffix): ../src_patch/rf_phy_driver.c  Lst/src_patch_rf_phy_driver$(PreprocessSuffix)
	$(CC) $(SourceSwitch) ../src_patch/rf_phy_driver.c $(CFLAGS) -MMD -MP -MT$(IntermediateDirectory)/src_patch_rf_phy_driver$(ObjectSuffix) -MF$(IntermediateDirectory)/src_patch_rf_phy_driver$(DependSuffix) $(ObjectSwitch)$(IntermediateDirectory)/src_patch_rf_phy_driver$(ObjectSuffix) $(IncludeCPath) $(IncludePackagePath)
Lst/src_patch_rf_phy_driver$(PreprocessSuffix): ../src_patch/rf_phy_driver.c
	$(CC) $(CFLAGS)$(IncludeCPath) $(PreprocessOnlySwitch) $(OutputSwitch) Lst/src_patch_rf_phy_driver$(PreprocessSuffix) ../src_patch/rf_phy_driver.c


-include $(IntermediateDirectory)/*$(DependSuffix)
