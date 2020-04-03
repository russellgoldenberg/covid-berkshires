PHONY: github data

github:
	rm -rf docs
	cp -r __sapper__/export/covid-berkshires docs
	git add -A
	git commit -m "update github pages"
	git push

data: 
	curl -o temp.csv "https://raw.githubusercontent.com/nytimes/covid-19-data/master/us-counties.csv";
	csvgrep -c "state" -r  "Massachusetts" temp.csv | csvcut -c "date,county,cases,deaths" > src/data/ma.csv;
	rm temp.csv