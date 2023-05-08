# mbox-extract
this program opens .mbox files and extracts all attachments


now I extracted a bigger mbox and got the error below. shall we skip unreadable files? catch this error somehow and then proceed?

Errno::ENOENT: No such file or directory @ rb_sysopen - /Users/chris/Desktop/mbox extract/output/annalena/RE-2023/01-2217.pdf
---< backtrace of Ruby side >-----
/Users/chris/Desktop/mbox/extract_attachments.rb:17:in `initialize'
/Users/chris/Desktop/mbox/extract_attachments.rb:17:in `open'
/Users/chris/Desktop/mbox/extract_attachments.rb:17:in `block (2 levels) in extract_attachments'
/Users/chris/Desktop/mbox/extract_attachments.rb:12:in `each'
/Users/chris/Desktop/mbox/extract_attachments.rb:12:in `block in extract_attachments'
/Users/chris/Desktop/mbox/extract_attachments.rb:9:in `each'
/Users/chris/Desktop/mbox/extract_attachments.rb:9:in `extract_attachments'
extract_attachments_gui.rb:64:in `block (2 levels) in <main>'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1430:in `eval_cmd'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1430:in `cb_eval'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1385:in `call'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1582:in `block in callback'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1581:in `catch'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1581:in `callback'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1798:in `mainloop'
/Users/chris/.rvm/gems/ruby-3.0.0@beautyme/gems/tk-0.4.0/lib/tk.rb:1798:in `mainloop'
extract_attachments_gui.rb:76:in `<main>'
---< backtrace of Tk side >-------
    invoked from within
"rb_out c00003"
    invoked from within
".w00007 invoke"
    ("uplevel" body line 1)
    invoked from within
"uplevel #0 [list $w invoke]"
    (procedure "tk::ButtonUp" line 23)
    invoked from within
"tk::ButtonUp .w00007"
    (command bound to event)


