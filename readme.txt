It's a tool in shell script to produce the output - a legal post file in jekyll.
The script is written by myself, which will format text file into html and automatically add header / footer as setted.

Edit content_template to fill in new post,
and run ./xpost.sh to produce html page,  see usage picture for detail

the content automatically translates:
/b text b/ : to be bolder
/i text i/ : to be italic
/u text u/ : to decorate as underline
/t to padding 4 space
and, support <pre></pre> tags to be not translated.

------------
written by Chenny Xie
contract me : xie.chenny@gmail.com 