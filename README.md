# How to start to development
1. build development enviroment
  - you can execute below command only one time at the first time
```
docker build -f Dockerfile.dev -t open-motherbase .
```
2. start container
```
docker run -d -p 4567:4567 --rm --privileged -v ${PWD}:/home --name open-motherbase open-motherbase
```
3. access to http://localhost:4567

# docker tips
- to stop docker container
```
docker stop open-motherbase
```

# NOTE
- internal directory has NO "internal data". There is only test data.
