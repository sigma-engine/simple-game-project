
hunter_config(
    glad
    URL https://github.com/Dav1dde/glad/archive/v0.1.28.tar.gz
    SHA1 10db58c9be03d6f3b223b6e19a14a034934b39a1
    CMAKE_ARGS GLAD_INSTALL=ON
)

hunter_config(
    debug-draw
    URL https://github.com/sigma-engine/debug-draw/archive/v2.0.0.tar.gz
    SHA1 c56130f893394972bac649a50eaa98c1f744886e
    CMAKE_ARGS GLAD_INSTALL=ON
)

hunter_config(
    Assimp
    URL https://github.com/assimp/assimp/archive/v4.1.0.tar.gz
    SHA1 ce3589f9455c743e993fd802bdaaed72838cd3f4
    CMAKE_ARGS ASSIMP_BUILD_ASSIMP_TOOLS=OFF ASSIMP_BUILD_TESTS=OFF
)
