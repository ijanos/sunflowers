.PHONY: clean all epub mobi

all: epub mobi
epub: sunflowers.epub
mobi: sunflowers.mobi

sunflowers.epub: island.md hotshot.md giants.md metadata.yaml epub.css
	pandoc -o $@ -t epub2 --toc --toc-depth=1\
		--metadata-file metadata.yaml \
		island.md \
		hotshot.md \
		giants.md \
		freezeframe.md

sunflowers.mobi: sunflowers.epub
	kindlegen sunflowers.epub

clean:
	rm -f sunflowers.mobi sunflowers.epub