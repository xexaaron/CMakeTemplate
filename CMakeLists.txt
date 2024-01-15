cmake_minimum_required(VERSION 3.27)
project($ENV{projName})
set(CMAKE_CXX_STANDARD 20)
#set(CMAKE_C_COMPILER gcc)
set(CMAKE_CXX_COMPILER g++)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(SOURCE_FILES 
    main.cpp
)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})


