xpost
==========
It's a tool in shell script to produce the output - a legal post file in jekyll.
The script will format text file into html and automatically add header / footer as setted.

Edit content_template to fill in new post,
and run ./xpost.sh to produce html page,  see usage picture for detail

The content automatically translates:
/b text b/ : bolder
/i text i/ : italic
/u text u/ : underline
/t to padding 4 space
and, support <pre></pre> tags to be not translated.

The "usage.png" picture may be more understandable.

------------
written by Chenny Xie
contract me : xie.chenny@gmail.com