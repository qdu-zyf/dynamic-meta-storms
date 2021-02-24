OMPFLG=-fopenmp
HASHFLG=-Wno-deprecated
BUILDFLG=-w -ffunction-sections -fdata-sections -fmodulo-sched -msse
EXE_TAL=bin/MS-single-to-table
EXE_T2S=bin/MS-table-to-single
EXE_CMP=bin/MS-comp-taxa
EXE_CPD=bin/MS-comp-taxa-dynamic
EXE_MMR=bin/MS-make-ref
tax:
	$(CXX) -o $(EXE_TAL) -static src/taxa_sel.cpp $(HASHFLG) $(BUILDFLG) $(CFLAGS) $(OMPFLG)
	$(CXX) -o $(EXE_T2S) -static src/table2single.cpp $(HASHFLG) $(BUILDFLG) $(CFLAGS) $(OMPFLG)
	$(CXX) -o $(EXE_CMP) -static src/comp_sam.cpp $(HASHFLG) $(BUILDFLG) $(CFLAGS) $(OMPFLG)
	$(CXX) -o $(EXE_CPD) -static src/comp_sam_dynamic.cpp $(HASHFLG) $(BUILDFLG) $(CFLAGS) $(OMPFLG)
	$(CXX) -o $(EXE_MMR) -static src/make_ref.cpp $(HASHFLG) $(BUILDFLG) $(CFLAGS) $(OMPFLG)
clean:
	rm -rf bin/* src/*.o
