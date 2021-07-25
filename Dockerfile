# thanks split our task for two images, we will get very small image with result from alpine
# Each line of a Docker file makes a new , independent image based on the previous line's image!
FROM ubuntu:16.04 AS builder
RUN apt-get update
RUN apt-get -y install curl
RUN curl https://google.com | wc -c > google-size

FROM alpine
COPY --from=builder /google-size /google-size 
#ADD will unzip files before copy to our image
ADD files.tar.gz /copysFiles/ 
#ENTRYPOINT VS CMD => CMD commands will be execute if is not any arguments
#ENTRYPOINT will be execute always
ENTRYPOINT echo google is this big; cat google-size

