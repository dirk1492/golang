.PHONY: build push
 
VERSION = 1.8
SHA256 = 406865f587b44be7092f206d73fc1de252600b79b3cacc587b74b5ef5c623596

OS=jessie
TAGS = 1.8
REPO = dil001/golang-arm64

SUBDIRS = alpine onbuild stretch

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
