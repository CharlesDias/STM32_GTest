#######################################################################################################################    
### Include directories relative to includes files ###

# include_directories("${PROJECT_SOURCE_DIR}/Test/UnitTests/*.cpp")


#######################################################################################################################    
### Add Tests

# list(REMOVE_ITEM tests "${PROJECT_SOURCE_DIR}/Test/main.cpp")

file(GLOB UnitTests "${PROJECT_SOURCE_DIR}/Test/UnitTests/*.cpp")

foreach(file ${UnitTests})
    set(name)
    get_filename_component(name ${file} NAME_WE)
    add_executable(${name} "")
    target_sources(${name} PRIVATE UnitTests/${name}.cpp)
    target_link_libraries(${name} gtest_main gmock_main)
    add_test(NAME ${name} COMMAND ${name} --gtest_output=xml:reports/${name}_report.xml)
endforeach()


file(GLOB IntegrationTests "${PROJECT_SOURCE_DIR}/Test/IntegrationTests/*.cpp")

foreach(file ${IntegrationTests})
    set(name)
    get_filename_component(name ${file} NAME_WE)
    add_executable(${name} "")
    target_sources(${name} PRIVATE IntegrationTests/${name}.cpp)
    target_link_libraries(${name} gtest_main gmock_main)
    add_test(NAME ${name} COMMAND ${name} --gtest_output=xml:reports/${name}_report.xml)
endforeach()