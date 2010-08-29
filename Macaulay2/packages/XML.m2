-- -*- coding: utf-8 -*-

newPackage("XML",
    	Version => "1.0", 
    	Date => "July 13, 2009",
    	Authors => {{Name => "Dan Grayson", Email => "dan@math.uiuc.edu", HomePage => "http://www.math.uiuc.edu/~dan/"}},
    	Headline => "an XML parser",
    	DebuggingMode => false)
export {"XMLnode", "tag", "children", "parse", "toXMLnode", "Trim", "toLibxmlNode", "getChildren", "getAttributes"}
scan(pairs Core#"private dictionary", (k,v) -> if match("^(Lib)?xml[A-Z]",k) then (
	  XML#"private dictionary"#k = v;
	  export v))

getChildren = method(TypicalValue => VerticalList)
getChildren LibxmlNode := node -> VerticalList (
     c := xmlFirstChild node;
     while c =!= null list first (c, c = xmlGetNext c))
getAttributes = method(TypicalValue => VerticalList)
getAttributes LibxmlNode := node -> VerticalList (
     a := xmlFirstAttribute node;
     while a =!= null list first (a, a = xmlGetNext a))

XMLnode = new Type of MutableHashTable
net XMLnode := n -> (
     attributes := concatenate apply(pairs n, (k,v) -> if instance(k,String) then (" ",k,"=",format v) else "");
     top := "<" | n.tag | attributes;
     if n.?children then (
	  cn := apply(n.children,c -> if instance(c,String) then format c else net c);
	  if #attributes === 0 and all(n.children,c -> instance(c,String)) then concatenate(top," ",between(" ",cn))
	  else stack(top,"  " | stack cn))
     else top)

nonnull = x -> select(x, i -> i =!= null)
trimwhite = s -> (
     s = replace("^[[:space:]]+","",s);
     s = replace("[[:space:]]+$","",s);
     if s =!= "" then s)
trimopt := identity					    -- not re-entrant!
settrim = opts -> trimopt = if opts.Trim then trimwhite else identity
toXMLnode0 = node -> (
     if xmlIsElement node then (
	  attr := xmlFirstAttribute node;
	  child := xmlFirstChild node;
	  new XMLnode from splice nonnull {
	       symbol tag => xmlGetName node,
	       if attr =!= null then toSequence (
		    while attr =!= null list first(
		    	 xmlGetName attr => ( c := xmlFirstChild attr; concatenate while null =!= c list first( xmlGetContent c, c = xmlGetNext c)),
		    	 attr = xmlGetNext attr)),
	       if child =!= null then symbol children => nonnull while child =!= null list first(toXMLnode child, child = xmlGetNext child)
	       }
	  )
     else if xmlIsText node then trimopt xmlGetContent node)
toXMLnode = method(Options => { Trim => true })
toXMLnode LibxmlNode := opts -> node -> (
     settrim opts;
     toXMLnode0 node)

net LibxmlAttribute := x -> xmlGetName x | " = " | net xmlFirstChild x

net LibxmlNode := x -> (
     if xmlIsText x 
     then net format toString x
     else net toString x)

LibxmlNode#{Standard,AfterPrint} = x -> (
     << endl;				  -- double space
     << concatenate(interpreterDepth:"o") << lineNumber;
     << " : " << class x;
     if xmlIsText x then << " (text)";
     if xmlIsElement x then << " (element)";
     << endl;
     )

toLibxmlNode = method(TypicalValue => LibxmlNode)
populate = (d,x) -> (
     scan(pairs x, (k,v) -> if instance(k,String) then xmlAddAttribute(d,k,v));
     if x.?children then scan(x.children, child -> (
	       if instance(child,String) then xmlAddText(d,child)
	       else if instance(child,XMLnode) then populate(xmlAddElement(d,child.tag),child)
	       else error "unrecognized child type"));
     d)
toLibxmlNode XMLnode := x -> populate(xmlNewDoc x.tag,x)
parse = method(Options => { Trim => true }, TypicalValue => XMLnode)
parse String := opts -> s -> (
     settrim opts;
     toXMLnode xmlParse s)

beginDocumentation()

multidoc ///
Node
  Key
    XML
  Description
    Text

      This package provides an interface to the library {\em libxml2}, which is a parser for XML files.  The package
      offers two ways of representing the result: as an object of class @ TO LibxmlNode @, which is a pointer to the
      structure created and accessed by the library; or as an object of class @ TO XMLnode @, which is a hashtable
      containing pointers to similar objects and to strings.
      
      -- Conceptually, no matter which representation is used, each XML node has: a tag (which is a string that serves as a
      -- label or name for the node); a list of children (which are XML nodes) and content pieces (which are strings); and a
      -- set of attribute names (which are strings) together with corresponding values (which are strings).

Node
  Key
    XMLnode
  Description
    Text
      An object of class @ TO XMLnode @ is a hashtable.

    --  result:
    --    each node is a hash table of type XMLnode
    --    some keys are strings, representing attributes
    --    a special non-string key (symbol children) will provide the list of children (hashtables) and content pieces (strings), if there are any
    --    a special non-string key (symbol name) for the name of the node



Node
  Key
    (parse,String)
    parse
    [parse,Trim]
  Headline
    parse XML
  Usage
    parse s
  Inputs
    s:
  Outputs
    :
      the tree resulting from parsing {\tt s}
Node
 Key
  LibxmlNode
 Headline
  the class of all XML nodes created by libxml2
 Description
  Text
   Each XML node created by {\tt libxml2} has:
   if it is an {\em element} (as determined by @ TO xmlIsElement @), an optional element {\em name}, which is a string and is obtained with @ TO xmlGetName @;
   if it is {\em text} (as determined by @ TO xmlIsText @), an optional {\em content} string, obtained with @ TO xmlGetContent @;
   a linked list of {\em attributes} of type @ TO LibxmlAttribute @;
   a linked list of {\em children} (which are XML nodes), obtained with @ TO xmlFirstChild @;
   and a pointer its next {\em sibling}, obtained with @ TO xmlGetNext @.
   
   XML nodes are mutable.

   Let's use @ TO xmlParse @ to make an XML node.
  Example
   n = xmlParse ////<foo> aabc <bar id="foo" name="too"> asdf </bar><coo/><coo>hi</coo><coo a="b">hi</coo></foo>////
   xmlIsElement n, xmlIsText n
  Text
   Since it is an element, we may use @ TO xmlGetName @ to get its name.
  Example
   xmlGetName n
  Text
   We use @ TO xmlFirstChild @ to get the first node in the linked list of children, which happens to be text:
  Example
   c = xmlFirstChild n
   xmlIsElement c, xmlIsText c
  Text
   We may follow the linked list of children of @ TT "n" @.
  Example
   c
   bar = xmlGetNext oo
   xmlGetNext oo
   xmlGetNext oo
   xmlGetNext oo
   xmlGetNext oo
  Text
   Let's examine the attributes of @ TT "bar" @.
  Example
   xmlFirstAttribute bar
   a = xmlGetNext oo
   xmlGetNext oo
  Text
   We may disassemble an attribute as follows.
  Example
   xmlGetName a
   b = xmlFirstChild a
   xmlGetNext oo
   xmlIsText b
   toString b
  Text
   There are other functions that retrieve the entire list of attributes or children.
  Example
   getChildren n
   class \ oo
   getAttributes bar
   class \ oo
 SeeAlso
  xmlParse
  xmlFirstAttribute
  xmlFirstChild
  xmlGetName
  xmlGetNext
  xmlIsElement
  xmlIsText
  getChildren
  getAttributes
  XMLnode
Node
 Key
  tag
Node
 Key
  children
Node
 Key
  (toXMLnode,LibxmlNode)
  toXMLnode
  [toXMLnode,Trim]
Node
 Key
  Trim
Node
 Key
  (toLibxmlNode,XMLnode)
  toLibxmlNode
Node
 Key
  (xmlIsElement,LibxmlNode)
  xmlIsElement
 Headline
  whether an XML node is an element
 Usage
  xmlIsElement n
 Inputs
  n:
 Outputs
  :Boolean
   whether {\tt n} is an element
 Description
  Example
   xmlParse ////<bar/>////
   xmlIsElement oo
 SeeAlso
  xmlIsElement
  xmlGetContent
Node
 Key
  (xmlIsText,LibxmlNode)
  xmlIsText
 Headline
  whether an XML node is text
 Usage
  xmlIsText n
 Inputs
  n:
 Outputs
  :Boolean
   whether {\tt n} is a text node
 Description
  Example
   n = xmlParse ////<bar>hi there</bar>////
   c = xmlFirstChild n
   xmlIsText c
 SeeAlso
  xmlIsElement
  xmlGetContent
Node
 Key
  (xmlParse,String)
  xmlParse
 Headline
  parse a string containing XML
 Usage
  xmlParse s
 Inputs
  s:String
 Outputs
  :LibxmlNode
 Description
  Example
   xmlParse ////<foo>aabc<bar id="foo" name="too">asdf</bar></foo>////
Node
 Key
  (getChildren,LibxmlNode)
  getChildren
 Headline
  get the list of children of an XML node
 Description
  Example
   xmlParse ////<foo>aabc<bar id="foo" name="too">asdf</bar></foo>////
   c = getChildren oo
   class \ c
   xmlIsText \ c
   xmlIsElement \ c
Node
 Key
  (getAttributes,LibxmlNode)
  getAttributes
 Headline
  get the list of attributes of an XML node
 Description
  Example
   xmlParse ////<bar id="foo" name="too">asdf</bar>////
   a = getAttributes oo
   class \ a
Node
 Key
  (xmlAddAttribute,LibxmlNode,String,String)
  xmlAddAttribute
 Headline
  add an attribute to an XML node
 Usage
  p = xmlAddAttribute(n,a,x)
 Inputs
  n:
  a:
  x:
 Outputs
  p:LibxmlAttribute
   a new attribute with name given by {\tt a} and content given by {\tt x}
 Consequences
  Item
   {\tt p} is added to the list of attributes of {\tt n}
 Description
  Example
   n = xmlParse ////<bar>asdf</bar>////
   a = xmlAddAttribute(n,"foo","the value")
   xmlGetName a
   n
Node
 Key
  (xmlAddText,LibxmlNode,String)
  xmlAddText
 Headline
  add text to an XML node
 Usage
  m = xmlAddText(n,s)
 Inputs
  n:
  s:
 Outputs
  m:LibxmlNode
   a new text node containing the string {\tt s}.
 Consequences
  Item
   The new node {\tt m} is attached as the last child of {\tt n}.
 Caveat
  The list of children should not contain two adjacent text nodes.
 Description
  Example
   n = xmlParse ////<bar id="foo" name="too"></bar>////
   xmlAddText(n,"hi there")
   xmlIsText oo
   n
Node
 Key
  xmlGetName
  (xmlGetName,LibxmlAttribute)
  (xmlGetName,LibxmlNode)
 Usage
  xmlGetName n
 Headline
  get the name of an XML node or attribute
 Inputs
  n:
   @ ofClass{LibxmlNode,LibxmlAttribute} @
 Outputs
  :String
   the name of the node
 Description
  Example
   n = xmlParse ////<bar id="foo" name="too"></bar>////
   xmlGetName n
   xmlFirstAttribute n
   xmlGetName oo
Node
 Key
  xmlGetNext
  (xmlGetNext,LibxmlAttribute)
  (xmlGetNext,LibxmlNode)
 Usage
  xmlGetNext n
 Headline
  get the next XML node or attribute
 Inputs
  n:
 Outputs
  :
   the next node in the linked list, or @ TO null @, if there is none
 Description
  Example
   xmlParse ////<bar><a/><b/></bar>////
   xmlFirstChild oo
   xmlGetNext oo
   xmlGetNext oo
   xmlParse ////<bar id="foo" name="too"/>////
   xmlFirstAttribute oo
   xmlGetNext oo
   xmlGetNext oo
Node
 Key
  (xmlFirstAttribute,LibxmlNode)
  xmlFirstAttribute
 Usage
  xmlFirstAttribute n
 Headline
  get the first attribute of an XML node
 Inputs
  n:
 Outputs
  :LibxmlAttribute
   The first attribute in the list of attributes of {\tt n}.
 Description
  Example
   xmlParse ////<bar id="foo" name="too"/>////
   xmlFirstAttribute oo
 SeeAlso
  xmlGetNext   
Node
 Key
  (xmlGetContent,LibxmlNode)
  xmlGetContent
 Headline
  get the string content of an XML text node
 Usage
  xmlGetContent n
 Inputs
  n:
   a text node, as determined by @ TO xmlIsText @
 Outputs
  :String
   the content string contained in {\tt n}
 Description
  Example
   xmlParse ////<bar>hi there</bar>////
   xmlFirstChild oo
   xmlGetContent oo
   class oo
Node
 Key
  (xmlAddElement,LibxmlNode,String)
  xmlAddElement
 Usage
  m = xmlAddElement(n,s)
 Headline
  add an element to an XML node
 Inputs
  n:
  s:
 Outputs
  m:LibxmlNode
   a new node named {\tt s}
 Consequences
  Item
   The new node {\tt m} is attached as the last child of {\tt n}.
 Description
  Example
   n = xmlParse ////<bar></bar>////
   xmlAddElement(n,"a")
   xmlAddElement(n,"b")
   xmlAddElement(oo,"b1")
   n
Node
 Key
  (xmlNewDoc,String)
  xmlNewDoc
 Headline
  create the first node of an XML document
 Usage
  xmlNewDoc v
 Inputs
  v:
 Outputs
  :LibxmlNode
   a new XML document
 Description
  Text
   The argument is the XML version number.
  Example
   xmlNewDoc "1.0"
Node
 Key
  xmlFirstChild
  (xmlFirstChild,LibxmlAttribute)
  (xmlFirstChild,LibxmlNode)
 Headline
  get the first child of an XML node or attribute
 Usage
  xmlFirstChild n
 Inputs
  n:
   @ ofClass{LibxmlNode,LibxmlAttribute} @
 Outputs
  :LibxmlNode
 Description
  Example
   n = xmlParse ////<bar a="123"><foo/></bar>////  
   xmlFirstChild n
   xmlFirstAttribute n
   xmlFirstChild oo
 SeeAlso
  xmlGetNext
Node
 Key
  LibxmlAttribute
 Headline
  the class of all XML attributes created by the library libxml
///

undocumented {
  (net,LibxmlAttribute),
  (net,LibxmlNode),
  (net,XMLnode)
  }

end

{*
this parser is a failure because Parsing doesn't provide lookahead at all!:

needsPackage "Parsing"
returns = t -> s -> t
second = s -> s#1
idP = concatenate % +letterParser
ampP = returns "&" % constParser "amp"
ltP = returns "<" % constParser "lt"
gtP = returns ">" % constParser "gt"
aposP = returns "'" % constParser "apos"
whitespace = * orP(" ","\t","\n","\r")
quotP = returns "\"" % constParser "quot"
entityP = second % andP("&",orP(ampP,ltP,gtP,aposP,quotP),";")
nonquoteP = new Parser from (c -> if c =!= "\"" and c =!= null then new Parser from (b -> if b === null then c))
stringP = concatenate % * orP(entityP, nonquoteP)
quotedstringP = (s -> s#1) % andP("\"",stringP,"\"")
pairP = (s -> s#0 => s#2) % andP(idP,"=",quotedstringP)
pairsP = * (first % andP(pairP,whitespace))
tagstartP = (s -> prepend(s#1,s#3)) % andP("<",(s -> symbol tag => s) % idP,whitespace,pairsP)
tagP = (s -> s) % andP(tagstartP, orP("/>",* futureParser tagP, "</", idP, ">"))
xmlParse = tagP : charAnalyzer
print xmlParse ///<foo bar="5" foo="asdf &amp; asdf"></foo>///
*}

restart
This demo

    loadPackage "XML"
    p = xmlParse ///<foo> aabc <bar id="foo" name="too"> asdf </bar> <coo/><coo>hi</coo><coo a="b">hi</coo> </foo>///
    x = toXMLnode p
    q = toLibxmlNode x

gives

    i1 : loadPackage "XML"

    o1 = XML

    o1 : Package

    i2 : p = xmlParse ///<foo> aabc <bar id="foo" name="too"> asdf </bar> <coo/><coo>hi</coo><coo a="b">hi</coo> </foo>///

    o2 = <foo> aabc <bar id="foo" name="too"> asdf </bar> <coo/><coo>hi</coo><coo a="b">hi</coo> </foo>

    o2 : LibxmlNode

    i3 : x = toXMLnode p

    o3 = <foo
	   "aabc"
	   <bar id="foo" name="too"
	     "asdf"
	   <coo
	   <coo "hi"
	   <coo a="b"
	     "hi"

    o3 : XMLnode

    i4 : q = toLibxmlNode x

    o4 = <foo>aabc<bar id="foo" name="too">asdf</bar><coo/><coo>hi</coo><coo a="b">hi</coo></foo>

    o4 : LibxmlNode

-- Local Variables:
-- fill-column: 122
-- compile-command: "make -C $M2BUILDDIR/Macaulay2/packages  PACKAGES=XML RemakePackages=true RerunExamples=true IgnoreExampleErrors=false RemakeAllDocumentation=true errorDepth=1"
-- End: