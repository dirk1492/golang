.PHONY: build push
 
VERSION = 1.8
OS = jessie-onbuild
TAGS = $(VERSION)-onbuild 
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

