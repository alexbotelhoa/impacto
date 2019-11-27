ASPMAILER.ASP by Tom Germain 
Version 1.0
Copyright 1998-1999 
http: //www.cgiware.com 
tg@cgiware.com   

**Visit  Site  for  latest  version  and  other  freeware**   

0 - DISCLAIMER and WHAT NOT   

This  is  freeware  -  Use  at your own risk. No  warranties 
provided.  Redistribution  of  this program, in whole or  in 
part,  is strictly prohibited without the expressed  written 
consent  of  the  author.  Custom  programming available  on 
hourly fee basis.   

1 - What is aspmailer?   

Aspmailer  is  a  straightforward  form  mailer with an  eye 
towards  secure behavior and some useful output  formatting. 
Your  visitors fill out the form and submit it. From  there, 
the form data is emailed to an address you designate  within 
the asp script. You can use it with any form (exception made 
of file uploads), so it's quite flexible as well.   

2 - Aspmailer's requirements   

If  you're hosted (or hosting) on an Windows NT server  with 
iis  4.0  or higher and asp 2.0 or higher, you can use  this 
script  rather  than  tgmail.pl.  In  fact, this one is  the 
better choice nowadays, since it doesn't need to connect  to 
a friendly mail relay to do its job, and doesn't require the 
overhead associated with running perl scripts.   

If  you  aren't  sure  if your system supports this  script, 
install  it  and  run  it.  It checks whether the  scripting 
engine  version  is correct and whether or not the  required 
components are available.   

3 - How to install aspmailer   

Unpack  the  zip  file using either Winzip or Pkzip.  Upload 
aspmailer.asp  to  your cgi-bin directory, or any  directory 
where  active server pages can be executed. Upload the  form 
(mailform.html)  to  wherever you want it to be accessible.   

4 - How to configurate the mailer form   

Mailform.html is just a sample form. You can customize it or 
use  any  existing  form, but either way make sure the  form 
"action" attribute points to the correct location of the asp 
script (Ex: action="/cgi-bin/aspmailer.asp").   

In  the  form  itself,  you can optionally add a few  hidden 
items:   

TGrequire:  This hidden input's value can contain a list  of 
the  form items you want to force user input for. Each  item 
of the list should be the exact input name. Use commas (,  ) 
to separate the list items.   

<input type="hidden" 
                 name="TGrequire" value="name,address,city">

In  the  example  above, this would cause the asp script  to 
check  the  inputs named "name", "address", and "city",  and 
return an error if any was empty.   

TGorder: This hidden input allows you to tell the asp script 
how  to  sort  the  form  inputs in the email. For example:   

<input type="hidden" name="TGorder" 
                                  value="name,address,city">

In  the  example  above, this would cause the asp script  to 
send a letter with the input named "name" on the first line, 
the input named "address" on the second line, and "city"  on 
the  third  line. For example, a user submitted the form  in 
the  previous  example, the letter sent would be  structured 
like this...   

name=Bob  
Jones address=10 
Nowhere Street 
city=NowhereVille   

Note  that  if  you  do give TGorder a value, only the  form 
items  it  lists  will  be  sent, the rest being discarded.   

TGsubject:  This  hidden  input  allows you to tell the  asp 
script what to put on the Subject line of the email. If  you 
use  several  different forms, having a different  TGsubject 
value allows you to quickly identify which form was submitt- 
ed. For example:   

<input type="hidden" name="TGsubject" 
                                   value="Form 1 Submitted">

The  subject  can also be set within the script itself.  See 
"How  to  configurate the script" section for more details.   

TGredirect:  This  hidden  input allows you to tell the  asp 
script to redirect browsers to a page of your choice upon  a 
successful form submittal. For example:   

<input type="hidden" name="TGredirect" value="/thanku.html">

In the above example, browsers will be redirected to a  page 
in the root directory of your domain, called  "thanku.html". 
A  redirect  can  also be set within the script itself.  See 
"How  to  configurate the script" section for more details.   

5 - How to configurate the script   

Typically,  an  asp  file  is  a combination of a  scripting 
language  and  html.  In  the  case  of  aspmailer.asp,  the 
scripting  language  is  VBscript.  You  can add html to  it 
between the comments tags "Put your html here".   

Some  html  in  aspmailer.asp  will only appear if an  error 
occurs,  while  other  html  will  only  appear  if  a  form 
submission is successful. Additionally, if a form submission 
is successful, the can be redirected to the url contained in 
the  TGredirect hidden input (see previous section), or  the 
strRedirect  variable  (see further on). Otherwise, html  in 
the  script  file  itself  will be fed back to the browser.   

There  are  few  variables  you can assign values to  inside 
aspmailer.asp.  You'll  find these variables clearly  marked 
and  commented  in  the script itself. strRcpt: This one  is 
mandatory.  It  must  be set to the email address that  will 
receive  the  form  data. For example, if you want the  data 
sent  to  bob@gdghjk.com,  you  would  give  it  the value:   

strRcpt = "bob@gdghjk.com"   

strFromVar:  This  optional variable allows you to select  a 
form  input  by  name as the return address of the  message. 
This makes it possible for you to receive the form data  and 
reply immediately to the true sender's address. For example, 
if  your form contains a variable called email, you can  use 
its  value as the reply-to address by setting strFromVar  as 
follows:   

strFromVar = "email"   

strDefFrom:  This  is  the  default  "From"  address. It  is 
required, as no message should be sent without an originati- 
ng  address.  It  can be a fake address, but it should  have 
valid syntax or it will trigger a runtime error.   

strDefSubject: This variable is optional. If TGsubject isn't 
set  in the form, strDefSubject's value will be used as  the 
subject  line  instead. The advantage of using TGsubject  is 
that  you  can  have  many  different  forms that caould  be 
identified by their subject.   

strRedirect: This variable is optional. If TGredirect  isn't 
set in the form, strRedirect's value will be used as the url 
the  browser will be sent to if a submission is successful.   

*****   

Thanks for using aspmailer!   

- Tom Germain, November 1998   


