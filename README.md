xpost
==========
It's a tool in shell script to produce the output - a legal post file in jekyll.<br/>
The script will format text file into html and automatically add header / footer as setted.<br/>
<br/>
Edit content_template to fill in new post,<br/>
and run ./xpost.sh to produce html page,  see usage picture for detail<br/>
<br/>
the content automatically translates:<br/>
/b text b/ : <b>text</b><br/>
/i text i/ : <i>text</i><br/>
/u text u/ : <u>text</u><br/>
/t text : to padding 4 space<br/>
and, support &lt;pre&gt; &lt;/pre&gt; tags to be not translated.<br/>
<br/>
the basic control flow is as follow:<br/>
<img style="width:600px;" src="http://www.xchenny.com/img/xpost/usage.png" />
<br/>
------------<br/>
written by Chenny Xie<br/>
contract me : xie.chenny@gmail.com <br/>