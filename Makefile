#------------------------------------------------------------------------------
#                                BSP MAKEFILE
#
# This makefile was automatically generated by the nios2-bsp-generate-files
# command. Its purpose is to build a custom Board Support Package (BSP)
# targeting a specific Nios II processor in an SOPC Builder-based design.
#
# To create an application or library Makefile which uses this BSP, try the
# nios2-app-generate-makefile or nios2-lib-generate-makefile commands.
#------------------------------------------------------------------------------

#------------------------------------------------------------------------------
#                                 TOOLS
#------------------------------------------------------------------------------

MKDIR := mkdir -p
ECHO := echo
SPACE := $(empty) $(empty)

#------------------------------------------------------------------------------
#                         The adjust-path macro
# 
# If COMSPEC is defined, Make is launched from Windows through
# Cygwin.  This adjust-path macro will call 'cygpath -u' on all
# paths to ensure they are readable by Make.
#
# If COMSPEC is not defined, Make is launched from *nix, and no adjustment
# is necessary
#------------------------------------------------------------------------------

ifndef COMSPEC
ifdef ComSpec
COMSPEC = $(ComSpec)
endif # ComSpec
endif # !COMSPEC

ifdef COMSPEC
	adjust-path = $(subst $(SPACE),\$(SPACE),$(shell cygpath -u "$1"))
	adjust-path-mixed = $(subst $(SPACE),\$(SPACE),$(shell cygpath -m "$1"))
else
	adjust-path = $(subst $(SPACE),\$(SPACE),$1)
	adjust-path-mixed = $(subst $(SPACE),\$(SPACE),$1)
endif

#------------------------------------------------------------------------------
#                               DEFAULT TARGET
#
# The default target, "all", must appear before any other target in the
# Makefile. Note that extra prerequisites are added to the "all" rule later.
#------------------------------------------------------------------------------
.PHONY: all
all:
	@$(ECHO) [BSP build complete]


#------------------------------------------------------------------------------
#                           PATHS & DIRECTORY NAMES
#
# Explicitly locate absolute path of the BSP root
#------------------------------------------------------------------------------

BSP_ROOT_DIR := .

# Define absolute path to the root of the BSP.
ABS_BSP_ROOT := $(call adjust-path-mixed,$(shell pwd))

# Stash all BSP object files here
OBJ_DIR := ./obj


#------------------------------------------------------------------------------
#                              MANAGED CONTENT
#
# All content between the lines "START MANAGED" and "END MANAGED" below is
# generated based on variables in the BSP settings file when the
# nios2-bsp-generate-files command is invoked. If you wish to persist any
# information pertaining to the build process, it is recomended that you
# utilize the BSP settings mechanism to do so.
#
# Note that most variable assignments in this section have a corresponding BSP
# setting that can be changed by using the nios2-bsp-create-settings or  
# nios2-bsp-update-settings command before nios2-bsp-generate-files; if you 
# want any variable set to a specific value when this Makefile is re-generated 
# (to prevent hand-edits from being over-written), use the BSP settings 
# facilities above.
#------------------------------------------------------------------------------

#START MANAGED

# The following TYPE comment allows tools to identify the 'type' of target this 
# makefile is associated with. 
# TYPE: BSP_PRIVATE_MAKEFILE

# This following VERSION comment indicates the version of the tool used to 
# generate this makefile. A makefile variable is provided for VERSION as well. 
# ACDS_VERSION: 18.1
ACDS_VERSION := 18.1

# This following BUILD_NUMBER comment indicates the build number of the tool 
# used to generate this makefile. 
# BUILD_NUMBER: 625

SETTINGS_FILE := software/bsp/settings.bsp
SOPC_FILE := lab1.sopcinfo

#-------------------------------------------------------------------------------
#                             TOOL & COMMAND DEFINITIONS
# 
# The base command for each build operation are expressed here. Additional
# switches may be expressed here. They will run for all instances of the 
# utility.
#-------------------------------------------------------------------------------

# Archiver command. Creates library files. 
AR = nios2-elf-ar

# Assembler command. Note that CC is used for .S files. 
AS = nios2-elf-gcc

# Custom flags only passed to the archiver. This content of this variable is 
# directly passed to the archiver rather than the more standard "ARFLAGS". The 
# reason for this is that GNU Make assumes some default content in ARFLAGS. 
# This setting defines the value of BSP_ARFLAGS in Makefile. 
BSP_ARFLAGS = -src

# Custom flags only passed to the assembler. This setting defines the value of 
# BSP_ASFLAGS in Makefile. 
BSP_ASFLAGS = -Wa,-gdwarf2

# C/C++ compiler debug level. '-g' provides the default set of debug symbols 
# typically required to debug a typical application. Omitting '-g' removes 
# debug symbols from the ELF. This setting defines the value of 
# BSP_CFLAGS_DEBUG in Makefile. 
BSP_CFLAGS_DEBUG = -g

# C/C++ compiler optimization level. "-O0" = no optimization,"-O2" = "normal" 
# optimization, etc. "-O0" is recommended for code that you want to debug since 
# compiler optimization can remove variables and produce non-sequential 
# execution of code while debugging. This setting defines the value of 
# BSP_CFLAGS_OPTIMIZATION in Makefile. 
BSP_CFLAGS_OPTIMIZATION = -O0

# C/C++ compiler warning level. "-Wall" is commonly used.This setting defines 
# the value of BSP_CFLAGS_WARNINGS in Makefile. 
BSP_CFLAGS_WARNINGS = -Wall

# C compiler command. 
CC = nios2-elf-gcc -xc

# C++ compiler command. 
CXX = nios2-elf-gcc -xc++

# Command used to remove files during 'clean' target. 
RM = rm -f


#-------------------------------------------------------------------------------
#                         BUILD PRE & POST PROCESS COMMANDS
# 
# The following variables are treated as shell commands in the rule
# definitions for each file-type associated with the BSP build, as well as
# commands run at the beginning and end of the entire BSP build operation.
# Pre-process commands are executed before the relevant command (for example,
# a command defined in the "CC_PRE_PROCESS" variable executes before the C
# compiler for building .c files), while post-process commands are executed
# immediately afterwards.
# 
# You can view each pre/post-process command in the "Build Rules: All &
# Clean", "Pattern Rules to Build Objects", and "Library Rules" sections of
# this Makefile.
#-------------------------------------------------------------------------------


#-------------------------------------------------------------------------------
#                     BSP SOURCE BUILD SETTINGS (FLAG GENERATION)
# 
# Software build settings such as compiler optimization, debug level, warning
# flags, etc., may be defined in the following variables. The variables below
# are concatenated together in the 'Flags' section of this Makefile to form
# final variables of flags passed to the build tools.
# 
# These settings are considered private to the BSP and apply to all library &
# driver files in it; they do NOT automatically propagate to, for example, the
# build settings for an application.
# # For additional detail and syntax requirements, please refer to GCC help
# (example: "nios2-elf-gcc --help --verbose").
# 
# Unless indicated otherwise, multiple entries in each variable should be
# space-separated.
#-------------------------------------------------------------------------------

# Altera HAL alt_sys_init.c generated source file 
GENERATED_C_FILES := $(ABS_BSP_ROOT)/alt_sys_init.c
GENERATED_C_LIB_SRCS += alt_sys_init.c


#-------------------------------------------------------------------------------
#                            BSP SOURCE FILE LISTING
# 
# All source files that comprise the BSP are listed here, along with path 
# information to each file expressed relative to the BSP root. The precise 
# list and location of each file is derived from the driver, operating system, 
# or software package source file declarations.
#
# Following specification of the source files for each component, driver, etc.,
# each source file type (C, assembly, etc.) is concatenated together and used
# to construct a list of objects. Pattern rules to build each object are then
# used to build each file.
#-------------------------------------------------------------------------------

# altera_avalon_jtag_uart_driver sources root 
altera_avalon_jtag_uart_driver_SRCS_ROOT := drivers

# altera_avalon_jtag_uart_driver sources 
altera_avalon_jtag_uart_driver_C_LIB_SRCS := \
	$(altera_avalon_jtag_uart_driver_SRCS_ROOT)/src/altera_avalon_jtag_uart_init.c \
	$(altera_avalon_jtag_uart_driver_SRCS_ROOT)/src/altera_avalon_jtag_uart_read.c \
	$(altera_avalon_jtag_uart_driver_SRCS_ROOT)/src/altera_avalon_jtag_uart_write.c \
	$(altera_avalon_jtag_uart_driver_SRCS_ROOT)/src/altera_avalon_jtag_uart_ioctl.c \
	$(altera_avalon_jtag_uart_driver_SRCS_ROOT)/src/altera_avalon_jtag_uart_fd.c

# altera_avalon_pio_driver sources root 
altera_avalon_pio_driver_SRCS_ROOT := drivers

# altera_avalon_pio_driver sources 
# altera_nios2_gen2_hal_driver sources root 
altera_nios2_gen2_hal_driver_SRCS_ROOT := HAL

# altera_nios2_gen2_hal_driver sources 
altera_nios2_gen2_hal_driver_C_LIB_SRCS := \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/altera_nios2_gen2_irq.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_usleep.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_busy_sleep.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_irq_vars.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_icache_flush.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_icache_flush_all.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_dcache_flush.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_dcache_flush_all.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_dcache_flush_no_writeback.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_ecc_fatal_exception.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_instruction_exception_entry.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_irq_register.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_iic.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_remap_cached.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_remap_uncached.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_uncached_free.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_uncached_malloc.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_do_ctors.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_do_dtors.c \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_gmon.c

altera_nios2_gen2_hal_driver_ASM_LIB_SRCS := \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_ecc_fatal_entry.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_exception_entry.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_exception_trap.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_exception_muldiv.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_irq_entry.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_software_exception.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_mcount.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/alt_log_macro.S \
	$(altera_nios2_gen2_hal_driver_SRCS_ROOT)/src/crt0.S

# hal sources root 
hal_SRCS_ROOT := HAL

# hal sources 
hal_C_LIB_SRCS := \
	$(hal_SRCS_ROOT)/src/alt_alarm_start.c \
	$(hal_SRCS_ROOT)/src/alt_close.c \
	$(hal_SRCS_ROOT)/src/alt_dev.c \
	$(hal_SRCS_ROOT)/src/alt_dev_llist_insert.c \
	$(hal_SRCS_ROOT)/src/alt_dma_rxchan_open.c \
	$(hal_SRCS_ROOT)/src/alt_dma_txchan_open.c \
	$(hal_SRCS_ROOT)/src/alt_environ.c \
	$(hal_SRCS_ROOT)/src/alt_env_lock.c \
	$(hal_SRCS_ROOT)/src/alt_errno.c \
	$(hal_SRCS_ROOT)/src/alt_execve.c \
	$(hal_SRCS_ROOT)/src/alt_exit.c \
	$(hal_SRCS_ROOT)/src/alt_fcntl.c \
	$(hal_SRCS_ROOT)/src/alt_fd_lock.c \
	$(hal_SRCS_ROOT)/src/alt_fd_unlock.c \
	$(hal_SRCS_ROOT)/src/alt_find_dev.c \
	$(hal_SRCS_ROOT)/src/alt_find_file.c \
	$(hal_SRCS_ROOT)/src/alt_flash_dev.c \
	$(hal_SRCS_ROOT)/src/alt_fork.c \
	$(hal_SRCS_ROOT)/src/alt_fs_reg.c \
	$(hal_SRCS_ROOT)/src/alt_fstat.c \
	$(hal_SRCS_ROOT)/src/alt_get_fd.c \
	$(hal_SRCS_ROOT)/src/alt_getchar.c \
	$(hal_SRCS_ROOT)/src/alt_getpid.c \
	$(hal_SRCS_ROOT)/src/alt_gettod.c \
	$(hal_SRCS_ROOT)/src/alt_iic_isr_register.c \
	$(hal_SRCS_ROOT)/src/alt_instruction_exception_register.c \
	$(hal_SRCS_ROOT)/src/alt_ioctl.c \
	$(hal_SRCS_ROOT)/src/alt_io_redirect.c \
	$(hal_SRCS_ROOT)/src/alt_irq_handler.c \
	$(hal_SRCS_ROOT)/src/alt_isatty.c \
	$(hal_SRCS_ROOT)/src/alt_kill.c \
	$(hal_SRCS_ROOT)/src/alt_link.c \
	$(hal_SRCS_ROOT)/src/alt_load.c \
	$(hal_SRCS_ROOT)/src/alt_log_printf.c \
	$(hal_SRCS_ROOT)/src/alt_lseek.c \
	$(hal_SRCS_ROOT)/src/alt_main.c \
	$(hal_SRCS_ROOT)/src/alt_malloc_lock.c \
	$(hal_SRCS_ROOT)/src/alt_open.c \
	$(hal_SRCS_ROOT)/src/alt_printf.c \
	$(hal_SRCS_ROOT)/src/alt_putchar.c \
	$(hal_SRCS_ROOT)/src/alt_putcharbuf.c \
	$(hal_SRCS_ROOT)/src/alt_putstr.c \
	$(hal_SRCS_ROOT)/src/alt_read.c \
	$(hal_SRCS_ROOT)/src/alt_release_fd.c \
	$(hal_SRCS_ROOT)/src/alt_rename.c \
	$(hal_SRCS_ROOT)/src/alt_sbrk.c \
	$(hal_SRCS_ROOT)/src/alt_settod.c \
	$(hal_SRCS_ROOT)/src/alt_stat.c \
	$(hal_SRCS_ROOT)/src/alt_tick.c \
	$(hal_SRCS_ROOT)/src/alt_times.c \
	$(hal_SRCS_ROOT)/src/alt_unlink.c \
	$(hal_SRCS_ROOT)/src/alt_wait.c \
	$(hal_SRCS_ROOT)/src/alt_write.c


# Assemble all component C source files 
COMPONENT_C_LIB_SRCS += \
	$(altera_avalon_jtag_uart_driver_C_LIB_SRCS) \
	$(altera_nios2_gen2_hal_driver_C_LIB_SRCS) \
	$(hal_C_LIB_SRCS)

# Assemble all component assembly source files 
COMPONENT_ASM_LIB_SRCS += \
	$(altera_nios2_gen2_hal_driver_ASM_LIB_SRCS)

# Assemble all component C++ source files 
COMPONENT_CPP_LIB_SRCS += \

#END MANAGED

#------------------------------------------------------------------------------
#                                 PUBLIC.MK
#
# The generated public.mk file contains BSP information that is shared with
# other external makefiles, such as a Nios II application makefile. System-
# dependent information such as hardware-specific compiler flags and
# simulation file generation are stored here.
#
# In addition, public.mk contains include paths that various software,
# such as a device driver, may need for the C compiler. These paths are
# written to public.mk with respect to the BSP root. In public.mk, each
# path is prefixed with a special variable, $(ALT_LIBRARY_ROOT_DIR). The
# purpose of this variable is to allow an external Makefile to append on
# path information to precisely locate paths expressed in public.mk
# Since this is the BSP Makefile, we set ALT_LIBRARY_ROOT_DIR to point right
# here ("."), at the BSP root. 
#
# ALT_LIBRARY_ROOT_DIR must always be set before public.mk is included.
#------------------------------------------------------------------------------
ALT_LIBRARY_ROOT_DIR := .
include public.mk


#------------------------------------------------------------------------------
#                                FLAGS
#
# Include paths for BSP files are written into the public.mk file and must
# be added to the existing list of pre-processor flags. In addition, "hooks"
# for standard flags left intentionally empty (CFLAGS, CPPFLAGS, ASFLAGS,
# and CXXFLAGS) are provided for conveniently adding to the relevant flags
# on the command-line or via script that calls make.
#------------------------------------------------------------------------------
# Assemble final list of compiler flags from generated content
BSP_CFLAGS += \
  $(BSP_CFLAGS_DEFINED_SYMBOLS) \
  $(BSP_CFLAGS_UNDEFINED_SYMBOLS) \
  $(BSP_CFLAGS_OPTIMIZATION) \
  $(BSP_CFLAGS_DEBUG) \
  $(BSP_CFLAGS_WARNINGS) \
  $(BSP_CFLAGS_USER_FLAGS) \
  $(ALT_CFLAGS) \
  $(CFLAGS) 

# Make ready the final list of include directories and other C pre-processor
# flags. Each include path is made ready by prefixing it with "-I".
BSP_CPPFLAGS += \
  $(addprefix -I, $(BSP_INC_DIRS)) \
  $(addprefix -I, $(ALT_INCLUDE_DIRS)) \
  $(ALT_CPPFLAGS) \
  $(CPPFLAGS)

# Finish off assembler flags with any user-provided flags
BSP_ASFLAGS += $(ASFLAGS)

# Finish off C++ flags with any user-provided flags
BSP_CXXFLAGS += $(CXXFLAGS)

# And finally, the ordered list
C_SRCS += $(GENERATED_C_LIB_SRCS) \
          $(COMPONENT_C_LIB_SRCS)

CXX_SRCS += $(GENERATED_CPP_LIB_SRCS) \
          $(COMPONENT_CPP_LIB_SRCS)

ASM_SRCS += $(GENERATED_ASM_LIB_SRCS) \
            $(COMPONENT_ASM_LIB_SRCS)


#------------------------------------------------------------------------------
#                         LIST OF GENERATED FILES
#
# A Nios II BSP relies on the generation of several source files used
# by both the BSP and any applications referencing the BSP.
#------------------------------------------------------------------------------


GENERATED_H_FILES := $(ABS_BSP_ROOT)/system.h

GENERATED_LINKER_SCRIPT := $(ABS_BSP_ROOT)/linker.x

GENERATED_FILES += $(GENERATED_H_FILES) \
                   $(GENERATED_LINKER_SCRIPT)


#------------------------------------------------------------------------------
#                        SETUP TO BUILD OBJECTS
#
# List of object files which are to be built. This is constructed from the input
# list of C source files (C_SRCS), C++ source files (CXX_SRCS), and assembler
# source file (ASM_SRCS). The permitted file extensions are:
#
# .c .C                       - for C files
# .cxx .cc .cpp .CXX .CC .CPP - for C++ files
# .S .s                       - for assembly files
#
# Extended description: The list of objects is a sorted list (duplicates
# removed) of all possible objects, placed beneath the ./obj directory,
# including any path information stored in the "*_SRCS" variable. The
# "patsubst" commands are used to concatenate together multiple file suffix
# types for common files (i.e. c++ as .cxx, .cc, .cpp).
#
# File extensions are case-insensitive in build rules with the exception of
# assembly sources. Nios II assembly sources with the ".S" extension are first
# run through the C preprocessor. Sources with the ".s" extension are not.
#------------------------------------------------------------------------------
OBJS = $(sort $(addprefix $(OBJ_DIR)/,                                        \
               $(patsubst %.c, %.o,   $(patsubst %.C, %.o, $(C_SRCS)))        \
               $(patsubst %.cxx, %.o, $(patsubst %.CXX, %.o,                  \
               $(patsubst %.cc, %.o,  $(patsubst %.CC, %.o,                   \
               $(patsubst %.cpp, %.o, $(patsubst %.CPP, %.o,                  \
                 $(CXX_SRCS) ))))))                                           \
               $(patsubst %.S, %.o, $(patsubst %.s, %.o, $(ASM_SRCS))) ))

# List of dependancy files for each object file.
DEPS = $(OBJS:.o=.d)


# Rules to force your project to rebuild or relink
# .force_relink file will cause any application that depends on this project to relink 
# .force_rebuild file will cause this project to rebuild object files
# .force_rebuild_all file will cause this project and any project that depends on this project to rebuild object files

FORCE_RELINK_DEP  := .force_relink
FORCE_REBUILD_DEP := .force_rebuild
FORCE_REBUILD_ALL_DEP := .force_rebuild_all
FORCE_REBUILD_DEP_LIST := $(FORCE_RELINK_DEP) $(FORCE_REBUILD_DEP) $(FORCE_REBUILD_ALL_DEP)

$(FORCE_REBUILD_DEP_LIST):

$(OBJS): $(wildcard $(FORCE_REBUILD_DEP)) $(wildcard $(FORCE_REBUILD_ALL_DEP))


#------------------------------------------------------------------------------
#                          BUILD RULES: ALL & CLEAN
#------------------------------------------------------------------------------
.DELETE_ON_ERROR:

.PHONY: all
all: build_pre_process
all: Makefile $(GENERATED_FILES) $(BSP_LIB) $(NEWLIB_DIR)
all: build_post_process


# clean: remove .o/.a/.d
.PHONY: clean
clean:
	@$(RM) -r $(BSP_LIB) $(OBJ_DIR) $(FORCE_REBUILD_DEP_LIST)
ifneq ($(wildcard $(NEWLIB_DIR)),)
	@$(RM) -r $(NEWLIB_DIR)
endif
	@$(ECHO) [BSP clean complete]


#------------------------------------------------------------------------------
#                           BUILD PRE/POST PROCESS
#------------------------------------------------------------------------------
build_pre_process :
	$(BUILD_PRE_PROCESS)

build_post_process :
	$(BUILD_POST_PROCESS)

.PHONY: build_pre_process build_post_process



#------------------------------------------------------------------------------
#                             MAKEFILE UP TO DATE?
#
# Is this very Makefile up to date? Someone may have changed the BSP settings
# file or the associated target hardware.
#------------------------------------------------------------------------------
# Skip this check when clean is the only target
ifneq ($(MAKECMDGOALS),clean)

ifneq ($(wildcard $(SETTINGS_FILE)),$(SETTINGS_FILE))
$(warning Warning: BSP Settings File $(SETTINGS_FILE) could not be found.)
endif

Makefile: $(wildcard $(SETTINGS_FILE))
	@$(ECHO) Makefile not up to date.
	@$(ECHO) $(SETTINGS_FILE) has been modified since the BSP Makefile was generated.
	@$(ECHO)
	@$(ECHO) Generate the BSP to update the Makefile, and then build again.
	@$(ECHO)
	@$(ECHO) To generate from Eclipse:
	@$(ECHO) " 1. Right-click the BSP project."
	@$(ECHO) " 2. In the Nios II Menu, click Generate BSP."
	@$(ECHO)
	@$(ECHO) To generate from the command line:
	@$(ECHO) " nios2-bsp-generate-files --settings=<settings file> --bsp-dir=<target bsp files directory>"
	@$(ECHO)
	@exit 1

ifneq ($(wildcard $(SOPC_FILE)),$(SOPC_FILE))
$(warning Warning: SOPC File $(SOPC_FILE) could not be found.)
endif

public.mk: $(wildcard $(SOPC_FILE))
	@$(ECHO) Makefile not up to date.
	@$(ECHO) $(SOPC_FILE) has been modified since the BSP was generated.
	@$(ECHO)
	@$(ECHO) Generate the BSP to update the Makefile, and then build again.
	@$(ECHO)
	@$(ECHO) To generate from Eclipse:
	@$(ECHO) " 1. Right-click the BSP project."
	@$(ECHO) " 2. In the Nios II Menu, click Generate BSP."
	@$(ECHO)
	@$(ECHO) To generate from the command line:
	@$(ECHO) " nios2-bsp-generate-files --settings=<settings file> --bsp-dir=<target bsp files directory>"
	@$(ECHO)
	@exit 1

endif # $(MAKECMDGOALS) != clean

#------------------------------------------------------------------------------
#                     PATTERN RULES TO BUILD OBJECTS
#------------------------------------------------------------------------------
$(OBJ_DIR)/%.o: %.c
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CC_PRE_PROCESS)
	$(CC) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CC_POST_PROCESS)

$(OBJ_DIR)/%.o: %.C
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CC_PRE_PROCESS)
	$(CC) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CC_POST_PROCESS)

$(OBJ_DIR)/%.o: %.cpp
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

$(OBJ_DIR)/%.o: %.CPP
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

$(OBJ_DIR)/%.o: %.cc
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

$(OBJ_DIR)/%.o: %.CC
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

$(OBJ_DIR)/%.o: %.cxx
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

$(OBJ_DIR)/%.o: %.CXX
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

$(OBJ_DIR)/%.o: %.S
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(AS_PRE_PROCESS)
	$(AS) -MP -MMD -c $(BSP_CFLAGS) $(BSP_CPPFLAGS) $(BSP_ASFLAGS) -o $@ $<
	$(AS_POST_PROCESS)

$(OBJ_DIR)/%.o: %.s
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(AS_PRE_PROCESS)
	$(AS) -MP -MMD -c $(BSP_ASFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(AS_POST_PROCESS)

# Pattern rules for making useful intermediate files
$(OBJ_DIR)/%.s: %.c
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CC_PRE_PROCESS)
	$(CC) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CC_POST_PROCESS)

$(OBJ_DIR)/%.s: %.cpp
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_PRE_PROCESS)

$(OBJ_DIR)/%.s: %.cc
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_PRE_PROCESS)

$(OBJ_DIR)/%.s: %.cxx
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_PRE_PROCESS)

$(OBJ_DIR)/%.i: %.c
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CC_PRE_PROCESS)
	$(CC) -E $(CPPFLAGS) $(ALT_CFLAGS) $(CFLAGS) -o $@ $<
	$(CC_PRE_PROCESS)

$(OBJ_DIR)/%.i: %.cpp
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_PRE_PROCESS)

$(OBJ_DIR)/%.i: %.cc
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_PRE_PROCESS)

$(OBJ_DIR)/%.i: %.cxx
	@$(ECHO) Compiling $(<F) to assembler...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_PRE_PROCESS)

# Pattern rules for building other object files.
%.o: %.c
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CC_PRE_PROCESS)
	$(CC) -MP -MMD -c $(CPPFLAGS) $(ALT_CFLAGS) $(CFLAGS) -o $@ $<
	$(CC_POST_PROCESS)

%.o: %.cpp
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_POST_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

%.o: %.cc
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_POST_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

%.o: %.cxx
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(CXX_PRE_PROCESS)
	$(CXX) -MP -MMD -c $(BSP_CPPFLAGS) $(BSP_CXXFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(CXX_POST_PROCESS)

%.o: %.S
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(AS_PRE_PROCESS)
	$(AS) -MP -MMD -c $(BSP_CFLAGS) $(BSP_CPPFLAGS) $(BSP_ASFLAGS) -o $@ $<
	$(AS_POST_PROCESS)

%.o: %.s
	@$(ECHO) Compiling $(<F)...
	@$(MKDIR) $(@D)
	$(AS_PRE_PROCESS)
	$(AS) -MP -MMD -c $(BSP_ASFLAGS) $(BSP_CFLAGS) -o $@ $<
	$(AS_POST_PROCESS)


#------------------------------------------------------------------------------
#                               NEWLIB RULES
#------------------------------------------------------------------------------

ifneq ($(COMPILE_NEWLIB),)
NEWLIB_FLAGS += $(BSP_CFLAGS)
endif

ifneq ($(NEWLIB_DIR),)
$(NEWLIB_DIR):
	@$(ECHO) Creating $(NEWLIB_DIR)...
	nios2-newlib-gen --no-multilib $(NEWLIB_DIR)-build-tmp $(NEWLIB_DIR) --custom "$(NEWLIB_FLAGS)"		
	@$(ECHO) Removing $(NEWLIB_DIR)-build-tmp...
	@$(RM) -rf $(NEWLIB_DIR)-build-tmp
endif

#------------------------------------------------------------------------------
#                               LIBRARY RULES
#------------------------------------------------------------------------------
$(BSP_LIB): $(OBJS)
	@$(ECHO) Creating $@...
	$(AR_PRE_PROCESS)
	$(RM) -f $@
	$(AR) $(BSP_ARFLAGS) $@ $^
	$(AR_POST_PROCESS)


#------------------------------------------------------------------------------
#                                DEPENDENCY FILES
#------------------------------------------------------------------------------
ifneq ($(findstring clean, $(MAKECMDGOALS)),clean)
-include $(DEPS)
endif

# End of Makefile


