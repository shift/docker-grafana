all: build push

build:
	docker build -t ${DOCKER_USER}/grafana:2.0.2 .

push: build
	docker push ${DOCKER_USER}/grafana:2.0.2

test: build
	docker run -i ${DOCKER_USER}/grafana:2.0.2 /bin/bash -l -c '/usr/sbin/grafana-server'
