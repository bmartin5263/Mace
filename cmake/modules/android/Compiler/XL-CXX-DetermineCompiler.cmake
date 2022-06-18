
set(_compiler_id_pp_test "defined(__IBMCPP__) && !defined(__COMPILER_VER__) && __IBMCPP__ >= 800")

include("IBMCPP-CXX-DetermineVersionInternal.cmake")
