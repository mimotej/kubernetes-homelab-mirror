FROM quay.io/curl/curl:latest
USER root
COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh
USER 1000
CMD ["/entrypoint.sh"]
