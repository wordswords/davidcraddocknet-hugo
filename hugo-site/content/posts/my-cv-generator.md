---
category:
  - tips
date: "2025-01-04T22:10:59+00:00"
guid: https://davidcraddock.net/my-cv-generator
title: Updated my CV Generator
url: /2025/01/04/my-cv-generator
author: David Craddock
---

I've updated the repository that generates my CVs in PDF and HTML form, from a markdown file.

The repository is [https://github.com/wordswords/dpc-resume.git](https://github.com/wordswords/dpc-resume.git) and it contains my patched version of a 8 years old markdown to HTML generator I found on the web, see here: [https://github.com/wordswords/markdown-resume-2024](https://github.com/wordswords/markdown-resume-2024).

I used the modified HTML CV generator to do most of the work, but then, instead of using the old inbuilt feature that doesn't work very well anymore, to convert it to PDF, I use another repository that I found, [https://github.com/UKHomeOffice/html-pdf-converter](https://github.com/UKHomeOffice/html-pdf-converter) to convert the HTML into PDF using Chrome.

I had to hack about with the HTML->PDF converter too though, as it only accepted a JSON POST of a html string, so I used some `jq` hackery to convert the HTML CV into JSON so that I can post it to the converter, so I can save the resultant response in PDF format.

I'm mostly happy with the result. I might go back and do some tidying up in the future, such as removing more deprecation warnings, and cutting out the inbuilt PDF generator code and replacing it with the UKHomeOffice converter, but for now it does exactly what I need it to.

My generated CVs are available here if you're interested:

* [https://wordswords.github.io/dpc-resume/CV.md](https://wordswords.github.io/dpc-resume/CV.md)
* [https://wordswords.github.io/dpc-resume/CV.html](https://wordswords.github.io/dpc-resume/CV.html)
* [https://wordswords.github.io/dpc-resume/CV.pdf](https://wordswords.github.io/dpc-resume/CV.pdf)


