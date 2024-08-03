export ANDROID_HOME=/opt/android-sdk
export ANDROID_NDK_TOOLCHAIN=$ANDROID_HOME/ndk-bundle/toolchains/llvm/prebuilt/linux-x86_64
export ANDROID_NDK_SYSROOT=$ANDROID_NDK_TOOLCHAIN/sysroot
export ANDROID_NDK_API=31


set_platform () {
  if [ $1 = arm64 ]
  then
    ANDROID_NDK_PLATFORM=aarch64-linux-android
  elif [ $1 = arm ]
  then
    ANDROID_NDK_PLATFORM=armv7a-linux-androideabi
  elif [ $1 = x86 ]
  then
    ANDROID_NDK_PLATFORM=i686-linux-android
  elif [ $1 = x86_64 ]
  then
    ANDROID_NDK_PLATFORM=x86_64-linux-android
  fi
}

set_toolchain () {
	export AR="$ANDROID_NDK_TOOLCHAIN/bin/llvm-ar $COMMON_FLAGS"
 	export CC="$ANDROID_NDK_TOOLCHAIN/bin/$ANDROID_NDK_PLATFORM$ABDROID_NDK_API-clang $COMMON_FLAGS"
	export AS="$CC $COMMON_FLAGS"
	export CXX="$ANDROID_NDK_TOOLCHAIN/bin/$ANDROID_NDK_PLATFORM$ANDROID_NDK_API-clang++ $COMMON_FLAGS"
	export LD="$ANDROID_NDK_TOOLCHAIN/bin/ld $COMMON_FLAGS"
	export RANLIB="$ANDROID_NDK_TOOLCHAIN/bin/llvm-ranlib $COMMON_FLAGS"
	export STRIP="$ANDROID_NDK_TOOLCHAIN/bin/llvm-strip $COMMON_FLAGS"
}


set_flags() {
	export CPPFLAGS="$COMMON_FLAGS"
	export CFLAGS="$COMMON_FLAGS"
	export CXXFLAGS="$COMMON_FLAGS"
}

set_platform arm64
export COMMON_FLAGS="-isystem $ANDROID_NDK_SYSROOT/usr/include/$ANDROID_NDK_PLATFORM --sysroot $ANDROID_NDK_SYSROOT -target $ANDROID_NDK_PLATFORM"
#set_toolchain
#set_flags 

#export PATH=$ANDROID_HOME/cmdline-tools/latest/bin:$PATH

source ~/.bashrc

# set the TERM variable so that tmux can display pretty colors
export TERM=xterm-256color

