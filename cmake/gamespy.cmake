set(GS_OPENSSL FALSE)
set(GAMESPY_SERVER_NAME "server.cnc-online.net")

FetchContent_Declare(
    gamespy
    GIT_REPOSITORY https://github.com/PiecePaperCode/GamespySDK.git
    GIT_TAG        1e0c86e0227390f7abff81dc70d594d2cefcf3a7
)

FetchContent_MakeAvailable(gamespy)
