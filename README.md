# befor start development for beginner
- You can go to training directory and read `example.txt`.
- try training following the file.
  - This training is a simple git training.
- If you find some other mistakes, for example, typo, bad grammar and etc, Please also fix. Thank you! 

# How to start development
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
