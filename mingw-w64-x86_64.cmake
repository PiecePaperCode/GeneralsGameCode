set(CMAKE_SYSTEM_NAME Windows)

# Use Clang with MinGW-w64 as the compiler
set(TOOLCHAIN_PREFIX x86_64-w64-mingw32)
set(CMAKE_C_COMPILER clang)
set(CMAKE_CXX_COMPILER clang++)

# Ensure the compiler targets Windows (MinGW)
set(CMAKE_C_COMPILER_TARGET ${TOOLCHAIN_PREFIX})
set(CMAKE_CXX_COMPILER_TARGET ${TOOLCHAIN_PREFIX})

# Use MinGW-w64 resource compiler
set(CMAKE_RC_COMPILER ${TOOLCHAIN_PREFIX}-windres)

# Set the correct include and library directories
include_directories(/usr/${TOOLCHAIN_PREFIX}/include)
link_directories(/usr/${TOOLCHAIN_PREFIX}/lib)

# Use lld as the linker to avoid MSVC-style flags
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -fuse-ld=lld")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fuse-ld=lld")

# Force MinGW standard library
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -stdlib=libstdc++")

# Prevent CMake from using MSVC-specific linker flags
set(CMAKE_EXE_LINKER_FLAGS "")
set(CMAKE_SHARED_LINKER_FLAGS "")

# CMake find settings
set(CMAKE_FIND_ROOT_PATH /usr/${TOOLCHAIN_PREFIX})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

# Compatibility
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -m32")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -D_MSC_VER=1200")
add_compile_options(-D__WCHAR_TYPE__=short)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -Xclang -fms-compatibility -fms-extensions")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fasm-blocks")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fdeclspec -Wno-invalid-noreturn -Wno-microsoft -Wno-attributes")
add_definitions(-D_aligned_malloc=aligned_malloc)
add_compile_options(-D_aligned_malloc=aligned_alloc)
add_compile_options(-Wno-non-pod-varargs -Wno-writable-strings)
add_compile_options(-Wno-non-pod-varargs)
add_compile_options(-Wno-writable-strings)
add_compile_options(-fasm-blocks)
set(CMAKE_EXPORT_COMPILE_COMMANDS 1)
add_definitions(-DVC98_COMPATIBLE)
set(CMAKE_CXX_STANDARD 98)
set(CMAKE_CXX_STANDARD_REQUIRED OFF)
