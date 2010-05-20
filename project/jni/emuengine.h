#ifndef EMUENGINE_H
#define EMUENGINE_H

class EmuEngine {
public:
	struct Game {
		int soundBits;
		int soundRate;
		int soundChannels;
		int fps;
	};

	struct Surface {
		void *bits;
		int bpr;
		int w;
		int h;
	};

	class Callbacks {
	public:
		virtual bool lockSurface(Surface *surface) = 0;
		virtual void unlockSurface(const Surface *surface) = 0;
		virtual void playAudio(void *data, int size) = 0;
		virtual unsigned int getKeyStates() = 0;
	};


	virtual bool initialize(Callbacks *cbs) = 0;
	virtual void destroy() = 0;

	virtual void reset() = 0;
	virtual void power() = 0;
	virtual Game *loadRom(const char *file) = 0;
	virtual void unloadRom() = 0;
	virtual void runFrame(bool skip) = 0;

	virtual bool saveState(const char *file) = 0;
	virtual bool loadState(const char *file) = 0;

	virtual void setOption(const char *name, const char *value) = 0;
};

#endif

