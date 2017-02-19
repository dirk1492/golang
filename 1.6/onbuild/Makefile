.PHONY: build push
 
VERSION = 1.6.4
OS=onbuild
TAGS = 1.6-$(OS) 
REPO = dil001/golang-arm64

build:
	docker build -t $(REPO):$(VERSION)-$(OS) .

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

