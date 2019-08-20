include(CMakeFindDependencyMacro)

find_dependency(Vulkan)
find_dependency(Threads)

if (ANDROID)
    # TODO
elseif (WIN32)
    # just use native windowing
elseif (APPLE)
    find_library(COCOA_LIBRARY Cocoa)
    find_library(QUARTZCORE_LIBRARY QuartzCore)
else()
    # use Xcb for native windowing
    find_package(PkgConfig)
    pkg_check_modules(xcb REQUIRED IMPORTED_TARGET xcb)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/vsgTargets.cmake")
