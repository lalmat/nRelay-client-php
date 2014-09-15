nRelay
======

Want to be Realtime in Existing Web Frameworks ? No Problem, nRelay is here ! Don't you ever dream of being able to use realtime data update with PHP Framworks ? nRelay is a start of solution.

Notes :
=======

After some researches, it seems that this project look like a free and open source Heroku Pusher (https://devcenter.heroku.com/articles/pusher).

New :
=====

- Support SSL Encryption and I use it in production environnement with a fallback to traditionnal mode.
- Socket.IO 1.0.x (Optimized Elephant.IO - Pulling Request in progress)

Get Started
===========

Once you've installed and runing the nRelay server, point your browser to http://localhost/[YOUR_PATH_TO]/nRelay-client-php/
Then you sould see a connection in your first terminal, open the console (F12) browser's console !

try to send message, connect more browsers and voilà !

Now you can build realtime webapps with ease ! Just look at the code.


In this app
===========

PHP Client : Written in PHP using Elephant.IO, 
JS  Client : Using Socket.IO client.