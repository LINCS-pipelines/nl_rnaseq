How to build
============
docker build -t neurolincs:v1 .

#docker run -d -t -p 87874:8787 neurolincs/pipeline

docker run --name nourorna -d -p 1988:8787 neurolincs:v1
