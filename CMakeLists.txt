cmake_minimum_required(VERSION 3.16)
project(sauna-monitor-qt LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_AUTOUIC ON)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

set(CMAKE_INCLUDE_CURRENT_DIR ON)

add_definitions(-D_GLIBCXX_USE_CXX11_ABI=0)

find_package(Qt6 REQUIRED COMPONENTS Core Qml Svg Gui)

qt_add_executable(sauna-monitor-qt
    controls/controls.cpp
    main.cpp

    # Headers
    controls/controls.h
)

add_library(libgpiod SHARED IMPORTED)
set_target_properties(libgpiod PROPERTIES IMPORTED_LOCATION /home/uraihan/libgpiod/lib/libgpiod.so)
target_include_directories(libgpiod INTERFACE /home/uraihan/libgpiod/include)
target_link_libraries(sauna-monitor-qt PRIVATE libgpiod)

#add_custom_command(OUTPUT )

set(qmake_resource_files
    "main.qml"
    "UI/HomeScreen.qml"
    "UI/ControlSlider.qml"
    "UI/SettingsDialog.qml"
    "UI/Greeter.qml"
    "UI/AboutPage.qml"
    "UI/TurningOff.qml"
    "UI/TemperatureSetting.qml"
    "UI/SaunaSchedule.qml"
    "asset/gear-icon.svg"
    "asset/sauna-icon.svg"
    "asset/power-button.svg"
    "asset/info-icon.svg"
    "asset/back-icon.svg"
    "asset/calendar-icon.svg"
)

qt_add_resources(sauna-monitor-qt sauna-monitor
    PREFIX
        "/"
    FILES
        ${qmake_resource_files}
)

target_link_libraries(sauna-monitor-qt PUBLIC
    Qt6::Core
    Qt6::Gui
    Qt6::Qml
    Qt6::Svg
#    gpiod::gpiod
)

set_target_properties(sauna-monitor-qt PROPERTIES
    WIN32_EXECUTABLE ON
    MACOSX_BUNDLE ON
)
