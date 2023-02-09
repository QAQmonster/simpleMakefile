#version 1
#hello : main.cpp printhello.cpp factorial.cpp
#	g++ -o hello main.cpp printhello.cpp factorial.cpp

#version 2
# CXX = g++
# TARGET = hello
# OBJ = main.o printhello.o factorial.o

# $(TARGET) : $(OBJ)
# 	$(CXX) -o $(TARGET) $(OBJ)

# main.o : main.cpp
# 	$(CXX) -c main.cpp
# printhello.o : printhello.cpp
# 	$(CXX) -c printhello.cpp
# factorial.o : factorial.cpp
# 	$(CXX) -c factorial.cpp

#version 3
# CXX = g++
# TARGET = hello
# OBJ = main.o printhello.o factorial.o

# CXXFLAGS = -c -Wall

# $(TARGET) : $(OBJ)
# 	$(CXX) -o $@ $^

# %.o : %.cpp
# 	$(CXX) $(CXXFLAGS) $<

# .PHONY : clean
# clean:
# 	rm -f *.o $(TARGET)	

#version 4
# CXX = g++
# TARGET = hello
# SRC = $(wildcard *.cpp)
# OBJ = $(patsubst %.cpp, %.o, $(SRC))

# CXXFLAGS = -c -Wall

# $(TARGET) : $(OBJ)
# 	$(CXX) -o $@ $^

# %.o : %.cpp
# 	$(CXX) $(CXXFLAGS) $< -o $@

# .PHONY : clean
# clean:
# 	rm -f *.o $(TARGET)

CXX = g++
TARGET = hello
SRC = $(wildcard *.cpp)
OBJ = $(patsubst %.cpp, %.o, $(SRC))
CXXFLAGS = -c -Wall
$(TARGET) : $(OBJ)
	$(CXX) -o $@ $^

%.o : %.cpp
	$(CXX) $(CXXFLAGS) $< -o $@

.PHONY : clean
clean: 
	rm -f *.o $(TARGET)
