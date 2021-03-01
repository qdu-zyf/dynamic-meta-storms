OMPFLG=-fopenmp
HASHFLG=-Wno-deprecated
BUILDFLG=-w -ffunction-sections -fdata-sections -fmodulo-sched -msse
EXE_TAL=$(PREFIX)/bin/MS-single-to-table
EXE_T2S=$(PREFIX)/bin/MS-table-to-single
EXE_CMP=$(PREFIX)/bin/MS-comp-taxa
EXE_CPD=$(PREFIX)/bin/MS-comp-taxa-dynamic
EXE_MMR=$(PREFIX)/bin/MS-make-ref
tax:
	$(CXX) -o $(EXE_TAL) -static src/taxa_sel.cpp $(HASHFLG) $(BUILDFLG) $(OMPFLG) $(CXXFLAGS) $(LDFLAGS)  
	$(CXX) -o $(EXE_T2S) -static src/table2single.cpp $(HASHFLG) $(BUILDFLG) $(OMPFLG) $(CXXFLAGS) $(LDFLAGS)
	$(CXX) -o $(EXE_CMP) -static src/comp_sam.cpp $(HASHFLG) $(BUILDFLG) $(OMPFLG) $(CXXFLAGS) $(LDFLAGS)
	$(CXX) -o $(EXE_CPD) -static src/comp_sam_dynamic.cpp $(HASHFLG) $(BUILDFLG) $(OMPFLG) $(CXXFLAGS) $(LDFLAGS)
	$(CXX) -o $(EXE_MMR) -static src/make_ref.cpp $(HASHFLG) $(BUILDFLG) $(OMPFLG) $(CXXFLAGS) $(LDFLAGS)
clean:
	rm -rf $(PREFIX)/bin/* src/*.o
