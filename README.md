# Node.js evaluator Docker image

This docker image is used to evaluate Node.js related challenges on Make it Real's Learning Platform.

It installs:

* Node.js
* Yarn
* Testing packages (Mocha, Sinon, Chai)
* Chromium
* Puppeteer (to automate Chromium)
* MongoDB shell

### Building

To build the image run the following command:

```
$ docker build -t makeitrealcamp/node-evaluator .
```
