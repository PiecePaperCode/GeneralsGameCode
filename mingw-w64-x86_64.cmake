set(CMAKE_SYSTEM_NAME Windows)

# Set the MinGW-w64 prefix for 32-bit (i686) builds
set(TOOLCHAIN_PREFIX i686-w64-mingw32)

# Cross compilers to use for C, C++, and RC (resource compiler)
set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}-gcc)
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}-g++)
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)

# target environment on the build host system
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})

# modify default behavior of FIND_XXX() commands
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Compatibility settings for older MSVC versions
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -D_MSC_VER=1300")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_MSC_VER=1300")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-rtti")  # Disable RTTI to match VC98
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fno-exceptions")  # Disable exceptions (VC98 default)

# Enable MFC compatibility
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_USRDLL -D_MBCS")

# Avoid using C++11 or later features since VC98 doesn't support them
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++98")

# Ensure the linker uses a 32-bit target
set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -m32")
set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -m32")
