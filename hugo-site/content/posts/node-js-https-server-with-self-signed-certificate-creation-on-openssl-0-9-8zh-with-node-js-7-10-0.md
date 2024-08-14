---
category:
  - node
  - node.js
  - node.js-7.10.0
  - node.js-https-server
  - openssl
  - openssl-0.9.8
  - self-signed
  - solutions-to-a-specific-problem
date: "2017-05-10T13:59:18+00:00"
guid: https://davidcraddock.net/?p=1923
tag:
  - node
  - node.js
  - node.js-7.10.0
  - node.js-https-server
  - openssl
  - openssl-0.9.8
  - self-signed
title: Node.js HTTPS server with self-signed certificate creation on openssl 0.9.8zh with node.js 7.10.0
url: /2017/05/10/node-js-https-server-with-self-signed-certificate-creation-on-openssl-0-9-8zh-with-node-js-7-10-0/

---
I couldn't find a concise guide to setting this up quickly so thought it was worth a post. To quickly get something working and create a https server using the above versions of openssl and node.js, do the following:

 **Generate self-signed server certificate with no password** `
sudo openssl req -x509 -newkey rsa:2048 -keyout ./csr.pem -out server.crt -days 3001 -nodes
` **Use this node.js code to setup a server quickly** `
const https = require('https');
const fs = require('fs');
const options = {
  key: fs.readFileSync('csr.pem'),
  cert: fs.readFileSync('server.crt')
};
https.createServer(options, (req, res) => {
  res.writeHead(200);
  res.end('hello world\n');
}).listen(8000);
` **Go to https://localhost:8000 and accept the certificate, you should see 'hello world'**
