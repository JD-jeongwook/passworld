## PASS WORLD

### 프로젝트 설명
  - 출발지와 도착지를 통한 간편한 비행기티켓 예매를 가능하게 했습니다.
  - 게시판을 통해 여행후기를 공유할 수 있게 했습니다.
  - 포인트를 통해 아이템 구매를 할 수 있게 했습니다.
  - 관리자와 유저 페이지를 구분했습니다.

---------------------------------------------------
##### 실행환경 및 버전 
  - window 7 / window 10 ( x64 ) , browser ( chrome )
  - MYSQL ver.8.0.21 
  - JDK ver.14.0.1
  - Apache Tomcat ver.9.0   
  - 구동전 필요한 데이터 및 설치파일
    -  [SQL 쿼리](https://github.com/JD-jeongwook/passworld/tree/main/KANG_PROJECT/export)
    -  [contextFile](https://github.com/JD-jeongwook/passworld/blob/main/KANG_PROJECT/context.xml)
    -  [Cos.jar](http://www.servlets.com/cos/) ,  [Jstl.jar](https://tomcat.apache.org/download-taglibs.cgi) , [Connector J](https://dev.mysql.com/downloads/connector/j/8.0.html)

**쿼리문을 DB에 꼭 넣어주세요.**

**보안을 위해 contextFile은 비공개 처리 했습니다.**

----------------------------------

### 프로젝트 이미지

  * 메인 페이지
    * PASS WORLD 메인 페이지입니다.
    
  ![move_sumbnail](https://user-images.githubusercontent.com/75401960/102967365-1aca9780-4535-11eb-989e-a88e59a160ee.gif)

  * 게시판
    * 유저들이 소통할 수 있는 공간입니다.
   
  ![board](https://user-images.githubusercontent.com/75401960/102973788-bca3b180-4540-11eb-82d2-73e2967234eb.gif)
  
  * 나의 갤러리
    * 내가 게시판에 올린 사진을 한눈에 볼 수 있습니다.
  
  ![gallary](https://user-images.githubusercontent.com/75401960/102974475-f3c69280-4541-11eb-8dc3-b6e91b45e49e.gif)
  
  * 간편 예매
    * 비행기 티켓을 간편하게 예매할 수 있습니다.
    
    ![Reservation](https://user-images.githubusercontent.com/75401960/102978713-47d47580-4548-11eb-86f7-cefd317439d1.gif)
> The overriding design goal for Markdown's
> formatting syntax is to make it as readable
> as possible. The idea is that a
> Markdown-formatted document should be
> publishable as-is, as plain text, without
> looking like it's been marked up with tags
> or formatting instructions.

This text you see here is *actually* written in Markdown! To get a feel for Markdown's syntax, type some text into the left window and watch the results in the right.

### Tech

Dillinger uses a number of open source projects to work properly:

* [AngularJS] - HTML enhanced for web apps!
* [Ace Editor] - awesome web-based text editor
* [markdown-it] - Markdown parser done right. Fast and easy to extend.
* [Twitter Bootstrap] - great UI boilerplate for modern web apps
* [node.js] - evented I/O for the backend
* [Express] - fast node.js network app framework [@tjholowaychuk]
* [Gulp] - the streaming build system
* [Breakdance](https://breakdance.github.io/breakdance/) - HTML to Markdown converter
* [jQuery] - duh

And of course Dillinger itself is open source with a [public repository][dill]
 on GitHub.

### Installation

Dillinger requires [Node.js](https://nodejs.org/) v4+ to run.

Install the dependencies and devDependencies and start the server.

```sh
$ cd dillinger
$ npm install -d
$ node app
```

For production environments...

```sh
$ npm install --production
$ NODE_ENV=production node app
```

### Plugins

Dillinger is currently extended with the following plugins. Instructions on how to use them in your own application are linked below.

| Plugin | README |
| ------ | ------ |
| Dropbox | [plugins/dropbox/README.md][PlDb] |
| GitHub | [plugins/github/README.md][PlGh] |
| Google Drive | [plugins/googledrive/README.md][PlGd] |
| OneDrive | [plugins/onedrive/README.md][PlOd] |
| Medium | [plugins/medium/README.md][PlMe] |
| Google Analytics | [plugins/googleanalytics/README.md][PlGa] |


### Development

Want to contribute? Great!

Dillinger uses Gulp + Webpack for fast developing.
Make a change in your file and instantaneously see your updates!

Open your favorite Terminal and run these commands.

First Tab:
```sh
$ node app
```

Second Tab:
```sh
$ gulp watch
```

(optional) Third:
```sh
$ karma test
```
#### Building for source
For production release:
```sh
$ gulp build --prod
```
Generating pre-built zip archives for distribution:
```sh
$ gulp build dist --prod
```
### Docker
Dillinger is very easy to install and deploy in a Docker container.

By default, the Docker will expose port 8080, so change this within the Dockerfile if necessary. When ready, simply use the Dockerfile to build the image.

```sh
cd dillinger
docker build -t joemccann/dillinger:${package.json.version} .
```
This will create the dillinger image and pull in the necessary dependencies. Be sure to swap out `${package.json.version}` with the actual version of Dillinger.

Once done, run the Docker image and map the port to whatever you wish on your host. In this example, we simply map port 8000 of the host to port 8080 of the Docker (or whatever port was exposed in the Dockerfile):

```sh
docker run -d -p 8000:8080 --restart="always" <youruser>/dillinger:${package.json.version}
```

Verify the deployment by navigating to your server address in your preferred browser.

```sh
127.0.0.1:8000
```

#### Kubernetes + Google Cloud

See [KUBERNETES.md](https://github.com/joemccann/dillinger/blob/master/KUBERNETES.md)


### Todos

 - Write MORE Tests
 - Add Night Mode

License
----

MIT


**Free Software, Hell Yeah!**

[//]: # (These are reference links used in the body of this note and get stripped out when the markdown processor does its job. There is no need to format nicely because it shouldn't be seen. Thanks SO - http://stackoverflow.com/questions/4823468/store-comments-in-markdown-syntax)


   [dill]: <https://github.com/joemccann/dillinger>
   [git-repo-url]: <https://github.com/joemccann/dillinger.git>
   [john gruber]: <http://daringfireball.net>
   [df1]: <http://daringfireball.net/projects/markdown/>
   [markdown-it]: <https://github.com/markdown-it/markdown-it>
   [Ace Editor]: <http://ace.ajax.org>
   [node.js]: <http://nodejs.org>
   [Twitter Bootstrap]: <http://twitter.github.com/bootstrap/>
   [jQuery]: <http://jquery.com>
   [@tjholowaychuk]: <http://twitter.com/tjholowaychuk>
   [express]: <http://expressjs.com>
   [AngularJS]: <http://angularjs.org>
   [Gulp]: <http://gulpjs.com>

   [PlDb]: <https://github.com/joemccann/dillinger/tree/master/plugins/dropbox/README.md>
   [PlGh]: <https://github.com/joemccann/dillinger/tree/master/plugins/github/README.md>
   [PlGd]: <https://github.com/joemccann/dillinger/tree/master/plugins/googledrive/README.md>
   [PlOd]: <https://github.com/joemccann/dillinger/tree/master/plugins/onedrive/README.md>
   [PlMe]: <https://github.com/joemccann/dillinger/tree/master/plugins/medium/README.md>
   [PlGa]: <https://github.com/RahulHP/dillinger/blob/master/plugins/googleanalytics/README.md>
