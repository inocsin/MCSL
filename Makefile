CC=g++
NAM="MCSL Traffic Loader"
VER="v1.6"
DIRSRC=./src
DIRHRD=$(DIRSRC)
DIROBJ=./obj
DIRTGT=./bin
CXXFLAGS=-I $(DIRHRD)
#HDR=$(wildcard $(DIRHRD)/*.h)
SRC=$(wildcard $(DIRSRC)/*.cpp)
OBJ=$(patsubst %.cpp,$(DIROBJ)/%.o,$(notdir $(SRC)))
TGT=$(DIRTGT)/mcsl_traffic_loader
#VPATH=$(DIRSRC)
all:$(TGT)

print:
	@echo $(DIRHRD)
	#@echo $(HRD)
	@echo $(SRC)
	@echo $(OBJ)
	@echo $(TGT)
	@echo $(CXXFLAGS)
	
$(DIROBJ)/%.o:$(DIRSRC)/%.cpp
	@echo ""
	@echo "----"
	@echo "Compiling "$(NAM)" "$(VER)"..."
	@echo ""
	@echo ""
	$(CC) -c $< -o $@ $(CXXFLAGS)

$(TGT):$(OBJ)
	$(CC) $(OBJ) -o $(TGT)
	@echo ""
	@echo ""
	@echo "Compiling "$(NAM)" "$(VER)" successfully finished!"
	@echo "----"
	@echo ""

.PHONY: clean
clean:
	@-rm $(TGT)
	@-rm $(OBJ)
