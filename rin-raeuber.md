---
title: Let's build a game with Ruby
speaker: Rin Räuber
---

We need just one, two minutes for Rin to prepare.

Okay, guys, I wanted to invite Rin, Ruby developer, of course, she
will tell us how to build 2‑D games. Using gosu library from the first
line of code to the play ball game, so, Rin (Applause) Good
morning. Oh, I should probably use this, right. Okay, that
works. Awesome.

So good morning! Yeah, my name is Rin, I like Ruby and tea, and I'm
talking about games, so, everybody lovers games, right, so who has
written a game in Ruby this year. ‑ That's that's actually three
persons, that's cool, why didn't you all write a game in Ruby?
Because games are written in C++ right, or in Java or in some other
non‑ruby language, right?

... no, grumpy cat says no, because there's this thing called GOSU,
with it you can write games in Ruby. And, it's actually easy to write
a game with it. And to prove that I did this crazy thing and proposed
a live coding talk that I now have to do. (Laughing) so, like before
we do that, just one basic thing, if you've never created a game to
give you an idea where to start, one way would be you have this window
and it has, I don't know a run method where there's an endless loop
between where it calls an update and a draw method in an endless loop
and in an update you would do things like update the state of your
player and of your world, yeah, and draw wow would basically draw, so
and another thing that got me confused and, yeah, is we have a
coordinate system, yeah, vertical, X, no vertical Y accesses,
horizontal X access and the difference to the coordinate system you
use in the school, the origin, 0.0 is in the top left corner, if you
move down you to increase Y, just something to keep in mind. Like
another node, collection detection, if you want to know when this red
ball hits the green ball, one really primitive way to do it, is to
look at the distance between these. So, like, if the distance is zero,
then, obviously they like totally overlap, and if the distance is
smaller than the sum of the radius of these two, then they almost
touch and as soon as it's smaller than that, they touch, so, that's
just some me‑explanatory stuff. Okay, live coding time, now I have the
problem that I need two hands. (Laughing) (Applause)

Thank you. Okay, that's- now it's like in a cooking show, where I
have something prepared here ... so, okay, let me just briefly explain
that we have this Gozu window object, and it's in extractor you just
give it width and height of the window and whether or not it's full
screen, okay. Yeah, I guess the rest is pretty self explanatory. Let
me just, I told you about this draw and this update method. And now I
will just run that thing. First you can see this window now. Which is
kind of hard to see because my terminal's black, but, okay, you can
see that there's like update and draw called all the time. Of 6 okay,
yeah, obvious first thing we want to do is we want to have a player,
so, let's just create player, classic object oriented style. I'm going
to show you now how you draw an image with Gozu. Yeah. If - Gosu,
there's Gosu image, you parse it - no, you parse it the window, and
just the path to the image which here is media player PNG, okay, then
we want our play tore have a draw method where we just draw that image
at some coordinates.

Okay. Yeah, now I create player parse it, the window. And here I want
to draw it, come on ... of here, as I cede, need the parse the window.
I think this should draw a player. Yeah, obviously, I like pugs,
too. Okay, well, that's the beginning, but, we probably want the move
that player, right, so that's where the update function comes into
play, that's where you do user interaction so yeah, let's add, like,
let's make the Y position of the player a variable - oh, no, I - set
it to something, and use nit the draw function and then make it
accessible so we can set it, okay, so, Gosu provides very useful
things like if you want to check whether a button is pressed you just
do button down and then there's - that's like the down - the up arrow,
yeah. Same thing for keyboard down, and then we want to set like just
set the Y of the player, like, maybe for up decrees it by ten and for
down increase it by ten and there's an end missing here. Yep, that
looks as if it could work. All right, I can move my player. Oh, but
there's one problem, you see, with can move out of the bounds of this
window, which is kind of stupid, so, let me Inc. which that so, when
we go up we want to increase it - no decrees it by ten, but the lower
bound should just be zero and same thing here increase it by ten, but,
the width- the height of the window is 600 okay, now we get stuck at
the top and at the bottom, because it's like, when you draw an image
the position is the top left corner, this probably needs to be 500
because the image has a height of 100 and then it looks right. Yeah,
okay, beautiful. Now you would say like the next obvious part would be
like to move horizontally, but actually we're going to cheat and like
make this a side controller, so we're going to draw a background and
move that so that it looks as if the player is moving. Yeah, let's
draw a become ground, we already know how to draw an image, let's all
just stuff we know, and obviously I don't know my keyboard, but that
doesn't matter. And then we're going to draw it - okay. Background.
Okay, I told you that we want to move this, so I'm just going to
introduce a variable called background X that is the X value and it's
set to zero, and I'm going to use it here and then maybe we have
something called scroll background where we just of decrees this thing
so that the background moves to the left. I should also in the update
function call the scroll background. Now we have a scrolling
background, awesome, but, that didn't last long. Does the code of
conduct allow the obvious, a that's what she said... (Laughing)

The trick is that we reset the background X to zero like if it reaches
in this case, minus 600, and you just have to believe me that the
background image repeats after 600 pixels, so that's whole thing about
it. Awesome, so that's already all most fun. (Laughing) but we're a
little lowly there, so I think we totally should have an enemy. So
because I'm lazy I'll just copy this whole player class oops and call
it enemy. Also use enemy picture there. And maybe I want to draw nit a
different position, I don't know. Okay, and then create it there enemy
Na Na Na and of course, draw it. Of okay, enemy. Seems a little
unfair, like, pug head against death star ... yeah, but this enemy is
kind of boring, it doesn't do much, so, I think this enemy should have
a move method. Like, for starters, let's just move him on the X access
yeah, so I will give him an X coordinates, that I use here if and then
I'm just- I don't know, maybe decrees X by ten and call enemy move
here an update and now he's moving, oh, but now he's gone ... yeah,
okay, we already know this trick, let's just reset the X if it's
smaller than zero like to what ever, 500

Okay, now - now that's a little stupid, he should probably start
somewhere like on the - like right outer part of the screen, so, since
the screen is of - maybe something here. And we should also do it like
that, because, yeah, as I said, the image has a width of 100 and
that's already nice, but, yeah, the thing is that nothing happens if I
touch it, right, so … we need a clicks detection.

Now,- Collision detection, so Gosu has this distance method where you
parse in X and Y coordinates of two objects. So, to make this work
first my player also needs an X coordinate. And the enemy needs an
accessible X like that. And it already has X and Y, okay. Okay, so, as
I cede, when this distance is smaller than sum of the radiuses, then
they touch probably.  It's a little unprecise, but, yeah. no, that's
correct, actually. What happens if they collide, let's play a sound,
that's also super easy, I have some crash sounds prepared. It's the
same thing with all the media stuff. And then in my update function I
well check for collision and play that sound so crash sound play if
our player collides with our enemy. Okay, now I probably have to -
it's a horrible sound so - no, don't even do that. (Laughing) see,
what I mean. So this totally seems to work. No further demonstration
needed. (Laughing) yeah, awesome, now, we almost have a game, the next
thing would be yeah, it gets sort of boring after a while because the
movement of the enemy is not exactly- I don't know, unexpected, so
now I have to cheat a little and look up this thing because I made up
a nice little formula to just like change the Y value for the enemy
here. Like, so I use Sinus so it will make a nice little curve. Yeah,
I think I can actually use it just like that. Unless I just stay here,
Huh - good, that's the way I play games. Awesome, okay, of now the
obvious next thing to do would be to add more enemies, and maybe I
don't - yeah ... the funny thing is, actually, when I practice this,
this whole part coding this already was half an hour, so now I have to
improvise and I will do that by - I mean this is a strip down version
of something that I did on my vacation, so the whole thing I did -
here I added different enemies, and actually I used to same picture but
drew them in different colors.  I will just kill the sound. And what
else I added was that you have a velocity and you can like get faster
and like the velocity is kind of like a global velocity so (Laughing)
everything moves really slowly. So, it's perfect to play it like maybe
when you're drunk, I don't know (Laughing) or when you like, somebody
puts some speed in your drink, you can like play it this way. So,
like, yeah ... yeah, I mean I will just show this code, because I will
not live code all of that. We make it a little smaller. Oh, no,
actually make it bigger. So, p what is new there?  Yeah, we have like
accelerate and decelerate, and for the movement of the enemies, I
just made up these three functions.  I mean, yeah, obviously, two of
these are like nice Si N and Cos curves and the other ones are just
like moving diagonally. Yeah, and then will's like nice stuff, like
you can have them the image rotate and that's just - yeah. Okay. Of
course, all of this is on‑line, back to - no, . So, now it's your turn
to write a game.

And like I can hear some of you say, like, but Rin we're programmers,
not designers, and obviously I am too. But, the internet is here to
help, and there's like all this awesome stuff on‑line that - like when
you Bruce this it will already inspire you the want the make an image,
for example, RPGs, which I already really love, there's super cute
tile sets, and, like, the little Sprites for all your items, and, I
don't know, spaceships, whatever. So, you can use all these and as you
saw, like drawing this stuff is super easy with Gosu, and, my slides
are on‑line and the code is too. There's also really good stuff to
like check how other people do this like collision detection if you, I
don't know if you look at the Androids clone. If you want to do more
advance stuff, and that's what I hope the try next, there's this
gamebox library- oh, I'm can take it, sorry. (Applause) thank you,
thank you very much T a gamebox library where you kind of define
business rules for your game, like what happens when ... and I think
that's probably something that enables you to do advance stuff, like
RPG, so I'm totally - I decided I want to try like make an RPG and not
just some stupid side scroller, so I'm going to try that and maybe you
will hear about it in some user group some day.  I think now we have
to make a Q and A session, because my talk was actually faster than I
anticipated.

Any questions?

Could you tell us a little bit how you
came to start using Gosu and what other game frameworks - what's the
background.

Rin: If story is that I was like, actually- if you read the text
about this talk on the web site, it was actually that like my Twitter
timeline keeps doing stuff like Ludan Dala and I'm sitting there,
being like, oh, man, I would like to do a game too, like, I'm just
really good at Ruby and I don't want to learn this other stuff to make
game because it's ugly and not elegant and I'm Lazy and this Gosu game
came up, there's some other stuff too, but for this topic, like, yeah,
obviously live coding a game was really easy to start with, like I
think you can also teach this to kids or something because take an
image, draw it, move it around is super easy. But, of course, now that
I got started with it, I think yeah, I want to do more advanced stuff,
and of course, like, if you just, like, try to build an RPG with just
Gosu that would probably suck, and you would probably write your own
game framework around it. But there's also other libraries that work
with Gosu, like a physics library, I didn't have the time to check it
out. And I didn't do anything with really physics, so, yeah, there's
this stuff, and you should check it out.

Other questions?

Do you have any comments on garbage collection in Ruby?  Like

Rin: I don't know anything about that. So, yeah, it's a good question,
how good would this work if you had - yeah, like a world with a lot of
of objects, images, whatever. Yeah, and where you couldn't do all the
tricks about reusing all the enemies all the time where you have a
really big world, I have no idea, maybe will find out. Okay.
(Applause)


Thanks, Rin, we have a coffee break till 11, so take a break.
