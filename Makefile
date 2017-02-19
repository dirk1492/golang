.PHONY: build push clean
 
SUBDIRS = 1.8 1.7 1.6

build:
	for dir in $(SUBDIRS); do \
                 make -C $$dir build ; \
        done

push:
	for dir in $(SUBDIRS); do \
                 make -C $$dir push ; \
        done

clean:
	for dir in $(SUBDIRS); do \
                 make -C $$dir clean ; \
        done
