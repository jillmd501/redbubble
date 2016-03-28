## Redbubble Test Site

![redbubble](http://i.imgur.com/zlk3bo1.png)

This project was created to produce a batch processor that takes the input file and produces a single HTML file.

The index HTML page contains:

* Thumbnail images for the first 10 work
* Navigation that allows the user to browse to all camera makes

Each Camera Make HTML page must contain:

* Thumbnail images of the first 10 works for that camera make
* Navigation that allows the user to browse to the index page and to all camera models of that make

Each Camera Model HTML page must contain:

* Thumbnail images of all works for that camera make and model
* Navigation that allows the user to browse to the index page and the camera make

Run the following command to run the processor:

```
ruby data_parser.rb
```

Run the following command to run the test suite:

```
rspec
```

Sources used:

* http://apidock.com/ruby/ERB
* http://www.nokogiri.org/tutorials/searching_a_xml_html_document.html
