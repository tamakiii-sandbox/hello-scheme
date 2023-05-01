FROM ubuntu:23.04

RUN apt update && \
		apt install -y \
			guile-3.0 \
			&& \
		apt clean all