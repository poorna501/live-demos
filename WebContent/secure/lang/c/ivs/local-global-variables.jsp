<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/bootstrap.min.css" />
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/introjs.css">
<link rel="stylesheet" href="/css/introjs-ct.css" />

<script src="/js/jquery-latest.js"></script>
<script src="/js/bootstrap.min.js"></script>
<script src="/js/jquery-ui-latest.js"></script>
<script src="/js/intro.js" type="text/javascript"></script>
<script src="/js/typewriting.min.js" type="text/javascript"></script>
<script src="/js/gs/TweenMax.min.js" type="text/javascript"></script>
<script src="/secure/lang/c/js-min/lgv.min.js" type="text/javascript"></script>

<title>Local and Global Variables</title>
<style type="text/css">

.margin-top-20 {
	margin-top: 20px;
}

.box-border {
	border: 1px solid gray;
	border-radius: 8px;
	background-color: #f5f5f5;
}

.center {
	margin-left: auto !important;
	margin-right: auto !important;
	display: block;
}

.address-div {
	height: 185px;
}

.output-console-body {
	height: 65px;
	white-space: initial;
	padding: 10px;
}

.output-console {
	margin: 0;
}

.creampretab4 {
	font-size: 13px;
	-moz-tab-size: 4;
	tab-size: 4;
	background-color: lavender !important;
	line-height: 1.75;
	font-family: monospace;
}

#outputDiv {
	margin-top: 45px;
}

.main-div {
	margin-top: 55px;
}

.introjs-tooltip {
	min-width: 300px;
}

.blinking-white {
	animation-name: blink-border-background-white ;
	animation-duration: 1s ;
	animation-iteration-count: infinite;
	animation-direction: alternate ;
	z-index: 10000000;
	position: relative;
}

@keyframes blink-border-background-white { 
	50% {
		border-color: white;
		background: white;
	}
}

.ui-effects-transfer {
    background-color: orange;
    z-index: 99999999 !important;
}

#gVal {
	position: relative;
}

.introjs-tooltip-min-width {
	min-width: 110px;
}

.padding0 {
	padding: 0;
}
</style>
</head>
<body>

	<div class="text-center margin-top-20">
		<h1 id="heading" class="label ct-demo-heading text-center">Local and Global Variables</h1>
	</div>
	<div class="main-div col-xs-12" id="mainDiv">
		<div class="col-xs-5" id="codeDiv">
	<pre id="codeAnimation" class='creampretab4 box-border code-div opacity00'>
	#include&lt;stdio.h&gt;
	<span id="funcDec">void display();</span>
	<span id="globalVar">int value = <span id="tweenVal1">50</span>;</span>
	<span id="mainFunc"><span id="startMain">void main() {</span>
		<span id="localVar">int value = <span id="tweenVal2">20</span>;</span>
		<span id="mainPf1">printf("value in main() before call : %d", value);</span>
		<span id="functionCall">display();</span>
		<span id="mainPf2">printf("value in main() after call : %d", value);</span>
	<span id="endMain">}</span></span>
	<span id="funcDef"><span id="userFunc">void display() {</span>
		<span id="valAddition"><span id="valDec">value</span> = <span id="valRes">value + 20</span>;</span>
		<span id="userPrintf">printf("value in dispaly() : %d", value);</span>
	<span id="endFunc">}</span></span></pre>
		</div>
		<div id="addressDiv" class="col-xs-6 col-xs-offset-1 box-border address-div opacity00">
			<div class="col-xs-12 margin-top-20">
				<div class="col-xs-12 text-center" style="font-weight: bold; color: rgb(47, 79, 79);">
					<div id="boxHeading" class="col-xs-4 col-xs-offset-6 opacity00">In main()</div>
				</div>
				<div class="col-xs-12" style="margin-top: 10px;">
					<div id="globalVal" class="col-xs-2 col-xs-offset-2 text-center opacity00">
						<div><b style="color: maroon;">value</b></div>
						<div class="box-border" style="line-height: 50px; height: 50px;">
							<span id="gVal" class="opacity00"></span>
						</div>
						<div id="address1">1564</div>
					</div>
					<div id="varBox" class="box-border col-xs-4 col-xs-offset-2 text-center opacity00">
						<div id="localVal" class="col-xs-7 col-xs-offset-2">
							<div><b style="color: maroon;">value</b></div>
							<div style="line-height: 50px; height: 50px;" class="box-border">
								<span id="lVal" class="opacity00"></span>
							</div>
							<div id="address2">4516</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xs-4 col-xs-offset-2" style="margin-top: 35px;">
			<div id="consoleId" class="output-console padding0 opacity00">
				<div class="output-console-title-bar"><span class="title">Output</span></div>
				<div style="color: white;" class="output-console-body">
					<div id="runEditor1"></div>
					<div id="runEditor2"></div>
					<div id="runEditor3"></div>
				</div>
			</div>
		</div>
	</div>
	<div class="col-xs-12 margin-top-20 text-center"><span id="restart" class="btn btn-warning opacity00">Restart</span></div>

	<script type="text/javascript">
	
	$(document).ready(function() {
		localGlobalVariablesReady();
	});
	
	</script>
</body>
</html>