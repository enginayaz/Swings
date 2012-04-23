#pragma once

#include "ofMain.h"
#include "ofxiPhone.h"
#include "ofxiPhoneExtras.h"
#include "ofxOpenALSoundPlayer.h"

class testApp : public ofxiPhoneApp {
	
public:
	void setup();
	void update();
	void draw();
	void exit();

	void touchDown(int x, int y, int id);
	void touchMoved(int x, int y, int id);
	void touchUp(int x, int y, int id);
	void touchDoubleTap(int x, int y, int id);
	void touchCancelled(ofTouchEventArgs &touch);
	
	void lostFocus();
	void gotFocus();
	void gotMemoryWarning();
	void deviceOrientationChanged(int newOrientation);
	
	void gotMessage(ofMessage msg);
	
    void volumeAdjustOneTrack(); // first iteration
    void volumeAdjustOneTrack(ofxOpenALSoundPlayer *sample);
    
    void volumeAdjustTwoTracks();
    
    float angle;
    
	ofImage arrow;

    //ofxOpenALSoundPlayer synth[10]; //load in 10 instances so that they can be played multiple times (sort of). Right now ofxALSoundPlayer doesn't work with multiPlay
    //int lastSoundPlayed; //counter to keep track of which sound we're playing
    
    //ofPoint audioLoc[5]; // one for each possible touch ID
    //int audioSize[5];
    
    ofxOpenALSoundPlayer childrenSounds;
    ofxOpenALSoundPlayer ambientSounds;
    
    ofxOpenALSoundPlayer rainMp3;
    ofxOpenALSoundPlayer rainWav;
    ofxOpenALSoundPlayer heartbeatMp3;
    ofxOpenALSoundPlayer heartbeatWav;
    
    ofxOpenALSoundPlayer *sample1;
    ofxOpenALSoundPlayer *sample2;
    ofxOpenALSoundPlayer *sample3;
    ofxOpenALSoundPlayer *sample4;

    
    bool soundOption1;
    
};
