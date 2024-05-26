# Setupvendor libraries

# Target: IMGUI
set(imgui_SRC imgui/imgui.cpp imgui/imgui_draw.cpp imgui/imgui_tables.cpp imgui/imgui_widgets.cpp imgui/imgui_demo.cpp)
add_library(imgui STATIC ${imgui_SRC})
target_include_directories(imgui PUBLIC imgui)
set_property(TARGET imgui PROPERTY POSITION_INDEPENDENT_CODE ON)

# Target: GLFW (supports CMake)
add_subdirectory(GLFW)

# Target: glm (supports CMake)
add_subdirectory(glm)

# Target: stb_image (header-only, create a dummy interface library)
add_library(stb_image INTERFACE)
target_include_directories(stb_image INTERFACE stb_image)

# Target: spdlog (header-only, create a dummy interface library)
add_library(spdlog INTERFACE)
target_include_directories(spdlog INTERFACE spdlog/include)
