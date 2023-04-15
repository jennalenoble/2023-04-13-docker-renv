.PHONY: build
build:
	docker build --tag dsci310-docker-renv .
	# docker build --tag jennalenoble/dsci310-docker-renv

.PHONY: run
run:
	docker run -it --rm -e PASSWORD="apassword" -e DISABLE_AUTH=true -p 8787:8787 --volume /$(pwd):/home/rstudio dsci310-docker-renv