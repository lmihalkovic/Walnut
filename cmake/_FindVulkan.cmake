message("<FindVulkan.cmake>")

# function(my_check validator_result_var item)
#     message( " ${validator_result_var} ${item}" )
#     # if(NOT item MATCHES ...)
#     #   set(${validator_result_var} FALSE PARENT_SCOPE)
#     # endif()
# endfunction()


SET(VULKAN_SEARCH_PATHS
    ~/Library/Frameworks
    /Library/Frameworks
    /usr/local
    /usr
    ${VK_LIB_PATH}
)

# FIND_PATH(VULKAN_INCLUDE_DIR Vulkan.h
# 	HINTS
# 	# $ENV{SDL2DIR}
# 	PATHS ${VULKAN_SEARCH_PATHS}
# 	PATH_SUFFIXES include/SDL2 include
# )

FIND_LIBRARY(VULKAN_LIBRARY_TEMP
	NAMES vulkan
	HINTS
	# $ENV{SDL2DIR}
	PATHS ${VULKAN_SEARCH_PATHS}
	PATH_SUFFIXES lib64 lib 
    NO_CACHE
)

IF(VULKAN_LIBRARY_TEMP)    
    
    cmake_print_variables(VULKAN_LIBRARY_TEMP)
	SET(VULKAN_LIBRARY       ${VULKAN_LIBRARY_TEMP} CACHE STRING "Where the Vulkan Library can be found")
	SET(VULKAN_LIBRARY_TEMP "${VULKAN_LIBRARY_TEMP}" CACHE INTERNAL "")

ENDIF(VULKAN_LIBRARY_TEMP)



add_library(Vulkan STATIC IMPORTED)
find_library(Vulkan_LIBRARY_PATH foo HINTS "${CMAKE_CURRENT_LIST_DIR}/../../")
set_target_properties(Vulkan PROPERTIES IMPORTED_LOCATION "${Vulkan_LIBRARY_PATH}")

message("</FindVulkan.cmake>")

INCLUDE(FindPackageHandleStandardArgs)
FIND_PACKAGE_HANDLE_STANDARD_ARGS(Vulkan REQUIRED_VARS VULKAN_LIBRARY) # VULKAN_INCLUDE_DIR)
