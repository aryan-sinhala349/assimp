project "Assimp"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

    targetdir ("bin/" .. outputdir .. "/%{prj.name}")
    objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "./**.h",
        "./**.hpp",
        "./**.cpp"
    }

    includedirs
    {
        "./",
        "code/",
        "include",
        "%{cfg.objdir}",
        "%{cfg.objdir}/include"
    }

    defines
    {
        --Disabled importers: m3d for 5.1
        "ASSIMP_BUILD_NO_M3D_IMPORTER",
        "ASSIMP_BUILD_NO_M3D_EXPORTER"
    }

    filter "options:target=windows"
        systemversion "latest"

        defines
        {
            "WIN32_LEAN_AND_MEAN",
            "UNICODE",
            "_UNICODE"
        }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

    filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"