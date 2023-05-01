FROM ubuntu:23.04

RUN apt update && \
		apt install -y \
			guile-3.0 \
			make \
			&& \
		apt clean all