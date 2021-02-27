INCLUDES=-I$(PREFIX)/include/c++/include 
CFLAGS=-g -Wall -O2 -Wc++-compat -L$(PREFIX)/include/c++/lib -fopenmp 
LIBS=-lm -lpthread
OMPFLG=-fopenmp -std=c++11
HASHFLG=-Wno-deprecated
BUILDFLG=-w -ffunction-sections -fdata-sections -fmodulo-sched -msse
EXE_TAL=bin/MS-single-to-table
EXE_T2S=bin/MS-table-to-single
EXE_CMP=bin/MS-comp-taxa
EXE_CPD=bin/MS-comp-taxa-dynamic
EXE_MMR=bin/MS-make-ref
tax:
	$(PREFIX)/include/c++ -o $(EXE_TAL) src/taxa_sel.cpp $(HASHFLG) $(BUILDFLG) $(INCLUDES) $(CFLAGS) $(LIBS) $(OMPFLG)  
	$(PREFIX)/include/c++ -o $(EXE_T2S) src/table2single.cpp $(HASHFLG) $(BUILDFLG) $(INCLUDES) $(CFLAGS) $(LIBS) $(OMPFLG)  
	$(PREFIX)/include/c++ -o $(EXE_CMP) src/comp_sam.cpp $(HASHFLG) $(BUILDFLG) $(INCLUDES) $(CFLAGS) $(LIBS) $(OMPFLG)  
	$(PREFIX)/include/c++ -o $(EXE_CPD) src/comp_sam_dynamic.cpp $(HASHFLG) $(BUILDFLG) $(INCLUDES) $(CFLAGS) $(LIBS) $(OMPFLG)  
	$(PREFIX)/include/c++ -o $(EXE_MMR) src/make_ref.cpp $(HASHFLG) $(BUILDFLG) $(INCLUDES) $(CFLAGS) $(LIBS) $(OMPFLG)  
clean:
	rm -rf bin/* src/*.o
