cmake_minimum_required(VERSION 3.5)
cmake_policy(SET CMP0074 NEW)

include(cmake/HunterGate.cmake)
include(sigma-bake/bake.cmake)
include(cmake/cotire.cmake)

HunterGate(
    URL "https://github.com/ruslo/hunter/archive/v0.23.27.tar.gz"
    SHA1 "70d75a25f895df3da00d8382417e8c2a08c93173"
	LOCAL
)
project(simple-game-project)

hunter_add_package(Assimp)
hunter_add_package(benchmark)
hunter_add_package(Boost COMPONENTS program_options)
hunter_add_package(cereal)
hunter_add_package(debug-draw)
hunter_add_package(glad)
hunter_add_package(glm)
hunter_add_package(GTest)
hunter_add_package(nlohmann_json)
hunter_add_package(SDL2)
hunter_add_package(stb)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/bin")
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/lib")
foreach(OUTPUTCONFIG ${CMAKE_CONFIGURATION_TYPES})
    string(TOUPPER ${OUTPUTCONFIG} OUTPUTCONFIG)
    set(CMAKE_RUNTIME_OUTPUT_DIRECTORY_${OUTPUTCONFIG} "${CMAKE_BINARY_DIR}/bin")
    set(CMAKE_LIBRARY_OUTPUT_DIRECTORY_${OUTPUTCONFIG} "${CMAKE_BINARY_DIR}/bin")
    set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY_${OUTPUTCONFIG} "${CMAKE_BINARY_DIR}/lib")
endforeach()

find_package(Assimp CONFIG REQUIRED)
find_package(benchmark CONFIG REQUIRED)
find_package(Boost CONFIG REQUIRED system program_options)
find_package(cereal CONFIG REQUIRED)
find_package(debug-draw CONFIG REQUIRED)
find_package(glad CONFIG REQUIRED)
find_package(glm CONFIG REQUIRED)
find_package(GMock CONFIG REQUIRED)
find_package(GTest CONFIG REQUIRED)
find_package(nlohmann_json  CONFIG REQUIRED)
find_package(SDL2 CONFIG REQUIRED)
find_package(stb CONFIG REQUIRED)
find_package(Threads REQUIRED)

add_subdirectory(sigma-core)
add_subdirectory(sigma-opengl)
add_subdirectory(simple-game)

bake_resources()
#(sigma-core sigma-opengl simple-game)
#set(DO_CLANG_TIDY "clang-tidy" "-checks=*,-clang-analyzer-alpha.*,-google-*,-llvm-*,-fuchsia-*")
#set_target_properties(sigma-core PROPERTIES CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
#set_target_properties(sigma-opengl PROPERTIES CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
#set_target_properties(simple-game PROPERTIES CXX_CLANG_TIDY "${DO_CLANG_TIDY}")
