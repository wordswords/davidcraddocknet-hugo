---
date: "2015-06-21T16:46:15+00:00"
guid: http://www.davidcraddock.net/my-writing
title: My Writing
url: /my-writing
---

I've always liked writing and have been doing it for a long time. I write a lot for work, and also have written a lot of creative writing.

### Work Essays and Articles

The latest updated versions of these can always be found at: [https://github.com/wordswords/dotfiles/tree/master/notes](Github).

I'm working on a way to format these properly within Hugo. For now though, the following will have to do. You can always view them in markdown in the Github repository.

#### 'How to Get a Job - Supply/Demand Strategy'

<code>
---.

If you want to get a job and get paid, focus on acquiring skills that are 1) in demand and 2) under supply.

Everyone knows JavaScript. So don't spend ages specialising in JavaScript, even if you love the language, because the supply of JavaScript developers is such that it is not a good return on investment.

Learn tech skills that people find difficult, so there are higher barriers to entry to acquiring them, but also pick skills that there is high demand for.

Learn tech skills that people find unpopular or 'uncool' but there is high demand. A small number of people make a lot of money as Fortran contractors, believe it or not.

Look at skills shortage lists. Look at lists that show the most 'in demand' areas where employers are struggling to find skilled candidates, such as cyber security, machine learning, test automation, devops/MLOps .. and so on.

This is basic economic supply and demand theory, and is true today as it was when I learned it in high school over 20 years ago.
</code>

#### 'A Hiring Strategy to Reduce Bias'

<code>
---.

A lot of tech companies will leave vacancies 'open' for hiring for months and months.

Hundreds of people will apply, and go through the application process, only to be turned down and no hire is made.

Why is this? Because these tech companies are kidding themselves.

If you have hundreds of applicants and you interview, say, 50, then in this market, you are bound to have already found someone who is good enough for the role.

They think that with the method they're using they're getting the 'cream of the crop'. The 'needle in the haystack'. They are just kidding themselves that they can differentiate such minutate that seperates hundreds of applicants that meet the required skillset from a hire.

When there are that many applicants, the hiring teams 'unconcious biases' kick in. They turn applicants down for 'spider sense' things which are mere imaginary slights and nothing to do with the skillsets they require. This is not helpful for a diverse and healthy team. Face it: you do not have a spider sense, you have an unconcious bias.

You are going to make hiring mistakes that you won't even know about until 6-12 months down the line. This is reality. This is normal. There is nothing you can do about it except pick the best candidate at the time and see if it both works out for both parties.

Meanwhile, the software team is understaffed and having to work 120% because of this silly recruitment game, and more engineers are likely to quit.

And people who are applying are getting frustrated when they're seeing the same role readvertised after they apply.

Face it, you are looking for something that doesn't exist. You are looking for the mythical 'unicorn' developer, when what you need to do is to simply hire from the very decent candidate pool that you have available already.

</code>

#### 'DevTestOps and Jenkins'

<code>
---.

There is a lot involved with automating any complex test automation on Jenkins. It might seem easy at first, but the main problem is that, as the complexity of your Jenkins job grows, so does the difficulty maintaining it.

There are a few tips that have helped me.

* In the organisations I work in, we generally use a Jenkins agent running on some kind of cloud container, e.g. Google Cloud.
* Docker is used to contain the application, and if you haven't already, you want to make sure all your user-facing products are Dockerized wherever possible.
* You have lots of options with Jenkins in writing pipelines, but I would argue only a few scale. The first is that you should NEVER define your pipeline scripts on Jenkins itself. Infrastructure-as-code is the whole philosophy of DevOps, and if you're not doing that, then you will run into a lot of problems.
* With Jenkins you define your "pipelines" in a Jenkinsfile. These outline a number of steps you take, for example, spinning up the different parts of your application in Docker containers before running tests against them.
* Jenkinsfiles are written in a fairly uncommon language called Groovy. I recommend you use as little Groovy as possible in your Jenkinsfiles. It is a very weird language and one I have never personally got on with. The Jenkins implementation of it is not very good either.
* The problem with Jenkinsfiles is that you often have no way of testing whether they work until you start a run in Jenkins. Jenkins does supply a linter, which I highly suggest you use. There are several ways to enable it, but weirdly it sits on the Jenkins server itself and you remotely connect to it and pipe your Jenkinsfiles through to it, and it highlights any errors.
* If you are in DevOps, you will almost definitely know Bash. Bash is a horrible language too, but I really suggest you use it for your Jenkinsfiles. It makes it much easier to see what is going on in your infrastructure.
* If you are going to use Bash, I also highly recommend you use Shellcheck. You can enable Shellcheck on Github actions for each of your repositories containing bash scripts.
* I also recommend you use as little Bash in your Jenkinsfile as possible. The bash you put in there should merely be enough to checkout a larger library of bash files, and run them in each step.
* The reason for this is that Jenkins does some very weird things with inline shell scripts and quoting, and you want to stay away from putting any complex code in Jenkinsfiles if at all possible, because of the time cost in having to run Jenkins pipelines just to test your code.
* For each stage, you can import a bash script, and call a bash function that does everything necessary for this stage. With this approach, you can test the bash functions independently of Jenkins and you can even get clever and write them in TDD style if you wish, there are unit testing frameworks for Bash. You can also reduce a lot of duplication in your Jenkinsfile which makes it much easier to maintain.
* This speeds up development HUGELY as your Jenkins pipeline becomes more complex. No longer do you have to rerun the pipeline, or even replay stages, to test new amendments to your automation. You can just test them locally.
* I also recommend you setup a Github action to test the repository where your tests and Jenkinsfile are sitting. So, on every PR that is made to merge into the master/main for that repository, your Jenkins pipeline should be running your tests to make sure they all work whenever anything changes. Using your tests to test your tests. Sounds good right?
* Another thing is, always use set -e on the Bash scripts you're using for automation. I KNOW this is not perfect. I know there are some weird edgecases where set -e actually causes bugs. But it's the closest thing to error checking that Bash has, and you definitely need it for your Bash scripts in Jenkins, where a single mistake can cause you to have to wait for another 10+ minute run to complete. Also consider other Bash error trapping options, there are a few.
* Whenever there is an error in any Bash script in your Jenkins job, the job should terminate. That allows for quicker feedback that something needs to be changed before the pipeline will run.
* As parameters for your Jenkins jobs, you should always allow whoever is running your Jenkins job to specify parameters for each branch for any repositories that are involved in your Jenkins job.
* Whenever you change anything in a Jenkinsfile or update your tests, you should have an alternative "development" pipeline where can you test any changes necessary to be made on a branch, and feed that branch name as a parameter into the Jenkins job. That makes sure you don't disturb the 'live' Jenkins job which is probably in use.
* Ideally you should have a way of replicating the entire Jenkins job locally. For example, if your Jenkins job spins up docker containers containing your infrastructure, and then spins up a docker container containing Cypress, and runs Cypress against the full infrastructure for your company, then you should have a way of replicating this locally in a bash script.
* This makes it much easier and faster as you can develop locally. This is why Docker containers are so useful, and why every developer in your organisation needs a fast laptop running Linux and a good internet connection.
* Bonus points if you can combine the two together - your local bash script, and the bash scripts that are run in your Jenkins job. Then you remove another lot of duplication and increase reliability.
* Use replays for your Jenkins jobs wherever possible, and also use your local bash script, where you should be able to re-run certain 'stages' separate to the others.
* Use timers a lot in your bash script. Time every task, using the UNIX time system. This will allow you to try and optimise slow-running tasks. I also recommend you set a time limit target for your Jenkins jobs, so for example, tests run on merge to master through Jenkins only take 10 minutes maximum. You can reduce the number of tests that you run, as well as look to optimise some of the building of your applications, to aid this. Realistically you want to keep the average time of your jobs down as much as possible, not just for your users, but for effective maintenance.
* Always try and keep the versions of Jenkins, your test automation tool (such as Cypress) and any other major components at the latest stable version. This will ensure that your tests run as quickly as possible and as reliably as possible.

If you do all the above, then your Jenkins jobs will be much more maintainable and your time spent maintaining them much less of a headache.
</code>

#### 'How to hold Meetings - A strategy for remote work'

<code>
---.

Here is how I do meetings.

Do we need a meeting?
* Never, ever, have a meeting that can be fully resolved via a Slack conversation or an email.

Before the meeting:
* In the meeting invite briefly describe the problem and why it matters so people can decide whether to get involved and how to prioritise it.
* Set a time where everyone can make it. Never exclude anyone who wants to join.
* You may need to reach out to particular key people and convince them that the topic needs discussion in the first place, and that they need to be there.

During the meeting:
* Keep each meeting as brief as possible.
* Introduce the problem and recap why we are discussing it, and why it matters.
* Come up with a list of possible solutions to the problem.
* Jointly decide on a solution that people generally agree with.
* Ask if anyone has any thing else to add.
* Convert the chosen solution into action points.
* Have those action points assigned to different people, ideally through volunteering.
* Repeat the action points and who is going to do what before ending the meeting. Often this involves taking notes on what the action points are, and/or creating items that will be project-managed, such as JIRA tickets.
* End the meeting positively by expressing happiness that the problem is on the way to be resolved, and by thanking everyone there.

Discussion in the meeting
* Don't feel shy about taking the lead in meetings where there is no obvious other leader.
* The responsibility of whoever is leading the meeting is to guide the discussion to ultimately a solution of the problem, with action points. If you end a meeting without a solution and action points, you need another meeting. You want to really avoid this.
* Keep the conversation positive and respectful while not shying away from directly stating your point, even if it is a difficult point.
* When disagreements come up, try and be as objective as possible and debate the facts, independently from the person that you are disagreeing with.
* Not everyone has to agree with the final solution, including you. That is normal. But don't plunge ahead and gloss over major problems with the solution that you might not have previously considered.
* Let everyone contribute, valid points can come from anywhere and anyone, regardless of seniority, whether you agree with them, your personal feelings, your experience with the person, or your presumptions about them.
* Avoid going round and round in circles. If two people are having a disagreement and are simply restating points at each other, again and again, ask what other people think about their points, to reach a decision.
* People should be allowed to get on with other work while listening in to the meeting. They should keep listening so they have an overview of what is happening and that if their opinion is requested, they can give it.
* If lots of people are tuning out and getting on with other work, it is a sign that the meeting shouldn't have taken place in the first place, or at least those people tuning out shouldn't have been on the invite.
</code>

#### 'A Test Strategy for Microservices'

<code>
---.

---

There are two ways to test structured output data from microservices (such as in json or xml), and you should use both:

* Test 1 - Validate against a schema. This one is easy, plenty of tools to help you do that.
* Test 2 - Use a tool like BeautifulSoup or an XLST engine to put the response into a graph which is parsable with an XQuery statement which defines exactly the information you care about testing, AND NOTHING ELSE.

Using XQuery it is possible to assert on partial structual relationships between elements in a XML graph or JSON graph, so even if the whole rest of the structure changes, if your bit that you care about doesn't, it will identify that bit that you care about, and read the data.

Now here is the clever bit - what these test results tell you:

* If Test 1 fails, there is probably an update to the data service that is providing you data. You want to know about this.
* If Test 2 fails, your data isn't present in the data service.
* If Test 1 fails and Test 2 passes, there has been an update to the data service that is providing your service data - BUT THEY HAVE RESPECTED THE BIT YOU CARE ABOUT. You probably need to get the new schema and upgrade your parsing code in your own microservice.
* If Test 1 passes and Test 2 fails - the data bits you are looking for aren't there but there has been no update to the structure of the data. Possibly there is a data problem with the query you're requesting.
* If Test 1 passes and Test 2 passes - No update, data still there, no problem, all good.
* If Test 1 fails and Test 2 fails - Likely there has been an update to the service that is feeding you data, AND THEY HAVEN'T RESPECTED THE BIT YOU CARE ABOUT. Major not good!

</code>

#### 'Skills Needed to Suitably Excel as a Software Engineer'

<code>
---.

Skills Needed to Sustainably Excel as a Software Engineer

It is my experience that the knowledge and skills you will need as a software engineer who is an individual technical contributor, can be categorised in these areas:

* Personal Efficiency and Productivity
* Technical Knowledge
* Business and Domain Knowledge
* People Skills and Communication Skills

Personal Efficiency and Productivity

It is a sad fact of software development that, more often than not, you will be judged on your speed of completing development features, not the quality of the code you produce, or the long term effect on the product it will have.

So you have got to work on your productivity and efficiency in your job role, because of two things:

* You need to be able to develop and ship code fast in most software organisations anyway.
* You need to be able to develop and ship code FASTER than the normal expectations, because you will (as a responsible and knowledgable software engineer) take extra time to make sure the quality of your contributions is as high as you can get it NO MATTER WHAT pressures project management will put you under.

Lots of lazy software developers go down the 'short cut' route of just getting features developed as fast as possible. This can get them far, but it is a fundamentally unethical and ignorant approach, contrary to the craft of technical excellence you should be pursuing as a software developer, and the beneficial long-term effects it has on software products.

To improve technical efficiency/productivity there are many skills you can improve, including:

* Knowing your own personal software development environment inside out, and making it as efficient for you as possible.
* Eating well, sleeping well, exercising well, keeping good physical health, optimising for a sedentary job where you will need to be at your most mentally alert for the rest of your career.
* Working on resilience and your mental health to a level where you can consistently and sustainably deliver.
* Find a strong drive and self-motivation to do what you do. This doesn't necessarily have to come from the job itself, it can come from the pressures of supporting a large family, for example.
* Work on self-discipline.
* Practising code katas, so you are familiar with your chosen technology stacks and languages and implementing solutions fast.
* Make sure you don't waste time during the day and work hard and efficiently for your contracted work hours, and don't do overtime, and then take time to RELAX after work. Overtime is unsustainable and is the sign of a bad organisation.

Some efficiency skills will also be covered under 'people skills' and 'technical knowledge'. If you have good people skills and good relationships in your organisation, then it is much easier to get things done quicker. If you have great technical knowledge and experience, you will implement things faster and more accurately.

Technical Knowledge

Some people would say that the other categories are more important than technical knowledge. It is undoubtedly true that you will encounter many people in your software engineering career who excel at the other categories and are not strong in their technical knowledge. They often occupy the highest ranks in an organisation and are paid the highest.

But it's not all about money or ladder-climbing. I would say, software engineers first and foremost need to be technical specialists and experts. Of course the other areas are important, but if software engineers are not the technical experts in modern day society, who exactly is supposed to be?

* Learn how to teach yourself anything (or nearly anything). This is the most important skill you can have a knowledge worker. Read books on learning how to learn, develop an effective note-taking and knowledge retention strategy, and implement what you have learned in personal projects and your career.
* Read a lot of technical books. More or less ALL the most important ideas in software engineering, computer science and many other subjects have been concentrated and expressed the best in books. It takes a substantial amount of effort to write a book, and the market is very competitive, and they are peer reviewed heavily, by experts, so the standards are very high. Most books out there are simply not worth your time, but the 5% that are, represent an incredibly good value way of learning the absolute best thinking out there, in your career.
* Study relevant theoretical academic subjects such as Computer Science, Electronic Engineering, Maths and Artificial Intelligence. Having a good educational foundation in these subjects is invaluable, although very difficult to get. Even if you had no formal education, you can make up for it by reading the right books on the subject, and practising what you've learned.
* Personal/toy projects are invaluable in implementing and assimilating the theoretical knowledge that you have read. If you don't have a personal project that you spend your spare time doing, get one now. It is very important to find something that you love that will also teach you a lot about your skill set. Always have a side-project going throughout your career, not focused on making money necessarily, but just having fun developing software and improving your technical skills. Make sure it is fun and keeps on being fun.
* Try teaching or mentoring as a way to improve your own knowledge and improve your communication and people skills. The best way to become an expert at something is to learn to teach it, because if you strive to do it well, you will become painfully aware of how little you know, and how much there is to know.

Business and Domain Knowledge

It is a fact of working for an organisation or business, that the more you understand about the business and its objectives, and the more you contribute to those objectives, the better you will do at that organisation.

Someone who writes a 3 line badly written batch file that solves a critical problem that business has, will be a hero, whereas the developer spending a long time and a lot of effort crafting a brilliant technical solution for a problem that the business does not value, will not do well in the organisation.

This area also covers the knowledge of how the business works and how and why the software systems it uses are set up to meet those needs.

I often think that as software engineers, we are often not given access to the meetings and learn the decisions that determine a lot of the business objectives and practices, and we are not sufficiently educated, especially in large organisations, how we can add the best value to the business, which may sometimes not be included in, or even run counter to, what we are told to do by our immediate management!

A lot of engineer types shy away from the business knowledge and are uninterested in developing their knowledge and domain knowledge. They just want to be told what to do. That is fine, but it will reduce the impact you can have on the success of the business, and how people will see you in that particular organisation. It will also reduce the autonomy and freedom you are given.

People and Communication Skills

People and communication skills are going to be key to your career and your effectiveness within it. Gone are the days when an anti-social engineer was locked in a basement for years and eventually emerges with a brilliant technical solution that changes the world.

I know that often engineers would prefer that was the case, but it is questionable whether that was ever really the case, or was just imagined or stereotyped as such.

Even in academia and research on the cutting edge technical problems of our time, your people skills will make you much more effective. What makes professors effective? It is the combination of their technical knowledge and research, BUT ALSO their ability to communicate it and teach it. Not to mention the extremely competitive and often nepotistic cut-throat academic arena demands good people skills to succeed in.

It might be possible to progress with bad people skills, but it's going to be 100x as difficult. And overwhelmingly the statistical chances are, if you are reading this, then you are not good enough technically to succeed with bad people skills.

</code>

#### 'Training Resources for Software Engineers in Test/QA Engineers'

<code>
---.

This is an heavily opinionated guide to what I personally think is important for new SDETs/QA Engineers to learn and know. I have spent 17 years in the software industry, and have experience in nearly all areas of software engineering, including a large number of years as a 'pure' developer, several years experience as an exploratory tester, several years experience in devops, and experience managing testing teams and defining test strategies.

I have seen a huge amount of change in the area of QA, and read up on and considered a lot of the different arguments of what QA engineers should do, including the 'testers shouldn't code', 'developers shouldn't test' movement, the devops movement, waterfall testing, the Agile movement, the BDD and TDD movements, shift-left testing, the rise and then fall of the SDET role, and its resurgence in demand today.

This is not to say that this guide would not be controversial to how a lot of people see the skillsets required, including many 'industry experts'. There is rarely 100% agreement on ANY topic in the software engineering world.

However, when looking at the current (June 2022) job descriptions for 'QA Engineers', this guide is meant to help address the skillset gap in what the majority of employers want in this role.

This is not meant to be 'gate-keeping' or scare people away, at all. I want as many competent QA Engineers in the industry as possible. It's just a summary of the skills you will have to learn if you want to do well in the current market. It IS possible to learn a lot of these skills on the job, and some employers will offer training, or at least leeway and space to get your head around some of these things. Some will definitely not, however.

With that said..

Rationale

I firmly believe that new QA engineers are going to have to learn how to code, and code very well. Gone are the days where they can just be business analysts/QA analysts/exploratory testers. Although they will need that skillset too. It is a very harsh market out there and there are lots to learn.

I think the ideal starting QA Engineer will know at least a bit about:

* Fundamental computing skills and software engineering skills
* Exploratory testing
* Test design and planning and documentation
* Software development (to as equal standard to a 'normal' software engineer as possible!!)
* DevOps - scripting/virtualisation and containers/CI/automation/developer environment customisation
* Communication, soft skills and teamworking skills

This is a LOT of information to learn I know, but is why QA Engineers skilled in these areas are commanding higher market values than 'standard' software engineers right now. I would argue that QA Engineers require a MORE varied and technical skillset than starting software engineers, whereas before they were seen as 'not as technical as software engineers'. This change from the way things were in the past is difficult to get your head around, I'm sure, but that's the way I see it.

The closer you can get to knowing these skillsets, the better off you are in today's demanding market. This document is a collection of resources and advice to help you grow in these areas.

Study Skills and Learning to Learn

* This guide is assuming that you are coming from a graduate perspective, ideally from a computing subject, ideally from a good university. In your technical career, your success will be defined by the speed you can teach yourself new technical concepts.

* A computing degree from a demanding university DOES teach you to learn technical information fast. It also teaches you good study skills. If you are NOT coming from a graduate perspective, it really is worth investing some time in developing your study skills, your reading speed and comprehension, your ability to filter a lot of the useless information on the internet and locate the good stuff, and the experience and confidence to do this fast and as a routine part of your day.

* Everyone learns differently. It is important to find out the style of learning that personally works best for you. For me, having come from an academic background and a fan of books, technical books are the best and cheapest way I have found of learning new concepts. Combined with taking good notes, creating side-projects and actually implementing what you learn, this is the system that works best for me.

* But it might not for you. So take some time to figure out what type of learning method works for you. For some people, online text based courses really help. For others, YouTube videos. Some people simply don't really learn very well on their own and should seek a mentor to pair program with. It is very important to learn how you learn best, because although the information you need to know won't change, the style you best absorb it is completely individual to you.

Resources for the Skills Required of a QA Engineer

Fundamental Computing Skill and Software Engineering skills

Prior Training

* There are things that a computing degree will teach you that you can definitely learn yourself, in your own time. But you are going to have to learn them one way or another. Things like basic programming, how computers work, concurrency, how databases work, how the web works, technical communication skills including writing and presenting information, the basics of complexity theory etc etc.

* Some people will swear that you don't need those skills to get into computing. Well, you may well find roles that will allow you to start without knowing these things. But as you progress in your technical career then you will find yourself learning these things, on the job, via trial and error. And that is not always a fun situation to be in.

* So if you have a choice, and not everyone does of course, then I really recommend you go through some kind of prior training. If you cannot take a full computing course, then some bootcamps are good at teaching the basics you need to know. There are more free options than ever with MOOCs being very popular. You just need time and discipline to go through them.

* But of course, any degree, course or bootcamp will not teach you everything. Never assume that. You're going to have to learn a LOT more than that.


MIT's "The Missing Semester" Course

* Once you have done your prior training from a course or bootcamp, I really recommend this following course. MIT might be a scary name for some, but this course really is excellent, and contains a LOT of information I really wished I had learned earlier in my career. Take it at your own pace.

There are no time constraints to this course so you can take it in the evenings while working, but there are so many essential skills here that you will have to learn sooner or later, so it might as well be sooner.

https://missing.csail.mit.edu/
ISTQB 'Fundementals' Course

* Although the true usefulness of ISTQB's Fundementals testing course has been debated for a long while, it is worth getting on your CV simply because a lot of job descriptions of QA roles require it.

* The syllabus changes all the time, but when I took the course in 2019, it seemed to be a good introduction to a lot of the more traditional QA/exploratory testing skills, with some useful information on communication and soft skills.

* However it did not cover many software development technical subjects at all, which I think has become increasingly important for any QA Engineer to know. There are seperate specialist 'test automation' ISTQB courses but I haven't been on any of those so cannot comment.

* Often employers will consider sending you on this course for professional development, so definitely push for it and go for it if they do, if only for the value of it on your CV/resume.

Exploratory testing

* Exploratory testing remains a hugely important skill for any QA engineer. The more exploratory testing you do, the better your attention to detail will become, and the better your understanding of where bugs and problems in software development arise from, and how to get a sense of where bugs might be hiding.
* I would argue that you shouldn't see exploratory testing as just something that you do on the graphical user interface to a product. You should look at the product through any interface that the user of the product uses. So for example, if the product is a C++ compiler, then you should exploratory test using the command line C++ interface.
* Software teams are only human, so often you will find that bugs come from problems in communication in the software development process, for example, misunderstood or miscommunicated requirements. Also you will find that the pressure modern software teams are under to release software as fast as possible contributes to cutting corners, and you should highlight this whenever it happens (and it WILL happen). You will also see new, untrained or experienced but overloaded software engineers being given too high expectations and be forced to work on risky areas they really shouldn't be working on, and not being given enough time to do a good job. You will learn to expect bugs when these process problems occur and know where to focus your testing for maximising quality.
* You will learn to prioritise areas of the product which offer the highest potential risk to the organisation if bugs were found there. This is called risk-based testing. For example, if you only have a limited amount of time to test a feature, and it includes changes to the payment system which the organisation gets most of its revenue from, and also some UI layout changes, then where should you focus your efforts on? The payment system of course. This is a trivial example, but there will be much more complex situations you will be in too. You are usually given much-less-than-ideal time frames to conduct your exploratory testing, so the general skill of prioritisation is very important.
* Part of exploratory testing is the skill in writing up the bugs to contain as much useful information as possible to get them prioritised and fixed. This includes being able to replicate them exactly on the different test environments and having a basic understanding of how the code you are testing gets pulled into each release that gets used by the users of your product. Without that understanding you may not produce useful bug reports. The more information you can give the developers to fix bugs quicker, the happier they will be.
* The more time you spend exploratory testing and finding bugs, the greater your understanding of the products you work on, becomes. As a QA engineer, you are often expected to be the subject matter expert on the product from a users perspective. The more exploratory testing and hands-on experience interacting with the product you can do, the more that will be the case. And when you have learned numerous products like this, the faster learning new products will become.
* You will find it incredibly difficult trying to design effective automated tests without the knowledge of the product, and without the insight into testing that working in exploratory testing will give you. So there is no way to skip this fundamental skill.

</code>

#### 'On Books and Reading'

<code>
---.

Why Books Are Still Relevant

I spent so much of my childhood and early adulthood reading, before the web became omnipresent, but I got back into reading books - in a serious way - about 5 years ago.

Since then, I have read dozens and dozens of books, and they really have enriched my whole life, not just my career.

It is impossible to get an expert understanding of almost any subject without reading at least a few good books about it.

Contrary to what you might think, books never have gone away in the digital age, just our patience, concentration span, and capacity to learn their contents.

Even the most popular and insightful online articles on a new idea are frequently based on third-hand interpretations of the leading research papers and books on the particular subject.

I prefer physical books because it is good idea to get away from the screen, but I also have a Kindle, a Kobo e-reader and a small tablet with e-reader apps for colour comics/graphic novels.

There is so much untapped wisdom, knowledge and entertainment in books, and if you are overlooking the importance of reading, you really are missing out.

Reading books in your spare time improves the speed of which you can read online content too, so if you spend your work days reading online webpages, then the more practice you have, the faster and more accurately you can read, and if you practice note-taking too, the better your notes.

They also improve your ability to write, communicate, reduce your stress levels (if you read fiction), and improve your imagination and vocabulary.

Not to mention that women love books, a high percentage of book readers are female, so if you are a single man, I would say it is seen as a desirable characteristic, and quite a rare one these days!
Make Notes

When reading non-fiction (or complex fiction), make notes on books. Underline, highlight, write in the margins, make online notes.. the more notes you make, the better your understanding will be of what you're reading.

My dad who worked as a university lecturer and is officially a 'super smart person', and who has read books voraciously throughout his life, recommends putting an A5 sheet of paper with a handwritten summary of the previous chapter in the book at the end of each chapter. That way you can quickly go back years later and get the understanding that you had when reading the book fresh the first time.
Read Selectively

With non-fiction you usually don't have to read the WHOLE book to get a good idea of its contents. Remember being in university and given a 20 book reading list for every course? Did anyone expect you to read ALL of those books cover-to-cover? Of course not, that wasn't even possible.

Read selectively and combine scanning through a text with detailed reading of parts, and making notes.

If you never went to university, or it has been a while since you did some proper study-type reading, there are books on that!

Personally I recommend the Open University Humanities Study Guide as an excellent and approachable reference to the different styles of reading you can do, and how to make good notes. There is also the Open University STEM Study Guide but I find the Humanities one has better reading and note-taking advice which is applicable to all reading, but it is worth picking both up.

Getting Books for Cheap

You don't have to buy all your physical books new!! Often you can get a huge discount by buying them second-hand, via Amazon or elsewhere. Some popular books, such as university textbooks and classic literature, can be bought for only £2, and the quality is good! A lot of ebooks can be found online for free. Imagine that kind of value for money, either in entertainment time, or amount learned, occurring anywhere else in this modern world?!
Bookshops and Libraries

I love bookshops and libraries.

Libraries are fast becoming a thing of the past in the UK, sadly, with very old books on the shelves and very little funding for new books. However if you find a good one, the books are free! A lot of libraries these days also have online ebook collections which you can 'borrow' in the same way as physical books - i.e. for free.

Bookshops are just great to soak in the excitement and enthusiasm of new books, particularly fiction, to read books before you buy them, and to sniff that wonderful 'new book' smell without even having to buy a new book!
Write and Read Reviews

Finally, I really recommend writing reviews of your books and reading others reviews, as a way of discovering more books, sharing your experiences, and summarising what you've learned.

Goodreads.com is my favourite review site, it's one of the most extensive.

Summary

To paraphrase George R. R. Martin - "That's what I do. I read books, and I know things."
</code>

### Poetry

#### 'Snowflakes'

```
Silence is a different mind
In crowds with noise and shouts
and people
who never knew what they might find
if still with thought, they stopped
and wondered.

Does your mind have hidden stairs?
With words to climb, and towers present
If you noticed, let me know,
for words are almost too
like whispers.

In dancing, do you leave yourself?
And go towards, another person
Things in beauty are flights in freedom
And nothing's true if all's forgotten.
```

#### 'Avalanche'

```
Beneath the twin peaks, you were born.
on a crisp morning when everything was white.

I never knew you as a child.
Leaping over rocks and playing on the fields.

Silently you grew, and many did not see it
until you were strong, and pure, and racing.

The valleys deep, they never knew your name
as you muttered them softness and brought them blankets.

The trees did not stop you, they couldn't, they wouldn't.
You washed them over, and took them with you.

Falling like a blizzard on a bright summer morning,
you tripped, then stumbled, and fell all around us.

You never thought what damage you caused
until you were still and silent, as now. And over.
```

#### 'Benefit Cheat'

```
The truth of the matter is: I didn't read the terms.
I didn't stop for a second, I had other concerns.
The truth of the matter is: I never knew her name.
It wasn't important to me; they read all the same.

The truth of the matter is: She wasn't very well.
How long did she suffer for? Well, who can tell?
The truth of the matter is: You reap what you sow.
And if you're poor in this society, then to work you should go.

The truth of the matter is: I don't know how she died.
But she could have worked, and she shouldn't have lied.
The truth of the matter is: everyone is treated the same.
And if it's not fair on you, then it's not me to blame.

I never was there, I never knew how
this lack of guilt would catch me somehow
and here I am now in this cold empty room
this noose right in front of me
(which we'll get to soon)
It wasn't me who sentenced all these people to death
(his lack of concern shows to his last breath)

but I never did anything
this is not meant to be
you can't prove anything
NO! SOMEBODY HELP ME!
```

#### 'Ultava by Smetana'

```
Stream
Slowly Trickling,
Creeping along,
The river is born.

Storm
Grim clouds
Lightning strikes
Thunder rolling
Rain pouring, gushing.

Fort
Huge gate
Proud turrets
Dark and dank moat
Grimancing through rain.

End
Dead calm
Sea in sight
A sense of joy . . .

The river is free!
```


