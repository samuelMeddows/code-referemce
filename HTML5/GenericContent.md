# Generic Content

```javascript
<!DOCTYPE html>
<html>
	<head>
        <style type="text/css">
        a:after {content: " (" attr(href) ")";}
        </style>
	</head>

	<body>
		<p><a href="http://www.bom.gov.au">The Weather</a> contains info about weather.</p>
		<p><b>Note:</b> IE8 supports the content property only if a !DOCTYPE is specified.</p>
	</body>
</html>
```



