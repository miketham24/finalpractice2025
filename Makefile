.PHONY: all clean

all:
	mkdir -p data
	mkdir -p results
	Rscript R/01_load_data.R
	Rscript R/02_methods.R
	
data:
	mkdir -p data

results:
	mkdir -p results

load: R/01_load_data.R
	Rscript R/01_load_data.R
	
method: R/02_methods.R
	Rscript R/02_methods.R
	
clean:
	rm -rf data
	rm -rf results