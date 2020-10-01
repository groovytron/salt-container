BUILD_NAME=salt
OWNER=groovytron
COMPOSE_BUILD_NAME=salt-container
VERSIONS=3001
LATEST=3001
LATEST_LABEL=latest
ALL=$(addprefix salt,$(VERSIONS))
VCS_REF="$(shell git rev-parse HEAD)"
BUILD_DATE="$(shell date -u +"%Y-%m-%dT%H:%m:%SZ")"
DOCKERHUB_USER=groovytron
CURRENT_DATE="$(shell date +"%Y%m%d")"

.PHONY: all
all: $(ALL)

.PHONY: $(ALL)
$(ALL):
	BUILD_DATE=$(BUILD_DATE) \
	BUILD_NAME=$(BUILD_NAME) \
	COMPOSE_BUILD_NAME=$(COMPOSE_BUILD_NAME) \
	VCS_REF=$(VCS_REF) \
	docker-compose -f build.yaml build \
		$@

.PHONY:publish-docker-images
publish-docker-images:
	for VERSION in $(VERSIONS); do \
		docker tag $(COMPOSE_BUILD_NAME):$$VERSION $(DOCKERHUB_USER)/$(BUILD_NAME):$$VERSION && \
		docker push $(DOCKERHUB_USER)/$(BUILD_NAME):$$VERSION; \
	done && \
	docker tag $(COMPOSE_BUILD_NAME):$(LATEST) $(DOCKERHUB_USER)/$(BUILD_NAME):latest && \
	docker push $(DOCKERHUB_USER)/$(BUILD_NAME):latest
