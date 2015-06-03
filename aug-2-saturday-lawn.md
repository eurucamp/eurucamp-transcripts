---
title: Panel discussion
speaker: Various
---

Welcome to Saturday evening panel discussion on the lawn.

Ben: Hello! It's great to be here, it's great to be outside, I've
never spoken outside before, actually no, I have spoken outside
before, but I've not spoken on a stage outside before, so I'm looking
around here.  I can see a couple of sofas just like my living room at
home, without the couple of hundred of Rubyists sitting there, which
would be kind of strange, so today, this evening, we're going to talk
about good design, and by that, I mean good design with regards to
software engineering, not visual design. I don't know anything about,
that probably wouldn't be qualified to speak about that. I'm go
introduce myself first and then I'm going to give your lovely panel
I.R.S. the opportunity to introduce themselves as well and then we'll
jump straight in, I'm Ben Lovel, some of you may have seen me before,
the misfortunate ones.  I work for a small digital agency just outside
of London called one minus one I've got a bunch of experience, I've
worked for a whole bunch of different companies, I've worked for
profit, BBC, Prime Ministers office, and I've shipped, I've seen some
terrible code, mostly my own, I've seen some good code, and, yeah, you
know, I won't talk for too long, I'll just pass you along to the
panelist, so

Konstantin: ...  I'm here, I have no idea who thought it would be a
good idea to give me a microphone, I work for Travis CI (Whooa !) And
I'm involved in certain open source projects that you might know or
not. Whatever I've seen some terrible code and mostly Ben's (Laughing)
no, actually he doesn't usually show it to me. I'm going to pass it on
to Austin.

Austin: I'm a freelance accessibility consultant, I work in
RubyMotion, and I do a lot of accessibility testing as well.

Okay, thank you, Austin.

Joanne: The logistics of this are going to be interesting. Hi any name
is Joanne Cheng, I'm from Denver, Colorado.

Yeah, Denver.

There's one person who lived in Denver here.

Two.

Joanne: And I worked for Thoughtbot, we have an office in Denver as
well as many other locations around the US and around the world.  I
work mostly as a consultant, but I've worked on product teams before,
and good design is a little bit different in both context. So, of ...

Phil: Hi, I'm Phil from New Zealand.

Hi Phil. New Zealand! I haven't spent much time will recently, I've
been traveling with my wife through North America and Europe, and I
run a company called Manuka coalition, and it's mainly Ruby
consulting.

Blythe: Hello, my name is Blythe Rocher, I live in Oakland,
California. Whooa. (Yeah, Oakland – yeah, oak town !) Yeah – I work
for a company called Big Nerd Ranch, based in Atlanta, Georgia. So I
work remotely, obviously, we do a couple of things: I predominantly do
consulting, so, I've seen some rescue projects, I've seen some green
field projects, so, yeah ... there's been some bad code in there,
couple of times. But, yeah.

Ben: Great, thanks, okay, so, we're go start off if discussion today
by asking is TDD dead?  (Laughing) no, I'm just joking.

No, you're not.

No, I am joking, seriously. So, no, I'm going to start by talking
about change, I think, so, it's a bit of a story, so, you're just
about to start a new project and it's like your first born when you
row news something, because not using row is an antipattern, you row
your project and everything's brand new, you have a blank slate of
which to use your craft, and, in those early days, while you're
working on a project, okayish everything's moving really fast, and the
cost of change is really small. You're building features really
quickly and then it starts to slow down a bit. And this doesn't just
happen to row, it's not like a kind of panel to troll row, we can
trollish nutrias well. It starts to slow down a bit, the cost of
change creeps in, and, you know, you start to cut corners, and then
you end up with this big behemoth monolithic application, right, this
is kind of the – how do you say, this is the – this is what you
generally end up with. So, the cost of change and making software
accommodate change is a really important thing, in my opinion, and one
of the kind of real driving factor in the decisions I make when
designing software, so, I'm going to turn to Blythe, and ask a
question, so, and to the rest of the panelist as well. So are there
any kind of characteristics in software that you develop or you've
experienced in you're, developing software that really stand out that
help you write software that's easy to change, easy to modify?

Blythe: Well, I think if you can sort of encapsulate and isolate
things, obviously that's a way to make things easy to change. If you
separate things so they're not dependent on each other.  I mean,
everybody sort of heard these things, probably, but I think those are
definitely, you need to keep following those rules to make your
application easy to change in the future, still.

Okay. Phil, you have any opinions on that.

Phil: Tests, yeah, tests, it had to be said. But, yeah, honestly, I
come into a lot of projects where they're several years old, or even
brand new and if they don't have tests then the cost of doing anything
is gone up dramatically already, and if they do have tests, it's way
more likely when I'm done it still works exactly the same, the code is
just a lot better.

Ben: Are there any particular type of tests or any kind of testing
methods that you favor?

I like really broad integration tests because you can see the entire
system and how it should work, not just like one little bit, so you
can really delve in, you can refactor one part and think you didn't
touch anything, but test comes in and say, oh, this breaks a couple of
things, those there most high value ones for me. Konstantin, got any
opinions?

Konstantin: Nah ... yeah, tests are good (laughing) I actually think –
oh, how to best say this, another thing that I find very, very
available when you design software to be easily changeable is strong
outer abstractions allow weak inner abstractions, so, say, you have a
distributive App with a clearly defined interface between the separate
apps, and the responsibilities are clear then you can write the most
crappy code and in the App itself and can just replace it with
something else easily and that is actually one of the pleasures of
working with disobeytive apps, which is otherwise sometimes quite a
painful experience (Distributive) so, I think, I think this has a lot
– this goes actually a lot with integration tests, I think testing can
also, depending on you do it, testing can make it hard to change
stuff.  I had this in a few projects, a few things you change one
small thing because you intentionally change how it behaves, and then
you spend three days rewriting hundreds of tests to accommodate that
change.

Ben: Yeah, I see. I was just going to say I've seen that before, as
many of you have. Joanne, have you got any opinions.

Joanne: Nothing that hasn't really been said. It's just kind of the

Ben: Yeah, so, Austin?

Austin: Yeah, okay, testing and refactoring and all that is important,
a little rule of thumb I like the keep in mind, I don't go more than
three levels deep if blocks, iterative, if you go more than three
levels deep, that's a good sign you should refactor that inner
code. It's a little rule.

Ben: Okay, thanks. So, going to kind of turn the attention towards
teams, and team dynamics and how teams can affect the design good or
bad of software. And I ask somebody earlier, I think et was
Konstantin, it was a quote or maybe a study, not good on my facts
today, so if you'll excuse me, I'm sure one of you will know. There
was either a quote or study that kind of Posited the structure of
software on a kind of micro level, actually mirrors the organize
organizational structure of people that worked ‑‑

Conway's law, okay, brilliant, so it's an Epotomious law of software,
I've been trying to create my own law of software, but nothing's stuck
yet. So, turning back to the panel, is there any particular team
dynamic or structure of teams that you've worked in that have lent
themselves more to good design or bad design?  I'm going to ask
Konstantin works in what you call a wide team, right, you kind of
don't tend to work together all of time, you work remotely, and of
course he's always flying around the world. Amazing us with his wit
and intellect. He wants to grab the mic and defend himself.

Konstantin: Yeah, so teams suck (Laughing) working with other people
is horrible. (Laughing) No, actually I love our team. But, that
doesn't mean we have it figured out. We oar right now actually
changing on how we work as a team. From everyone works on like – we
had big focus problems, that's not actually the architecture thing. Of
course our team is strongly reflected in our architecture, you know
which people work on certain projects. And we try to fight that by
shifting people around: Ice also not because of the code struck – it's
also not because of the code structure, but because of the bus factor,
which has a lot do with design, but maintainability – not really with
design, but maintainability.  I have an interesting story, I told this
earlier.  I used to go to university here, and one thing they did is
to teach us agile methodology as we worked as AD students on a single
Rails project with a Scrum, and most of us didn't know any Rails or
Ruby, I was one of the few who did. Our team was working on, oh, I
don't know, authorization maybe, I'd say, something like that, and we
did some magic that hacked into ever model basically so it was
automatically in will because people would forget to talk our APIs, so
we were on ever backtrace, and offed people put blame always based on
backtrace, so the last few – the last few lines in the backtrace are
coming from code that your team is working on, so this exception is
your responsibility. And this was a throw away project anyway. So,
what I did is I monkey patched exception to filter out (Laughing) any
stack frames that were going through our team's code. (Applause)

Ben: Job done! Fantastic (Applause) so, I'm going to ask Phil, I'm
going to turn to Phil and say, the kind of the – I'm going to ask you
the opposite question, are there any kind of team structures, I know
you do a lot of consulting, you work with different teams, different
companies, organizations around the world and do a lot of remote
stuff, are there any team structures or kind of team dynamics that
you've worked under or with or within encouraged good design?

Phil: I thought you were going to ask me bad design. Well, either,
either or.

The teams that have encouraged good design is with a clear decision
maker involved somewhere, like there's someone in charge of saying
what is or isn't going to happen like when there's a dispute over what
should happen. And within that, I think small teams, mostly comprise
with peers, but not always peering as well I've seen with the best
design, just always having someone else to talk to about, hey, is this
thing done really, really stupid or something like that.

Ben: Yeah. So, Joanne, do you have any opinions?  Do you work mostly,
you pair a lot.

Joanne: We pair a good amount, it varies from project to
project. Pairing, we do have constant code reviews, that's part of our
policy for all of our internal projects and all of our client projects
we do a lot of, we do code reviews for pretty much everything.

Ben: Is that the pull request workflows?

Joanne: Yes. Usually when we can't get someone on our client project
to look at our pull request, we'll ping anyone else from any other
office to look at our code, and it's great because – it's great
because I through pull requests and comments and being aware of what
everyone else is doing, I think encourages good design, and encourages
consistent design and consistency, which I think is a very key part of
good design.

Ben: Definitely. Austin, do you have if I opinions?

Austin: Yeah, I wanted to play off what fill was saying how the best
teams have an essential decision maker. People sometimes will ask me
about Android accessibility. And when you compare iOS and Android
accessibility, when you compare Voice‑Over and talk back, it's a few
years behind, it's just not as there: It doesn't give a seamless
experience, going back to con way's law – software is as good as the
team that created it. Apple the decision maker for their accessibility
department, Google is much more fragmented, and you see that when you
compare the two screen readers, it's interesting.

Konstantin?

Konstantin: Which might relate to this, yeah, I'm talking again. Yeah,
great, one clap. So, I might have dement this, but I think there was a
study – Dreamt this, I think there was a study, I think it was
conducted by Microsoft with Microsoft, which is a very large
corporation, it might have been some other company, I hope no one sues
me. Very large corporation where teams all work very differently
looking at which teaches are most productive, and produce the best
quality. And there were a lot of assumptions on things like team
sizes, large teams and small teams, turns out team size has some
effect but team size doesn't matter as much, what matters is
responsibility for the developers that write the code or actually
higher keep depth, which makes sense, so the developers write the
code, how far away are they from actually being annoyed by the code
not working or being happy about the code working really well.

Okay, so Blythe, what kind of teams do you work in do you work in
small, large teams or remotely.

Blythe: I work full time remote. We have for at Big Nerd Ranch, most
of the people live in Atlanta, but we have a good per season tang of
remote workers. So we are doing the same thing (Percentage) with the
code review. We have a code review rotation, so we're always seeing
other projects, so, the whole backend team sees everyone, what
everyone else is working on. We also typically use a pull request
workflow. So you know, you submit a pull request, and a couple of
other people will take a look at it before it gets merged, I think
that helps a lot. And it allows it to be sort of asynchronous for the
distributed team. We do pairing, not a hundred percent or anything
like that, but we do pairing whenever we need. And to go on what Phil
was saying, to have some sort of authority for what is good design, I
worked on some projects where there's not, there's not one owner but
maybe several owners, and I think it's difficult to get – to ever ship
anything, sometimes, because there are differing opinions about what
is good design. And so, I think that is actually really important, I
agree.

Ben. . So, how about code metrics?  So how good an indicator do you
think the code metricse tricks such as the obvious ones, like code
coverage and test lines of code to actual lines of code, and how much
of a benchmark do you feel that is, or an indicator of good quality,
good design or not. Of

Blythe: I think over all, yes, of course, it's a great indicator, if
you're looking at a Repo that has a 2.0 vs one with a 4.0, you know,
but, I think, when you're starting to get down in the 0.1 scale, I
think at that point, it's less a direct relationship. Okay, I in the
change and the score went down 0.1 points, was that a worse change?  I
don't think so sometimes.

Ben: Do any of you have any kind of enforced thresholds that you can't
kind of drop below? Or is there anyone – are any one of us working in
teams like that?  No, okay. Does anyone have any opinions about map
metrics and code engineering?  Konstantin?  Austin? Any opinions about
metrics.

No, no.

Konstantin: I'm talking again, I think it varies by project.  I
generally think 95 percent code coverage – no, (Laughing) so, and that
actually also depends not just on the project, but so, if you for
instance write a style that we try the use at Travis-CI we have a lot
in the library style, and then you have Apps that are very small,
those apps for instance can have the most horrible, horrible metrics
you want to have, or you can have, or whatever. And then also, open
source project it varies a lot, I tend to set different goals, so
... I have one project that has a 0.0 score and has to stay at this
score and I have another project that has a 4.0 score, it has to stay
at that score. That's the rule, if your pool request changes that,
it's denied.

Ben: Wow, Konstantin that sets code climate on fire, pretty regularly
by the sounds of it. So going to ask, for instance typical code base,
when you come into a project, let's just say you come into a project
halfway down the line, and, you know, kind of things are bad and
there's a bunch of smells in there, there's a duplication
everywhere. Are there any kind of like, what other kind of top level
techniques that you get into straight away, like what are those
techniques that you use, first of all to identify where the really
sore points are the points that may be difficult to change or don't
have safety net of test or good coverage?  And are there any kind of
techniques that you can use or you can share with anybody here today
to try and remedy, remedy those kind of problems in a code base. It's
a fairly open question, but ... going to pass it to Joanne.

Joanne: So, usually what happens I'm in a code base that I'm, you
know, the quality is not – not ideal, I usually start with a task I
need to do, so I'll work in that part of the code base and wherever I
am, I try to just clean it up to what I think it is, so I have like
little areas of nice code. Occasionally, there are times when I need
to touch something small and like another part of the code base and
it's, you know, it ends up, I see something where if I just take maybe
a couple hours to refactor something I know it's going to be easier to
change down the line, and of course I make sure everything has good
test coverage that I'm covering, and, that I'm working in, and that's,
I think also really important, so it's easier to change down the
line. Yeah, that's what I keep in mind.

Ben: Sure, okay. So Austin wanted to ask you what kind of testing and
what kind of techniques do you employ in the software that you create
to ensure kind of good design.

Austin: Well, RubyMotion has rspec, a clone of rspec, so I use that a
lot. And, I try to do, I really try to do the test driven development,
you know, writing tests, watch them fail, to make sure they work, and
then make them pass.

Ben: So obviously the RubyMotion tests tend to be kind of slow, right,
so there any way or any techniques that you use or employ to kind of,
you know, how do you get the most value out of testing given that
those test are potentially quite slow to run?

Oh, the most value out of them?

What are the things really, so, if I just give you an example, so,
sometimes if you're developing round applications there's certain
types of test that give you a lot of value, so things that integrate
potentially, components tall way down to the day the base, all the way
back up to the browser, you know, we write tests for those and we use
headless browser technology and stuff, and they're really, really
slow, but they're actually really quite available. My experience, with
RubyMotion that testing is really slow, and they tend to be those kind
of small integration style testing – tests. And they're quite
slow. So, I guess what I'm asking, is there any kind of particular
feature, if you're working on a feature if an application, are there
any things that you know that you need to test more thoroughly than
others?

Lower level stuffs, yeah, I would say, the lower level, that needs to
be tested because it's being used by so much other stuff.

Ben: Cool. So, I'm going to pass to Blythe. Similar question to you,
actually. Don't know what kind of applications you tend to work on
most, browser applications like most of us here. Any kind of of where
do you think the most value is in testing in round applications and
actually, I guess the kind of business concerns of those applications
as well, is there anything you really need make sure that you test
that you make sure that you're reaching your benchmark for good
design?

Blythe: Well, I'm mostly developing for clients, so, I really always
want to be writing feature tests, so is the application doing the
things that they want it to be doing?  So integration type feature
tests. Those are the first primary tests that I would write. Also, any
sort of complicated logic or maybe calculations that are happening or
anything that's important, maybe deals with money. (Laughs) put some
tests on that, you know, you'll sleep easier.

Phil, any opinions?

Phil:

Ben: I know you said you favor more integration style test, but as we
said ‑‑

Phil: Just because they're like quick win test, a whole lot at
once. Not above what's been said, yelly. Sure.

Ben: Okay, so, good design, so going to try to cover some of the
points, well, some of the panelist would consider or actual things and
of patterns and practices and processes and what have you that I've
seen in the projects that they have worked on, kind of real, yeah,
this feels good, this is a good project to work on, like would that be
perhaps, again, touching back on the team structure, the structure of
the code on a kind of more micro level or even on a macro level. Are
there any kind of things that you can, you know, kind of quick
benchmarks that you look at an application and say, yeah, this is like
a really nice piece of software and this is going to be a joy to work
on, any one of you, perhaps, Joanne?

Joanne: I mean 6 good organized tests, I mean, that's kind of a
given. Also, looking at, like just thinking of Rails projects, just
because the last one, I've been doing a lot of Rails projects, small
isolated classes, but not too many, but not crazy abstractions. Things
that just – yeah, and going back on tests like I'm coming into a few
project, I want my test to basically act as my documentation and so
being able to understand tests and like having, you know, good unit
test, but also integration tests that are readable, that I can, that I
can read through and understand what's going on, what the user needs
to go through, I think that makes for a good project to work on.

Ben: So, Konstantin Austin if you have anything ‑‑

I feel like this is not going to be a serious panel when I signed up
for this.

Ben. Well you're on it, so it's not too serious.

Yeah, any way, to give you a serious answer, so, I actually think
documentation itself, so you said what makes me feel like a project
has good design when I first come into the project. First of all, when
I come in, there's documentation that makes me understand what this
project does and how I'm supposed to hold it. And then, then, from
that I build a mental model of what the code probably looks like and
when I then go into the code and the code looks just like I expected
it to look like, then that's good design (Laughing) so the example is
I want to contribute something very simple to some project and – no,
what was the example ... I had some code where I recently went oh what
the hell I don't even understand like, it was very – something, very,
very simple or I thought it was very, very simple ‑‑

That was go code.

It was go code.

No this was actually Ruby project, I think I tweeted about this.

Active record, no, with that I don't expect such things .

Ben: No, of course not.

Konstantin: Yeah, I don't remember, when you go in and the code has
like certain structure that you expect, like I expect the code that
solves this to find that class and that wherever – and then, of
course, I quickly judge code by aesthetics that are probably not an
indication at all for offed – for good code quality. I actually looked
to day at Austin's code and thought oh my God there's no indentation.

Austin: I'm sorry ‑‑ but it makes sense that there's no indentation,
because the visual effect of organizing the code probably provides no
value.

Austin: It just gets in my way, I'm sorry. Offed

Blythe: So I've done a few code audits, one of the first places I like
to look is the routes file. Because that can tell you some things
about an application. If you see – if you see controllers with maybe
like ten extra actions added on there, you probably know you're about
to have a bad time.

Ben: The other one I've used is if you do it at the count of line in
the user.rb which tends to be the unGodly trash can of every row
application, don't have a user.rb con is that teen said, just use one
.rb (Konstantin)

Phil: I tend to look for things like a concerns directory that is full
of files, and I know this is specific Rails example, but it happens,
in other projects too, just mix‑ins everywhere, not such a big fan,
I'd rather have classes that were responsible for something and you
look at class and go, oh, that does that, oh, that does that without
going why is it include status and include roles, and include
like... why is there a kitchen sink in this class.

Ben: So. When is it okay to slow some of the good design principles
out of the window?  I'm mindful of one project I worked on many years
ago, had significant investment, over million pounds there was a whole
bunch of us working on this project, and it was beautiful. It was
absolutely perfect, the code was exactly where you wanted it to be, it
functioned perfectly, there was brilliant test Commonwealth of
Virginia rang, it was absolutely great. But they never had a single
customer. And the business died and the project died with it, and it
was a really sad moment for all of us, it actually taught me some
really important things about, you know, sometimes you can't focus too
much on the details. And as engineers I think our tendency is to think
of engineering principles and how it affects us. Sometimes we need to
focus on the bigger picture of design, so, when is there, or are there
any other kind of situations where you can kind of turn a blind eye to
these things?

Blythe: So as a consultant (Blythe) we're agile, we're delivering week
by week basis, the client can stop work any time. So we're, the goal
is to be delivering features to them that they can then see and test
and accept, of course. Or reject, and just – so, when I am delivering
a feature that maybe the client doesn't even know that they're going
to keep, you know, if they're uncertain about whether the feature is
going to stick around, then maybe it's better just to deliver the
feature with maybe not the perfect, perfect design. Just get it in
front of the client, let them see it, then spend the time to clean it
up a little bit.

Yeah, sure.

Often times a client will change their mind and you're just going to
throw that code away any way. It's Bert than spending two weeks on –
Bert than spending two weeks on perfect code and deliver a feature in
one week and let them decide to throw it away (It's better)

Would you keep it on a branch and not merge it to master until
perfect?

Blythe: I think if it was on a staging environment, let the client see
it.

Konstantin: You could also just write perfect code in one week

Ben: Yeah, guys, come on. Okay, sorry, Austin, have you got any
opinions?

Austin: Yeah, going back to a few things speaking of turning a blind
eye to things, indentation or the lack there of, it's always weird
that sighted people rely so much on it, it's all syntax, when I'm
hearing the code, I'm keeping track of the syntax in my head and the
level that we're on or what have you, that's kind of what I'm doing,
so it's strange to me. The other thing I wanted to say is that I find
if I start making a mistake, if I start referring to a method or
whatever by the wrong name, stop and think, don't just get frustrated
and change it back, stop and think why did I make that mistake?
Because you might find that that's actually the right thing.

Ben: Thanks, Joanne an you got any opinions.

Joanne: I don't think that – like, I think for, sorry ‑‑

Ben: Sorry, just jumped out on you there. Take your time.

Joanne: So, when bad design is appropriate, I think it's for code that
you're going throw awhat.  I mean sometimes yes, you need to get a
feature out quickly, there's definitely different levels of good
design and you there can be a design this you're comfortable with,
that you know, maybe it's like the best design or the best way to lay
out the code is not apparent, but, you know, you can still follow some
rules and still make things decent. But, you know, generally when we
estimate we should be estimating how long it's going to take a good
feature the be out. But, yeah, generally with – other than like
spiking, I think, good design is – should be used most of the time.

Ben: Yeah, sure. My experience is, funny, just coming back to what you
said about throw away code, my experience has always been that the
code that you actually assume to be kind of throw away that wouldn't
live for very long actual lives the longest. It's always the way. So I
just wanted to try and cover, exploratory design. So one of the things
that really helps me when I'm trying to design software is just kind
of, you know, forget tests, forget everything, just kind of hack
around on something, just kind of get something working. You know,
kind of learn from that. Of and then what I'll usually do, not
actually push that to master and get it shipped for whatever it will
live in production, forever more.  I kind of throw that away and then
start from scratch, – with all of that knowledge if I'd get from a
spike, I'd write test, explore the feature that way and implement the
feature that way. So, back to Joanne. Is there any kind of preference
that you have when you're designing when you're starting from a
feature from scratch.  I know sometimes there's situations or features
that we're working on, that we know, very specifically how we're going
to implement them. In the case where you don't necessarily don't,
maybe integrating with third party services, some kind of API you're
unfamiliar with, is there any specific technique that you use?

Joanne: I like the spiking technique, and then sometimes, when I go
back to, like when I throw away that code and kind of start over
again, and like I – when I start a new feature and I'm not sure what's
happening, isle write a higher level test and just sort of write what
I need in just one place. And get the integration level test, and then
kind of see like where the pattern, where the abstractions will come
from the code, write more unit tests covering those situations. So,
very much outside in.

Ben: Like, Konstantin, I'll remind you what you said earlier,
sometimes you'll write a feature three times before it actually gets
shipped.

Konstantin: Yeah, this is actually more true for non-Travis code, in
general I tend to write code, delete it and write it over again,
sometimes I don't delete it and have a sheer number of project
directories for the same project around. Of but so it's similar to the
spiking except offed at one point I don't see it as a pike anymore,
but I still delete it do that over until I'm extremely happy with what
I see. So the one project that I'm actually not supposed to talk
about, because everyone gets excited and everyone wants to work on it,
and everyone writes code I cannot – I don't like at all is over the
last maybe five years, every two months I start writing Sinatra new,
and some point it's probably going to turn into Sinatra 2.0, but
somehow I always delete it again. Austin, have you got any tips or do
you use any specific techniques for kind of exploretory design when
you're trying to work on a feature you don't necessarily fully
understand how you're going to implement.

Austin: I like the idea of writing specs like what Joanne was saying,
I feel like, don't wait for inspiration, I feel like sometimes, we're
going to write the effect code, right out and then you'll sit there
for like twenty minutes and nothing will happen. You know, you got the
start from somewhere, so just start, don't wait for that divine
inspiration, just start.

Ben: Okay, brilliant. Well, I think we're kind of getting to the end
of the session now, and going to wrap it up, just wanted to thank
everybody for joining me today. And Phil 24 was the first time that
Phil was actually been on stage before. Apart from when he dances on
stage. Yeah, round of aulos for Phil. It wasn't so bad, was it Phil?

Phil: Fantastic.

Ben: And thanks for everybody joining in today and thank everyone for
coming along. Thanks (Applause)

Florian: so we're now going to start immediately with the lightening
talk sessions, so we have to throw you all off stage. Yeah, so our
lightening talk today, most people that only come for the conference
to Berlin will miss out on one of the best part, which is the RUG-B,
which Tobi has been running for the last few years. And he's doing an
awesome job, and yeah. For those of you – yeah, he's already
organizing, you see. So, ... so some of you at Rugby might have found
the bug in this conference, first of all, Tobi is running around in a
pink shirt and the other bug that we have is that we have green
shirts, but also the green shirts have a problem, which we are going
to fix now because Tobi has a pretty specific color of green, so
that's the unique green Tobi shirt. (Applause) we have of wall to
change put in here. Not for information, it's just for Tobi to
change. (Whistle. Sorry, code of conduct).

Florian, have a long stair at the lightening talk list. (Whistles)
finally (Applause) thank you very much, that was uncalled
for. (Laughs) actually out of words, and I need someone please to turn
the white board around because the speakers, this is like lightening
talks with like super difficult so please give the speaker, give the
speakers an – sorry because they won't be able to use any slides. They
can just draw on the white board and I ask like at the beginning of a
lightening talk, I will always say who's up next, that person should
please already line up here. So we don't have any more
delays. Speakers, you will have monitor down there that shows you your
time and five minutes time, no over run, applause and quickly the next
one comes through the stage. Do we have microphone for the speakers?
On the table ... great. So, um ... wait a second. Next up is Jan, is
already there, very good, first up Lucas from the ArrangoDB project,
give them applause. ((Applause)) check the mic. Hello, great. Five
minute it is and there you go.

Lucas: Hey, everyone, we're from a tiny town called Cologne where we
are try to help organize Ruby user groups and stuff like that. And,
um, we found when we came here, you have so many user groups, you have
so many talks, in Berlin, that's not a problem, but we found that
other user groups that are not that active have problems keeping them
active and getting speakers involved and miting every month so we want
to give you some – and meeting every month. We want to give tips if
your user group is not active how to improve that. We had the
situation that in Cologne that we had a user group that was not very
active anymore, and we wanted to change that, so at the last meet ups
of the old user group there is were like four or five people maybe
showing up, so we just restarted the whole thing. One of the problems
of the old user group was that a lot of people felt like it was too
far away from them because it was on the other side of the Rhine. This
– if you know Cologne, this is not really a hassle, but some people
felt like it was (It totally is !) So what we changed is that we will
have a different location every time we meet up. So every time we ask
a different company to say, okay, we will host this one. One of the
advantages is that is if someone lives in a part of the town which is
not easy to reach, maybe at some day it will be next to the venue of
the user group. And the other advantage is, the company will just say,
okay, I will stay here tonight and then they will continue to be there
and you'll have some attendees there. This helped us a lot, so since
then we have not missed a single month of user groups. Another thing
we tried when restarting this whole thing. A colleague of mine and I
decided what about running a regular show of user group to explain
basic stuff of Ruby, so newcomers have something to listen to, and
everybody knows there's at least one talk, all the time something
familiar, we call that Ruby magic. We present something like closures,
and how self works, and all the little things in Ruby so it's not
always presenting, we didn't present any gems or frameworks or stuff
like that or projects, and besides that, yeah, others could just
present some gem or stuff that normally is presented on a user
group. And we find that very attractive to have this regular thing
showing up. And, besides that, obviously, you want that people come up
with ideas, and that's really hard, not for Berlin, I think, told me
talks lined up for the next weeks, and, next months of meet ups. Yeah,
and what we want to do is to encourage, especially newcomer or people
never talked before user group – taught user groups, just fiver
minutes, lightening talk, present something whitey are working on,
and, yeah, with discussion groups, and lowering the barrier to just
tell something that worked out really good.

So another thing we learned was when we were in Miami they had a very
inactive user group for quite some time, they tried something entirely
different, they now meet every week and they just meet in a bar and
people either drink alcoholic drinks or non‑alcoholic drinks and just
talk to each other. Since then every week there are at least some
people showing up, some people bring their notebooks with questions,
some people just want to talk about non‑work stuff, and it works quite
well, the same way the Belgium people are doing something similar.

Yeah, the Belgium people started something called Ruby burgers, and I
learned in Berlin, it's called Veggies burgers, Ruby burgers doesn't
implicate that you to eat meat, it's only about meeting at a fun place
and meet other people, eating together, have a drink afterwards or
whatever. And it's around Belgium so it's not bound to one city, and
we tried this in Cologne as well, most of time we do it before the
regular meet up, some people are just coming to the burgers, some
people are coming afterwards, some people are staying for both. Yeah,
we learned that helped a little bit to break up the ice and, yeah,
invite more people to come and have more regular stuff.

Because everyone has to eat any way, so it's in time wasted. So, and –
that's it. Our time is up.

Thank you very much. Thank you (Applause) so, please get ready super
coke or something, bring your own – build your own start up, that's up
next while we talk about user group, who stays in Berlin until the
next first day Ruby user group is next first day, hope the see all of
you lovely people there. There is a Ruby Veggie burger plan (Arne) and
Ruby in the park when?

Next month.

Tobi: Next month somewhere, if you try to stick around for longer,
okay. Next up is Jan, I forgot the talk topic, sorry, there we go.

Jan: Okay, thank you, I just wanted to – I hope I don't need five
minutes, I just want to quickly plug a project I've been working since
a few weeks. How many of you know code for America?  All right, quite
a few people, I guess you're all Americans, that's great. Code for
America is great, but, you know, I'm living in Germany, and, funnily
someone started a project called code for Germany, because it's not
German, which make it weird. What is this – code for.DE is the URL, I
know there are a lot of regional groups, there's one in Hamburg,
obviously, I'm from Hamburg, I'm going regularly every two weeks,
there is a chapter in Berlin, if you go to that URL, there's a map
with all the groups, I believe there's one in Cologne, not sure about
that, and what kind of stuff do we do there?  So I don't have to
explain that for the code for America people, but usually what we do
there is we try to do interesting stuff with open data. And that can
be data that has been open up by the state, but that can be also all
kinds of other data that is available. And I just have a small list
here of stuff that we've been working on in Hamburg. We started to,
there's a very interesting data set that documents all the trees in
Hamburg, which is kind of interesting, so we made a map out of this,
and why is this interesting?  This is interesting because it can kind
of see where the air might be better and stuff, so it's not just about
trees, it's about the whole environment of a part of the city. We also
did a few things with data that's available for kindergartens in
Hamburg, it's nice because it allows to find free spaces in
kindergarten which is a very hairy problem if you're a parent in
Hamburg. Of and also we do fun projects, so there's this saying that
Hamburg has more bridges than Venice than any other city in
Europe. And we try to find out how many brims there are actually in
Hamburg. Turns out, quite a lot.  I don't have the actual number
there, but definitely more than Venice.  And, the project I've been
working on is a fun project as well, which is there's this tumbler
that documents things that are standing on bike lanes. That is a hairy
problem, probably in Berlin too, you know, trash cans, mostly cars,
but sometimes also funny things like mattresses and stuff like
that. We just took the data, most people do their photos with
smartphones so they have Geo coordinates, we just took them and
documented them on a map, and you can kind of see, well you can kind
of see where the people who are using the project are driving to work,
but you can also see where there are more problems than in other parts
of the city.  So, if you're interested in this kind of stuff, like I
said, we meet every two weeks. In the evening, there will be some sort
of food, mostly it's Pizza. There will be drinks, usually Mates, so,
you can just hack on stuff that you're interested in. There's lots of
data that wants to be freed or is free already, and we're working on
interesting stuff that can make living in the city you're in better so
that's it, thank you very much (Applause)

Thank you Jan, now the one is being written down for Poland.

Please write bigger.

Sorry, yeah.

Write bigger. Well, then while he gets ready – awesome. We can still
start Jafe is going to tell you how to build your own start up.  I
guess.

Yeah, my name is Javier, I have really small start up, and I want to
tell you how it was for me, why I decided to start a start up and how
it is to, you know, to build your own product. So as a developer, as I
started working, I used to work for a company that told me, okay this
is what the customer wants, build it and we pay you. It was our
agreement, but the thing is the salary I was getting, it was much
smaller than the money they were getting from the customer, so I
thought, okay, if I start my own company I can get the money that I
should from the customer. I did that with some friends, we set up a
consultantancy shop, we had disagreements with customers, they told us
we want this, we will build it and they will pay us, and it was
amazing, the problem was, we had to work for the client to pay. So if
we didn't have any customers we didn't get any money. So that's the
thing when you are selling your time you are quite sensitive to, you
know, to be selling all the time to have all those things, so we
thought what we need to do is have like reoccurring benefits, so sell
one to the customer and get money every month .

That's amazing, that's what a start up does, when you're building a
product that's what you do, you're satelliting something and you're
getting money like every month and you might think, okay, but building
a start up, it's, it takes a lot of money because you read about
things, I don't know, this company raised ten million dollar, this
company raised whatever, the trick is by the time they are raising
that money, they are already making money. So, starting your own
company, and getting a product in public which is ready to be sold is
not that expensive. In our case, we have a small start up called
Towaki, not even a thousand developers in the platform, but it's built
with the current infrastructure it could support like 20,000 users
concurrently, and I don't know how much you think it's costing us
every month with everything, services, hosting or whatever, how much
would you say?  It cost to run a platform to serve 20,000 customers
concurrently. It's costing below a hundred Euros a month, you can get
a nice server for ten dollars a month, we have 8. Then you can have
Amazon Web Services, Google cloud services, we are running the block
Bloging Wordpress, mail chain which is free till you get to a point
which you don't need the money anymore. You can use a lot of tools,
like I don't have slides like (CHECK HERE)trayler, melt in, real lick,
real lick we are (/CHECK HERE) paying like three and half dollar
asmonth something like that, so the thing is when you're adding
everything, it's like a hundred dollars – a hundred Euros, that's what
it costs, and how it sends you, the thing is, you pass from developing
all the time to do other things which are complex, but are pretty fun
in the end, you is to network, you is to sell to people, you have to
talk to customers, you have to change your mind a lot of times, you
learn a lot, and the worst thing that could happen, at this moment in,
you know, in this market, is if everything twos bad and you to close
your Saturday up, the other thing that happens is okay, you can get
another job where you're going to make a few thousand dollars a month,
because Berlin, London, a lot of places you have a lot of jobs right
now for developers, so, I don't know, if it works for you, but for me
it was a no brainer to start my own company.  If you want to know more
about what it takes like to run your services, talk to people, and all
the things – I'll be around. And by the way, we are not profitable
yet, but still, I would say the your – I wouldn't change the journey
for anything else that we have. Thank you (Applause)

Thank you very much; by the way, the is increased difficulty for the
speakers without slides, we have this nice out door venue, so I guess
we can make up for that. Jessica from the barn, are you still here?
Yes, you R. please get – no, not your time yet, but get to the cue,
thank you (Applause) and next one is Mavina and I'm not supposed to
say what she's talking about, go ahead.

So, yeah, okay. Hi. I'm Malwine...

Hi. Malwine.

Yeah, I did something the last days, it looks like this Ooops. Can you
see it?  What's that?  Yeah, it's a bat, yeah, I celebrated with some
people did (It's a bird maybe) my one year Ruby anniversary, and I
have beautiful slides, but, yeah ... I can also tell you. So, my talk
is called meet my village. Many people of you earlier this year saw
maybe the talk of Michele – Michele, it takes a village the make a
programmer, so, yeah maybe you're interested in my story. So after I
finished high school I went to university, started studying computer
science it was horrible and after a year I wanted to quit, and this
was in summer, I was like Nah, that's not so nice.  Well, maybe it's
nothing for me. And then I was really literally down on my knees
asking God, like what else can I do?  God replied, like, giving me a
little Ruby right (So, yeah, I heard on the radio that there will be a
Rail Girls workshop, so I went there and actually that's the point
where nevere everything started so I went last year to eurucamp and
made the Rails Girls workshop, at this point I want to give this – to
the Rails Girls for the amazing organization work.  Pretty cool that
you do that. And, yeah, I think I will award some people now, for
example the whole community and as representative I chose Tobi (Law
officering) because he made Ruby on Rails course at my university and
so, I could, like jump deeper into the topic, that was pretty cool,
and also Tobi was nudging me every time, join RUG-B, join our learners
group, yeah, you can hear, meet Tom he's pretty cool, and stuff like
that. And secondly, I want to give an award to to the coaching people
like, as a representative, I chose Til, and Rubycorns that's pretty
cool that there are learning groups, and I also want to award,
actually Arne for the Ruby Monsters and Johanna for the Open Tech
School, because I learned so many things from those people, that
really, I have to say thank you.  And, yeah, I also want to thank you
people that you motivated people during this process, for example,
Jules and John have a big part in this thing, and hey should get
awarded too. I think I will hand out the awards on Twitter later so
you will see them. And, yeah, finally, of course, for the
encouragement to give a talk at the RUG-B, I want to award Susan that,
and, of course, I want to give an award to the Rugby, because, Susanna
said if you want to work, then you should probably do a lightening
talk and talk at some conference or at some music group, so I did, and
I am so happy that at this evening that Dawanda was on board, so guess
who gets the next award, of course my awesome colleagues Luca, Jalyna,
both Lucas, all the team, they are so nice.  Yeah, thank you that you
gave me this opportunity that I can work with you, it's pretty cool, I
learn so many things every day. And this year, yeah. And, they are
finally, of course, I want to thank my family, which is not here of
course, and my cute Hooo for supporting me, yeah.  And last but not
least, I want to thank the whole eurucamp crew that you did this last
year because otherwise I wouldn't be here, right. So, of awards go out
to Dajana, Florian, Alex and the whole team, of course, pretty good
that you did this, auditione, right I think I forgot lots of people,
it was possible that I made all this progress in this one year because
of everyone of you, so, yeah, maybe you should give applause to
yourself and, yeah, I'm happy to have you guys, so thank you
(Applause)

Thank you very much, I think we gladly accept the awards. Jessica we
come on stage, the next person was, oh, my God, I forgot the name,
Patrick Ndife. Please line up. And I want to emphasize the last point
that Malwine, thanks – onset enough, I don't know there used to be
this Ruby thankful Hashtag, it was shortly after the AVM versus AVIAN
fall out and people donated lots of money to the guy maintain it,
who's name escapes me right now Wayne, see green, so maybe try to
rewrite the Ruby thankful Hashtag, we have lots of open source people
around, just say thank you to them, once in a while. And that goes on
and on. Next up is Jessica, who's probably going to tell us something
about awesome coffee and there's your microphone.

Not really – not about Ruby, but coffee. Thanks to her awesome coffee
that she makes (Applause) sponsored by Travis of course, and with
that, we continue.

Cool, okay, so maybe you have guessed that I like drinking coffee, but
it's not the only thing that I really enjoy about coffee. And there's
another aspect to it which actually is maybe not so evident, and that
would be the culture and the history that is based around coffee.  So,
it's very large. And I only have five minutes, so I just wanted to
tell you a couple of my favorite points from this history. So Legend
has it that coffee was discovered by a guy called Caldie whale he was
out looking after his goats, the goats ate the cherry from the coffee
tree and started dancing crazy.  He thought it looks pretty good so
I'm going to try that, he realized it was pretty good. So, the Arabs
had this for a long, long time, because they were in Ethiopia, they
realized how brilliant coffee was, and started making it as abaser
raj, they realized how good it was to the extend that they wouldn't
let people take trees outside of the land that they owned. They didn't
want anyone else to have it. They did trade it as a roasted bean, but
they didn't want them to be able to grow it so they makee made sure
when they transported coffee, that no one would be able the plant it
and grow it as a coffee tree. However, eventually it did get into
Europe through a number of crafty ways, that's why I call it coffee
debatchry and how it was transported throughout the world. The first
coffee house in Vienna was called blue bottom after the battle of
Vienna in 1683, basically they were in this castle, surrounded by the
Arabs, they thought we have no chance, there was one Polish soldier
that had lived for a period of time and spoke Arabic he was able to
sneak out, get past the troops and get help, and in this way they
managed to actually overthrow the Arabs and win when the Arabs left
they left everything behind including all the coffee, and the vie
niece started to burn it they don't know what it was, this Polish guy
smelt it because he had been in the Arab country realized straite
straight away and was stop, I'm going to take it if you don't want it,
he took all the supplies and opened the first coffee house in Vienna
with that coffee.  The blue bottom. The second story that I wanted to
tell you was about captain Gabriel Decluex, my French isn't good so I
might pronounce that wrong. He was put in charge with putting the
coffee plant into Martin next, it was gifted to which everyoui in
charge at the time, there was many, and he took this plant with him on
a ship, it's a little unsure if he took one or two, but he had to go
to great lengths to look after it.  He had to their – they had to get
away from higher pie rates and even one of his colleagues with him on
the ship was so jealous that he would have this opportunity to like do
something for his country he tried to spoil the tree and ripped off a
branch. So, eventually he did get there, and he took the – he took the
treee tree and he planted it, and shortly there after, or a thousand
years, pretty short in history, there was actually 19 million trees in
the whole of Martinique from this one plant that he took.  So, a lot
of love, a lot of dedication, I think like the history and this whole
culture within like the 1800 of coffee is incredibly interesting, you
can read all about it in a great book called all about coffee by
William H Herkurs, free on the internet. That's part of my passion
behind it, but obviously how great it tastes too. If you want to come
drink coffee tomorrow, we'll be in the same place (Applause)

Then Yvonn about refactoring CE Rails apps, please get started and
next up – Woops is Patrick, telling us about empowering people

hey, what's up, eurucamp. Make some noise! Whoooo. Make some noise! !
! ! Yeah that's what's up. You know, I'm really moved by you guys and
what you guys are doing. This is not my field, I'm a musician, and I'm
into fashion that's what I've got passion for, but you know you guys
really moved me. Just to make it speech to encourage you guys,you
know, don't let nobody tell you that you can't do it, you can do it! ,
when some people started they never knew that they would be where they
are today. You understand what I'm saying?  So don't let nobody tell
you you can't do it you can do it! You can do it! Do what you want to
do! And you can be who you want to be once you work hard on it. You
understand what I'm saying!

Yep. That's a good one. Because you've got what it takes, I've been
watching you guys you guys are composed, one, you guys are
disciplined, you guys are humble. That's all it takes. To be what you
want to be. You know. Maybe by six months time one year, you never
know. You might be like Bill Gates because when they started, it was
just like this, you know. They never knew that they would be where
they are today. They might be people – people might be telling them,
oh, you can't, oh, what you want to be, but ... once you work hard on
whatever you want to be, don't let nobody tell you, you guys are on
the move, you guys are on the move. Ain't no stopping you buys, you
guys are getting there. You guys are getting there. You know. Don't
let nobody tell you oh you can't do it, because you guys I've watched
a lot of great speakers from you guys, you guys are great!  And you
guys are doing great. You know. I was really moved, I'm moved, by what
you guys are doing. You guys are trying to make this world a better
place. There's some certain things we never knew that it was going to
be possible today that you would be at your home relaxing, and order
like Pizza, it's going to your house.  – you know – I never knew that
– you can be at home and register some certain things – you know – and
it's going – you know ... that beautiful woman out there – that's my
wife.  (Whooa applause. She's waked me um so many times in the middle
of the night and said, what do you have passion for?  At times I will
fumble, I will say music, at times I will say fashion – (Laughing)
number of times I've said fashion,okay, follow your passion,that's
fashion. So, I'm here too encourage you guys to follow your passion
keep on keep on keep on keep on doing what you're doing! Don't look
back. Don't look back ain't no stopping you guys you guyinges are on
the move, don't let nobody say, oh, you can't do it, you can do it,you
can do it,i I'm here to 2E8 you can do it.  Say I can do it! Say I can
do it! That's what's up! Great one, great one, and the organizers,you
guys are just, it's as if you guys are programmed had (Laughing) you
guys are on the time – no mission understanding.  I don't know,
Florian ... did you program those guys?  I've been too lot of
conference at times they will have problem within themselves, but this
one is a great one. It's a great onement please, please, please,
please, please. Keep doing what you're doing! Keep doing it! Sky is
going to be your limit, each and every one of you! Just believe! In
whatever you're doing, don't let nobody tell you you can't do it. You
can do it!

I would love to listen to that,but we're out of time, thank you very
much. Patrick (applause) big up your spirit! thanks man. Next up,
Jalyna, would you please get ready. Okay, and now, Yvon is up,
talking, telling us how to refactor all our messy rail apps which I'm
sure we all have a lot of. ‑‑ Hi, guys, I came here from Russia from
Siberia and it's actually first time I'm attending European conference
and I'm exciting to be here (Applause) so, thanks I'll try to be – to
give you a practical advice, and I start with three questions, which I
realized, at some point that every good developer should be able to
ask on himself so the first question is, actual – actually how – what
it means for me to write a good code. And the second one is how should
I test this code properly. What does it mean. And the third question
is how can I refactor all that shitty stuff I wrote when I learned of
to do first two things.  Yeah ... so any talk will be about it. So
please raise your hand who never saw rail duplication which looks like
a messy fire ball I think we all saw such applications and before I
gave this practical advice, I'll give you some non‑practical advice –
Ah! Don't listen to me, so ... the first thing is just don't push it
too hard, when you see the crappy code, don't try to get the first
random thing and refactor it, because you can end up with two abstract
code and the worse thing that actually customer can come in and say
that we actually don't need that code anymore, and you did your job
for nothing.  The second thing is don't do it for free. So, it means
when you going to do it, without any – any money, you can ... you can
do it also for nothing. Aged you can end up with architecture –
astronaut.  And this is my advice, and I actually wrote some – drew
some pictures let me do it. So, the advice is imagine that
application. You have a controller, you have actions, and those
actions are about one, three, and more hundreds of code, and, what to
do in this situation, so ... the answer is you should add one more
level of abstraction.  This is the thing called somebody called them
services somebody calls them interactors, somebody called them use
cases. So, if you have ... I don't know, this is the controller, this
is your crappy actions, and you have your business logic mixed in
number of controllers. And the idea – is to have your controllers just
do their controller work, just deal with requests, response rhetoric,
session – and your business logic should be in another place, and
that, services layer or use cases layer, so what I propose is just to
create separate directory, called them use cases for example, and put
your entity, mine was – mine called samples. And put this stuff here
so I end up with six – six use cases and it was basically separate
classes, which had one method run and what it does they contain all
the business logic, all the business logic rules, and they were just
preparing the data for my views here, and, the benefit from – from it
you gain is that at some point when all business logic is here, you
start to realize that some methods in your models they are only used
in those use cases in one use case.  This means that you actually
don't – shouldn't have this method in your model, you should, you
should remove it – you should move it here too as a private, and your
models become more clear and this is a simple step, we try encourage
you to do with your – this is it, I'm sore I. thank you very much
(Applause)

Actually thank you for using the white board, for once, next one up is
Jalyna. Just get ready, cool, I'm going to clean the white board while
she's talking hello.

I'm Jalyna and I want to talk today with you about authorization. So,
in my company we used to have like 7‑year‑old legacy App where we
don't care about authorization so you can imagine all this implicit
code in the controller or in the view for authorization and yeah,
right now we are building our own news deck so we need some
authorization, and authorization and web context means mostly like
specific some permissions on a use their can maybe do some activities
on specific resources.  And for us, that was like a hard thing because
we have multiple apps in our new stacks so we want something
centralized, so this is our first requirement, we want to have
centralized authorizetion. And, of course, we want to have role base
access control, because it's great and, yeah, we don't want to rely on
Rails and we want to use it in our different apps explicitly, and, so,
of there are already some gems you can see if you look for Ruby
authorization arrays authorization, especially mostly Rails, that's
the problem. And there is like one cool gem, I really like, it's not
maintained, it's really outdated where they already have centralized
authorization, also Alma Candelaria can is quite famous, but we came
up with our own idea, (CanCanCan) why not create a diesel for setting
up our rules, so what we have, like in the role based access controls
are basically roles, and what I already said, we have to specify
permissions on these roles, and in our case, it makes sense to specify
these permissions, for users on resources and then maybe for example
provide like CRUD operations on it, and, I was thinking like we want
to have like a really really readable thing, so I came up with an idea
how this thing should look like.  So, I was thinking also a very easy
DSL, so, first, there should be some container for each roll, so,
let's say we have a user role, what is quite common, right, so that's
log in the user, and we want to give him some permissions, so this is
a block as you can see, we want the give permissions on a resource, so
let's make it readable. So, we can do something like pass permission
on, for example.  If you have different opinions on the naming, please
come to me, maybe you have some good idea, and then we give a resource
name, let's say I want to have something like messageses like private
messaging, what I now want, this or – no, I don't have space anymore,
what I now want to do is I want this user can only of create messages
where the user is actual sender, okay, so ... let's – and I have
option where that is called too, and I can give the activity I want,
like create. And, now, but, now I want explicitly that this user can
only create the messages where he's the sender, so, the next blocks
come, it looks much more nicer with syntax highlighting. ?
Laughing. And I was thinking, in most cases I want to check some
attributes or methods on the user, right, so I thought about like an
interface that should look like that. So, I want that the sender ID,
so I expect the attribute sender ID

As I said I'm specifying these rules, so I'm thinking, okay, what do I
want to do with these attributes or methods, I want them to be
something so, I came up with what I city a good idea, and I tried
toous what I already know so I – I used R special measures basically
it's getting long, I'm sorry, I hope you can still read it, no, okay.
And there are some ends missing, but, never mind, so what I come up
with, like just using rspec measures that had many advantages, so
first advantage, obviously.  – this is it, sorry. (Applause)

Please get ready Matt Patterson. We have to cut the lightening talks a
bit short, we're dropping out some of the last Storm might with
approaching, so we have to cut some, I'm sorry. And are you ready –
yes

I'm from Germany, and I've never spoken in front of such a big crowd,
so I hope I do it well. Yeah, I'm currently, since a few months
documenting my journey and exploring and gaining experience in
software architecture and so, I want to use this lightening talk I
believe to promote my Blog and to talk about a very simple
architectural theme.  I'm – I've not really encountered but I read
about I, and I used it very well: It's called basically role
connectors, I'll give a very quick code example to illustrate. I hope
this is readable, this is a bank account, it has a method, transfer
with the mount – shit that's right – and another account, and some
implementation, this method accepts amount and another instance of a
bank account to transfer money from the bank account, from this bank
account to another bank account. So very straightforward, two
arguments, what's – there's a tiny little problem here, when your
system evolves, you will get new classes, new services, whatever.  So
on the one point you will get something that receives money, whatever,
you know – theymore of in directions would you never estimated
before. Instead of using actual names of classes. As arguments, you
should use name – the name of the role. Which would be in this case
instead of a can't, receiver, we have no types in Java you would do a
receiver, interface and the bank account would have the receiver
interface, it needs a receiver, you can implement this receiver
wherever you want, we don't have typing, we don't want to implement
the typing in Ruby we love not typing, we use naming of an argument as
our role, so you have the role receiver in the argument list, you're
documenting that's the receiver, and when ever there comes a new
actor, like bank account, you don't have to touch this code to stuff
it in.  You have just to implement the methods, which is the agreement
or the implicit contract of the receiver role. The methods would you
put into the interface. In Java or C# or the abtract class if you
program C++ whoever wants do this. That's basically role connectors, I
recently blogged about it, just wanted to talk about it.  There's
another thing we heard this morning from Michele and she was talking
about mentoring, that he believedly impressed me, so I thought, why
not, so I added a mentoring side to my Blog.  I will write it here,
it's my first name, Jacob. I – hope you can read it. Is it readable?
Very good, if someone is interested many measuring or give feedback,
I'm blogging on a weekly basis, I would love to get some feedback, I'm
just blogging for myself, I make no advertisement. It's basically for
learning, but, so, yeah 789 that's all, two minutes left, what
ever. Thank you very much (Applause)

We have one slot left which I think is the code with the Huruko talk,
next up is Matt, talking to us about design. "Hi, Matt how you doing?"
"Good, thank you, also thank for all the other lightening talk
speakers" "And, Matt, you ready?  You need the white board?"

Nope.

And here we go.

Hello, my name is Matt, this is talk about design all women become
clear. I work for company called tape TV, we have some tape TV tape
with us. I also help coach with the Ruby Monsters and do things like
that. (Applause) but I have a secret, a dark, dark secret, which is I
don't have a computer science degree. I have a design degree.

Oh, God

I've got a quick question, quick show of hands, who here calls
themselves a designer, anyone call themselves a designer?  Who calls
themselves a developer?  Who calls themselves both? Of (Sighs) a quick
question, what is design?  Is it how something looks? Is it how
something works? Maybe it's arranging things so that somebody or
something can do a particular thing and what is development?  It is
just writing code?  Is it methodologies, agile, or TDD or solid or OPP
or functional, or is it arranging things so that somebody or something
can do a particular thing?  If graphic design for is designing logical
systems of information as coherent visual systems, maybe when people
talk about software design, they're not kidding. Maybe, you're all
designers whether you like it or not. So, what did I learn in design
school that might be useful to you?  Number one, restate the brief. If
someone comes to you with a problem or with a task, term them what you
think they asked you. The only way to come to a real shared
understanding is to make sure that nothing is lost in translation that
you can take what someone said to you, say et back to them and they
agree with you that that's what they said to you.  Number two, you get
better by trying and by showing. Design Crits are like code
review. But, you take time and you don't just say this can go, this
can't go, but you say, well, why did do you this?  What does this do,
how does this work, what were you trying to solve. More context, that
can work really really well. And the next one is systems and
organization.

So, complex typographic design and information design are about
understanding complex and messy things. About decomposing them into
(CHECK HERE)discrackses(/CHECK HERE) and visual systems that make
those things explicable. Which sounds like building a large system,
right. So maybe design criticism and maybe design theory from other
disciplines is worth examining, so, think about this, where do design
patterns come from? Design patterns come from the Christopher
Alexanders work, he has a book called pattern language. Stuart Burns
gave information architecture web design the whole concept of sharing
layer, and one of my favorite is a book called by normal particle,
which is design "for the design, good design is the generous and
pertinent response to the full context of a design opportunity with
whether large or small, and the quality of the outcome resides in a
close and truthful correspondence between between form and meaning."
I've got a lot of time for Norman potter, I think you should too.

Thank you, tape TV is highering, C Christoph so come work in our
office in Pankow, we have a bawl room, on the bad side, here is the
slide with all the acceptable lunch options in Pankow. We near the
process moving to the center of Berlin, we have a lot of exciting
problems and lovely people, come join us, find me on Twitter, come see
me afterwards. (Applause)

Thank you, Matt. Ful – Polzie is here, good, and...

You were born ready, cool.

Good evening, I'm happy that the weather gives us the of mum setting
for our lightening and thunder talk. So my talk is called – and I have
to check just a second. The question is – what has – what has Heroku
ever done for us? You may know the company Heroku, if not it's a
popular (I will remember going off) it's a popular application hosting
service. So, and you might know the life of Brian, the movie, so the
question is what has Heroku ever done for us anyone?

How about free application hosting. So, apart from free application
hosting what has Horuko done for us ‑‑

Pardon me?

Easy deployment.

Okay, apart easy deployment and free application hosting what has
Heroku every done for us, I'm promoting, an idea, it's some kind of
revelation. I'm – Oo, just one, just one minute here. I'm planning
about some kind of Heroku‑like service, some kind of of application
hosting because I think of owning your own application service today
is something like – is – like having your own e‑mail address, I think
half of us are owning our own application housing service now, there
is this domain, it's called what-has-heroku-ever-done-for-us.com, I
set it up this afternoon, and it's user voice forum behind it, so,
there you can – I would ask you if you could answer this question –
not what has Heroku ever done for us, but to tell me how you would
like a application hosting service or what you don't like about of the
existing application hosting services. Yeah, that's it. thank
you. (Applause)

Thank you – what-has-heroku-ever-done-for-us.com.

Small lightening announcement, leave
