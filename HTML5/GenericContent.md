# Generic Content

### Code
<script src="https://gist.github.com/samuelMeddows/1868556d3da7fc15fa1d967aa72bb277.js"></script>

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

### Example

![Example](https://github.com/samuelMeddows/code-reference/blob/master/HTML5/screenshots/GenericContent1.PNG)

### Live Example
[Generic Content Example](https://html5-css-javascript-examples.azurewebsites.net/HTML5/GenericContent.html "Generic Content Example")

