.PHONY: build push clean
 
VERSION = 1.6.4
SHA256 = 8796cc48217b59595832aa9de6db45f58706dae68c9c7fbbd78c9fdbe3cd9032

OS=jessie
TAGS = 1.6 1.6-$(OS) 
REPO = dil001/golang-arm64

SUBDIRS = alpine onbuild

build:
	docker build --build-arg GOLANG_VERSION=$(VERSION) --build-arg GOLANG_SRC_SHA256=$(SHA256) -t $(REPO):$(VERSION)-$(OS) .

	for tag in $(TAGS); do \
                docker tag $(REPO):$(VERSION)-$(OS) $(REPO):$$tag ; \
        done 

	for dir in $(SUBDIRS); do \
		make -C $$dir build ; \
	done

push:
	docker -- push $(REPO):$(VERSION)-$(OS)
	for tag in $(TAGS); do \
                docker push $(REPO):$$tag ; \
        done 

	for dir in $(SUBDIRS); do \
		make -C $$dir push ; \
	done

clean:
	docker rmi $(REPO):$(VERSION)-$(OS)
	for tag in $(TAGS); do \
                docker rmi $(REPO):$$tag ; \
        done 

	for dir in $(SUBDIRS); do \
		make -C $$dir clean ; \
	done
