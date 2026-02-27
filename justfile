default: texto

texto: clean
  lualatex --interaction=batchmode --draftmode main.tex 
  bib2gls main -g
  lualatex --interaction=batchmode --draftmode main.tex 
  bib2gls main -g
  lualatex --interaction=batchmode main.tex
  lualatex --interaction=batchmode main.tex

clean: 
  rm -f *.glstex *.lof *.synctex.gz *.aux *.log *.bbl *.bcf *.blg *n.glg *.out *.run.xml *.toc *.lot 

hardclean: 
  rm -f *.glstex *.lof *.synctex.gz *.aux *.log *.bbl *.bcf *.blg *n.glg *.out *.run.xml *.toc *.lot *.pdf main.synctex\(busy\)

