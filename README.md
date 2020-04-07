# How to start to development
```
docker build -f Dockerfile.dev .
```

# How to run
```
docker run -d -p 4567:4567 --rm --privileged -v ${PWD}:/home --name open-motherbase open-motherbase
```
