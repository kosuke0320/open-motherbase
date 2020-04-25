# Requirements
- git
- docker

## git
- I highly recommend to use git by CLI
  - For windows user : [git for windows](https://gitforwindows.org/)
  - For mac user : git command has already installed by default. you just open Terminal.app

# Quick start
- clone this repository
```
git clone https://github.com/YsuOS/open-motherbase.git
```
- just do it! Good luck!

# befor start development for beginner
- You can go to training directory and read `example.txt`.
- try training following the file.
  - This is a simple git training.
- If you find some other mistakes, for example, typo, bad grammar and etc, Please also fix. Thank you! 

# How to start development
1. move to open-motherbase directory in terminal
```
cd <open-motherbase's directory path you cloned>
for example:
    cd ~/Desktop/open-motherbase
```
- To confirm where you are, you can just type `pwd`.

2. build development enviroment
  - you can execute below command only one time at the first time
```
docker build -f Dockerfile.dev -t open-motherbase .
```
2. start container
```
docker run -d -p 8080:8080 --rm --privileged -v ${PWD}:/home --name open-motherbase open-motherbase
```
3. access to http://localhost:8080

# docker tips
- to stop docker container
```
docker stop open-motherbase
```

# NOTE
- internal directory has NO "internal data". There is only test data.

# Design of motherbase
- here is directory tree of motherbase v2.0
```
.
├── Dockerfile.dev
├── README.md
├── helper.rb
├── internal
│   ├── article
│   │   ├── cnp
│   │   │   └── test   <<<--- page title and it also has document1~2
│   │   ├── memo   <<<--- memo directory
│   │   │   └── memo   <<<--- memo file
│   │   ├── tools
│   │   │   └── test
│   │   └── vmcores
│   │       └── test
│   └── data
│       └── closedcase
├── main.rb
├── public
│   └── clipboard.min.js
├── test.rb
├── training
│   ├── YsuOS.txt
│   ├── example.txt
│   └── kosuke0320.txt
└── views
    ├── closedcase.haml
    ├── default.haml
    ├── index.haml
    └── tools.haml
```

- we want to change it like below at v3.0
```
.
├── Dockerfile.dev
├── README.md
├── helper.rb
├── internal
│   ├── cnp   <<<--- *1
│   │   ├── cnp1   <<<--- page title
│   │   │   ├── cnptest   <<<--- cnp1's document1   <<<--- *1-1
│   │   │   └── cnptest2   <<<--- cnp1's document2   <<<--- *1-2
│   │   └── cnp2   <<<--- page title
│   │       ├── cnp2-1   <<<--- cnp2's document1
│   │       └── cnp2-2   <<<--- cnp2's document2
│   ├── memo   <<<--- memo file   *2
│   ├── operations   <<<--- just change directory name *3
│   │   └── test
│   ├── vmcores
│   │   └── test
│   └── closedcase   <<<--- remove data directory and put file directly  *4
├── main.rb
├── public
│   └── clipboard.min.js
├── test.rb
├── training
│   ├── YsuOS.txt
│   ├── example.txt
│   └── kosuke0320.txt
└── views
    ├── closedcase.haml
    ├── default.haml
    ├── index.haml
    └── cnp.haml   <<<--- change the file name   *4
```

## *1
- cnp/test is like below at v2.0
```
cnptest
----------
Copy and Paste TEST
----------
hello! you can click below button.
You can copy this text to your clipboard!
==========
cnptest2
----------
Copy and Paste TEST2
----------
ola! you can click below button.
You can copy this text to your clipboard!
```

- In v3.0, we split this file into each files
```
$ cat cnp/cnp1/cnptest   <<<--- *1-1
Copy and Paste TEST
----------
hello! you can click below button.
You can copy this text to your clipboard!

$ cat cnp/cnp1/cnptest2   <<<---*1-2
Copy and Paste TEST2
----------
ola! you can click below button.
You can copy this text to your clipboard!
```

## *2
- we remove memo directory and put direct memo file in article directory 

## *3 
- change the directory name

## *4
- remove article/data directory
- put closedcase file into internal directly
- change the file name; views/tools.haml -> views/cnp.haml
