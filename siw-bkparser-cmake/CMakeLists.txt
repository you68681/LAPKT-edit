# cmake_minimum_required(VERSION <specify CMake version here>)
cmake_minimum_required(VERSION 3.10)
project(siw_ffparser_cmake)

set(CMAKE_CXX_STANDARD 17)

include_directories(src)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -O0")
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -O0")
#SET CORRECT PATH TO LAPKT
set(LAPKT_PATH "/home/chao/LAPKT-edit/LAPKT-public")

#Bring the headers, such as Student.h into the project
include_directories(
        ${LAPKT_PATH}/interfaces/agnostic/
        ${LAPKT_PATH}/interfaces/ff-wrapped/
        ${LAPKT_PATH}/include/
        ${LAPKT_PATH}/external/
        )


#However, the file(GLOB...) allows for wildcard additions:
file(GLOB SOURCES
        "src/*.cxx"
        "${LAPKT_PATH}/interfaces/agnostic/*.cxx"
        "${LAPKT_PATH}/interfaces/ff-wrapped/*.cxx"
        "${LAPKT_PATH}/include/aptk/*.cxx"
        "${LAPKT_PATH}/src/*.cxx"
        )

#Compile Static library containing FF-parser
#add_library(libff STATIC
#        ${LAPKT_PATH}/external/libff/expressions.c
#        ${LAPKT_PATH}/external/libff/inst_easy.c
#        ${LAPKT_PATH}/external/libff/inst_final.c
#        ${LAPKT_PATH}/external/libff/inst_hard.c
#        ${LAPKT_PATH}/external/libff/inst_pre.c
#        ${LAPKT_PATH}/external/libff/lex.fct_pddl.c
#        ${LAPKT_PATH}/external/libff/lex.ops_pddl.c
#        ${LAPKT_PATH}/external/libff/libff.c
#        ${LAPKT_PATH}/external/libff/memory.c
#        ${LAPKT_PATH}/external/libff/output.c
#        ${LAPKT_PATH}/external/libff/parse.c
#        ${LAPKT_PATH}/external/libff/relax.c
#        ${LAPKT_PATH}/external/libff/scan-fct_pddl.tab.c
#        ${LAPKT_PATH}/external/libff/scan-ops_pddl.tab.c
#        ${LAPKT_PATH}/external/libff/search.c
#        ${LAPKT_PATH}/external/libff/utility.c )

#Add EXECUTABLE target
add_executable(siw ${SOURCES})

#Add the static library to linker
target_link_libraries(siw ${LAPKT_PATH}/external/libff/libff.a)

#Add BOOST library dependencies
find_package( Boost REQUIRED COMPONENTS program_options )
include_directories( ${Boost_INCLUDE_DIRS} )
target_link_libraries( siw ${Boost_PROGRAM_OPTIONS_LIBRARY} ${Boost_REGEX_LIBRARY} )
