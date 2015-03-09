#include "ofMain.h"
#include "ofAppGlutWindow.h"
#include <PxPhysicsAPI.h>

#ifdef _DEBUG 
#pragma comment(lib, "PhysX3DEBUG_x64.lib") 
#pragma comment(lib, "PhysX3CommonDEBUG_x64.lib") 
#pragma comment(lib, "PhysX3ExtensionsDEBUG.lib") 
#else 
#pragma comment(lib, "PhysX3_x64.lib")  
#pragma comment(lib, "PhysX3Common_x64.lib") 
#pragma comment(lib, "PhysX3Extensions.lib")
#endif

using namespace std;
using namespace physx;

class xApp : public ofBaseApp {

	public:
		ofEasyCam cam;
		int w,h;

		PxPhysics*               gPhysicsSDK = NULL;
		PxFoundation*            gFoundation = NULL;
		PxDefaultErrorCallback   gDefaultErrorCallback;
		PxDefaultAllocator       gDefaultAllocatorCallback; 
		PxScene*                        gScene = NULL;
		PxReal                          gTimeStep = 1.0f/60.0f;
		PxRigidDynamic                 *gBox = NULL;   

		void InitPhysX() {
		        gFoundation = PxCreateFoundation(PX_PHYSICS_VERSION, gDefaultAllocatorCallback, gDefaultErrorCallback);
		        gPhysicsSDK = PxCreatePhysics(PX_PHYSICS_VERSION, *gFoundation, PxTolerancesScale() );
		        if(gPhysicsSDK == NULL) {
		                cerr<<"Error create PhysX."<<endl;
		        }
		        PxSceneDesc sceneDesc(gPhysicsSDK->getTolerancesScale());
		        sceneDesc.gravity               = PxVec3(0.0f, -9.8f, 0.0f);
		        sceneDesc.cpuDispatcher = PxDefaultCpuDispatcherCreate(1);
		        sceneDesc.filterShader  = PxDefaultSimulationFilterShader;
		        gScene = gPhysicsSDK->createScene(sceneDesc);
		        PxMaterial* material = gPhysicsSDK->createMaterial(0.5,0.5,0.5);
		        PxTransform planePos =  PxTransform(PxVec3(0.0f),PxQuat(PxHalfPi, PxVec3(0.0f, 0.0f, 1.0f)));
		        PxRigidStatic* plane =  gPhysicsSDK->createRigidStatic(planePos);
		        plane->createShape(PxPlaneGeometry(), *material);
		        gScene->addActor(*plane);
		        PxTransform             boxPos(PxVec3(0.0f, 10.0f, 0.0f));
		        PxBoxGeometry   boxGeometry(PxVec3(2,2,2));
		        gBox = PxCreateDynamic(*gPhysicsSDK, boxPos, boxGeometry, *material, 1.0f);
		        gScene->addActor(*gBox);
		}

		void StepPhysX() {
			gScene->simulate(gTimeStep);    
		        gScene->fetchResults(true);             
		}

		void ShutdownPhysX() {
		        gPhysicsSDK->release();                 
		        gFoundation->release();                 
		}

		void setup(){
			ofSetFrameRate(150);

			w=ofGetScreenWidth();
			h=ofGetScreenHeight();
		        InitPhysX();
        		for(int i=0; i<=300; i++) {
		                if(gScene) StepPhysX();
		                PxVec3 boxPos = gBox->getGlobalPose().p;
                		cout<<"BoxPosition: X:"<<boxPos.x <<" - Y:"<<boxPos.y <<" - Z:"<<boxPos.z<<"\n";
		        }
		}

		void exit(){
			ShutdownPhysX();
		}

		void update(){
			ofSetWindowTitle(ofToString(ofGetFrameRate()));
		}

		void draw(){
			ofBackgroundGradient(255,0);
		}

		void keyPressed(int key){

		}
};

int main( ){
	ofAppGlutWindow window;
	ofSetupOpenGL(&window, 1280, 720, OF_WINDOW);
	ofRunApp(new xApp());
}
