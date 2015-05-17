---
speaker: Charles Nutter, Thomas E Enebo
title: JRuby
---

Of okay, so, we have next talk. And I think we need – I don't know
that we need such big introduction, team Ruby leads Charles and Tom.

Tom: Okay, I guess we're going to get started. We're going to talk a
bit about JRuby. My name is Tom Enebo, and I'm Charles Nutter, hi, and
we've been working on J ruby for a very long time. We've been doing
this as our day job since 2006 now, which is really awesome. And we're
going to talk about why JRuby is cool, and it's very difficult odo
that without talking about the JVM a little bit, so we're going to
talk about why the JVM great, we're going to try and bring Sexy back
for the JVM. We have two different Ruby implementations and two
different teams, we obviously run on a host platform, but in reality,
JRuby writes to the JVM, there's a few places where we burro past the
JVM and go to his some POSIX stuff we need to do the 'em plait C Ruby
but we generally just write to the JVM, I'm going to argue that this
is a good thing. And it's not the pick on MRI, I think this is a set
of trade offs. Having all that control is great, sometimes we wish we
had total control we're subject to the limitations of the JVM, but we
get so much from it. So it's better. We have people like John rose at
Oracle who has a brain the ten time the size of mine, one of many
people with PHDs who have been writing Compilers and garbage
collectors for decades now, so we don't actually have do all this cool
stuff, it's done for us already, making a virtual machine that doesn't
crash with native threads, is I guess, exceptionally hard. Of we have
a thought experiment for you. Let's pretend a few years back all the
Ruby implementors went one and MRI implementors went on have vacation
together, we were on a bus and get in an accident and died. This
happened about the time that JRuby 1.0.3, this was the latest version
of JRuby that worked with Java 1.4, for the sake of completeness, you
can see as over time as new versions of Java came out the benchmark
continued to get faster and faster without us changing anything in
JRuby at all. JRuby gets three times as fast without doing anything,
and of course we continue to work on JRuby, and MRI didn't get any
help, they went alone and they're all dead. JVM is absolutely
everywhere, from every laptop in here to exotic platforms like an AS
400 Bill mainframe, open VMS running on anti train yum architecture
(IBM) almost on's phone here, JRuby has this extra reach because the
JVM is everywhere. This is our old issue tracker, we have some old
bugs that are still open for openVMS, people use JRuby on open VMS,
who has ever heard of openVMS, wow! I'm surprised, that's way more
than I expected. About 20 percent. Talk about obscure operating
systems and people running JRuby on it. One of the great things
compiling down to Java byte code, it's gives increased portability,
not foe tall portability, but ... here's the JRuby specific gems where
it uses some Java native component. So, if we go and install this on
windows, there's no compilation step like with the native C extension,
we get this portability for free. Of I don't know, I'm sure there's
more library in there now than when we originally made the slide,
there's a loft useful libraries, if you want to no SQL database, you
can use Neo 4j and some library you're using in Ruby and missing an
option you need, fall over the Java and there'll be a library that has
those options. There's also many languages, and it runs under the same
VM, so, some are quite popular now like closure. And, really, it's
about picking the right tool for the right job. Ruby isn't the best
language for every possible task in your project, you can just bust
out and pick a different language. For that matter, everyone one of
these languages has their own set of library that you can also
pick. So let's say you wanted to go and use an actor framework, you
could use Scala Aca framework from JRuby's really easily. It It's
actually a gem that makes it easy to do that.

Mica.

Yes.

So I'll talk a little bit on the GC side which has been a traditional
pain point with any reasonably sized application, and you know,
sometimes this isn't a problem, if you is a small enough application
and GC is not an issue for you, that's great, you're okay for a while,
but, pretty much every application grows over time the data sets you
want to handle, number of users and so on, with Ruby's object heavy
nature, yowie eel eventually get to the point trying to run several
processes and trying to run all this in MRI will catch up with you and
you start to spend more and more time just wasted on garbage
collection, any application running on MRI will probably have issues
eventually with this. On the other side JVM GC we have several options
in the open JDK garbage collectors, ranging from parallel garbage
collectors that use lots of threads to concurrent collectors running
in the background while your application still executes, it can scale
up to gig gay byte Terebyte heaps, these are state of the arts the
best garbage collector in the world, if you read research paper on
garbage collection each one of them are talking about garbage
collector implemented for JVM, and we get all this for free. So, in
open JDK I mention there had's the parallel collector which will use
all the cores in your system to make the pauses as short as possible,
there's the concurrent collector, which will still stop the world,
once in a wild, but usually, it's – onee once in a wild, but usually
it's running concurrent you don't see pauses in your application,
there's a couple new one, GY is supposed to replace the current
collector, eliminate even more pauses, and then many others from other
companies, other folks that are add things into open JDK. Tom was
talking about how we have all these languages and libraries, and
because they all run, on the same VM in the same memory space, it's
all the same objects, we oar not trying to deal with a C library that
may or may not collect it's – free it's memory properly, or connecting
up with an external language through V 8 or something like that. With
it's own garbage collector, it's all the same world, so it helps keep
things much more consistent and predictable, as predictable as GC is,
you have a holistic view when you actually get the tools, Exactly,
when you look at a memory dump, not only you seeing rue one Ruby on –
Ruby objects you've created and whatever else is running on the same
VM, very hard to find memory leeke leeks on Ruby for example because
you need separate tools to look at both types of objecttion. So we
have some GC demo scripts that we use periodically to see whether the
JVM is garbage collecting well enough for us, to compare it with other
implementations as well. It's fairly sample, just a bunch of loops,
the inner most loop here, the per.times, is going to create a bunch of
objects that are immediately dereferenced, so they should get thrown
out and garbage collected quickly, the outer loops will create a chain
of objects that stays in memory and grows over time, so we're checking
the garbage collector as far as young objects and old objects in this
system. Now, if you run this with Ruby 2.1.1, unfortunately it runs
the garbage collector many, many more times than we do on the JVM,
this is primarily because this is not really a generational garbage
collector on MRI, in fact we have to kind of go log rhythmic scale to
see where JRuby fits in, two or three orders of magnitude garbage
collection, this also applies to the amount of time, Ruby ends up
spending ten to a hundred times as much waisted effort on garbage
collection for exactly the same code and the same scripts. And this is
where the time is going in your application, these are the pauses that
you're users are going to see, eventually any application will run
into this.

Tom: Has anyone employed a Ruby'se on Rails App and forced a GC on
request.

Tom: You can admit it, it's all right. Those are the kinds of things
you have to do, and some of the web frameworks have add in GC.start
between requests, because of the poor garbage collection on PRI in the
past. It has improved over time, but, still obviously needs some
work. This is Ruby 2.0 but these numbers should be basically the same
on Ruby 2.1, this is showing how without a generational collector
where you put all the old objects in an area you don't have to look at
often, the larger the heap on MRI, it's exknownble more time is spent
trying – expo anyonecially more time cleaning up the objects, –
wasting time on garbage collection that shouldn't be happening. And
that's not happy. This one was another graph that really does show how
it becomes a log rhythmic thing even for the GC times for just a gig
heap. And even if you split this up into multiple processes, it's
still same ratio. It's still ten processes all wasting that amount of
time on garbage collection, it doesn't help to have it split up, you
need a different garbage collection model. So, as we can kind of show
here, there's more uniform GC times ton JVM, far fewer pauses and a
lot more predictability for applications that you're running . Of
threads, of course, is the next big one. So on the JVM, we, again, get
for free, the really solid stable native threading that's
available. You create a Java thread and it's senly an operating
system – e season think an operating system thread, run in parallel
and the JVM takes care of making it all work nicely. Another little
benchmark, this is the serial one where we're not going to have
multiple threads, and this is the one where instead of doing it in
serial we'll speed it up and have them do it in parallel. If you run
this on Ruby 2.1, you are using multiple threads at operating system
level, but because of the global lock, only one of them can run at a
time, so you'll only see one core saturated on the machine. If you run
this with JRuby, first thing you'll notice is the unthreaded version
there are other cores doing a little bit of work, that's probably the
garbage collector with it's multiple cores trying to make garbage
collection run as fast as possible. With JRuby of coursing with one
process and a few threads you can basically use up all of the
resources on the machine and keep it hot all the time. And that's what
you want, you don't want to have into spin up 8 Ruby processes each
with a hundred, two hundred, five hundred megabytes of memory just do
you can utilize the system, it's wasteful and expensive if you're
using a virtualized server. Now, the performance of this, obviously,
it almost improves by two every time, there's only so much you can do
as far as memory pipelines and pushing day the through the system,
but, here on JRuby, another benchmark we have that just reverses a
string, manually, in a multiple threads, here we have it increasing
almost by twice every time it goes down. As we get down to four
threads, we oar starting to get down to where – we're starting to get
down to how many processes in the system, not much improvement past
that point. Anybody heard of Omd – Amdahl's law, it shows that no
matter how hard you try, as you three more processors, more cores at a
problem, you're eventually going to start to tail off, so you will,
eventually reach a point where adding more processor core s is not
going to speed up the application, but we're still talking about in
the range of 16, 64, 512 cores. How many people have a 12 core machine
that they're worried about – a 512 core sha mean they're worried
about. You'll see a solidism provement in JRuby on any of the machines
you're used to deploying on because you can use that one process and
use up all the cores. So, tools, this is another big one for us,
because of number of people that work on the JVM and build
applications for JVM, there's been lots of work on tools and profilers
and other things that are available that we can use with JRuby as
well, and you can use with your applications. Talk about couple of
these here. So, on the monitoring side, if you want to have an
application in production, be able to check on it, and see what the
state of the VM is, see how the memory's looking, see what threads are
doing, you can use something called JMX, it's a remote monitoring API
that allows you to see all these internals of the JVM, we also publish
some JMX information, so you'll see information about JRuby, how many
classes have been loaded, what the application is doing at a Ruby
level too. J console and virile VM are two tools that come with open
JDK, they provide a little bit deeper way of look bog these JMX end
point – look bog the JMX end point and getting the health of the VM,
and most of the servers you run on will have some amount of additional
tools for helping monitor the JVM, Relic all of them have stuff like
that. I'm going to show a bit about visual VM, free available with
open JDK and cool to play with. You can do CPU monitoring, see what
the amendment I have like, see what the threads are doing ‑‑ see what
the threads are dog live, see where they are in the application any
given time, you can do performance profiling, memory profiling in a
number of different ways, and probably the coolest one is visual GC,
isle show if a minute. So, started up, you get a view like this. We're
monitoring, the basics of the VM, how much CPU is being used at any
given time, classtion and threads that are in there, ‑‑ classes and
threads that are in there, what the heap is, showing how much space
has been allocated for it, the orange, and the blue how much of that
is being used at any given time. This shows why JRuby usually has a
larger base memory footprint, the JC needs room to breathe, and that's
why it's able to run so well, and use so little resources, but it does
mean that we have a little bit bigger base footprint. Here's a thread
monitor, the only Ruby thread here is the main thread, second from the
bottom. But we have ‑‑ the Git thread is there in there from JRuby,
compilers for the JVM, all sorts of other utilities that starts
up. Notice that JMX server connection that's that monitoring end point
I was talking about earlier this is visual GC, which is just
awesome. This is showing live in real‑time what the GC is doing on all
of the different memory areas that it's managing, the one that's going
up and down quickly there is the Eden space, where all the new young
objects are created, it fills up a bit and then it goes down while it
clears out, the two below it are the next level up, objects get
promote in the there, if they survive collection in the young space,
and then the old space is where objects that have been around for a
long time go. It allows the JVM to ignore all of that so it's not
spending it's time on objects that probably aren't going to go
away. So, again, we get all of this stuff for free, and it's pretty
awesome, and then you get it too. So, exciting times.  Yes.

Charles: All right, so, some of you may have heard about the work that
we're doing with Oracle on something called Ruby Truffle. Truffle is
language development framework that Oracle Labs has been working on
that allows you to just write an interpreter for your language and it
optimizes it and does all of the compilation and all the in‑lining and
magic of a VM for you, so early numbers with JRuby and Truffle here,
obviously are doing rather well on these benchmarks ‑‑

Tom: To be clear this was a benchmark that the Truffle people came up
with.

Charles: Yes, yes, they're very care 68 about the benchmarks they
publish.  It's a reasonable Ruby benchmark.

Charles: It's very early days, we want to temper the excitement, this
is lab project, research project with a bunch of Phds trying do this
stuff, probably not something we're going to see in production any
time soon, we're trying to find every possible way to name JRuby
faster, making Ruby faster for you all to use. You can play wit on
JRuby master, there's a specific VM you want to down loud, a modified
version, if you take a look at Chris Seaton's Blog, he has all the
information if you want to play with it and see what the next
generation JRuby might look like.

Tom: So up to this point, we rally only talked about that JVM provides
for us, bewe haven't talked about anything that JRuby provides for
you. So, let's talk about one of the bigger features. In JRuby you can
go and pull any Java class and interact with it and for ‑‑ sake of a
better term, pretend it's a Ruby class that you're interacting
with. So, let's just go through a little sample. There's a technology
called JavaFX, which is kind of pimped out new GUI framework, and
here's a clock example. And in this example, I changed the syntax in
the minimal amount from Java to Ruby just to get it to run as Ruby
syntax. So, here's three little snit ets we'll look at. The first one
draws the minute hand, creates the path, sets it to fill with a black
color, starts a point, does this little round things up towards the
center, draws down to radius and then it completes itself and goes
back up to the point, you can see it makes a try Angular hand hand,
then we specify what's going to rotate. In the middle we implement a
Java interface called event handler, to satisfy that, we just include
it, and then we define the method that we need, which is handle. And
at the bottom in Java FX you have to set up a timeline for any action
you want to perform, in this case we're going to indefinitely, once
the second create a new refresh handler. And then we're going to call
play and make t work.  I put some tabs in tap in here to intend stuff,
though I love tap. So the first thing we do is JRuby allows you to
short hand method names in the previous slide here we had get
elements, here we can just shorten that down to elements, this is
already starting to make things look a lot more Ruby‑like. So, the
next thing we can do is we can similarly change setters, so, instead
of set fill, now we can just do fill equals black and starting to get
better and better. Case names don't look very nice in Ruby, we allow
you go in and time snake case name and dispatch to the proper method
in java. And, we have this really cool feature called implicit closure
conversion, so, this key frames add expected that interface called
event handler, where we can pass it a block and JRuby well make sure
that it is an vent handler, now we got rid of that middle snippet of
code all together. And because some things are so common, like Java
Util collections we annotate those classes with Ruby methods to make
it duck type or appear the be something like an array, we have a less
than less than method instead of add. So I think, arguably you can
look at this nit et of code and have no idea that this was actually
interacting with Java classes, it looks just like Ruby Code. Of so, I
work in another project called Purugin, that's how you would spell
that out in Romagy and Japanese. It's a mine craft modification
framework. It's built on top of a Java framework called bucket.

Charles: Any mine crafters here ‑‑ yeah, of course

Tom: There's a few closet mine crafters in here. In the code base is
almost a hundred percent Ruby.  I think just a few lines to bootstrap
nit Java, but most of the code is just adding a block syntax for some
of the methods to make it nicer and some routines to go and change
like Ruby symbols to a Java Enum to make t feel more like Ruby. Very
small methods and took very few methods to make it appear nice, but we
need some eye candy, so, this is a Mod where you can go and change
what comes out of an egg and how many things come out of an egg. Right
now I'm throwing lots of eggs, every time I throw it fifty chickens
come out. This is a really great world to destroy your world in mine
craft (Laughing) I thought, oh, crap what am I going to do now, so I
went and changed it from 50 chickens to 50 wolfs, I thought they would
eat the chickens, then they didn't eat the chickens, soy had twice as
many animals so I had the wipe out the world. So, here's what this
plug‑in works like, or Prugni, I don't think ‑‑ Purugin, I don't think
you could tell it's Java, this e.hatching equals true is E.set
hatching, most of the is calling into Java you can't tell till you get
a stack trace (Laughing) ignore the man behind the curtain J

Charles: Talk a little bit about performance of JRuby in general. We
showed this before, there's teams of folks working on the JVM to make
it faster for everybody, we get a lot of that for free, we continue to
work on JRuby too. This is the same benchmark on different versions of
JRuby but the same JVM version, we've made massive improvements and
performance over time. The addition of a GII that compiles down the
JRM byte code. At that point JVM was able to optimize the Ruby Code
along with Java code. Of the other thing that we fixed around here is
that the originally we did support all of the features of ObjectSpace
being able to walk through all objects in memory, move that overhead
ended up giving us this big performance boost. People complained we're
not supporting all of Ruby, it's an MRI specific feature the be able
to walk every object at any time. One of the problems we had with it
is in order to be able to walk all these objects we needed to track
them in a separate structure that was constantly being updated and
created lots of temporary objects. So running on this on JRuby 1.0
lots of time wasted on these objects and all of the gashage collection
happening for them. Way too much overhead, we started to realize we
oar not going to be able to support that feature. When we got rid of
it, pretty much every iteration of that very heavy garbage collection
benchmark, there was one garbage collection that would run for, you
know, thousandth of a second, took almost no time. The other big boost
that we got here, as you see from 168 to 17, this is a new JVM
feature. And the JVM feature was add in the the Java 7 time frame
called invoke dynamic, the JVM folks worked with us for a couple of
years to design a new byte code for JVM that would allow us to
optimize Dynamic Languages as well as java, generally we're talking
three to five times performance just by having invoked dynamic on the
JVM, now, again, it's still kind of settling, still working on some of
the optimizations they've been working on Java for so many years that
they new things that Ruby does that we need them to kind of work on at
the JVM level, it's looking really awesome so far, we're continuing to
improve over time.  Tom of the. So when we get back from Germany,
probably in about a week, the next version of JRuby will be out
1.7.14, this summer we planned on releasing JRuby 9000, when you say
summer, you always mean the end of summer, but, things haven't went as
fast or as quickly as weed like, so we plan on a holiday release, this
really isn't the code name of JRuby 9000, but, I love Krampus. So
... all right, so that's all we have. We are going to be around again
tomorrow, of course, and leave to hear from you, if you're running
JRuby for an application or if you're looking to make a move, we are
always standing by to help, we're on the JRuby IRC channel, pretty
much every day on free node, so, come and grab us here and find us
on‑line.  And, if anyone wants to go the beer festival, there's a
eurucamp activity and we're going to be meeting out front side of this
door at 12:30, sign up, there's only 9,69199 slots left,
so. (Laughter) All right, thanks very much (. Applause)

Charles: Looks like we have about five minutes for questions.  Are you
ware of any ‑‑ say I want to migrate an application from M rivet the
JRuby, is there anything that I should look at in terms of both
capabilities and performance?

Charles: What extenses are you use, so many extensions have been
written for JRuby, to work around performance problems GC issues that
most application has at least one or two in it. Usually, these days
there's a JRuby equivalent or the extensions have been written so they
have a JRuby version as well. But that's usually the first
Gotcha. Other than that, that's the main one as far as compatibility.

Tom: Sometimes if you're using something like Fork or you is some
background processing thing, that might be a Gotcha. I wanted to
expand your question and talk about something else ‑‑ (Laughs) that's
if you're going to move to JRuby you might want to take advantage of
multi‑threading and con currency. If you take a Rails application you
want to spend a little extra time and basically enable thread‑safe
mode and instead of having multiprocess con currency for your
application you'd switch to multi‑thread con currency. So that is an
extra activity that you do, but it has such a high pay off that it's
usually the next step once you get it running.  I have a code base
that's really simple and single threaded and it's slower than on C
Ruby, just wondering if that's based on maybe astring usage, of too
much string. Is that a possibility?

Charles. .  What did he say?

Tom: You were talk about string performance?  We can take that off
line, if you prefer.  All right, sorry.  Better be a good question.
All right so we had some applications running on JRuby, did
successfully, mainly for performance reason, this was actually
great. But one thing that was kind of problem pattic was the start up
time of the JVM, especially when unit testing, because, especially if
you put a lot of effort in to making your tests really fast and the
JVM kind of meet needs a second or whatever to boot up, that breaks
your TDD cycle a little bit, are you aware of this problem or working
at this kind of?

Tom: I think we can both speak to this one a little bit I've been
going to work to speed up the parser recently, and I was also working
on another exper Minnesota tall feature, which I goal back to once
9000 is out, which billion allow you to save and intermediate format,
like come pile ago.O file, that should be faster, not only should it
be faster it should load optimized code faster so it should warm up
faster as well. But, Charles just got back from the JVM language
summit. So ...

Charles: It's definitely the number one issue we're working on, we
understand it's very difficult for people. The first thing I would
recommend, there's a Wiki page, if you search for JRuby start up time,
it's the top hit on Google. It will have a list of things that you can
do, some tuning flags, some extra tools that will help with start up
time. We also very recently released in JRuby 1.7.12 a dash, dash Dev
flag that will turn on a bunch of those settings for you. For most
application it's at least twice as fast to start up when you use those
flags. As far as the JVM language summit, met with a bunch of folks
that work on JDK and the inner parttion of JVM, once I told them start
up time was our number one complaint, they said send us your cases
we'll see what we can help you figure another why we're not starting
up the way we should is potentially in Java 9 the ability to
pre‑compile in an application down to native code so you don't have
that cold start up and warm up time in applications, lots of cool
things coming, like I say, look at the Wiki, those tips will help
tremendously with start up, and then we'll continue to work on it, on
our end.  Okay, thank you a lot .

Charles: Anything else?  It's high noon. All right, thanks a lot all.

(Applause)

Thanks, it's working. This one ‑‑ yeah.
