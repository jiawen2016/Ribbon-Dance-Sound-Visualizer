
CXX=g++
INCLUDES=
FLAGS=-D__MACOSX_CORE__ -c
LIBS=-framework CoreAudio -framework CoreMIDI -framework CoreFoundation \
	-framework IOKit -framework Carbon  -framework OpenGL \
	-framework GLUT -framework Foundation \
	-framework AppKit -lstdc++ -lm

OBJS=   RtAudio.o RibbonDance.o chuck_fft.o

RibbonDance: $(OBJS)
	$(CXX) -o RibbonDance $(OBJS) $(LIBS)

RibbonDance.o: RibbonDance.cpp RtAudio.h
	$(CXX) $(FLAGS) RibbonDance.cpp

RtAudio.o: RtAudio.h RtAudio.cpp RtError.h
	$(CXX) $(FLAGS) RtAudio.cpp
chuck_fft.o: chuck_fft.h chuck_fft.c
		$(CXX) $(FLAGS) chuck_fft.c

clean:
	rm -f *~ *# *.o RibbonDance
