DEFAULT_FLG=-static
CXX=g++ -openmp -DOMP $(DEFAULT_FLG)

MESS = "Compiling with parallel support."
ifeq ($(OMP),no)
        CXX  = g++ $(DEFAULT_FLAGS)
        MESS = "Compiling with NO parallel support."
endif

HASHFLG=-Wno-deprecated
BUILDFLG=-w -ffunction-sections -fdata-sections -fmodulo-sched -msse
EXE_TAL=$(PREFIX)/bin/MS-single-to-table
EXE_T2S=$(PREFIX)/bin/MS-table-to-single
EXE_CMP=$(PREFIX)/bin/MS-comp-taxa
EXE_CPD=$(PREFIX)/bin/MS-comp-taxa-dynamic
EXE_MMR=$(PREFIX)/bin/MS-make-ref
tax:
	$(CXX) -o $(EXE_TAL) src/taxa_sel.cpp $(HASHFLG) $(BUILDFLG)   
	$(CXX) -o $(EXE_T2S) src/table2single.cpp $(HASHFLG) $(BUILDFLG) 
	$(CXX) -o $(EXE_CMP) src/comp_sam.cpp $(HASHFLG) $(BUILDFLG) 
	$(CXX) -o $(EXE_CPD) src/comp_sam_dynamic.cpp $(HASHFLG) $(BUILDFLG) 
	$(CXX) -o $(EXE_MMR) src/make_ref.cpp $(HASHFLG) $(BUILDFLG) 
clean:
	rm -rf $(PREFIX)/bin/* src/*.o
