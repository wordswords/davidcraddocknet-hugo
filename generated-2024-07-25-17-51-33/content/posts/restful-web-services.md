---
category:
  - tutorials
date: "2011-03-02T14:21:23+00:00"
guid: http://www.davidcraddock.net/?p=876
title: RESTful Web Services
url: /2011/03/02/restful-web-services/

---
REST (Representational State Transfer) is a way of delivering web services. When a web service conforms to REST, it is known as RESTful. The largest RESTful web service is the Hypertext Transfer Protocol (HTTP) which you use every day to send and receive information from web servers while browsing the internet.

To implement RESTful web services, you should implement four methods: GET, PUT, POST and DELETE. Resources on RESTful web services are typically defined as collections of elements. The REST methods can either act on a whole collection, or a specific element in a collection.

A collection is usually logically defined as a hierarchy on the URL, for example take this fictitious layout:

**Collection:** www.bbc.co.uk/iplayer/programmes/
**Element:** www.bbc.co.uk/iplayer/programmes/24
**Element:** www.bbc.co.uk/iplayer/programmes/25
**Element:** www.bbc.co.uk/iplayer/programmes/26

The REST methods you use do different things depending on whether you are interacting with a Collection resource or an Element resource. See below:

**On a Collection: ie: www.bbc.co.uk/iplayer/programmes/**

GET – Lists the URLs of the collection’s members.
PUT – Replace the entire collection with another collection.
POST – Create a new element in a collection, returning the new element’s URL.
DELETE – Deletes the entire collection.

**On an Element: ie: www.bbc.co.uk/iplayer/programmes/24**

GET – Retrieve the addressed element in the appropriate internet media type, ie: music file or image
PUT – Replace the addressed element of the collection, or if it doesn’t exist, create it in the parent collection.
POST – Treat the addressed element of the collection as a new collection, and add an element into it.
DELETE – Delete the addressed element of the collection.

REST is a simple and clear way of implementing the basic methods of data storage; CRUD (Create, Read, Update and Delete), see: [http://en.wikipedia.org/wiki/Create,\_read,\_update\_and\_delete](http://en.wikipedia.org/wiki/Create,_read,_update_and_delete)
