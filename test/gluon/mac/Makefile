SRC_DIR:=.
OUT_DIR:=bin
EXECUTABLE:=$(OUT_DIR)/test-window

SOURCE_NATIVE_CC:= $(shell find $(SRC_DIR) -name "*.mm")
OBJECTS:= $(addsuffix .o, $(patsubst $(SRC_DIR)/%,$(OUT_DIR)/_objs/%,$(SOURCE_NATIVE_CC)))

# Compiler
CXX:= g++
CXXFLAGS:= 
LDFLAGS:=
LDLIBS:=

CXXFLAGS+=-std=c++11

# Debug flags
CXXFLAGS+=-O0 -g -Wall
# - clang AddressSanitizer
CXXFLAGS += -fsanitize=address -fno-omit-frame-pointer
LDFLAGS += -fsanitize=address -fno-omit-frame-pointer

# Release flags
# CXXFLAGS+=-O3 -Wall

# Libraries
# > Khronos Headers
CXXFLAGS+= -I./lib/khronos_headers

# > OS X GLES Emulation
GLES2_DIR:= lib/powervr_gles
GLES2_LIBS:= $(shell echo $(GLES2_DIR)/lib{GLESv2,EGL}.dylib)
OUT_GLES2_LIBS:= $(patsubst $(GLES2_DIR)/%,$(OUT_DIR)/Frameworks/%,$(GLES2_LIBS))
LDLIBS+= $(OUT_GLES2_LIBS)

# > Cocoa (for OSX windowing)
LDFLAGS+= -framework Cocoa

# > embedded haxe example
CXXFLAGS+= -I../bin/include
LDFLAGS += ../bin/libExample.a

# > include hxcpp libs
HXCPP := $(shell haxelib config)/hxcpp/4,0,52
CXXFLAGS+= -I$(HXCPP)/include
# LDFLAGS += $(HXCPP)/lib/Mac64/libregexp.a $(HXCPP)/lib/Mac64/libstd.a $(HXCPP)/lib/Mac64/libzlib.a 


$(EXECUTABLE): $(OBJECTS)	$(OUT_GLES2_LIBS)
	@$(call ECHO_SUBHEADING,"Building \"$@\"")
	@$(call TOUCH_DIRECTORIES,$@)
	@# link
	$(CXX) $(LDFLAGS) $(LDLIBS) $(OBJECTS) -o "$@"
	@$(call ECHO_SUCCESS,"Completed target \"$@\"")

$(OBJECTS): $(OUT_DIR)/_objs/%.o : $(SRC_DIR)/%
	@$(call TOUCH_DIRECTORIES,$@)
	@# compile
	$(CXX) $(CXXFLAGS) -c "$<" -o "$@"

# GLES2 .dylib Copy And Patch
$(OUT_GLES2_LIBS): $(OUT_DIR)/Frameworks/% : $(GLES2_DIR)/%
	@$(call TOUCH_DIRECTORIES,$@)
	cp -f "$<" "$@"
	install_name_tool -id "@executable_path/Frameworks/$(notdir $@)" $@

$(GLES2_LIBS):
	@$(call TOUCH_DIRECTORIES,$@)
	@$(call ECHO_SUBHEADING,"Downloading \"$@\"")
	curl -sL --progress-bar "https://github.com/powervr-graphics/Native_SDK/blob/5.2/lib/macOS_x86/$(notdir $@)?raw=true" -o $@
	@$(call ECHO_SUCCESS,"Downloaded \"$@\"")


# Cleaning
.PHONY: clean
clean:
	rm -rf $(OUT_DIR)

# utils
TOUCH_DIRECTORIES=mkdir -p "$(dir $1)"

BRIGHT_GREEN='\033[38;5;35m'
BRIGHT_CYAN='\033[38;5;38m'
BOLD='\033[1m'
RESET='\033[m'

ECHO_SUBHEADING=echo $(BOLD)$(BRIGHT_CYAN)"> $1"$(RESET)
ECHO_SUCCESS=echo $(BOLD)$(BRIGHT_GREEN)"> $1"$(RESET)