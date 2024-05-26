file(GLOB_RECURSE Walnut_SRC LIST_DIRECTORIES false Source/*.cpp)
add_library(Walnut STATIC ${Walnut_SRC})

target_include_directories(Walnut PUBLIC Source)
target_include_directories(Walnut INTERFACE spdlog)
#target_compile_features(tutorial_compiler_flags INTERFACE cxx_std_20)

# set_property(TARGET Walnut PROPERTY POSITION_INDEPENDENT_CODE ON)

# setup internal project compile definition
if(WIN32)
    target_compile_definitions(Walnut PRIVATE WL_PLATFORM_WINDOWS)
endif()

if(WALNUT_BUILD STREQUAL "GUI") 
    target_include_directories(Walnut PUBLIC Platform/GUI)
    file(GLOB_RECURSE extra LIST_DIRECTORIES false Platform/GUI/*.cpp)
elseif(CMAKE_BUILD_TYPE STREQUAL "HEADLESS")
    target_include_directories(Walnut PUBLIC Platform/Headless)
    file(GLOB_RECURSE extra LIST_DIRECTORIES false Platform/Headless/*.cpp)
endif()
target_sources(Walnut PUBLIC ${extra})



if(CMAKE_BUILD_TYPE STREQUAL "Debug")
    target_compile_definitions(Walnut PRIVATE WL_DEBUG)
elseif(CMAKE_BUILD_TYPE STREQUAL "RelWithDebInfo")
    target_compile_definitions(Walnut PRIVATE WL_RELEASE)
elseif(CMAKE_BUILD_TYPE STREQUAL "Release")
    target_compile_definitions(Walnut PRIVATE WL_DIST)
endif()

target_link_libraries(Walnut PUBLIC imgui glfw glm::glm stb_image spdlog Vulkan::Vulkan)

if(WIN32)
    target_link_libraries(Walnut PUBLIC dwmapi)
endif()

# dump public interface
cmake_print_properties(TARGETS Walnut 
                       PROPERTIES INTERFACE_INCLUDE_DIRECTORIES)



install(TARGETS Walnut DESTINATION bin)
