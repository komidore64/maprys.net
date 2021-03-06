Date: 19 May 2014
Categories: website, nesta, nitrousio, ruby
Summary: Find out what tools I've used for creating maprys.net 2.0.
Read more: tell me more about some cool new tools

# New Website

I decided to rewrite my website because it was due for an overhaul. The previous homegrown website that I had written would only go so far. It was mostly PHP and JavaScript (eww).

Welcome to **maprys.net** 2.0! I've used [Nesta CMS](http://nestacms.com) for the framework of the new site. It's written in Ruby (which I'm very comfortable with) so It's easily modifiable if I'd like to change bits and pieces.  I've worked on the site exclusively using [Nitrous.io](https://www.nitrous.io/join/Ne4RmyEvhD8?utm_source=nitrous.io&utm_medium=copypaste&utm_campaign=referral); it's turned out to be a great cloud-based development environment that can be used for free.

`nesta` is a swanky little CMS where you just create a new file for every new article/post you want to add, so there's no database to fool with. It's very simple. To get started all you have to do is install the gem and tell `nesta` to generate a new project for you:

```
gem install nesta
nesta new mysite.com
# from http://nestacms.com
```

Cool!
