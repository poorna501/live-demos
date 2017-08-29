<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/jquery-ui.css">
<link rel="stylesheet" href="/css/introjs.css">
<link rel="stylesheet" href="/css/introjs-ct.css">
<link rel="stylesheet" href="/css/font-awesome.min.css">
<link rel="stylesheet" href="/css/animate.css">

<script src="/js/jquery-latest.js"></script>
<script src="/js/intro.js"></script>
<script src="/js/bootstrap.js"></script>
<script src="/js/jquery-ui-all.js"></script>
<script src="/js/typewriting.min.js"></script>
<script src="/js/gs/TweenMax.min.js"></script>
<script src="/js/jquery.scrollTo.js"></script>
<title>Single Linked List UNION and CONCAT</title>

<style type="text/css">

.introjs-tooltip {
	min-width: 350px;
}

.introjs-tooltip-min-width-custom {
	min-width: -moz-max-content;
}

.introjs-duplicate-nextbutton {
	margin: 0px !important;
	background-color: green;
}

.box-border {
	border-radius: 12px;
	border: 2px solid gray;
}

.buttons-div {
	margin-top: 20px;
	margin-bottom: 5px;
	text-align: center;
}

div, span {
	position: relative;
}

.padding00 {
	padding: 0;
}

.creamPreTab {
	tab-size: 3;
	margin: 2px;
	padding: 12px;
	font-size: 12px;
	-moz-tab-size: 2;
	white-space: pre;
	border-radius: 8px;
	font-family: monospace;
	background-color: #fffae6;
}

.ui-effects-transfer {
	border: 1px solid blue;
	z-index: 99999999 !important;
}

.z-index1000000 {
	position: relative;
	background-color: white;
	z-index: 1000000 !important;
}

.position {
	display: inline-block;
	position: relative;
}

.margin-top15 {
	margin-top: 15px;
}

.output-console-title-bar {
	background-image: -moz-linear-gradient(center top, #e8e8e8, #bcbbbc);
	border-top-left-radius: 8px;
	border-top-right-radius: 8px;
	font-size: 0.75em;
	padding: 2px 0;
	text-align: center;
}

.output-console-body {
	background-color: black;
	border-bottom-left-radius: 8px;
	border-bottom-right-radius: 8px;
	color: #f0f0f0;
	font-family: monospace;
	font-size: 14px;
	margin-bottom: 14px;
	height: 150px;
	overflow: auto;
	padding: 10px;
	white-space: pre-line;
}

#varDec {
    margin-top: 23px;
}

#varDec > span {
    padding: 5px 10px;
}

#firstList, #secondList {
	margin-top: 25px;
}

#secondList {
	margin-bottom: 25px;
}

.box {
	min-height: 24px;
	text-align: center;
	border-radius: 6px;
	border: 1px solid green;
}

.div-border {
	margin: 0;
	padding: 0;
	width: 45px;
	min-height: 24px;
	text-align: center;
	display: inline-block;
	border: 2px solid gray;
}

.left-radius {
	border-right: none;
	border-color: blue;
	border-top-left-radius: 6px;
	border-bottom-left-radius: 6px;
}

.right-radius {
	border-color: green;
	border-top-right-radius: 6px;
	border-bottom-right-radius: 6px;
}

.inline-css {
	margin: 0 10px;
	position: relative;
	display: inline-block;
}

.buttons {
	color: black;
	letter-spacing: 1px;
	font-family: monospace;
	box-shadow: 1px 2px 4px 0;
}

.user-text {
	width: 82px;
	height: 27px;
	border: none;
	background: black;
}

.btn:hover {
	color: white;
	background-color: #4CAF50 !important;
}

.btn:active{
	color: white;
	background-color: #2E8B57 !important;
}

.disabled {
	pointer-events: none;
}

.margin-left30 {
	margin-left: 30px;
}

.margin-7 {
	margin-top: 9px;
	margin-bottom: 12px;
}

.svg-css {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 100%;
}

.svg-line {
	/* display: none; */
	marker-end: url("#arrowEnd"); 
	position: relative;
	stroke: gray;
	stroke-width: 2; 
	z-index: 10000000 !important;
}

.ct-code-b-red {
	font-weight: bold;
	font-family: monospace;
	color: rgb(252, 66, 66);
}

.ct-lime-color, .ct-green-color {
	color: lime;
	font-weight: bold;
	font-family: monospace;
}

.ct-green-color {
	color: green;
}

.ct-blue-color {
	font-weight: bold;
	font-family: monospace;
}

.ct-brown-color {
	color: brown;
	font-weight: bold;
	font-family: monospace;
}

.error-text {
	color :red;
	font-weight: bold;
}

.true {
	background: green none repeat scroll 0 0;
    border-radius: 3px;
    color: white;
    font-weight: bold;
}

.false {
	background: red none repeat scroll 0 0;
    border-radius: 3px;
    color: white;
    font-weight: bold;
}

.red-color {
	color: red;
}
.green-color {
	color: green;
}

.blue {
    color: blue;
}

</style>
</head>
<body>

<script type="text/javascript">

var buttonNames = ["CONCAT", "UNION", "INTERSET"];
var arr = ["l1", "l2","l3","x", "t3"];
var count, tCount, printfCount, outputLineCount, returnValCount, nodeCount, lineCount, outerLoop, innerLoop, extraNode ;
count = tCount = printfCount = outputLineCount = returnValCount = nodeCount = lineCount = outerLoop = innerLoop = extraNode = 1;
var typingSpeed = 10, buttonName;
var concatflag, lineClass = false;

var tempLine = 11, qLine = 111, removeLineNum, fstNdeInSecdList;
var svgIds = [], secSvgIds = [];

$(document).ready(function() {
	documentCallFunctin();
});

function documentCallFunctin() {
	preStructTypeList();
	appendButtons();
	svgAppend("#animatinDiv", "svgId");
	svgMarkerAppend("#svgId", "arrow");
	noOfNodeList();
	noOfNodesInUnion();
	initIntroJS();
}

function preStructTypeList() {
	$("#structTypelist").append('<span id="strcutSpan">struct list {\n'
		+ '\tint info;\n'
		+ '\tstruct list *next;\n'
		+ '};</span>\n'
		+ '<span id="typeDefDec">typedef struct list* nodeptr;</span>\n');
}

function preMain() {
	$("#inMain").append('<div class="text-center ct-blue-color padding00">In Main</div>\n'
		+ '<span id="nodeDec">nodeptr l1, l2, l3;</span>\n'
		+ '<span id="nodeToNull">l1 = l2 = l3 = NULL;</span>\n'
		+ '<span id="printf1">printf("Enter list 1 elements : ");</span>\n'
		+ '<span id="callCreateMethos1">l1 = createAndAddNodes(l1);</span>\n'
		+ '<span id="printf2">printf("Enter list 2 elements : ");</span>\n'
		+ '<span id="callCreateMethos2">l2 = createAndAddNodes(l2);</span>\n');
}

function preSingleLinkedListOperations() {
	$("#sllOperations").append('nodeptr createAndAddNodes(<span id="firstNode">nodeptr first</span>) {\n'
		+ '\t<span id="initTempAndQnode">nodeptr temp, q;</span>\n'
		+ '\t<span id="initXVar">int x;</span>\n'
		+ '\t<span id="printf3">printf("Enter element : ");</span>\n'
		+ '\t<span id="scanf3">scanf("%d", &x);</span>\n'
		+ '\t<span id="whileXNotEqlToMinusOne">while(<span id="xNotEqToOne">x != -1</span>) {</span>\n'
		+ '\t\t<span id="createNewTempNode">temp = (nodeptr)malloc(sizeof(struct list));</span>\n'
		+ '\t\t<span id="xValStreInTempData">temp->data = x;</span>\n'
		+ '\t\t<span id="tempNextToNull">temp->next = NULL;</span>\n'
		+ '\t\t<span id="ifFirstEqlToNull">if(first == NULL) {</span>\n'
		+ '\t\t\t<span id="firstEqlToTemp">first = temp;</span>\n'
		+ '\t\t} else {\n'
		+ '\t\t\t<span id="tempToQNext">q->next = temp;</span>\n'
		+'\t\t}\n'	
		+ '\t\t<span id="tempValStreInQ">q = temp;</span>\n'
		+ '\t\t<span id="printf4">printf("Enter element : ");</span>\n'
		+ '\t\t<span id="scanf4">scanf("%d", &x);</span>\n'
		+ '\t}\n'
		+ '\t<span id="returnFirst">return first;</span>\n'
		+'}\n');
}

function preConcatOperation() {
	$("#sllOperations").append('nodeptr concat(<span id="concatTwoNodes">nodeptr t1, nodeptr t2</span>) {\n'
			+ '\t<span id="decNodeT3"> nodeptr t3;</span>\n'
			+ '\t<span id="ifT1IsNull">if (t1 == NULL) {</span>\n'
			+ '\t\t<span id="returnT1">return t2;</span>\n'
			+ '\t} <span id="ifT2IsNull">else if (t2 == NULL) {</span>\n'
			+ '\t\t<span id="returnT2">return t1;</span>\n'
			+ '\t} else {\n'
			+ '\t\t<span id="t1StoredToT3">t3 = t1;</span>\n'
			+ '\t\t<span id="whileT1NxtNotEqNull">while(t1 -> next != NULL) {</span>\n'
			+ '\t\t\t<span id="t1nxtToT1">t1 = t1 -> next;</span>\n'
			+ '\t\t}\n'
			+ '\t\t<span id="t2StoreT1Nxt">t1 -> next = t2;</span>\n'
			+ '\t}\n'
		    + '\t<span id="returnT3">return t3;</span>\n'
			+ '}\n\n');
}

function preUnionOperation() {
	$("#sllOperations").append('nodeptr unions(<span id="unionTwoNodes">nodeptr l1, nodeptr l2</span>) {\n'
        + '\t<span id="decForNodes">nodeptr l3, t1, t2, q = NULL;</span>\n'
        + '\t<span id="callToConcatMethod">l3 = concat(l1, l2);</span>\n'
        + '\t<span id="nodeRepeation">for (t1 = l3; t1 != NULL && t1->next != NULL; \n\t\tt1 = t1->next) {\n'
	    + '\t\tfor (t2 = t1; t2 != NULL && t2->next != NULL;\n\t\t\t) {\n'
		+ '\t\t\tif (t1->data == t2->next->data) {\n'
		+ '\t\t\t\tq = t2->next;\n'
		+ '\t\t\t\tt2->next = q->next;\n'
		+ '\t\t\t\tfree(q);\n'
		+ '\t\t\t} else {\n'
		+ '\t\t\t\t t2 = t2->next;\n'
		+ '\t\t\t}\n'
	    + '\t\t}\n'
		+ '\t}</span>\n'
      	+ '\t<span id="returnT4">return l3;</span>\n'
		+ '}\n\n');
}

function prePrintfFunctionOperation() {
	$("#sllOperations").append('void print(<span id="printNode">nodeptr first</span>) {\n'
			+ '\t<span id="nodeQ">nodeptr q = first;</span>\n'
			+ '\t<span id="firstIsNull">if (<span id="ifFstEqNull">first == NULL</span>) {</span>\n'
			+ '\t\t<span id="printf7">printf("empty");</span>\n'
			+ '\t} else {\n'
			+ '\t\t<span id="printf8">printf("Elements in list are:");</span>\n'
			+ '\t\t<span id="whileQNotEqNull">while (<span id="checkQNxtNull">q != NULL</span>) {</span>\n'
			+ '\t\t\t<span id="printf9">printf("%d---> ",q -> data);</span>\n'
			+ '\t\t\t<span id="qNxtToQ">q = q -> next;</span>\n'
			+ '\t\t}\n'
			+ '\t\t<span id="printf10">printf("NULL");</span>\n'
			+ '\t}\n'
			+ '}\n');
}

function unionOperationFunction() {
	$("#unionOperations").append("<span id='firstLoop'>for (t1 = <span class='position' id='l3ValInit'>l3</span>; <span id='fstLoopCond'>"
			+ " <span id='fstFstCon' class='position'><span class='position' id='t1'>t1</span>"
			+ " != NULL</span> && <span class='position' id='fstSecCon'>"
			+ " <span id='t1Nxt' class='position'>t1->next</span> != NULL</span></span>;"
			+ " <span id='t1Inc' class='position'>t1 = t1->next</span>) {&nbsp;&nbsp;"
      		+ " <span id='firstLoopTrueOrFalse' class='position'></span></span>\n"
			+ " \t<span id='secondLoop'>for (t2 = <span class='position' id='t1ValInit'>t1</span>; "
			+ " <span id='secForLoop'><span id='secFstCon' class='position'><span id='t2' class='position'>t2</span> != NULL</span>"
      		+ " && <span id='secSecCon'><span id='t2Next' class='position'>t2->next</span> != NULL</span>"
      		+ " </span>;) {&nbsp;&nbsp;"
      		+ " <span id='secondLoopTrueOrFalse'></span></span></span>\n"
            + "\t\t<span id='ifCondition'>if (<span id='unIfCon'><span id='t1Data' class='position'>t1->data</span>"
            + " == <span id='t2NextData' class='position'>t2->next->data</span></span>) {"
            + "&nbsp;&nbsp;<span id='ifConTrueorFalse' class='position'></span></span>\n"
            + "\t\t\t<span id='fstStat'>q = <span class='position' id='t2nextVal'>t2->next</span>;</span>\n"
            + "\t\t\t<span id='secStat'>t2->next = <span class='position' id='qNodeNxt'>q->next</span>;</span>\n"
            + "\t\t\t<span id='thirdStat'><span id='freeQnode'>free(q)</span></span>\n"
            + "\t\t} else {\n"
            + "\t\t\t<span id='t2Increment'><span id='t2Inc' class='position'>t2 = t2->next</span>;</span>\n"
            + "\t\t}\n"
            + "\t}\n"
            + "}\n\n");
}


function firstAndSecondList() {
	for (var i = 1; i <=2; i++) {
	$(".list" + i).append('<div class="col-xs-1 padding00 opacity00" id="firstNode'+ i +'">'
		+ '	<div class="text-center col-xs-12 padding00 ct-green-color firstNodeName'+ i +'">first</div>'
		+ '	<div class="col-xs-12 box padding00" id="firstDiv'+ i +'">'
		+ '	<span  id="firstVal'+ i +'" class="opacity00 ct-green-color inline-style">NULL</span>'
		+ '	</div>'
		+ '</div>'
		+ '<div class="col-xs-11" id="dynamicNodes'+ i +'"></div>');
	 }
}

function createDynamicNodes(selector, nodeNum) {
	var randomAddress = getRandomInt(1000, 5000);
	$(selector).append('<div class="opacity00 col-xs-2 nodes node list-nodes" id="node' + nodeNum 
		+ '" style="top: 0px; width: auto;">'
		+ ' <div class="col-xs-12 padding00"><div class="col-xs-6 ct-blue-color padding00 text-center">'
		+ ' data</div><div class="ct-green-color text-center">next</div></div>'
		+ ' <div id="nodedata' + nodeNum + '"><div id="dataDiv' + nodeNum + '"'
		+ ' class="div-border left-radius col-xs-6 data-div"><span id="data' + nodeNum +'"'
		+ ' class="data-span opacity00 ct-blue-color" style="top: 0px; left: 0px;"></span></div>'
		+ ' <div id="nextDiv' + nodeNum +'" class="position div-border right-radius col-xs-6 next-div">'
		+ ' <span id="next' + nodeNum +'" class="position next-span ct-green-color inline-style"></span></div></div>'
		+ ' <div class="col-xs-12 padding00"><div class="col-xs-6 padding00 text-center">'
		+ ' <span id="dataAddress' + nodeNum + '" class="data-address padding00 ct-brown-color">'+ randomAddress 
		+ '</span></div></div></div>');
}

function createLastNode(i, nodeName, nodeNumber) {
	$('#nodeAddress'+i).append('<div class="col-xs-1 padding00 margin-top15 opacity00" id="lastNodeMemory'+ nodeNumber +'">'
		+ '<div class="col-xs-12 box padding00" id="memDiv'+ nodeNumber +'"><span id="nodeVal'
		+ nodeNumber +'" class="ct-brown-color inline-style"></span></div>'
		+ '<div class="text-center col-xs-12 padding00 ct-green-color" id="nodeName'+ nodeNumber +'">'+ nodeName +'</div>'
		+ '</div>');	
	if (nodeNumber == 1) {
		$("#lastNodeMemory" + nodeNumber).addClass("");
	} else {
		$("#lastNodeMemory" + nodeNumber).addClass("margin-left30");
	}
}

function noOfNodeList() {
	$("#NoOfLists").append('<div class="col-xs-12 text-center ct-blue-color padding00 opacity00" id="inMainMet">In Main</div>')
	for (var i = 0; i < arr.length; i++ ) {
	$('#NoOfLists').append('<div class="col-xs-1 padding00 opacity00 margin-left30" id="'+ arr[i] +'Node">'
		+ '<div class="col-xs-12 box padding00"><span id="'
		+ arr[i] +'Val" class="ct-brown-color inline-style"></span></div>'
		+ '<div class="text-center col-xs-12 padding00 ct-green-color" id="'
		+ arr[i] +'nodeName">'+ arr[i] +'</div>'
		+ '</div>');
	}
}

function noOfNodesInUnion() {
	$("#NoOfListsInUnion").append('<div class="col-xs-12 text-center ct-blue-color padding00 opacity00" id = "inUnion">In Union</div>')
	for (var i = 0; i < arr.length; i++ ) {
	$('#NoOfListsInUnion').append('<div class="col-xs-1 padding00 opacity00 margin-left30" id="'+ arr[i] +'NodeInUn">'
		+ '<div class="col-xs-12 box padding00"><span id="'
		+ arr[i] +'ValInUn" class="ct-brown-color inline-style"></span></div>'
		+ '<div class="text-center col-xs-12 padding00 ct-green-color" id="'
		+ arr[i] +'nodeNameInUn">'+ arr[i] +'</div>'
		+ '</div>');
	}
}

function appendButtons() {
	for (var i = 0; i <= 2; i++) {
		$('#buttonDiv').append('<div class="inline-css"><span class="btn btn-success buttons btn-xs margin-7 disabled" id="'
				+ buttonNames[i].toLowerCase() +'">'+ buttonNames[i] +' </span></div>');
	}
}

function getRandomInt(min, max) {
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min)) + min;
}

function initIntroJS() {
	introjs = introJs();
	introjs.setOptions({
		showStepNumbers : false,
		exitOnOverlayClick : false,
		keyboardNavigation : false,
		exitOnEsc : false,
		showBullets : false,
		steps : [{
			element: '#headdingSection',
			intro: '',
		},{
			element:'#structTypelist',
			intro: '',
			tooltipClass : "hide",
		},{
			element:'#strcutSpan',
			intro: '',
			tooltipClass : "hide",
		}, {
			element : "#restartBtn",
			intro : "",
			position: "right"
		}]
	});
	
	introjs.onafterchange(function (targetElement) {
			var elementId = targetElement.id;
			$('.introjs-skipbutton, .introjs-prevbutton, .introjs-nextbutton').hide();
			$('.introjs-helperLayer').one('transitionend', function() {
			switch (elementId) {
				case "structTypelist" :
					$("#structTypelist, #explanationDiv").removeClass("opacity00");
					setTimeToIntroGoNextStep();
				break;
				case "strcutSpan":
					$('.introjs-tooltip').removeClass('hide');
					var text = "This is the declaration of a new <span class='ct-code-b-yellow'>struct</span>"
							+ " type <span class='ct-code-b-yellow'>"
							+ " list</span>.";
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#typeDefDec", "", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "buttonDiv" :
					$("#l1Node, #l2Node, #l3Node, #l1Val, #l2Val, #l3Val, #firstNode1, #firstVal1").addClass("opacity00");
					$("#lastNodeMemory1, #nodeVal1, #inMainMet, #inUnion, #l1NodeInUn, #l1ValInUn").addClass("opacity00");
					$("#l2NodeInUn, #l2ValInUn, #l3NodeInUn, #l3ValInUn").addClass("opacity00");
					$(".buttons").removeClass("disabled");
					$("#NoOfLists, #NoOfListsInUnion").removeClass("box-border");
					$("#nodeAddress1, #nodeAddress2, #firstList, #secondList").empty();
					$("line").remove()
					tempLine = 11, qLine = 111, removeLineNum, fstNdeInSecdList;
					count = tCount = printfCount = outputLineCount = returnValCount = nodeCount = lineCount = 1;
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "showButtons" :
							$("#concat").click(function() {
								buttonName = "concat";
								$("#inMain, #consoleBodyDiv").empty();
								preMain();
								$("#callCreateMethos2").after('\n<span id="callConcatMethod">l3 = concat(l1, l2);</span>\n'
									+ '<span id="printf5">printf("Elements in list3 : ");</span>\n'
									+ '<span id="printFunction">print(l3);</span>');
								introNextSteps("#inMain", "", "bottom");
								introjs.nextStep();
							});
							$("#union").click(function() {
								buttonName = "union";
								$("#inMain, #consoleBodyDiv").empty();
								preMain();
								$("#callCreateMethos2").after('\n<span id="callConcatMethod">l3 = unions(l1, l2);</span>\n'
									+ '<span id="p3">printf("Unions list : ");</span>\n'
									+ '<span id="p4">print(l3);</span>');
								introNextSteps("#inMain", "", "bottom");
								introjs.nextStep();
							});
						break;
					}
				break;
				case "typeDefDec" :
					$('.introjs-tooltip').removeClass('hide');
					var text = "The <span class='ct-code-b-yellow'>typedef</span> "
							+ "creates a <span class='ct-code-b-yellow'>nodeptr</span> as a"
							+ " new type <span class='ct-code-b-yellow'>pointer</span> to "
							+ "<span class='ct-code-b-yellow'>struct list</span>.";
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#buttonDiv", "showButtons", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "inMain" :
					$("#inMain").removeClass("opacity00");
					introNextSteps("#nodeDec", "", "bottom");
					setTimeToIntroGoNextStep();
				break;
				case "nodeDec" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we are declaring <span class="ct-code-b-yellow">three</span>'
							+ ' variable <span class="ct-code-b-yellow">l1</span>, '
							+ '<span class="ct-code-b-yellow">l2</span>, and '
							+ '<span class="ct-code-b-yellow">l3</span> to the '
							+ '<span class="ct-code-b-yellow"> nodeptr</span> type.';
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "varDeclr", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "nodeToNull" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we are initializing '
							+ ' <span class="ct-code-b-yellow">l1</span>, '
							+ '<span class="ct-code-b-yellow">l2</span>, and '
							+ '<span class="ct-code-b-yellow">l3</span> to  '
							+ '<span class="ct-code-b-yellow"> NULL</span>.';
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "assignToNull", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "printf" + printfCount :
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "enterList1Elem" :
							introNextSteps("#consoleId", "displyEntrList"+ printfCount +"Elem", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "enterNodeValText" :
							introNextSteps("#consoleId", "displyEntrNodeVal", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "printL3Text" :
							introNextSteps("#consoleId", "displyL3Text", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "printEmpty" :
							introNextSteps("#consoleId", "printEmptyText", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "printListEle" :
							introNextSteps("#consoleId", "printListEleText", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "printData" :
							introNextSteps("#consoleId", "printListEleData", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "printNull" :
							introNextSteps("#consoleId", "printNullVal", "bottom");
							setTimeToIntroGoNextStep();
						break;
						
					}
				break;
				case "scanf" + printfCount :
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "readNodeVal" :
							introNextSteps("#consoleId", "enterNodeVal", "bottom");
							setTimeToIntroGoNextStep();
						
						break;
					}
				break;
				case "animatinDiv" :
					introjs.refresh();
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "varDeclr" :
							initializeTheL1L2AndL3("Node", function() {
								introNextSteps("#nodeToNull", "", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "assignToNull" :
							initializeTheL1L2AndL3("Val", function() {
								introNextSteps("#printf" + printfCount, "enterList"+ printfCount +"Elem", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "declrFirstNode" :
							firstAndSecondList();
							introjs.refresh();
							$(".firstNodeName2").text("first");
							$("#firstVal" + printfCount).addClass("opacity00");
							zoomInEffect("#firstNode" + printfCount, function() {
								fromEffectWithTweenMax("#l"+ printfCount +"Val", "#firstVal"+printfCount, false, function() {
									introNextSteps("#initTempAndQnode", "", "bottom");
									setTimeToIntroGoNextStep();
								});
							});
						break;
						case "tempAndQvarDeclr" :
							zoomInEffect("#lastNodeMemory1" , function() {
								zoomInEffect("#lastNodeMemory2" , function() {
									introjs.refresh();
									introNextSteps("#initXVar", "", "bottom");
									setTimeToIntroGoNextStep();
								});
							});
						break;
						case "xValDec" :
							zoomInEffect("#xNode", function() {
								printfCount = 3;
								introNextSteps("#printf3", "enterNodeValText", "bottom");
								setTimeToIntroGoNextStep();
							});	
						break;
						case "firstValueStorInL" + returnValCount :
							fadeInBounceEffectWithTimelineMax("#firstVal"+ returnValCount, "#l"+ returnValCount +"Val", function() {
								$(".nodes").removeClass("nodes");
								zoomOutEffect("#firstNode" + returnValCount);
								$("#firstNode" + returnValCount).addClass("opacity00");
								$("#line" + removeLineNum).remove();
								printfCount = ++returnValCount;
								if (returnValCount == 2 ) {
										introNextSteps("#printf2", "enterList1Elem", "bottom");
								} else {
									$("#sllOperations").empty().addClass("opacity00");
									introNextSteps("#callConcatMethod", "methodCall", "bottom");
								}
									setTimeToIntroGoNextStep();
							});
						break;
						case "MemoryAllocation" :
							$("#node" + nodeCount).removeClass("opacity00")
							TweenMax.from("#node" + nodeCount, 1, {top : -30, onComplete:function() {
								$("#nodeVal" + (nodeCount + 1)).removeClass("opacity00")
								fadeInBounceEffectWithTimelineMax("#dataAddress" + nodeCount , "#nodeVal1", function() {
									$("#line" + tempLine).remove();
									svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
										+ nodeCount, "#svgId", "line"+ tempLine, "arrow", function() {
										introNextSteps("#xValStreInTempData", "", "");
										setTimeToIntroGoNextStep();
									});
								});
							}});
						break;
						case "storeXVal":
							$("#data" + nodeCount).text($("#nodeDataVal" + (outputLineCount - 1)).val()).addClass("opacity00")
							fromEffectWithTweenMax("#xVal", "#data" + nodeCount, false, function() {
								introNextSteps("#tempNextToNull", "", "");
								setTimeToIntroGoNextStep();
							})
						break;
						case "assignNullToTmpNxt" :
							$("#next" + nodeCount).text("NULL").addClass("opacity00");
							zoomInEffect("#next" + nodeCount, function() {
								introNextSteps("#ifFirstEqlToNull", "", "");
								setTimeToIntroGoNextStep();
							});	
						break;
						case "tempValStredInFirst":
							fadeInBounceEffectWithTimelineMax("#nodeVal1", "#firstVal" + returnValCount ,function() {
								svgAnimatingLineRightToLeft("#animatinDiv", "#firstDiv"+ returnValCount, "#dataDiv"
										+ nodeCount, "#svgId", "line"+ lineCount, "arrow", function() {
										removeLineNum = lineCount;
										if (returnValCount % 2 == 0) {
											console.log("Haii");
											fstNdeInSecdList = nodeCount;
											svgIds.push("#line"+ lineCount);
										} 
									lineCount++;
									introNextSteps("#tempValStreInQ", "", "");
									setTimeToIntroGoNextStep();
								});
							});
						break;
						case "tempValStredInQ" :
							fadeInBounceEffectWithTimelineMax("#nodeVal1", "#nodeVal2",function() {
								$("#line" + qLine).remove();
								svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
										+ nodeCount, "#svgId", "line"+ qLine, "arrow", function() {
									printfCount = 4;
									nodeCount++;
									introNextSteps("#printf4", "enterNodeValText", "bottom");
									setTimeToIntroGoNextStep();
								});
							});
						break;
						case "tempvalstoredInQNext" :
							fadeInBounceEffectWithTimelineMax("#nodeVal1", "#next"+(nodeCount - 1),function() {
								lineClass = true;
								svgAnimatingLineRightToLeft("#animatinDiv", "#nextDiv"+ (nodeCount - 1), "#dataDiv"
										+ nodeCount, "#svgId", "line"+ lineCount, "arrow", function() {
									console.log("add lineClass");
									if (returnValCount % 2 == 0) {
										svgIds.push("#line"+ lineCount);
									}
									lineClass = false;
									lineCount++;
									introNextSteps("#tempValStreInQ", "", "");
									setTimeToIntroGoNextStep();
								});
							});
						break;
						case "declrT1AndT2Nodes":
							var selector1, selector2;
							$(".firstNodeName2").text("t2");
							$("#nodeVal1").addClass("opacity00");
							zoomInEffect("#lastNodeMemory1", function() {
								zoomInEffect("#firstNode2", function() {
									if (concatflag) {
										selector1 = "#l1ValInUn";
										selector2 = "#l2ValInUn";
									} else {
										selector1 = "#l1Val";
										selector2 = "#l2Val";
									}
									$("#nodeVal1").text($(selector1).text());
									fromEffectWithTweenMax(selector1, "#nodeVal1", false, function() {
										if (($("#firstVal1").text()).trim() != "NULL") {
											svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv1", "#svgId", "line1", "arrow");
										}
										$("#firstVal2").text($(selector2).text());
										fromEffectWithTweenMax(selector2, "#firstVal2", false, function() {
											if (($("#firstVal2").text()).trim() != "NULL") {
												$("#line" + removeLineNum).remove();
												svgAnimatingLineRightToLeft("#animatinDiv", "#firstDiv2","#dataDiv"+ fstNdeInSecdList, "#svgId", "line"+ removeLineNum, "arrow");
											}
											setTimeout(function() {
												introNextSteps("#decNodeT3", "", "bottom");
												setTimeToIntroGoNextStep();
											},1200);
										});
									});
								});
							});
						break;
						case "declrL1AndL2Nodes" :
							$("#inUnion, #inMainMet").removeClass("opacity00");
							$("#NoOfLists, #NoOfListsInUnion").addClass("box-border");
							zoomInEffect("#l1NodeInUn", function() {
								zoomInEffect("#l2NodeInUn", function() {
									$("#l1ValInUn").text($("#l1Val").text());
									fromEffectWithTweenMax("#l1Val", "#l1ValInUn", false, function() {
										$("#l2ValInUn").text($("#l2Val").text());
										fromEffectWithTweenMax("#l2Val", "#l2ValInUn", false, function() {
											introNextSteps("#decForNodes", "", "bottom");
											setTimeToIntroGoNextStep();
										});
									});
								});
							});
						break;
						case "declrT3Nodes" :
							$("#firstVal1").addClass("opacity00");
							$(".firstNodeName1").text("t3");
							zoomInEffect("#firstNode1", function() {
								introNextSteps("#ifT1IsNull", "", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "declrFourNodes" :
							zoomInEffect("#l3NodeInUn", function() {
								zoomInEffect("#lastNodeMemory2", function() {
									zoomInEffect("#lastNodeMemory3", function() {
										zoomInEffect("#lastNodeMemory4", function() {
											$("#nodeVal4").text("NULL").addClass("opacity00");
											zoomInEffect("#nodeVal4", function() {
												introNextSteps("#callToConcatMethod", "methodCall", "bottom");
												setTimeToIntroGoNextStep();
											});
						  				});
						  			});					
						  		});
							});
						break;
						case "streT1ToT3" :
							var text = $("#firstVal1").text($("#nodeVal1").text().trim());
							fromEffectWithTweenMax("#nodeVal1", "#firstVal1", false, function() {
								if (text != "NULL") {
									$("#line21").remove();
									svgAnimatingLineRightToLeft("#animatinDiv", "#firstDiv1",
											"#dataDiv1", "#svgId", "line21", "arrow", function() {
										introNextSteps("#whileT1NxtNotEqNull", "concatWhileCon", "bottom");
										setTimeToIntroGoNextStep();
									});
								} else {
									introNextSteps("#whileT1NxtNotEqNull", "concatWhileCon", "bottom");
									setTimeToIntroGoNextStep();
								}
							});
						break;
						case "streT1nextToT1":
							$("#nodeVal1").parent().effect( "highlight",{color: 'blue'}, 500, function() {
								svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"+count , "#svgId", "line1"+count, "arrow", function(){
									$("#line1" + count).remove();
									fadeInBounceEffectWithTimelineMax("#next" + count, "#nodeVal1", function() {
										count++;
										$("#line1").remove();
								        svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"+count , "#svgId", "line1", "arrow", function(){
								        	introNextSteps("#whileT1NxtNotEqNull", "concatWhileCon", "bottom");
								        	setTimeToIntroGoNextStep();
								        });
									});
								});
							});
						break;
						case "streT2NextToT1Nxt" :
							fadeInBounceEffectWithTimelineMax("#firstVal2", "#next"+(fstNdeInSecdList - 1), function() {
								svgAnimatingLineBottomToTop("#animatinDiv", "#nextDiv" + (fstNdeInSecdList - 1) 
										, "#nextDiv"+fstNdeInSecdList , "#svgId", "line0", "arrow", function() {
									$("#line0").attr("class", "svg-line lineNumber");
									tCount = 3;
									introNextSteps("#returnT3", "concatWhileCon", "bottom");
						        	setTimeToIntroGoNextStep();
								});
							});
						break;
						case "storeT3ToL3" :
							var selector;
							if (concatflag) {
								selector = "#l3ValInUn";
							} else {
								selector = "#l3Val";
							}
							if ($("#nodeVal1").text().trim() == "NULL") {
								fadeInBounceEffectWithTimelineMax("#firstVal2", selector, function() {
									valStoreInT3Node();
								});
							} else if ($("#firstVal2").text().trim() == "NULL") {
								fadeInBounceEffectWithTimelineMax("#nodeVal1", selector, function() {
									valStoreInT3Node();
								});
							} else {
								fadeInBounceEffectWithTimelineMax("#firstVal1", selector, function() {
									valStoreInT3Node();
								});
							}	
						break;
						case "storeUnionl3Value" :
							fadeInBounceEffectWithTimelineMax("#l3ValInUn", "#l3Val", function() {
								$("#line22, #line23").remove();
								$("#lastNodeMemory2, #lastNodeMemory3, #lastNodeMemory4").addClass("opacity00");
								introNextSteps("#p3", "", "bottom");
					        	setTimeToIntroGoNextStep();
							});
						break;
						case "dspFstNode" :
							$("#firstVal1").addClass("opacity00");
							$(".firstNodeName1").text("first");
							zoomInEffect("#firstNode1", function() {
								$("#firstVal1").text($("#l3Val").text());
								fromEffectWithTweenMax("#l3Val","#firstVal1", false, function() {
									if ($("#firstVal1").text().trim() != "NULL") {
										$("#line21").remove();
										svgAnimatingLineRightToLeft("#animatinDiv", "#firstDiv1",
										"#dataDiv1", "#svgId", "line21", "arrow", function() {
											introNextSteps("#nodeQ", "", "bottom");
								        	setTimeToIntroGoNextStep();
	                      				});	
									} else {
										introNextSteps("#nodeQ", "", "bottom");
							        	setTimeToIntroGoNextStep();
									}
				                });
							});
						break;
						case "decAndStreQVal" :
							$("#nodeName1").text("q");
							$("#nodeVal1").addClass("opacity00");
							zoomInEffect("#lastNodeMemory1" , function() {
								$("#nodeVal1").text($("#firstVal1").text());
								fromEffectWithTweenMax("#firstVal1", "#nodeVal1", false, function() {
									var isL2NodeData = $("#l2Val").text().trim() != "NULL" && $("#l1Val").text().trim() == "NULL";
									if (isL2NodeData) {
										$("#line22").remove();
										svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
											+ count, "#svgId", "line22", "arrow", function() {
											introNextSteps("#firstIsNull", "", "bottom");
								        	setTimeToIntroGoNextStep();
										});	
									} else {
										if ($("#firstVal1").text().trim() != "NULL") {
											$("#line22").remove();
											svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1",
												"#nextDiv" + count, "#svgId", "line22", "arrow", function() {
												introNextSteps("#firstIsNull", "", "bottom");
									        	setTimeToIntroGoNextStep();
											});	
										} else {
											introNextSteps("#firstIsNull", "", "bottom");
								        	setTimeToIntroGoNextStep();
										}
									}
								});
							});
						break;
						case "qNxtToQNode" :
							 $("#nodeVal1").parent().effect( "highlight",{color: 'blue'}, 500, function() {
								 changeQNodeAddressToQNextAdd();
							});
						break;
					}
				break;
				case "consoleId" :
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "displyEntrList"+ printfCount +"Elem" :
							$("#consoleBodyDiv").append('<span id="output'+ outputLineCount +'">Enter list '
									+ printfCount +' elements : </span>\n');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								outputLineCount++;
								introNextSteps("#callCreateMethos"+ printfCount +"", "callCreate"+ printfCount +"", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "displyEntrNodeVal" :
							$("#consoleBodyDiv").append('<span id="output'+ outputLineCount +'">Enter element : </span>'
									+'<input class="user-text opacity00"'
									+ ' id= "nodeDataVal'+ outputLineCount +'" placeholder="Number" maxlength="3"></span>\n');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								outputLineCount++;
								introNextSteps("#scanf" + printfCount, "readNodeVal", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "enterNodeVal" :
							$('.introjs-tooltip').removeClass('hide');
							var t = $(".nodes").length == 5;
							if (t) {
								addNegativeValuEvent("#nodeDataVal" + (outputLineCount - 1))
								var text = "Here, we are restrick to allow  only <span class='ct-code-b-yellow'>5</span> nodes so "
										+ "  plese enter the <span class='ct-code-b-yellow'>node data</span> as "
										+ "<span class='ct-code-b-yellow'>-1</span> only.";
							} else {
								enterValidNumberOrNot("#nodeDataVal" + (outputLineCount - 1));
								var text = "Enter the <span class='ct-code-b-yellow'>node data</span> value";
							}
							typing('.introjs-tooltiptext', text, function() {
								$("#nodeDataVal" + (outputLineCount - 1)).removeClass("opacity00").focus();
								introNextSteps("#whileXNotEqlToMinusOne", "whileForInsertNode", "bottom");
							});
						break;
						case "displyL3Text" :
							$("#consoleBodyDiv").append('<span id="output'+ outputLineCount +'">Elements in list3 :  </span>\n');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								outputLineCount++;
								printfCount = 6;
								$("#sllOperations").empty().addClass("opacity00");
								introNextSteps("#printFunction", "callPrintFun", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "printEmptyText" :
							$("#consoleBodyDiv").append('<span id="output'+ outputLineCount +'">Empty</span>\n');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								introNextSteps("#buttonDiv", "showButtons", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "printListEleText" :
							$("#consoleBodyDiv").append('<span id="output'+ outputLineCount +'">Elements in list are : </span>\n');
							$("#consoleBodyDiv").append('<span id="output'+ (outputLineCount  + 1)+'">'
									+ '<span class="position" id="displaydata"></span></span>');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								introNextSteps("#whileQNotEqNull", "", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "printListEleData" :
							$("#displaydata").append('<span id="outData'+ count +'"></span>&nbsp;<span class="opacity00"id="arrow'+ count 
									+ '">-->&nbsp;</span>');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								$("#nodeVal1").parent().effect( "highlight",{color: 'blue'}, 500, function() {
									printL1AndL2Nodes();
								});
							});
						break;
						case "printNullVal" :
							$("#displaydata").append('<span id="outData'+ count +'">NUll</span>\n');
							zoomInEffect("#outData"+count, function() {
								introNextSteps("#buttonDiv", "showButtons", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
						case "displyUnionText" :
							$("#consoleBodyDiv").append('<span id="output'+ outputLineCount +'">Unions list : </span>\n');
							$("#consoleBodyDiv").scrollTo($("#consoleBodyDiv > span:last()"), 500, function() {
								$("#sllOperations").addClass("opacity00").empty();
								introNextSteps("#p4", "", "bottom");
								setTimeToIntroGoNextStep();
							});
						break;
					}
				break;
				case "callCreateMethos" + returnValCount :
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "callCreate" + returnValCount :
							$('.introjs-tooltip').removeClass('hide');
							text = 'Here, we call the '
								+ ' <span class="ct-code-b-yellow">createAndAddNodes()</span> method and '
								+ ' pass <span class="ct-code-b-yellow">l'+ returnValCount +'</span> data (i.e. '
								+ ' <span class="ct-code-b-yellow">NULL</span>) as a argument and '
								+ ' the <span class="ct-code-b-yellow">return</span> value is stored in the'
								+ ' variable <span class="ct-code-b-yellow">l'+ returnValCount +'</span>.';
							typing('.introjs-tooltiptext', text, function() {
								$("#sllOperations").empty();
								preSingleLinkedListOperations();
								introNextSteps("#sllOperations", "addNodes", "right");
								$('.introjs-nextbutton').show();
							});
						break;
						case "returnValueStoreIn" :
							$('.introjs-tooltip').removeClass('hide');
							var text = 'The <span class="ct-code-b-yellow">createAndAddNodes()</span> method return value '
									+ ' <span class="ct-code-b-yellow"> '+$("#firstVal" + returnValCount).text() 
									+ '</span> is stored in the variable <span class="ct-code-b-yellow">l'+returnValCount +'</span>.';	
							typing('.introjs-tooltiptext', text, function() {
								introNextSteps("#animatinDiv", "firstValueStorInL" + returnValCount + "","bottom");
								$('.introjs-nextbutton').show();
							});
						break;
					}
				break;
				case "sllOperations" :
					$("#sllOperations").removeClass("opacity00");
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "addNodes" :
							introNextSteps("#firstNode", "", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "concatNode":
							if (buttonName == "concat") {
								introNextSteps("#concatTwoNodes", "", "bottom");
							} else {
								introNextSteps("#unionTwoNodes", "", "bottom");
							}
							setTimeToIntroGoNextStep();
						break;
						case "displayPrintFun" :
							introNextSteps("#printNode", "", "bottom");
							setTimeToIntroGoNextStep();
						break;
						case "unionNode" :
							introNextSteps("#unionTwoNodes", "", "bottom");
							setTimeToIntroGoNextStep();
						break;
					}
				break;
				case "firstNode" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'Here, we are declaring <span class="ct-code-b-yellow">first</span> node'
							+ ' and that will be initialized to <span class="ct-code-b-yellow">createAndAddNodes(l1)</span>'
							+ ' method passed value.';
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "declrFirstNode", "right");
						$('.introjs-nextbutton').show();
					});					
				break;
				case "initTempAndQnode" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we are declaring <span class="ct-code-b-yellow">two</span>'
						+ ' variable <span class="ct-code-b-yellow">temp</span> and '
						+ '<span class="ct-code-b-yellow">q</span> to the '
						+ '<span class="ct-code-b-yellow"> nodeptr</span> type.';
					typing('.introjs-tooltiptext', text, function() {
						createLastNode(returnValCount, "temp2", 4);createLastNode(returnValCount, "temp2", 4);
						createLastNode(returnValCount, "q", 2);createLastNode(returnValCount, "temp1", 3);
						createLastNode(returnValCount, "temp", 1);
						introNextSteps("#animatinDiv", "tempAndQvarDeclr", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "initXVar" :
					$('.introjs-tooltip').removeClass('hide');
					var text = "Here, we declare an integer variable <span class = 'ct-code-b-yellow'>x</span>.";
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "xValDec", "bottom");
						$('.introjs-nextbutton').show();
 					});
				break;
				case "whileXNotEqlToMinusOne" :
					var dataVal = $("#nodeDataVal" + (outputLineCount - 1)).val();
					$("#xVal").text(dataVal);
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "whileForInsertNode" :
							whileConditionCheckingText("x", " != -1", function() {
								toEffectAnimation("#xNotEqToOne", "#whileConForAddNode", function() {
									checkWhileCondForisDataValIsNullOrNot();
								});	
							});
						break;
					}
				break;
				case "returnFirst" :
					$("#xNode").addClass("opacity00");
					$("#xVal").text("");
					$("#nodeAddress" + returnValCount).empty();
					$("#line" + tempLine + ", #line" + qLine).remove();
					introNextSteps("#callCreateMethos" + returnValCount, "returnValueStoreIn", "bottom");
					setTimeToIntroGoNextStep();
				break;
				case "createNewTempNode" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'Here, we are create a <span class="ct-code-b-yellow">nodeptr</span> '
						+ 'with <span class="ct-code-b-yellow">data</span> and'
						+ ' <span class="ct-code-b-yellow">next</span> field and '
						+ 'allocate <span class="ct-code-b-yellow">dynamic memory</span>.';
					typing('.introjs-tooltiptext' , text, function() {
						createDynamicNodes("#dynamicNodes" + returnValCount, nodeCount);
						introNextSteps("#animatinDiv", "MemoryAllocation", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "xValStreInTempData" :
					$('.introjs-tooltip').removeClass('hide');
					var text = "The <span class='ct-code-b-yellow'>x</span> value i.e. ("
							+ '<span class="ct-code-b-yellow">' + $("#nodeDataVal" + (outputLineCount - 1)).val() 
							+ '</span>) is stored in <span class="ct-code-b-yellow">temp -> data</span>.';
					typing('.introjs-tooltiptext' , text, function() {
						introNextSteps("#animatinDiv", "storeXVal", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "tempNextToNull" :
					$('.introjs-tooltip').removeClass('hide');
					var text = "Assign a <span class='ct-code-b-yellow'>NULL</span> value "
							+ 'to <span class="ct-code-b-yellow">temp -> next</span>.';
					typing('.introjs-tooltiptext' , text, function() {
						introNextSteps("#animatinDiv", "assignNullToTmpNxt", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "ifFirstEqlToNull" :
					ifConditionCheckingText("first", " == NULL", function() {
						toEffectAnimation("#ifFirstEqlToNull", "#ifConForAddNode", function() {
							var firstVal = $("#firstVal" + returnValCount).text().trim();
							ifConToChekisFirstEqlToNull(firstVal, "ifFirstEqlToNull");
						});	
					}); 
				break;
				case "firstEqlToTemp" :
					$('.introjs-tooltip').removeClass('hide');
					var text = "The <span class='ct-code-b-yellow'>temp</span> value i.e. ("
							+ '<span class="ct-code-b-yellow">' + $("#nodeVal1").text() 
							+ '</span>) is stored in <span class="ct-code-b-yellow">first</span>.';
					typing('.introjs-tooltiptext' , text, function() {
						introNextSteps("#animatinDiv", "tempValStredInFirst", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "tempValStreInQ" :
					$('.introjs-tooltip').removeClass('hide');
					var text = "The <span class='ct-code-b-yellow'>temp</span> value i.e. ("
							+ '<span class="ct-code-b-yellow">' + $("#nodeVal1").text() 
							+ '</span>) is stored in <span class="ct-code-b-yellow">q</span>.';
					typing('.introjs-tooltiptext' , text, function() {
						introNextSteps("#animatinDiv", "tempValStredInQ", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "tempToQNext":
					$('.introjs-tooltip').removeClass('hide');
					var text = "The <span class='ct-code-b-yellow'>temp</span> value i.e. ("
							+ '<span class="ct-code-b-yellow">' + $("#nodeVal1").text() 
							+ '</span>) is stored in <span class="ct-code-b-yellow">q -> next</span>.';
					typing('.introjs-tooltiptext' , text, function() {
						introNextSteps("#animatinDiv", "tempvalstoredInQNext", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "callConcatMethod" : 
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "methodCall" :
							$('.introjs-tooltip').removeClass('hide');
							text = 'Here, we call the '
								+ ' <span class="ct-code-b-yellow">'+ buttonName +'()</span> method and '
								+ ' pass <span class="ct-code-b-yellow">l1</span> and '
								+ ' <span class="ct-code-b-yellow">l2</span> data (i.e. '
								+ ' <span class="ct-code-b-yellow">'+ $("#l1Val").text() 
								+ '</span> and  <span class="ct-code-b-yellow">'+ $("#l2Val").text() 
								+ '</span>) as a argument and '
								+ ' the <span class="ct-code-b-yellow">return</span> value is stored in the'
								+ ' variable <span class="ct-code-b-yellow">l3</span>.';
							typing('.introjs-tooltiptext', text, function() {
								if (buttonName == "concat") {
									preConcatOperation();
									introNextSteps("#sllOperations", "concatNode", "right");
									$('.introjs-nextbutton').show();		
								} else {
									preUnionOperation();
									introNextSteps("#sllOperations", "concatNode", "right");
									$('.introjs-nextbutton').show();
								}
								
							});
						break;
						 case "returnValue" :
							 $('.introjs-tooltip').removeClass('hide');
							 text = 'The <span class="ct-code-b-yellow">concat(l1, l2)</span> return value '
							 		+ ' is stroed on <span class="ct-code-b-yellow">l3</span>.'
					 		typing('.introjs-tooltiptext', text, function() {
								introNextSteps("#animatinDiv", "storeT3ToL3", "right");
									$('.introjs-nextbutton').show();
							});
						break;
						case "returnValue1" :
							$('.introjs-tooltip').removeClass('hide');
							 text = 'The <span class="ct-code-b-yellow">unions(l1, l2)</span> return value '
							 		+ ' is stroed on <span class="ct-code-b-yellow">l3</span>.'
					 		typing('.introjs-tooltiptext', text, function() {
					 			$("#unionOperations").empty().addClass("opacity00");
					 			$(".fa").remove();
					 			$("#animatinDiv").removeClass("z-index1000000");
								introNextSteps("#animatinDiv", "storeUnionl3Value", "right");
									$('.introjs-nextbutton').show();
							});
						break;
					}
				break;
				case "callToConcatMethod" :
					var animateStep = introjs._introItems[introjs._currentStep].animateStep;
					switch(animateStep) {
						case "methodCall" :
							$('.introjs-tooltip').removeClass('hide');
							text = 'Here, we call the '
								+ ' <span class="ct-code-b-yellow">concat()</span> method and '
								+ ' pass <span class="ct-code-b-yellow">l1</span> and '
								+ ' <span class="ct-code-b-yellow">l2</span> data (i.e. '
								+ ' <span class="ct-code-b-yellow">'+ $("#l1Val").text() 
								+ '</span> and  <span class="ct-code-b-yellow">'+ $("#l2Val").text() 
								+ '</span>) as a argument and '
								+ ' the <span class="ct-code-b-yellow">return</span> value is stored in the'
								+ ' variable <span class="ct-code-b-yellow">l3</span>.';
							typing('.introjs-tooltiptext', text, function() {
								$('.introjs-tooltiptext').append("<a class='introjs-button introjs-duplicate-nextbutton'>next &#8594;</a>");
								$(".introjs-duplicate-nextbutton").click(function() {
									$(".introjs-duplicate-nextbutton").remove();
									$("#sllOperations").empty();
									preConcatOperation();
									buttonName = "concat";
									$(introjs._options.steps[introjs._currentStep].element).addClass("introjs-relativePosition introjs-showElement");
									introNextSteps("#sllOperations", "concatNode", "right");
									introjs.nextStep();
								})
							});
						break;
						 case "returnValue" :
							$('.introjs-tooltip').removeClass('hide');
							text = 'The <span class="ct-code-b-yellow">concat(l1, l2)</span> return value '
							 		+ ' is stroed on <span class="ct-code-b-yellow">l3</span>.'
					 		typing('.introjs-tooltiptext', text, function() {
								introNextSteps("#animatinDiv", "storeT3ToL3", "right");
								$('.introjs-nextbutton').show();
							});
						break;
					}
				break;
				case "concatTwoNodes" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we are declaring <span class="ct-code-b-yellow">t1</span> and '
							+ ' <span class="ct-code-b-yellow">t2</span> nodes'
							+ ' and that will be initialized to <span class="ct-code-b-yellow">concat(l1, l2)</span>'
							+ ' method passed value.';
					typing('.introjs-tooltiptext', text, function() {
						createLastNode(1, "t3", 2);createLastNode(1, "t1", 1);
						if (!concatflag) {
							rechangeSVGLineHeights(true);
						}
						introNextSteps("#animatinDiv", "declrT1AndT2Nodes", "right");
						$('.introjs-nextbutton').show();
					});	
				break;
				case "unionTwoNodes" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we are declaring a local variable <span class="ct-code-b-yellow">l1</span> and '
						+ ' <span class="ct-code-b-yellow">l2</span> nodes'
						+ ' and that will be initialized to <span class="ct-code-b-yellow">union(l1, l2)</span>'
						+ ' method passed value.';
					typing('.introjs-tooltiptext', text, function() {
						concatflag = true;
						createLastNode(1, "t3", 5);createLastNode(1, "t1<sub>inUnion</sub>", 2);
						createLastNode(1, "t2<sub>inUnion</sub>", 3);createLastNode(1, "q<sub>inUnion</sub>", 4);
						rechangeSVGLineHeights(true);
						introNextSteps("#animatinDiv", "declrL1AndL2Nodes", "right");
						$('.introjs-nextbutton').show();
					});
				break;
				case "decNodeT3" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we declaring <span class="ct-code-b-yellow">t3</span> node.';
					typing(".introjs-tooltiptext", text, function() {
						introNextSteps("#animatinDiv", "declrT3Nodes", "right");
						$('.introjs-nextbutton').show();
					});
				break;
				case "decForNodes" :
					$('.introjs-tooltip').removeClass('hide');
					var text = 'Here, we declaring <span class="ct-code-b-yellow">l3</span>, '
							+ '<span class="ct-code-b-yellow">t1</span>, '
							+ '<span class="ct-code-b-yellow">t2</span> and, '
							+ '<span class="ct-code-b-yellow">q</span>, nodes. The '
							+ '<span class="ct-code-b-yellow">q</span> node will be initializing to '
							+ '<span class="ct-code-b-yellow">NULL</span>.';
					typing(".introjs-tooltiptext", text, function() {
						introNextSteps("#animatinDiv", "declrFourNodes", "right");
						$('.introjs-nextbutton').show();
					});
				break;
				case "ifT"+ tCount +"IsNull" :
					ifConditionCheckingText("t" + tCount , "== NULL" ,function() {
						toEffectAnimation("#ifT"+ tCount +"IsNull", "#ifConForAddNode", function() {
							if(tCount == 1) {
								var firstVal = $("#nodeVal1").text().trim();
								ifConToChekisFirstEqlToNull(firstVal, "ifT"+ tCount +"IsNull");
							} else {
								var firstVal = $("#firstVal2").text().trim(); 
								ifConToChekisFirstEqlToNull(firstVal, "ifT"+ tCount +"IsNull");
							}
						});
					});
				break;
				case "returnT" + tCount :
					$(introjs._options.steps[introjs._currentStep].element).removeClass("introjs-relativePosition introjs-showElement");
					if (concatflag) {
						setTimeout(function() {
							preUnionOperation();
							introNextSteps("#callToConcatMethod", "returnValue", "bottom");
							$(introjs._options.steps[introjs._currentStep + 1].element).addClass("introjs-relativePosition introjs-showElement");
							setTimeToIntroGoNextStep();
						},500);
					} else {
						introNextSteps("#callConcatMethod", "returnValue", "bottom");
						setTimeToIntroGoNextStep();
					}
				break;
				case "returnT4" :
					introNextSteps("#callConcatMethod", "returnValue1", "bottom");
					setTimeToIntroGoNextStep();
				break;
				case "t1StoredToT3" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'The <span class="ct-code-b-yellow">t1</span> value i.e('
							+ '<span class="ct-code-b-yellow">'+ $("#t1val").text() +'</span>) is stored '
							+ ' in <span class="ct-code-b-yellow">t3</span>.';
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "streT1ToT3", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "whileT1NxtNotEqNull" :
					whileConditionCheckingText("t1 -> next", " != NULL", function() {
						toEffectAnimation("#whileT1NxtNotEqNull", "#whileConForAddNode", function() {
							var firstVal = $("#nextDiv" + count).text().trim();
							whileConForT1nextNotEqNull(firstVal, "whileT1NxtNotEqNull");
						});
					});
				break;
				case "t1nxtToT1" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'The <span class="ct-code-b-yellow">t1 -> next</span> value i.e('
							+ '<span class="ct-code-b-yellow">'+ $("#nextDiv" + count).text() +'</span>) is stored '
							+ ' in <span class="ct-code-b-yellow">t1</span>.';
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "streT1nextToT1", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "t2StoreT1Nxt" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'The <span class="ct-code-b-yellow">t2</span> value i.e('
							+ '<span class="ct-code-b-yellow">'+ $("#firstVal2").text() +'</span>) is stored '
							+ ' in <span class="ct-code-b-yellow">t1 -> next</span>.';
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "streT2NextToT1Nxt", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "printFunction" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'Here, we are calling the '
						+ ' <span class="ct-code-b-yellow">print()</span> method and '
						+ ' pass <span class="ct-code-b-yellow">l3</span> data (i.e. '
						+ ' <span class="ct-code-b-yellow">'+ $("#l3Val").text() +'</span>) as a argument.';
					typing('.introjs-tooltiptext', text, function() {
						count = 1;
						$("#sllOperations").removeClass("opacity00")
						prePrintfFunctionOperation();
						introNextSteps("#sllOperations", "displayPrintFun", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "printNode" :
					introNextSteps("#animatinDiv", "dspFstNode", "bottom");
					setTimeToIntroGoNextStep();
				break;
				case "nodeQ" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'Here, we are declaring and initializing a <span class="ct-code-b-yellow">q</span> note'
							+ ' with <span class="ct-code-b-yellow">first</span> node value.'
					typing('.introjs-tooltiptext', text, function() {
						introNextSteps("#animatinDiv", "decAndStreQVal", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
				case "firstIsNull" :
					ifConditionCheckingText("first", " == NULL", function() {
						toEffectAnimation("#ifFstEqNull", "#ifConForAddNode", function() {
							var firstVal = $("#firstVal1").text().trim();
							ifConToChekisFirstEqlToNull(firstVal, "ifFirstIsNull");
						});	
					});
				break;
				case "whileQNotEqNull" :
					whileConditionCheckingText("q", " != NULL", function() {
						toEffectAnimation("#checkQNxtNull", "#whileConForAddNode", function() {
							var firstVal = $("#nodeVal1").text().trim();  
							whileConForT1nextNotEqNull(firstVal, "whileQNotEqNull");
						});
					});
				break;//poorna
				case "qNxtToQ" :
					introNextSteps("#animatinDiv", "qNxtToQNode", "bottom");
					setTimeToIntroGoNextStep();
				break;
				case "nodeRepeation" :
					removeLine();
					unionOperationFunction();
					introNextSteps("#unionOperations", "", "left");
					setTimeToIntroGoNextStep();	
				break;
				case "unionOperations" :
					var t1Val = $("#l3ValInUn").text().trim();
					$("#unionOperations").removeClass("opacity00");
					$("#animatinDiv").addClass("z-index1000000");
					arrow("#firstLoop", "#firstLoop", function() {
						$('.introjs-tooltip').removeClass('hide');
						var text = "The <span class='ct-code-b-yellow'>t1</span> value will be initialize to "
								+ " <span class='ct-code-b-yellow'>l3</span>"
								+ " (i.e <span class='ct-code-b-yellow'>"+$("#l3ValInUn").text() +"</span>)";
						typing('.introjs-tooltiptext', text, function() {
							$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
									+ "onclick = outerLoopIniializationText()>Next &#8594;</a>");
						});
					});
				break;
				case "p3" :
					introNextSteps("#consoleId", "displyUnionText", "bottom");
					setTimeToIntroGoNextStep();
				break;
				case "p4" :
					$('.introjs-tooltip').removeClass('hide');
					text = 'Here, we are calling the '
						+ ' <span class="ct-code-b-yellow">print()</span> method and '
						+ ' pass <span class="ct-code-b-yellow">l3</span> data (i.e. '
						+ ' <span class="ct-code-b-yellow">'+ $("#l3Val").text() +'</span>) as a argument.';
					typing('.introjs-tooltiptext', text, function() {
						count = 1;
						$("#sllOperations").removeClass("opacity00")
						prePrintfFunctionOperation();
						introNextSteps("#sllOperations", "displayPrintFun", "bottom");
						$('.introjs-nextbutton').show();
					});
				break;
			}
		});
	});
	introjs.start();
	var text = "Here, we learn the <span class='ct-code-b-yellow'>Single Linked List Operation</span>"
			+ " i.e. <span class='ct-code-b-yellow'>Concat</span>,<span class='ct-code-b-yellow'>Union</span>,"
			+"<span class='ct-code-b-yellow'>intersect</span>,.";
	typing('.introjs-tooltiptext', text, function() {
		$('.introjs-nextbutton').show();
	});
	$('.introjs-skipbutton, .introjs-prevbutton, .introjs-nextbutton').hide();
}

function outerLoopIniializationText() {
	var t1Val = $("#l3ValInUn").text().trim();
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').addClass('hide');
	rotationEffect("#l3ValInit",  t1Val, function() {
		$("#nodeVal2").text($("#l3ValInit").text());
		fromEffectWithTweenMax("#l3ValInit", "#nodeVal2", false, function() {
			if (t1Val !=  "NULL") {
				svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
						+ outerLoop, "#svgId", "line22", "arrow", function() {
					outerLoopConditionText(t1Val);
				});
			} else {
				outerLoopConditionText(t1Val);
			}
	    });
	});
}

function outerLoopConditionText(t1Val) {
	$('.introjs-tooltip').removeClass('hide');
	var text = "Now check the condition <span class='ct-code-b-yellow'>t1 != NULL && "
				+ "t1 -> next != NULL</span>."
	typing('.introjs-tooltiptext', text, function() {
		if (outerLoop == 1) {
			t1Val = $("#l3ValInUn").text().trim();
		} else {
			t1val = $("#nodeVal2").text().trim();
		}
		$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
			+ "onclick = outerLoopCheck("+ "\"" + t1Val.toString() + "\"" +")>Next &#8594;</a>");
	});

}

function outerLoopCheck(t1Val) {
	$("#secondLoopTrueOrFalse, #ifConTrueorFalse").empty()
	$("#secFstCon, #secSecCon").removeClass("true");
	$("#secFstCon, #secSecCon").removeClass("false");
	checkCondition("#t1", "#fstFstCon", t1Val, function() {
		var t1Con = t1Val != "NULL";
		if (t1Con) {
    		firstForLoopFstConTrueCon();		
    	} else {
    		firstForLoopFalseCon();
    	}
	});
}

function firstForLoopFstConTrueCon() {
	var t1Val = $("#next"+outerLoop).text().trim();
	$('.introjs-tooltip').removeClass('hide');
	var text = "The first condition evaluates to <span class='ct-code-b-yellow'>true</span> "
			+ "so check the second condition <span class='ct-code-b-yellow'>t1->next != NULL</span>.";
	typing('.introjs-tooltiptext', text, function() {
		$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
				+ "onclick = outerLoopSecondCon("+ "\"" + t1Val.toString() + "\"" +")>Next &#8594;</a>");
	});
}

function firstForLoopFalseCon() {
	$('.introjs-tooltip').removeClass('hide');
	var text = "The first condition evaluates to <span class='ct-code-b-yellow'>false</span> "
			+ "so no need to check the second condition <span class='ct-code-b-yellow'>t1->next != NULL</span>"
			+ " because we are using <span class='ct-code-b-yellow'>&&</span> operator, the total condition will"
			+ " evaluates to <span class='ct-code-b-yellow'>false</span>";
	typing('.introjs-tooltiptext', text, function() {
		$("#firstLoopTrueOrFalse").removeClass("green-color");
		$("#firstLoopTrueOrFalse").text("=====> false").addClass("red-color");
		concatflag = false;
		introNextSteps("#returnT4", "", "left");
		$('.introjs-nextbutton').show();
	});
}

function outerLoopSecondCon(t1Val) {
	checkCondition("#t1Nxt", "#fstSecCon", t1Val, function() {
		var t1Con = t1Val != "NULL";
		if (t1Con) {
			inOuterLoopBothAreTrue();
    	} else {
    		$("#firstLoopTrueOrFalse").removeClass("green-color");
    		$("#firstLoopTrueOrFalse").text("=====> false").addClass("red-color");
    		$('.introjs-tooltip').removeClass('hide');
    		var text= "The total condition evaluates to <span class='ct-code-b-yellow'>false</span>."
    		typing('.introjs-tooltiptext', text, function() {
    			concatflag = false;
    			introNextSteps("#returnT4", "", "left");
    			$('.introjs-nextbutton').show();
    		});
    	}
	});
}

function inOuterLoopBothAreTrue() {
	$('.introjs-tooltip').removeClass('hide');
	$("#firstLoopTrueOrFalse").removeClass("red-color");
	$("#firstLoopTrueOrFalse").text("=====> true").addClass("green-color");
	var text = "The second condition is also evaluates to  <span class='ct-code-b-yellow'>true</span> "
			+  "  the total condition will evaluates <span class='ct-code-b-yellow'>true</span>, so"
			+ " the control enters into the for loop block";
	typing('.introjs-tooltiptext', text, function() {
		$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
				+ "onclick = innerForLoop()>Next &#8594;</a>");
	});
}

function innerForLoop() {
	if (outerLoop == 1) {
		var t2Val = $("#l3ValInit").text().trim();
	} else {
		var t2Val = $("#nodeVal2").text().trim();
	}
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').addClass('hide');
	arrow("#firstLoop", "#secondLoop", function() {
		$('.introjs-tooltip').removeClass('hide');
		var text = "The <span class='ct-code-b-yellow'>t2</span> value will be initialize to "
				+ " <span class='ct-code-b-yellow'>t1</span>"
				+ " (i.e <span class='ct-code-b-yellow'>"+ t2Val +"</span>)";
		typing('.introjs-tooltiptext', text, function() {
			$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
					+ "onclick = innerLoopIniialization("+ "\"" + t2Val.toString() + "\"" +")>Next &#8594;</a>");
		});
	});
}

function innerLoopIniialization(t2Val) {
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').addClass('hide');
	rotationEffect("#t1ValInit", t2Val, function() {
		$("#nodeVal3").text($("#t1ValInit").text());
		fromEffectWithTweenMax("#t1ValInit", "#nodeVal3", false, function() {
			var t2Value = $("#nodeVal3").text().trim();
			innerLoopConditionText("\"" + t2Value.toString() + "\"");
	   });
	});
}

function innerLoopConditionText(t2Val) {
	if (t2Val ==  "NULL") {
		$('.introjs-tooltip').removeClass('hide');
		var text = "Now check the condition <span class='ct-code-b-yellow'>t2 != NULL && "
				+ "t2 -> next != NULL</span>."
		typing('.introjs-tooltiptext', text, function() {
			$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
					+ 'onclick = innerLoopFstConCheck("NULL")>Next &#8594;</a>');
		});
	} else {
		$("#line23").remove();
		svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
				+ innerLoop, "#svgId", "line23", "arrow", function() {
			$('.introjs-tooltip').removeClass('hide');
			var text = "Now check the condition <span class='ct-code-b-yellow'>t2 != NULL && "
					+ "t2 -> next != NULL</span>."
			typing('.introjs-tooltiptext', text, function() {
				$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
						+ "onclick = innerLoopFstConCheck("+ t2Val.toString() +")>Next &#8594;</a>");
			});
			
		});
	}
}

function innerLoopConditionText1(t2Val) {
	removeLine();
	arrow("#freeQnode", "#secondLoop", function() {
		$('.introjs-tooltip').removeClass('hide');
		var text = "Now check the condition <span class='ct-code-b-yellow'>t2 != NULL && "
				+ "t2 -> next != NULL</span>."
		typing('.introjs-tooltiptext', text, function() {
			if (t2Val == "NULL") {
				$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
						+ 'onclick = innerLoopFstConCheck("NULL")>Next &#8594;</a>');
			} else {
				$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
						+ "onclick = innerLoopFstConCheck("+ t2Val.toString() +")>Next &#8594;</a>");
			}
		});
	});
}


function innerLoopFstConCheck(t2Val) {
	checkCondition("#t2", "#secFstCon", t2Val, function() {
		var t2Con = t2Val != "NULL";
		if (t2Con) {
			var t2Value = $("#next" + (innerLoop + 1)).text().trim();
			firstInnerForLoopSecConText("\"" + t2Value.toString() + "\"");
    	} else {
    		$('.introjs-tooltip').removeClass('hide');
    		var text = "The first condition evaluates to <span class='ct-code-b-yellow'>false</span> "
    				+ "so no need to check the second condition <span class='ct-code-b-yellow'>t2->next != NULL</span>"
    				+ " the total condition will evaluates to <span class='ct-code-b-yellow'>false</span>.";
    		typing('.introjs-tooltiptext', text, function() {
    			$("#secondLoopTrueOrFalse").removeClass("green-color");
    			$("#secondLoopTrueOrFalse").text("=====> false").addClass("red-color");
   				$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
  						+ "onclick = t1IncrementText()>Next &#8594;</a>");
    		});
    	}
	});
}

function firstInnerForLoopSecConText(t2Val) {
	$('.introjs-tooltip').removeClass('hide');
	var text = "The first condition evaluates to <span class='ct-code-b-yellow'>true</span> "
			+ "so check the second condition <span class='ct-code-b-yellow'>t2->next != NULL</span>.";
	typing('.introjs-tooltiptext', text, function() {
		$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
				+ "onclick = innerLoopSecondCon()>Next &#8594;</a>");
	});
}

function innerLoopSecondCon() {
	var t2Val = $("#next" + (innerLoop)).text().trim();
	$(".introjs-duplicate-nextbutton").remove();
	checkCondition("#t2Next", "#secSecCon", t2Val, function() {
		var t2Con = t2Val != "NULL";
		if (t2Con) {
			ininnerLoopBothAreTrue();
    	} else {
    		$("#secondLoopTrueOrFalse").removeClass("green-color")
    		$("#secondLoopTrueOrFalse").text("=====> false").addClass("red-color");
    		$('.introjs-tooltip').removeClass('hide');
    		var text= "The total condition evaluates to <span class='ct-code-b-yellow'>false</span>"
    		typing('.introjs-tooltiptext', text, function() {
    			$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
						+ "onclick = t1IncrementText()>Next &#8594;</a>");
    		});
    	}
	});
}

function ininnerLoopBothAreTrue() {
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').removeClass('hide');
	$("#secondLoopTrueOrFalse").text("=====> true").addClass("green-color");
	var text = "The second condition is also evaluates to  <span class='ct-code-b-yellow'>true</span> "
			+  "  the total condition will evaluates <span class='ct-code-b-yellow'>true</span>, so"
			+ " the control enters into the if block and check the condition "
			+ " <span class='ct-code-b-yellow'>t1 -> data == t2 -> next -> data </span>.";
	typing('.introjs-tooltiptext', text, function() {
		$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
				+ "onclick = ifCondition()>Next &#8594;</a>");
	});
}

function ifCondition() {
	arrow("#secondLoop", "#ifCondition", function() {
		$(".introjs-duplicate-nextbutton").remove();
		var value1 = $("#data" + outerLoop).text()
		var value2 = $("#data" + (innerLoop + 1)).text()
		rotationEffect("#t1Data", value1, function() {
		  rotationEffect("#t2NextData", value2, function() {
		    if (value1 == value2)  {
		      $("#ifConTrueorFalse").text("=====> true").addClass("green-color");
		      $('.introjs-tooltip').removeClass('hide');
		      var text = "The if condition will evaluates to <span class='ct-code-b-yellow'>true</span>";
		      typing('.introjs-tooltiptext', text, function() {
		    	  $(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
		  				+ "onclick = qEqlT2Nxt()>Next &#8594;</a>");
		      });
		    } else {
		      $("#ifConTrueorFalse").text("=====> false").addClass("red-color");
		      $('.introjs-tooltip').removeClass('hide');
		      var text = "The if condition will evaluates to <span class='ct-code-b-yellow'>false</span>";
		      typing('.introjs-tooltiptext', text, function() {
		    	  $(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
			  				+ "onclick = incrementT2ValueText()>Next &#8594;</a>");
		      });
		    }
		  });
		});
	});
}

function qEqlT2Nxt() {
	arrow("#ifCondition", "#fstStat", function() {
		$('.introjs-tooltip').removeClass('hide');
		var text = "<span class='ct-code-b-yellow'>t2 -> next</span>"
		  	+ "(i.e <span class='ct-code-b-yellow'>"+ $("#next" + innerLoop).text() 
			+ "</span>) is stored in <span class='ct-code-b-yellow'>q</span>"
		typing('.introjs-tooltiptext', text, function() {
			$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
	  				+ "onclick = qEQlT2NxtAnimation()>Next &#8594;</a>");
		});
	})
}

function qEQlT2NxtAnimation() {
	$(".introjs-duplicate-nextbutton").remove();
	$("#nodeVal4").removeClass("opacity00");
	fadeInBounceEffectWithTimelineMax("#next" + (innerLoop), "#nodeVal4",  function() {
		if ($("#nodeVal4").text().trim() == "NULL") {
			$("#line26").remove();
            $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
			+ "onclick = qNxtToT2Nxt()>Next &#8594;</a>");
		} else {
			if ($("#l2ValInUn").text().trim() == "NULL") {
				svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory4", "#nextDiv"
						+ (innerLoop + 1), "#svgId", "line26", "arrow", function() {
					 $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
								+ "onclick = qNxtToT2Nxt()>Next &#8594;</a>");
				});
			} else if ($("#l1ValInUn").text().trim() == "NULL") {
				svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory4", "#nextDiv"
						+ (innerLoop + 1), "#svgId", "line26", "arrow", function() {
					 $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
								+ "onclick = qNxtToT2Nxt()>Next &#8594;</a>");
				});
			} else {
				if (innerLoop < fstNdeInSecdList) {
					svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory4", "#nextDiv"
							+ (innerLoop + 1), "#svgId", "line26", "arrow", function() {
						 $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
									+ "onclick = qNxtToT2Nxt()>Next &#8594;</a>");
					});
				} else {
					svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory4", "#nextDiv"
							+ (innerLoop + 1), "#svgId", "line26", "arrow", function() {
						 $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
									+ "onclick = qNxtToT2Nxt()>Next &#8594;</a>");
					});
				}
			}
		}  
	});
}


function qNxtToT2Nxt() {
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').removeClass('hide');
	arrow("#fstStat", "#secStat", function() {
		var text = "The <span class='ct-code-b-yellow'>q -> next</span> value (i.e "
			+ "<span class='ct-code-b-yellow'>"+ $("#next" + (innerLoop + 1)).text() +"</span>)"
			+ " stored in <span class='ct-code-b-yellow'>t2 -> next</span>.";
		typing('.introjs-tooltiptext', text, function() {
			$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
				+ "onclick = qNxtToT2NxtAnimation()>Next &#8594;</a>");
		});	
	})
	
}

function qNxtToT2NxtAnimation() {
	$(".introjs-duplicate-nextbutton").remove();
	fadeInBounceEffectWithTimelineMax("#next" + (innerLoop + 1), "#next" + innerLoop,  function() {
		if ($("#next" + (innerLoop)).text().trim() == "NULL") {
			$("#line" + (innerLoop)).remove();
			$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
					+ "onclick = freeQNode()>Next &#8594;</a>");
		} else {
			if ($("#l2ValInUn").text().trim() == "NULL") {
				$("#line" + (innerLoop + 1)).remove();
				svgAnimatingLineBottomToTop("#animatinDiv", "#nextDiv" + (innerLoop), "#dataDiv"
						+ (innerLoop + 2), "#svgId", "line" + (innerLoop + 1), "arrow", function() {
					$("#line" + (innerLoop + 1)).attr("class", "svg-line lineNumber");
					$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
							+ "onclick = freeQNode()>Next &#8594;</a>");
				});
			} else if ($("#l1ValInUn").text().trim() == "NULL") {
				$("#line" + (innerLoop + 1)).remove();
				svgAnimatingLineRightToLeft("#animatinDiv", "#nextDiv" + (innerLoop), "#dataDiv"
						+ (innerLoop + 2), "#svgId", "line" + (innerLoop + 1), "arrow", function() {
					$("#line" + (innerLoop + 1)).attr("class", "svg-line lineNumber");
					$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
							+ "onclick = freeQNode()>Next &#8594;</a>");
				});
			} else {
				if ((innerLoop + 1) == $("#dynamicNodes1 > .list-nodes").length) {
					$("#line" + (innerLoop + 1)).remove();
					svgAnimatingLineBottomToTop("#animatinDiv", "#nextDiv" + (innerLoop), "#dataDiv"
							+ (innerLoop + 2), "#svgId", "line" + (innerLoop + 1), "arrow", function() {
						$("#line" + (innerLoop + 1)).attr("class", "svg-line lineNumber");
						$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
								+ "onclick = freeQNode()>Next &#8594;</a>");
					});
				} else {
					$("#line" + (innerLoop + 1)).remove();
					svgAnimatingLineRightToLeft("#animatinDiv", "#nextDiv" + (innerLoop), "#dataDiv"
							+ (innerLoop + 2), "#svgId", "line" + (innerLoop + 1), "arrow", function() {
						$("#line" + (innerLoop + 1)).attr("class", "svg-line lineNumber");
						$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
								+ "onclick = freeQNode()>Next &#8594;</a>");
					});
				}
			}
		}
	});
}

function freeQNode() {
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').removeClass('hide');
	arrow("#secStat", "#freeQnode", function() {
		var text = "free the node <span class='ct-code-b-yellow'>q</span>";
		typing('.introjs-tooltiptext', text, function() {
			$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
				+ "onclick = freeQNodeAnimation()>Next &#8594;</a>");
		});
	});
}

function freeQNodeAnimation() {
	$(".introjs-duplicate-nextbutton").remove();
	$("#line26").remove();
	$("#nodeVal4").text("").addClass("opacity00");
	$("#line"+ (innerLoop)).remove();
	TweenMax.to("#node" + (innerLoop + 1), 0.5, { top : -80, onComplete: function() {
		$("#node" + (innerLoop + 1)).addClass("opacity00").removeClass("list-nodes");
	  	extraNode = 20 + innerLoop;
	  	deleteParticularNode(extraNode) 
	  	changePosIds();
		var lValue = $("#nodeVal3").text().trim();
	  	$(".introjs-tooltiptext").append("<br><a class='introjs-button introjs-duplicate-nextbutton'" 
			+ "onclick = innerLoopConditionText1("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
	}});
}

function incrementT2ValueText() {
	$("#secondLoopTrueOrFalse, #ifConTrueorFalse").empty()
	$("#secFstCon, #secSecCon").removeClass("true");
	$("#secFstCon, #secSecCon").removeClass("false");
	$("#t2Inc").addClass("blue");
	$('.introjs-tooltip').removeClass('hide');
	arrow("#secondLoop", "#t2Increment", function() {
		var text = "Now the <span class='ct-code-b-yellow'>t2</span> value will be incremet by "
				+ " <span class='ct-code-b-yellow'>t2 -> next</span> value. ";
		typing('.introjs-tooltiptext', text, function() {
			$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
					+ "onclick = incrementT2Value()>Next &#8594;</a>");
		});
	});
}

function incrementT2Value() {
	$("#t2Inc").removeClass("blue");
	arrow("#ifCondition", "#secondLoop", function() {
		$(".introjs-duplicate-nextbutton").remove();
		if ($("#next" + innerLoop).text().trim() == "NULL") {
			svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
					+ innerLoop, "#svgId", "line25", "arrow", function() {
				$("#line25").remove();
				t2incrementValue();
			});
		} else {
			if ($("#l2ValInUn").text().trim() == "NULL") {
				svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
						+ innerLoop, "#svgId", "line25", "arrow", function() {
					$("#line25").remove();
					t2incrementValue();
				});
			} else if ($("#l1ValInUn").text().trim() == "NULL") {
				svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
						+ innerLoop, "#svgId", "line25", "arrow", function() {
					$("#line25").remove();
					t2incrementValue();
				});
			} else {
				if (innerLoop < fstNdeInSecdList) {
					svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
							+ innerLoop, "#svgId", "line25", "arrow", function() {
						$("#line25").remove();
						t2incrementValue();
					});
				} else {
					svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
							+ innerLoop, "#svgId", "line25", "arrow", function() {
						$("#line25").remove();
						t2incrementValue();
					});
				}
			}
		}
	});
} 

function t2incrementValue() {
	fadeInBounceEffectWithTimelineMax("#next" + innerLoop, "#nodeVal3",  function() {
		removeLine();
		innerLoop++;
		var lValue = $("#nodeVal3").text().trim();
   		if ($("#nodeVal3").text().trim() == "NULL") {
   		 	$("#line23").remove();
            $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
			+ 'onclick = innerLoopConditionText1("NULL")>Next &#8594;</a>');
   		} else {
   			if ($("#l2ValInUn").text().trim() == "NULL") {
   				$("#line23").remove();
   				svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
   						+ innerLoop, "#svgId", "line23", "arrow", function() {
   						   	$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
   								+ "onclick = innerLoopConditionText1("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
   							});	
			} else if ($("#l1ValInUn").text().trim() == "NULL") {
				$("#line23").remove();
				svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
				+ innerLoop, "#svgId", "line23", "arrow", function() {
				    $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
							+ "onclick = innerLoopConditionText1("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
				});
			} else {
				if (innerLoop < fstNdeInSecdList) {
	        	    $("#line23").remove();
					svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
					+ innerLoop, "#svgId", "line23", "arrow", function() {
					   	$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
							+ "onclick = innerLoopConditionText1("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
						});	
				} else {
	            	$("#line23").remove();
					svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory3", "#nextDiv"
					+ innerLoop, "#svgId", "line23", "arrow", function() {
					    $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
								+ "onclick = innerLoopConditionText1("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
					});
				}
   			
			}
    	}
	});
}

function t1IncrementText() {
	$("#secondLoopTrueOrFalse, #ifConTrueorFalse, #firstLoopTrueOrFalse").empty()
	$("#secFstCon, #secSecCon, #fstFstCon, #fstSecCon").removeClass("true");
	$("#secFstCon, #secSecCon, #fstFstCon, #fstSecCon").removeClass("false");
	$(".introjs-duplicate-nextbutton").remove();
	$("#t1Inc").addClass("blue");
	$("#t1Inc").effect( "highlight",{color: 'blue'}, 500);
	arrow("#secondLoop", "#firstLoop", function() {
		$('.introjs-tooltip').removeClass('hide');
		var text = "Now the <span class='ct-code-b-yellow'>t1</span> value will be increment by "
				+ " <span class='ct-code-b-yellow'>t1 -> next</span> value. ";
		typing('.introjs-tooltiptext', text, function() {
			innerLoop = 2;
			 $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
						+ "onclick = t1Increment()>Next &#8594;</a>");
		});
	});
}

function t1Increment() {
	$(".introjs-duplicate-nextbutton").remove();
	$("#t1Inc").removeClass("blue");
	arrow("#secondLoop", "#firstLoop", function() {
		$(".introjs-duplicate-nextbutton").remove();
		if ($("#next" + (innerLoop - 1)).text().trim() == "NULL") {
			svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
					+ outerLoop, "#svgId", "line25", "arrow", function() {
				$("#line25").remove();
				t1incrementValue();
			});
		} else {
			if ($("#l2ValInUn").text().trim() == "NULL") {
				svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
						+ outerLoop, "#svgId", "line25", "arrow", function() {
					$("#line25").remove();
					t1incrementValue();
				});
			} else if ($("#l1ValInUn").text().trim() == "NULL") {
				svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
						+ outerLoop, "#svgId", "line25", "arrow", function() {
					$("#line25").remove();
					t1incrementValue();
				});
			} else {
				if (outerLoop < fstNdeInSecdList ) {
					svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
							+ outerLoop, "#svgId", "line25", "arrow", function() {
						$("#line25").remove();
						t1incrementValue();
					});
				} else {
					svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
							+ outerLoop, "#svgId", "line25", "arrow", function() {
						$("#line25").remove();
						t1incrementValue();
					});
				}
			}
		}
	});
}

function t1incrementValue() {
	fadeInBounceEffectWithTimelineMax("#next" + outerLoop, "#nodeVal2",  function() {
		removeLine();
		outerLoop++;
		var lValue = $("#nodeVal2").text().trim();
   		if ($("#nodeVal2").text().trim() == "NULL") {
   		 	$("#line22").remove();
            $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
			+ "onclick = outerLoopConditionText("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
   		} else {
   			if ($("#l2ValInUn").text().trim() == "NULL") {
   				$("#line22").remove();
   				svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
   						+ outerLoop, "#svgId", "line22", "arrow", function() {
   						   	$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
   								+ "onclick = outerLoopConditionText("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
   							});	
			} else if ($("#l1ValInUn").text().trim() == "NULL") {
				$("#line22").remove();
				svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
						+ outerLoop, "#svgId", "line22", "arrow", function() {
						    $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
									+ "onclick = outerLoopConditionText("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
				});
			} else {
				if (outerLoop < fstNdeInSecdList) {
	        	    $("#line22").remove();
					svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
					+ outerLoop, "#svgId", "line22", "arrow", function() {
					   	$(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
							+ "onclick = outerLoopConditionText("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
						});	
				} else {
	            	$("#line22").remove();
					svgAnimatingLineBottomToTop("#animatinDiv", "#lastNodeMemory2", "#nextDiv"
					+ outerLoop, "#svgId", "line22", "arrow", function() {
					    $(".introjs-tooltiptext").append("<br/><a class='introjs-button introjs-duplicate-nextbutton'" 
								+ "onclick = outerLoopConditionText("+ "\"" + lValue.toString() + "\"" +")>Next &#8594;</a>");
					});
				}	
			}
    	}
	});
}

function checkCondition(selector1, selector2, value, callBackFunction) {
	$(".introjs-duplicate-nextbutton").remove();
	$('.introjs-tooltip').addClass('hide');
	rotationEffect(selector1, value, function() {
    	$(selector2).effect( "highlight",{color: 'blue'}, 500);
    	var t1Con = (value != "NULL");
    	if (t1Con) {
    		$(selector2).addClass("true");
    	} else {
    		$(selector2).addClass("false");
    	}
    	if (typeof callBackFunction === "function") {
    		callBackFunction();
    	}
	});
}


function valStoreInT3Node() {
	$("#line" + fstNdeInSecdList + ", #line21, #line1").remove();
	$("#lastNodeMemory1, #firstNode1, #firstNode2").addClass("opacity00");
	if (concatflag) {
		introNextSteps("#nodeRepeation", "", "bottom");
		setTimeToIntroGoNextStep();
	} else {
		printfCount = 5;
		introNextSteps("#printf5", "printL3Text", "bottom");
        setTimeToIntroGoNextStep();	
	}
}

function whileConditionCheckingText(selector1, selector2, callBackFunction) {
	$('.introjs-tooltiptext').append("<span id='whileConForAddNode' class='opacity00 ct-code-b-yellow'>"
			+ "<span id='valOfX' class='position'>"+ selector1 +"</span> "+ selector2 +"</span> &nbsp;&nbsp;<span id='whileTrueOrFalse' "
			+ "class='opacity00'></span><br/><spna id='appendText'></span>");
	$('.introjs-tooltip').removeClass('hide');
	if (typeof callBackFunction === "function") {
		callBackFunction();
	}
}


function ifConditionCheckingText(selector1, selector2, callBackFunction) {
	$('.introjs-tooltiptext').append("<span id='ifConForAddNode' class='opacity00 ct-code-b-yellow'>"
			+ "<span id='valOfFirst' class='position'>"+ selector1 +"</span> "+ selector2 
			+ "</span> &nbsp;&nbsp;<span id='ifTrueOrFalse' "
			+ "class='opacity00'></span><br/><spna id='appendText'></span>");
	$('.introjs-tooltip').removeClass('hide');
	if (typeof callBackFunction === "function") {
		callBackFunction();
	}
}

function whileConForT1nextNotEqNull(firstVal, caseName) {
	rotationEffect("#valOfX", firstVal, function() {
		if (firstVal != "NULL") {
			$("#whileTrueOrFalse").html("====> <span class='ct-lime-color'>true</span>");
			zoomInEffect("#whileTrueOrFalse", function() {
				var text = "The condition evaluates to <span class='ct-lime-color'>true</span>."
					+ " So the control enters into the while-body.";
				typing("#appendText", text, function() {
					if (caseName == "whileT1NxtNotEqNull") {
						introNextSteps("#t1nxtToT1", "", "bottom");
					} else {
						printfCount = 9;
						introNextSteps("#printf9", "printData", "bottom");
					}
					$('.introjs-nextbutton').show();
				});
			});
		} else {
			$("#whileTrueOrFalse").html("====> <span class='ct-code-b-red'>false</span>");
			zoomInEffect("#whileTrueOrFalse", function() {
				var text = "The condition evaluates to <span class='ct-code-b-red'>false</span>.";
				typing("#appendText", text, function() {
					if (caseName == "whileT1NxtNotEqNull") {
						introNextSteps("#t2StoreT1Nxt", "", "bottom");
					} else {
						printfCount = 10;
						introNextSteps("#printf10", "printNull", "bottom");
					}
					$('.introjs-nextbutton').show();
					
				});
			});
		}
	});
}

function ifConToChekisFirstEqlToNull(firstVal, caseName) {
	rotationEffect("#valOfFirst", firstVal, function() {
		if (firstVal == "NULL") {
			$("#ifTrueOrFalse").html("====> <span class='ct-lime-color'>true</span>");
			zoomInEffect("#ifTrueOrFalse", function() {
				var text = "The condition evaluates to <span class='ct-lime-color'>true</span>."
					+ " So the control enters into the if-body.";
				typing("#appendText", text, function() {
					if (caseName == "ifFirstEqlToNull") {
						introNextSteps("#firstEqlToTemp", "", "bottom");
					} else if (caseName == "ifT"+ tCount +"IsNull") {
						introNextSteps("#returnT" + tCount, "", "bottom");
					} else if (caseName == "ifFirstIsNull") {
						printfCount = 7;
						introNextSteps("#printf7", "printEmpty", "bottom");
					}
					$('.introjs-nextbutton').show();
				});
			});
		} else {
			$("#ifTrueOrFalse").html("====> <span class='ct-code-b-red'>false</span>");
			zoomInEffect("#ifTrueOrFalse", function() {
				var text = "The condition evaluates to <span class='ct-code-b-red'>false</span>.";
				typing("#appendText", text, function() {
					$('.introjs-tooltip').removeClass('hide');
					if (caseName == "ifFirstEqlToNull") {
						introNextSteps("#tempToQNext", "", "bottom");
					} else if (caseName == "ifT1IsNull") {
						tCount++;
						introNextSteps("#ifT2IsNull", "", "bottom");
					} else if (caseName == "ifFirstIsNull") {
						printfCount = 8;
						introNextSteps("#printf8", "printListEle", "bottom");
					} else {
						introNextSteps("#t1StoredToT3", "", "bottom");
					}
					$('.introjs-nextbutton').show();
				});
			});
		}
	});
}

function checkWhileCondForisDataValIsNullOrNot() {
	var dataVal = $("#nodeDataVal" + (outputLineCount - 1)).val();
	rotationEffect("#valOfX", dataVal, function() {
		if (dataVal != -1) {
			$("#whileTrueOrFalse").html("====> <span class='ct-lime-color'>true</span>");
			zoomInEffect("#whileTrueOrFalse", function() {
				var text = "The condition evaluates to <span class='ct-lime-color'>true</span>."
					+ " So the control enters into the while-body.";
				typing("#appendText", text, function() {
					introNextSteps("#createNewTempNode", "createTempNode", "bottom");
					$('.introjs-nextbutton').show();
				});
			});
		} else {
			$("#whileTrueOrFalse").html("====> <span class='ct-code-b-red'>false</span>");
			zoomInEffect("#whileTrueOrFalse", function() {
				var text = "The condition evaluates to <span class='ct-code-b-red'>false</span>.";
				typing("#appendText", text, function() {
					printfCount = 1;
					introNextSteps("#returnFirst", "", "bottom");
					$('.introjs-nextbutton').show();
				});
			});
		}
	});
}

function printL1NodeData() {
	svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#dataDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv" + count).text());
			fromEffectWithTweenMax("#dataDiv" + count, "#outData"+count, false, function() {
               	$("#outData"+count).css("color", "yellow");
               	zoomInEffect("#arrow"+count, function() {
               		introNextSteps("#qNxtToQ", "", "bottom");
					setTimeToIntroGoNextStep();
               	});
        	});
		});
	});
}

function printL2NodeData() {
	svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#dataDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv" + count).text());
			fromEffectWithTweenMax("#dataDiv" + count, "#outData"+count, false, function() {
				$("#outData"+count).css("color", "yellow");
				zoomInEffect("#arrow"+count, function() {
	            	introNextSteps("#qNxtToQ", "", "bottom");
					setTimeToIntroGoNextStep();
				});
			});
		});
	});
}

function printUpToL1LastNode() {
	svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#dataDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv" + count).text());
			fromEffectWithTweenMax("#dataDiv" + count, "#outData"+count, false, function() {
               	$("#outData"+count).css("color", "yellow");
               	zoomInEffect("#arrow"+count, function() {
               		introNextSteps("#qNxtToQ", "", "bottom");
					setTimeToIntroGoNextStep();
               	});
        	});
		});
	});
}

function printUpToL2LastNode() {
	svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#dataDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv" + count).text());
			fromEffectWithTweenMax("#dataDiv" + count, "#outData"+count, false, function() {
				$("#outData"+count).css("color", "yellow");
	               zoomInEffect("#arrow"+count, function() {
	               	introNextSteps("#qNxtToQ", "", "bottom");
					setTimeToIntroGoNextStep();
				});
			});
		});
	});
}

function printL1AndL2Nodes() {
	var isl1NodeData = $("#l1Val").text().trim() != "NULL" && $("#l2Val").text().trim() == "NULL";
	var isL2NodeData = $("#l2Val").text().trim() != "NULL" && $("#l1Val").text().trim() == "NULL";
		if (isl1NodeData) {
			printL1NodeData();
		} else if (isL2NodeData) {
			printL2NodeData();
		} else {
			if (count < fstNdeInSecdList) {
				printUpToL1LastNode();
		 } else {
			 printUpToL2LastNode();
		 }
	}
}

function l1ValueNorEqNullAndL2ValNull() {
	 svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
		+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#nextDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv"+count).text());
			fadeInBounceEffectWithTimelineMax("#next" + count, "#nodeVal1",  function() {
				count++;
				$("#line22").remove();
				if ($("#nodeVal1").text().trim() == "NULL") {
					introNextSteps("#whileQNotEqNull", "", "bottom");
			        setTimeToIntroGoNextStep();
				} else {
					svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
					+ count, "#svgId", "line22", "arrow", function() {
                   		introNextSteps("#whileQNotEqNull", "", "bottom");
				       	setTimeToIntroGoNextStep();
                   	});	
				}
			});
		});
	 });
}

function l2ValueNorEqNullAndL1ValNull() {
	svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#nextDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv"+count).text());
			fadeInBounceEffectWithTimelineMax("#next" + count, "#nodeVal1",  function() {
				$("#line22").remove();
				if ($("#nodeVal1").text().trim() == "NULL") {
					introNextSteps("#whileQNotEqNull", "", "bottom");
					setTimeToIntroGoNextStep();
				} else {
					count++;
					svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
					+ count, "#svgId", "line22", "arrow", function() {
	            		introNextSteps("#whileQNotEqNull", "", "bottom");
					  	setTimeToIntroGoNextStep();
	                });
				}
			});
		});
	});
} 

function firstPartArrowAnimation() {
	svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#nextDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv"+count).text());
			fadeInBounceEffectWithTimelineMax("#next" + count, "#nodeVal1",  function() {
				if ($("#nodeVal1").text().trim() == "NULL") {
					introNextSteps("#whileQNotEqNull", "", "bottom");
			       	setTimeToIntroGoNextStep();
				} else {
					$("#line22").remove();
					if (count < (fstNdeInSecdList - 1)) {
						count++;
						svgAnimatingLineTopToBottom("#animatinDiv", "#lastNodeMemory1", "#nextDiv"
						+ count, "#svgId", "line22", "arrow", function() {
	        	       		introNextSteps("#whileQNotEqNull", "", "bottom");
				        	setTimeToIntroGoNextStep();
	                   	});
					} else {
						count++;
						svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
						+ count, "#svgId", "line22", "arrow", function() {
	                  		introNextSteps("#whileQNotEqNull", "", "bottom");
				        	setTimeToIntroGoNextStep();
	                   	});
					}
				}
       		});
		});
	});
}

function secondPartArrowAnimation() {
	svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
	+ count, "#svgId", "line23", "arrow", function() {
		$("#line23").remove();
		$("#nextDiv" + count).effect( "highlight",{color: 'blue'}, 500, function() {
			$("#outData"+count).text($("#dataDiv"+count).text());
			fadeInBounceEffectWithTimelineMax("#next" + count, "#nodeVal1",  function() {
				$("#line22").remove();
				if ($("#nodeVal1").text().trim() == "NULL") {
					introNextSteps("#whileQNotEqNull", "", "bottom");
		        	setTimeToIntroGoNextStep();
				} else {
					count++;
					svgAnimatingLineRightToLeft("#animatinDiv", "#lastNodeMemory1", "#dataDiv"
					+ count, "#svgId", "line22", "arrow", function() {
	               		introNextSteps("#whileQNotEqNull", "", "bottom");
			        	setTimeToIntroGoNextStep();
	               	});
				}
            });
		});
	});
}

function notL1AndL2() {
	if (count < fstNdeInSecdList) {
		firstPartArrowAnimation();
	 } else {
		 secondPartArrowAnimation();
	 }
}

function changeQNodeAddressToQNextAdd() {
	var isL1AndL2 = $("#l1Val").text().trim() != "NULL" && $("#l2Val").text().trim() == "NULL";
	var isL2AndL1 = $("#l2Val").text().trim() != "NULL" && $("#l1Val").text().trim() == "NULL";
	if (isL1AndL2) {
		l1ValueNorEqNullAndL2ValNull();
	} else if (isL2AndL1) {
		l2ValueNorEqNullAndL1ValNull();
	} else {
		notL1AndL2();
	}
}

function initializeTheL1L2AndL3(idName, callBackFunction) {
	if (idName == "Val") {
		for (var i = 0; i < 3; i++ ) {
			$("#" + arr[i] + idName).text("NULL").addClass("opacity00");
		}
	}
	for(var  i = 0; i < 3; i++) {
		  zoomInEffect("#" + arr[i] + idName);
	}
	if (typeof callBackFunction === "function") {
		callBackFunction();
	}
}

function addNegativeValuEvent(selector) {
	$(selector).on("keydown keyup", function(e) {
		$('.error-text').remove();
		var max = $(this).attr("maxlength");
		if ($.inArray(e.keyCode, [8, 46, 37, 39, 27]) !== -1) {
			return;
		}
		if ($(this).val() == "-1") {
			$('.introjs-nextbutton').show();
			$("input").attr("disabled", true);
		} else {
			$('.introjs-nextbutton').hide();
		}
		if ($(this).val().length < 1 && (e.keyCode == 109 || e.keyCode == 189 || e.keyCode == 173)) {
			return;
		}
		if ($(this).val().length >= 1 && (e.keyCode == 49 || e.keyCode == 97))  {
			return;
		} else {
			$('.introjs-tooltiptext').append('<div class="error-text">Enter -1 only.</div>');
			e.preventDefault();
		}
	});
}

function enterValidNumberOrNot(selector) {
	$(selector).on("keydown", function(e) {
		$('.error-text').remove();
		var max = $(this).attr("maxlength");
		if ($.inArray(e.keyCode, [8, 46, 37, 39, 27]) !== -1) {
			return;
		}
		if (e.keyCode == 109 || e.keyCode == 189 || e.keyCode == 173) {
			if ($(this).val().length < 1) {	
				return;
			} else {
				e.preventDefault();
			}
		}
		if (((e.shiftKey || (e.keyCode < 48 || e.keyCode > 57)) && (e.keyCode < 96 || e.keyCode > 105)) || (e.keyCode == 13 || e.keyCode == 9)) {
			e.preventDefault();
		}
		if ($(this).val().length > max - 1) {
			$('.introjs-tooltiptext').append('<div class="error-text">Please restrict the maximum length to 3 digits only.</div>')
			e.preventDefault();
		}
	});
	$(selector).on("keyup", function(e) {
		$('.error-text').remove();
		if ($(this).val().length > 0 && (!$(this).val().startsWith('-'))) {
			$('.introjs-nextbutton').show();
		} else if ($(this).val().length >= 2 && $(this).val().indexOf('-', $(this).val().indexOf('-') + 1) == -1) {
			$('.introjs-nextbutton').show();
		} else if (!$(this).val().startsWith('-')) {
			$('.introjs-nextbutton').hide();
			$('.introjs-tooltiptext').append('<div class="error-text">Please enter number.</div>')
		} else {
			$('.introjs-nextbutton').hide();
		}
	});
}


function fadeInBounceEffectWithTimelineMax(selector1, selector2, callBackFunction) {
	var timelineMax = new TimelineMax();
	$(selector1).parent().effect( "highlight",{color: 'blue'}, 500, function() {
		var l1 = $(selector1).offset();
		var l2 = $(selector2).offset();
		var topLength = l1.top - l2.top;
		var leftLength = l1.left - l2.left;
		$("#explanationDiv").append("<span id='dummy' class='ct-brown-color' style='position: relative;z-index: 9999999;'>" 
			+ $(selector2).text() + "</span>");
		$('#dummy').offset({
			"top": l2.top, 
			"left": l2.left
		});
		$(selector2).text($(selector1).text());
		timelineMax.from(selector2, 1, {ease: Bounce.easeOut, top: topLength, left: leftLength, onComplete: function() {
      $(selector2).removeAttr("style")
			if (typeof callBackFunction === "function") {
				callBackFunction();
			}
		}}).to('#dummy', 0.5, {opacity: 1, top: parseInt($('#dummy').css("top")) - 40, onComplete: function() {
      		$(selector2).text($(selector1).text());
			$("#animationDiv").removeAttr("style");			
			$('#dummy').remove();
		}}, "-=0.5");
	});
}

function rotationEffect(selector, val, callBackFunction) {
	$(selector).effect( "highlight",{color: '#ffff33'}, 500);
	TweenMax.to($(selector), 0.5, {rotationX : 90, onComplete:function() {
		$(selector).text(val);
		TweenMax.to($(selector), 0.5, {rotationX : 0, onComplete:function() {
			if (typeof callBackFunction === "function") {
				callBackFunction();
			}
		}});
	}});
}

function toEffectAnimation(selector1, selector2, callBackFunction) {
	var l1 = $(selector1).offset();
	$(selector2).offset({top:l1.top, left:l1.left});
	$(selector2).removeClass("opacity00");
	$(selector1).effect( "highlight",{color: '#ffff33'}, 500);
	TweenMax.to(selector2, 0.5, {top:0, left:0, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function fromEffectWithTweenMax(selector1, selector2, flag, callBackFunction) {
	var l1 = $(selector1).offset();
	var l2 = $(selector2).css({"color" : "brown", "font-width" : "bold", "z-index" : "99999999"}).offset();
	var topLength = l1.top - l2.top;
	var leftLength = l1.left - l2.left;
	if (flag) {
		$("body").append("<span id='dummy' style='position: relative; z-index: 9999999; color: red;'>" + $(selector2).text() + "</span>");
		$("#dummy").offset({
			"top" : l2.top,
			"left" : l2.left
		});
	}
	$(selector2).removeClass('opacity00')
	$(selector1).addClass('z-index1000000').effect( "highlight",{color: '#ffff33'}, 500);
	TweenMax.from($(selector2), 1, {top: topLength, left: leftLength, onComplete: function() {
		$(selector2).removeAttr("style").css("color", "brown");
		$(selector1).removeClass('z-index1000000');
		$("#dummy").remove();
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function zoomInEffect(selector1, callBackFunction) {
	$(selector1).removeClass("opacity00").addClass("animated zoomIn").one('animationend', function() {
		$(selector1).removeClass("animated zoomIn")
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	});
}

function zoomOutEffect(selector1, callBackFunction) {
	$(selector1).removeClass("opacity00").addClass("animated zoomOut").one('animationend', function() {
		$(selector1).removeClass("animated zoomOut")
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	});
}

function setTimeToIntroGoNextStep() {
	setTimeout(function() {
		introjs.nextStep();
	},800); 
}

function introNextSteps(stepName, animatedStep, position) {
	$('.introjs-disabled').removeClass('introjs-disabled');
	var options = {
			element :stepName,
			intro :'',
			position : position,
			tooltipClass : "hide",
			animateStep: animatedStep
	}
	introjs.insertOption(introjs._currentStep + 1, options);
	introjs._options.steps.push({"element" : stepName});
}

function typing(typingId, typingContent, typingCallbackFunction) {
	$(typingId).typewriting(typingContent, {
		"typing_interval" : typingSpeed,
		"cursor_color" : 'white'
	}, function() {
		typingCallbackFunction();
		$('.introjs-tooltip').show();
	});
}

function svgAppend(selector, svgId) {
	var code = '<svg class="svg-css" id="' + svgId + '"></svg>';
	$(selector).append(code);
}

function svgMarkerAppend(svgId, svgMarkerId) {
	var marker = document.createElementNS("http://www.w3.org/2000/svg", 'marker');
	marker.setAttribute('id', svgMarkerId);
	marker.setAttribute('refX', '5');
	marker.setAttribute('refY', '2.5');
	marker.setAttribute('markerWidth', '5');
	marker.setAttribute('markerHeight', '5');
	marker.setAttribute('orient', 'auto');
	marker.style.fill = 'gray';
	$(svgId).append(marker);
	var path = document.createElementNS("http://www.w3.org/2000/svg", 'path');
	path.setAttribute("d", "M0,0 L5,2.5 L0,5 Z");
	$('#' + svgMarkerId).append(path);
}

function svgLineAppend(svgId, svgLineId, markerId, x1, y1, x2, y2) {
	var line = document.createElementNS("http://www.w3.org/2000/svg", 'line');
	line.setAttribute("id", svgLineId);
	line.setAttribute("class", (lineClass) ? "svg-line " + "lineNumber" : "svg-line");

	line.setAttribute("x1", x1);
	line.setAttribute("y1", y1);
	line.setAttribute("x2", x2);
	line.setAttribute("y2", y2);
	line.style.markerEnd = 'url("#' + markerId + '")';
	$(svgId).append(line);
}

// from selector1 Right side to selector2 Left side
function svgAnimatingLineRightToLeft(parentSelector, selector1, selector2, svgId, svgLineId, markerId, callBackFunction) {
	var parentOffset = $(parentSelector).offset();
	var x1 = $(selector1).offset().left - parentOffset.left + $(selector1).outerWidth();
	var y1 = $(selector1).offset().top - parentOffset.top + $(selector1).outerHeight() / 2;
	var x2 = $(selector2).offset().left - parentOffset.left;
	var y2 = $(selector2).offset().top - parentOffset.top + $(selector2).outerHeight() / 2;
	svgLineAppend(svgId, svgLineId, markerId, x1, y1, x1, y1);
	TweenMax.to($('#' + svgLineId).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

// from selector1 Left side to selector2 Right side
function svgAnimatingLineLeftToRight(parentSelector, selector1, selector2, svgId, svgLineId, markerId, callBackFunction) {
	var parentOffset = $(parentSelector).offset();
	var x1 = $(selector1).offset().left - parentOffset.left;
	var y1 = $(selector1).offset().top - parentOffset.top + $(selector1).outerHeight() / 2;
	var x2 = $(selector2).offset().left - parentOffset.left + $(selector2).outerWidth();
	var y2 = $(selector2).offset().top - parentOffset.top + $(selector2).outerHeight() / 2;
	svgLineAppend(svgId, svgLineId, markerId, x1, y1, x1, y1);
	TweenMax.to($('#' + svgLineId).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

// from selector1 Bottom side to selector2 Top side
function svgAnimatingLineBottomToTop(parentSelector, selector1, selector2, svgId, svgLineId, markerId, callBackFunction) {
	var parentOffset = $(parentSelector).offset();
	var x1 = $(selector1).offset().left - parentOffset.left + $(selector1).outerWidth() / 2;
	var y1 = $(selector1).offset().top - parentOffset.top + $(selector1).outerHeight();
	var x2 = $(selector2).offset().left - parentOffset.left + $(selector2).outerWidth() / 2;
	var y2 = $(selector2).offset().top - parentOffset.top;
	svgLineAppend(svgId, svgLineId, markerId, x1, y1, x1, y1);
	TweenMax.to($('#' + svgLineId).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

// from selector1 Top side to selector2 Bottom side
function svgAnimatingLineTopToBottom(parentSelector, selector1, selector2, svgId, svgLineId, markerId, callBackFunction) {
	var parentOffset = $(parentSelector).offset();
	var x1 = $(selector1).offset().left - parentOffset.left + $(selector1).outerWidth() / 2;
	var y1 = $(selector1).offset().top - parentOffset.top;
	var x2 = $(selector2).offset().left - parentOffset.left + $(selector2).outerWidth() / 2;
	var y2 = $(selector2).offset().top - parentOffset.top + $(selector2).outerHeight();
	svgLineAppend(svgId, svgLineId, markerId, x1, y1, x1, y1);
	TweenMax.to($('#' + svgLineId).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function arrow(fromId, toId, callBackFunction) {
	$(".arrow").remove();
	$('body').append("<i class='fa fa-arrow-right arrow faa-passing animated' style='position: relative; z-index: 10000000;'></i>");
	var l = $(fromId).offset();
	$('.arrow').offset({
		'top': l.top,
		'left': l.left - ($('.arrow').outerWidth() * 2)
	});
	var l1 = $(fromId).offset();
	var l2 = $(toId).offset();
	var topLength = parseInt($(".arrow").css("top")) + (l2.top - l1.top);
	var leftLength = parseInt($(".arrow").css("left")) + (l2.left - l1.left);
	TweenMax.to(".arrow", 0.5, { top : topLength, left : leftLength, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function deleteParticularNode(extraNode) {
	$("#node" + (innerLoop + 1)).removeAttr("id").attr("id", "node" + (extraNode));
	$("#nodedata" + (innerLoop + 1)).removeAttr("id").attr("id", "nodedata" + (extraNode));
	$("#dataDiv" + (innerLoop + 1)).removeAttr("id").attr("id", "dataDiv" + (extraNode));
	$("#data" + (innerLoop + 1)).removeAttr("id").attr("id", "data" + (extraNode));
	$("#nextDiv" + (innerLoop + 1)).removeAttr("id").attr("id", "nextDiv" + (extraNode));
	$("#next" + (innerLoop + 1)).removeAttr("id").attr("id", "next" + (extraNode));
	$("#dataAddress" + (innerLoop + 1)).removeAttr("id").attr("id", "dataAddress" + (extraNode));
}

function changePosIds() {
	var len = $(".list-nodes").length
	for (var idx = (innerLoop + 2); idx <= len + 1; idx++ ) {
		$("#node" + (idx)).removeAttr("id").attr("id", "node" + (idx - 1));
		$("#nodedata" + (idx)).removeAttr("id").attr("id", "nodedata" + (idx - 1));
		$("#dataDiv" + (idx)).removeAttr("id").attr("id", "dataDiv" + (idx - 1));
		$("#data" + (idx)).removeAttr("id").attr("id", "data" + (idx - 1));
		$("#nextDiv" + (idx)).removeAttr("id").attr("id", "nextDiv" + (idx - 1));
		$("#next" + (idx)).removeAttr("id").attr("id", "next" + (idx - 1));
		$("#dataAddress" + (idx)).removeAttr("id").attr("id", "dataAddress" + (idx - 1));
	}
}

function removeLine() {
	var abc = [];
	var len = $("#dynamicNodes1 > .node").length;
	$.each($(".lineNumber"), function(idx) {
	    abc.push($(this).attr("id"));
	});
	abc.splice((len - 1), 0, abc.pop())
	$.each(abc, function(idx, val) {
	  $("#" + val).attr("id", "line" + (idx + 1));
	});
}

function rechangeSVGLineHeights(flag) {
	for (var i = 0; i < svgIds.length; i++) {
		if (flag == true) {
		  var y = (parseFloat($(svgIds[i]).attr("y1")) + 57);
		} else {
			var y = (parseFloat($(svgIds[i]).attr("y1")) - 57);
		}
			$(svgIds[i]).attr({"y1" : y, "y2" : y});
	}
}

</script>

	<div class="col-xs-12 padding00">
		<div class="ct-box-main">
			<div class="text-center">
				<h1 class="label ct-demo-heading text-center" id="headdingSection">SLL with Concat, Union and interset Operations</h1>
			</div> 
		</div>
		<div class='buttons-div'>
			<button type="button" class="btn btn-warning opacity00" id="restartBtn">Restart</button>
		</div>
		<div class="col-xs-12 opacity00" id="explanationDiv">
			<div class="col-xs-4 padding00">
				<pre class="creamPreTab opacity00" id="structTypelist"></pre>
				<!-- <pre class="creamPreTab opacity00" id="createNodeMethod"></pre> -->
				<pre class="creamPreTab opacity00" id="inMain"></pre>
				<pre class="creamPreTab opacity00" id="sllOperations"></pre>
			</div>
			<div class="col-xs-8"> 
				<div class="col-xs-12 box-border padding00">
					<div class="col-xs-12 margin-top15">
						<div class="col-xs-12 box-border text-center" id="buttonDiv"></div>
						<div class="col-xs-12 padding00 margin-top15 box-border" id="animatinDiv">
							<div class="col-xs-12 animationDiv">
								<div class="col-xs-12 padding00 margin-top15" id="NoOfLists"></div>
								<div class="col-xs-12 padding00 margin-top15" id="NoOfListsInUnion"></div>
								<div class="col-xs-12 padding00 list1" id="firstList"></div>
								<div class="col-xs-12 padding00" id="nodeAddress1"></div>
								<div class="col-xs-12 padding00 list2" id="secondList"></div>
								<div class="col-xs-12 padding00" id="nodeAddress2"></div>
							</div>
						</div>
					</div>
					<div class="col-xs-12 padding00 margin-top15">
						<div class="col-xs-12" id="uninonOperation">
							<div class="col-xs-12">
								<pre class="creamPreTab opacity00" id="unionOperations"></pre>
							</div>
						</div>
					</div>
					<div class="col-xs-12 padding00 margin-top15">
						<div class="col-xs-12 padding00">
							<div class="col-xs-12 margin-top" id="outputDiv">
								<div id="consoleId" class="center">
									<div class="output-console-title-bar">
										<span class="title"><b>Console</b></span>
									</div>
									<div class="output-console-body" id="consoleBodyDiv"></div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>