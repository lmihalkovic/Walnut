
export VULKAN_SDK=/Users/laurent/Developer/vulkan_sdk

#cmake -DCMAKE_LIBRARY_ARCHITECTURE="aarch64-linux-gnu"  -Bbuild  


# --debug-find  --trace-source="CMakeLists.txt"

mkdir -p build/cm
cmake -Bbuild/cm
cmake --build ./build/cm

