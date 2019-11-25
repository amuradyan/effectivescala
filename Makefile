all: index.html index-ja.html index-ru.html index-cn.html index-hy.html

index.html: header.html.inc effectivescala.html footer.html.inc
	cat $^ > $@

index-ja.html: header-jp.html.inc effectivescala-ja.html footer-jp.html.inc
	cat $^ > $@

index-ru.html: header-ru.html.inc effectivescala-ru.html footer-ru.html.inc
	cat $^ > $@

index-cn.html: header-cn.html.inc effectivescala-cn.html footer-cn.html.inc
	cat $^ > $@

index-hy.html: header-hy.html.inc effectivescala-hy.html footer-hy.html.inc
	cat $^ > $@

pub: all
	./publish.sh index.html index-ja.html index-ru.html index-cn.html index-hy.html coll.png

%.html: %.mo
	cat $< | bash proc.sh | bash toc.sh | bash fmt.sh | markdown > $@

%.ps: %.pic
	9 pic $< | 9 troff | 9 tr2post | 9 psfonts > $@

%.eps: %.ps
	rm -f $@
	ps2eps -f $< $@

%.png: %.eps
	convert -density 150 $< $@

%.proof: %.pic
	9 pic $< | 9 troff | 9 proof

clean:
	rm *.html

.PHONY: all clean pub

