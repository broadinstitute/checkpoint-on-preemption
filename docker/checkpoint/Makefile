VERSION = 0.1.2
TAG1 = us.gcr.io/broad-dsp-lrma/checkpoint:$(VERSION)
TAG2 = us.gcr.io/broad-dsp-lrma/checkpoint:latest

all: build push

build:
	docker build -t $(TAG1) -t $(TAG2) .

push:
	docker push $(TAG1)
	docker push $(TAG2)
