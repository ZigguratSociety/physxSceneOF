# add custom variables to this file

# OF_ROOT allows to move projects outside apps/* just set this variable to the
# absoulte path to the OF root folder

OF_ROOT = ../../..

# USER_CFLAGS allows to pass custom flags to the compiler
# for example search paths like:
# USER_CFLAGS = -I src/objects

LIBS=-D_DEBUG -m64 -L./Lib/linux64/ -L./Bin/linux64/ -lpthread -lrt -lm -ltinyxml -lglut -lLowLevel -lPhysX3CharacterKinematic -lPhysX3Extensions -lPhysXVisualDebuggerSDK -lSceneQuery -lLowLevelCloth -lPhysX3Common -lPhysX3Vehicle -lPvdRuntime -lSimulationController -lPhysX3 -lPhysX3Cooking -lPhysXProfileSDK -lPxTask -lpthread -lrt -lm -ltinyxml -lLowLevel -lPhysX3CharacterKinematic -lPhysX3Extensions -lPhysXVisualDebuggerSDK -lSceneQuery -lLowLevelCloth -lPhysX3Common -lPhysX3Vehicle -lPvdRuntime -lSimulationController -lPhysX3 -lPhysX3Cooking -lPhysXProfileSDK -lPxTask -lpthread -lrt -lm -ltinyxml -lLowLevel -lPhysX3CharacterKinematic -lPhysX3Extensions -lPhysXVisualDebuggerSDK -lSceneQuery -lLowLevelCloth -lPhysX3Common -lPhysX3Vehicle -lPvdRuntime -lSimulationController -lPhysX3 -lPhysX3Cooking -lPhysXProfileSDK -lPxTask -lpthread -lrt -lm -ltinyxml -lLowLevel -lPhysX3CharacterKinematic -lPhysX3Extensions -lPhysXVisualDebuggerSDK -lSceneQuery -lLowLevelCloth -lPhysX3Common -lPhysX3Vehicle -lPvdRuntime -lSimulationController -lPhysX3 -lPhysX3Cooking -lPhysXProfileSDK -lPxTask -lpthread -lrt -lm -ltinyxml -lGL -lGLU -Wl,-O1

USER_CFLAGS =  -D_NDEBUG $(LIBS) \
	       -L./Include/extensions/PxDefaultErrorCallback.h \
               -I./Include/ \
               -I./Include/characterkinematic \
               -I./Include/cloth \
               -I./Include/common \
               -I./Include/cooking \
               -I./Include/extensions \
               -I./Include/foundation \
               -I./Include/geometry \
               -I./Include/particles \
               -I./Include/physxprofilesdk \
               -I./Include/physxvisualdebuggersdk \
               -I./Include/pxtask   \
               -I./Include/vehicle  \
               -I./Include/pvd \
               -I./Snippets/SnippetRender \
	       

PROJECT_CFLAGS =

# USER_LDFLAGS allows to pass custom flags to the linker
# for example libraries like:
# USER_LDFLAGS = libs/libawesomelib.a

USER_LDFLAGS = 


EXCLUDE_FROM_SOURCE="bin,.xcodeproj,obj"

# change this to add different compiler optimizations to your project

USER_COMPILER_OPTIMIZATION = -march=native -mtune=native -Os


# android specific, in case you want to use different optimizations
USER_LIBS_ARM = 
USER_LIBS_ARM7 = 
USER_LIBS_NEON = 

# android optimizations

ANDROID_COMPILER_OPTIMIZATION = -Os

NDK_PLATFORM = android-8

# uncomment this for custom application name (if the folder name is different than the application name)
#APPNAME = folderName

# uncomment this for custom package name, must be the same as the java package that contains OFActivity
#PKGNAME = cc.openframeworks.$(APPNAME)





# linux arm flags

LINUX_ARM7_COMPILER_OPTIMIZATIONS = -march=armv7-a -mtune=cortex-a8 -finline-functions -funroll-all-loops  -O3 -funsafe-math-optimizations -mfpu=neon -ftree-vectorize -mfloat-abi=hard -mfpu=vfp



