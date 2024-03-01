
all: clean compile run_coverage report

compile:
	vlib work
	vlog FILES.svh

run_coverage:
	vsim -cvgperinstance -c -voptargs=+acc top_tb -do "coverage save -onexit testcov.ucdb; run -all; exit"

run:
	vsim -c top_tb -do "run -all; quit"

clean:
	rm -rf work
	rm -rf transcript

report:
	vsim -cvgperinstance -viewcov testcov.ucdb -do "coverage report -file final_report.txt -byfile -detail -noannotate -option -cvg"


