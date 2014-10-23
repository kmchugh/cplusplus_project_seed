solutionName = "MyApplication"
projectName = "MyProject"
libraryName = "MyLibrary"

solution(solutionName)
    configurations {"DebugLib", "ReleaseLib", "DebugDLL", "ReleaseDLL"}

    project(projectName)
        kind "ConsoleApp"
        language "C++"
        location("./" .. projectName)
        links { "MyApplicationLib" }

        files { "./" .. projectName .. "/src/**.h", "./" .. projectName .. "/src/**.cpp"}
        excludes { "./" .. projectName .. "/tests/*.*"}

        configuration "Debug*"
            defines { "DEBUG" }
            flags { "Symbols" }

        configuration "Release*"
            defines { "NDEBUG" }
            flags { "Optimize" }

    project(libraryName)
        location("./" .. libraryName)
        language "C++"
        files { "./" .. libraryName .. "/src/**.h", "./" .. libraryName .. "/src/**.cpp" }
        excludes { "./" .. libraryName .. "/tests/*.*"}

        configuration "*Lib"
            kind "StaticLib"

        configuration "*DLL"
            kind "SharedLib"

        configuration "Debug*"
            defines { "DEBUG" }
            flags { "Symbols" }

        configuration "Release*"
            defines { "NDEBUG" }
            flags { "Optimize" }