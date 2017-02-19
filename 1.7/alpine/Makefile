.PHONY: build push
 
VERSION = 1.7.5
SHA256 = 4e834513a2079f8cbbd357502cccaac9507fd00a1efe672375798858ff291815

OS=alpine
TAGS = 1.7 1.7-$(OS) 
REPO = dil001/golang-arm64

build:
	docker build --build-arg GOLANG_VERSION=$(VERSION) --build-arg GOLANG_SRC_SHA256=$(SHA256) -t $(REPO):$(VERSION)-$(OS) .

	for tag in $(TAGS); do \
                docker tag $(REPO):$(VERSION)-$(OS) $(REPO):$$tag ; \
        done 

push:
	docker -- push $(REPO):$(VERSION)-$(OS)
	for tag in $(TAGS); do \
                docker push $(REPO):$$tag ; \
        done 

clean:
	docker rmi $(REPO):$(VERSION)-$(OS)
	for tag in $(TAGS); do \
                docker rmi $(REPO):$$tag ; \
        done 

