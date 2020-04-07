# How to start to development
```
docker build -f Dockerfile.dev -t open-motherbase .
```

# How to run
```
docker run -d -p 4567:4567 --rm --privileged -v ${PWD}:/home --name open-motherbase open-motherbase
```

# NOTE
- internal directory has NO "internal data". There is only test data.
