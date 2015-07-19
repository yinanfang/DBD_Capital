![Golden Compass: An Elegant Full-Stack Project](https://raw.githubusercontent.com/yinanfang/GoldenCompass/master/Others/images/logo_github.png)

An elegant full-stack project with Node.js backend, HTML5 website and iOS app

## Progress
- [ ] iOS app
- [ ] Node backend
- [ ] HTML5 website

## Requirements
- iOS 8.0+
- Xcode 6.3+
- Node 0.11.2+

## Quick Installation

    git clone https://github.com/yinanfang/GoldenCompass; cd GoldenCompass
    cd node; npm install -g gulp bower && npm install && bower install; cd ..
    cd iOS; cocoapod install; cd ..

    Create $HOME/node/config/config.js and fill in info like $HOME/Others/configTemplate.js

## iOS Features:
- [ ] Strong Mudularity
  - [ ] Modular and Reusable code

#### Use of Popular Third-Party Libraries
- Core for all
  - ReactiveCocoa
  - CocoaLumberjack
  - libextobjc
- Animation
  - pop
- Model
  - Mantle
- Networking
  - AFNetworking
- Routing
  - JLRoutes
- Debug
  - chisel

#### Multi-Threaded Programming
Only update UI from the main thread. Do other work in the secondary thread

- Queue
  - Default Main Queue
  - Default Background Queue
  - Data Layer Queue

#### Dependencies Injection with NSNotification+Factory Methods

#### Architecture Decision
- [VIPER](http://www.objc.io/issues/13-architecture/viper/)
  - After Comparing the [difference](http://khanlou.com/2014/03/model-view-whatever/) between MVC, MVVM, and VIPER, I chose to use VIPER because of its scalability.

#### Localization
  - [ ] English, Chinese

#### TO-DOs:
- [ ] App
  - [ ] Welcome, Login, Register, Visitor - UIView-Shake
  - [ ] Show list of accounts
  - [ ] Account overview - Chart
    - [ ] Account detailed view
- [ ] Images.xcassets
  - [x] Use Images.xcassets to avoid different naming suffix for image files
  - [ ] Add build phase with objc-codegenutils and generate class methods
- [ ] LocalizedStrings
- [ ] Use [chisel](https://github.com/facebook/chisel) for lldb debug


- [ ] GCAppKit -
  - [ ] GCUIKit
    - [ ] GCUICategory (or name it like GCButton?)
      - [ ] UIView+GCFoundation - [UIView-Shake](https://github.com/andreamazz/UIView-Shake),
      - [ ] UITextField+GCFoundation - [UITextField-Shake](https://github.com/andreamazz/UITextField-Shake), [JVFloatLabeledTextField](https://github.com/jverdi/JVFloatLabeledTextField)
      - [ ] NSAttributedString+GCFoundation
    - [ ] GCCustomeUIFactory - Provide Factory Method/Class Method for creating UI component fast
      - [ ] GCButton - [FlatUIKit](https://github.com/Grouper/FlatUIKit)
      - [ ] GCGestureRecognizer
      - [ ] GCShimmer
  - [ ] GCUtility
    - [ ] GCAccountManager
    - [ ] GCNetworkManager
    - [x] GCConstant
    - [ ] GCMacro
    - [ ] GCPList
      - [Link01](http://stackoverflow.com/questions/21119922/how-to-read-a-plist-and-create-different-arrays-from-its-content-in-xcode), [Link02](https://developer.apple.com/library/ios/documentation/Cocoa/Conceptual/PropertyLists/ReadWritePlistData/ReadWritePlistData.html)
    - [ ] GCConfiguration
    - [ ] GCBundle
    - [ ] GCAppCategory
      - [ ] GCLog - Pretty hex dump
    - [ ] GCFormatter - [FormatterKit](https://github.com/mattt/FormatterKit)
      - [ ] NSDate+GCFoundation
      - [ ] GCDateFormatter
      - [ ] GCTimeFormatter
    - [ ] GCComposer
    - [ ] GCFriendList
    - [ ] GCShare
      - [ ] GCSharingSheet
      - [ ] GCShareAction
    - [ ] GCPrivacyControl
    - [ ] GCLike
    - [ ] GCComment
    - [ ] GCModuleManager - minimizes dependencies between products
    - [ ] GCURLSegue


## Node.js

#### Architecture

1. OAuth
  - Choose [Json Web Token over Session](https://auth0.com/blog/2014/01/27/ten-things-you-should-know-about-tokens-and-cookies/) with [Bcrypt](dcodeIO/bcrypt.js) Encryption

#### TO-DOs:

- [ ] User Icon
  - [ ] Random Icon from selected Image
  - [ ] [Identicon](https://github.com/dmester/jdenticon)
- [ ] WebAPI
  - [ ] Server - express
  - [ ] CORS - expressjs/cors
  - [ ] jwt - hokaccha/node-jwt-simple
  - [ ] CSV parsing - PapaParse
- [ ] npm
  - [ ] Auto Refresh
    - [ ] nodemon for development
    - [ ] pm2 for production. Monitor and profile for production
  - [ ] Promise - Async
  - [ ] Build System - Gulp
  - [ ] Advanced logging - Bunyan
  - [ ] Advanced debug
    - [ ] [debug](https://github.com/visionmedia/debug)
    - [ ] node-inspector
  - [ ] Test coverage ??
  - [ ] Static analysis tools??
    - [ ] ESLint,
  - [ ] Statistics?? - [statsd](https://github.com/etsy/statsd)
- [ ] Blog Website
  - [ ] AngularJS
  - [ ] ejs

#### Website Architecture
- [ ] Folder structure follow "polymer-starter-kit".
  - Same from Yeoman maybe. Add .htaccess at the root level "app": https://www.youtube.com/watch?v=gKiaLSJW5xI
- [ ] UI Front-end Libraries
  - [ ] Bootstrap, AngularJS, Modernizr
- [ ] Build with Facebook [Flux](https://www.youtube.com/watch?list=PLb0IAmt7-GS188xDYE-u1ShQmFFGbrk0v&t=602&v=nYkdrAPrdcw) & React
  - MVC doesn't scale
    - MVC is pretty good for small application. Everything has its particular roll to play. The problem is that it doesn't make room for the new features
    - Increase predictability
    - MVC allows bi-direction data flow, but Flux allows only one direction data flow
    - When data changes, React re-renders the component
    - Referentially transparent functions
      - Describe UI at any point in time
      - Trivial to predict for a given input
      - Easy to test
    - React builds a new virtual DOM subtree
      - diffs it with the old one
      - computes the minimal set of DOM mutations and puts them in a queue
      - and batch executes all updates
    - Might worries about the performance if only a small changes occurs in a huge DOM tree. There're a lot of useless diffs

## Summarize Great Article from
- [ ] Make them a feature of this project
  - [ ] [VIPER modularity ](http://www.objc.io/issues/13-architecture/viper/) - Get great links in this article
  - [ ] 10 key points: https://www.airpair.com/node.js/posts/top-10-mistakes-node-developers-make
  - [ ] This too: https://medium.com/@faisalabid/7-tips-for-a-node-js-padawan-e7c0b0e5ce3c
  - [ ] https://auth0.com/blog/2014/01/27/ten-things-you-should-know-about-tokens-and-cookies/

## To learn
- Difference between JWT and OAuth2, OAuth1
- Flux and React. How to improve this kind of performance hit

## Utility
- Icon
  - [Iconfinder](https://www.iconfinder.com)
- Github badges
  - [shields](https://github.com/badges/shields)
- Markdown Editor
  - [stackedit](https://stackedit.io/editor)



