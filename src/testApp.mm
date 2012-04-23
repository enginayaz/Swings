#include "testApp.h"

//--------------------------------------------------------------
void testApp::setup(){	
	ofBackground(225, 225, 225);
	ofSetCircleResolution(80);
	
	// register touch events
	//ofxRegisterMultitouch(this);
	
	// initialize the accelerometer
	ofxAccelerometer.setup();
    
    // need to initialize gyroscope
	
	//iPhoneAlerts will be sent to this.
	ofxiPhoneAlerts.addListener(this);
    
    // initialize the angle
    angle = 0;
    
	arrow.loadImage("arrow.png");
	arrow.setAnchorPercent(1.0, 0.5);
    
    
    // added this from openAl example
    ofSetFrameRate(20);
	
	/*
	ofxOpenALSoundPlayer::ofxALSoundSetListenerLocation(ofGetWidth()/2,0,ofGetHeight()/2);
	ofxOpenALSoundPlayer::ofxALSoundSetReferenceDistance(10);
	ofxOpenALSoundPlayer::ofxALSoundSetMaxDistance(500);
	ofxOpenALSoundPlayer::ofxALSoundSetListenerGain(5.0); TEST TEST
    */
    
    //childrenSounds.loadSound("children.mp3");;
    //ambientSounds.loadSound("ambient.mp3");
    
    rainMp3.loadSound("Rain.mp3");
    //rainWav.loadSound("Rain.wav");
    //heartbeatMp3.loadSound("heartbeat.wav");
    heartbeatWav.loadSound("hearbeat.wav");
    
    // QUESTION: whether to use variables or pointers for sample 1 and 2
    
    /*
    // VOLUME ADJUST - ONE TRACK
    soundOption1 = false;
    if(soundOption1 == true)    sample1 = childrenSounds;
    else                        sample1 = ambientSounds;
    */
    
    
    // VOLUME ADJUST - TWO TRACKS
    //sample1 = childrenSounds;
    sample1 = heartbeatWav;
    sample2 = rainMp3;
    
    /*
    // PITCH ADJUST - does not work with mp3s
    sample1 = childrenSounds;
    sample2 = ambientSounds;
     */
    
}


//--------------------------------------------------------------
void testApp::update() {
    
    // angle ranges between 90 and 270 for the swing motion. can be useful as a metric, combines the force in y and x to set the direction of the arrow
    // getForce().y switches between -1 and 1.   
    // default sound volume is 1. range is 0 to 1. 
    //float typicalVolume = exampleSound.volume;
    angle = 180 - RAD_TO_DEG * atan2( ofxAccelerometer.getForce().y, ofxAccelerometer.getForce().x );
    //printf("x = %f   y = %f   z= %f   angle= %f ", ofxAccelerometer.getForce().x, fabs(ofxAccelerometer.getForce().y), ofxAccelerometer.getForce().z, angle);

    
    //volumeAdjustOneTrack();
    
    
    // QUESTION: WHY DOES PASSING A VARIABLE NOT WORK?
    //volumeAdjustOneTrack(childrenSounds);
    
    volumeAdjustTwoTracks();
    
    // also set delays
    // explore setPitch(float pitch)
    // and set the track on a loop
    
}

//--------------------------------------------------------------
void testApp::draw() {
    
	ofSetColor(54);
	ofDrawBitmapString("swings project", 10, 20);
	ofEnableAlphaBlending();
	ofSetColor(255);
	ofPushMatrix();
		ofTranslate(ofGetWidth()/2, ofGetHeight()/2, 0);
		ofRotateZ(angle);
		arrow.draw(0,0);
	ofPopMatrix();

}


void testApp::volumeAdjustOneTrack(){
    
    float adjustedVolume = ofMap(fabs(ofxAccelerometer.getForce().y) * fabs(ofxAccelerometer.getForce().y), 0, 1.1, 0, 1);
    sample1.setVolume(adjustedVolume);
    if(sample1.getIsPlaying() == false) sample1.play();
}



void testApp::volumeAdjustOneTrack(ofxOpenALSoundPlayer sample){
    
    float adjustedVolume = ofMap(fabs(ofxAccelerometer.getForce().y) * fabs(ofxAccelerometer.getForce().y), 0, 1.1, 0, 1);
    sample1.setVolume(adjustedVolume);
    if(sample1.getIsPlaying() == false) sample.play();
    
}



void testApp::volumeAdjustTwoTracks(){
    
    float adjustedVolume = ofMap(fabs(ofxAccelerometer.getForce().y) * fabs(ofxAccelerometer.getForce().y), 0, 1.1, 0, 1);
    
    printf("volume= %f ", adjustedVolume);
    
    sample1.setVolume(1-adjustedVolume);
    sample2.setVolume(adjustedVolume);
    
    if(sample1.getIsPlaying() == false) sample1.play();
    if(sample2.getIsPlaying() == false) sample2.play();
    
}


//--------------------------------------------------------------
void testApp::exit() {

}

//--------------------------------------------------------------
void testApp::touchDown(int x, int y, int id){
    
}

/*
//--------------------------------------------------------------
void testApp::touchDown(ofTouchEventArgs & touch){
	audioLoc[touch.id].set(touch.x,touch.y);
	audioSize[touch.id]=1;
	
	lastSoundPlayed++;
	if(lastSoundPlayed>=10)
		lastSoundPlayed=0;
	
	printf("%f %f  \n", touch.y / ofGetHeight(), touch.y);
	synth[lastSoundPlayed].play();
	synth[lastSoundPlayed].setPitch(0.5 + touch.y / ofGetHeight());
	synth[lastSoundPlayed].setLocation(touch.x, 0, touch.y);
    
}
 */


//--------------------------------------------------------------
void testApp::touchMoved(int x, int y, int id){
	
}

/*
//--------------------------------------------------------------
void testApp::touchMoved(ofTouchEventArgs & touch){
	synth[lastSoundPlayed].setPitch(0.5 + touch.y / ofGetHeight());
	synth[lastSoundPlayed].setLocation(touch.x, 0, touch.y);
}
 */



//--------------------------------------------------------------
void testApp::touchUp(int x, int y, int id){
	
}

//--------------------------------------------------------------
void testApp::touchDoubleTap(int x, int y, int id){
	
}

//--------------------------------------------------------------
void testApp::lostFocus() {
}

//--------------------------------------------------------------
void testApp::gotFocus() {
}

//--------------------------------------------------------------
void testApp::gotMemoryWarning() {
}

//--------------------------------------------------------------
void testApp::deviceOrientationChanged(int newOrientation){
}

//--------------------------------------------------------------
void testApp::touchCancelled(ofTouchEventArgs& args){

}

//--------------------------------------------------------------
void testApp::gotMessage(ofMessage msg){
	
}

