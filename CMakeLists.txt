cmake_minimum_required(VERSION 3.18)
project(WalnutApp)

include(CMakePrintHelpers)

if(NOT CMAKE_BUILD_TYPE)
  set(CMAKE_BUILD_TYPE Debug CACHE STRING "" FORCE)
endif()

## list(APPEND CMAKE_MODULE_PATH "${CMAKE_CURRENT_LIST_DIR}/cmake")
## message(STATUS "ARCH: ${CMAKE_LIBRARY_ARCHITECTURE}")

find_package(Vulkan REQUIRED)

# build types: "GUI" "HEADLESS"
set(WALNUT_BUILD "GUI")

if (Vulkan_FOUND)
    message(STATUS "Found Vulkan")
    # include_directories(${SDL2_INCLUDE_DIR})
    # add_definitions(-DWASMINT_HAS_SDL)
endif()

set (CMAKE_CXX_STANDARD 20)
set (CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -DVK_PROTOTYPES")
set (CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -DVK_PROTOTYPES")

message("STD => ${CMAKE_CXX_STANDARD}")

if(WALNUT_BUILD STREQUAL "GUI") 
    message("Build: GUI")
elseif(CMAKE_BUILD_TYPE STREQUAL "HEADLESS")
    message("Build HEADLESS")
else()
    message("Build: UNKNOWN")
endif()


# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}" -DLIBCXX_ENABLE_INCOMPLETE_FEATURES)
add_compile_options(-fexperimental-library)


message("Build Type: ${CMAKE_BUILD_TYPE}")

add_subdirectory(vendor)
add_subdirectory(Walnut)
add_subdirectory(WalnutApp)
