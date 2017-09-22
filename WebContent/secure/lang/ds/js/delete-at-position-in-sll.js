var intro, lang, nodeCount = stepCount = 1;

function deleteAtPositionAnimation() {
	lang = getURLParameter("lang");
	declareNodesWhenFunctionCall("tempNode", "tempVal", "tempNodeInDelMtd", "temp");
	svgAppend("#animationDiv", "svgId");
	svgMarkerAppend("#svgId", "arrow");
	introFunction();
}

function introFunction() {
	intro = introJs();
	intro.setOptions({
		showStepNumbers : false,
		exitOnOverlayClick : false,
		showBullets : false,
		exitOnEsc : false,
		keyboardNavigation : false,
			steps : [{
						element :'#headingDiv',
						intro :'',
					},{
						element :'#animationDiv',
						intro :'',
						animateStep: 'firstNodeNull',
						tooltipClass : "hide",
					}]
	});
	intro.onafterchange(function(targetElement) {
		intro.refresh();
		var elementId = targetElement.id;
		$('.introjs-nextbutton').hide();
		$('.introjs-helperLayer').one('transitionend', function() {
			switch (elementId) {
				case 'animationDiv' :
					intro.refresh();
					var animateStep = intro._introItems[intro._currentStep].animateStep;
					switch(animateStep) {
						case 'firstNodeNull': 
							$('.introjs-tooltip').removeClass('hide');
							text = "<ul><li>Let us assume <y>single linked is empty</y>. i.e <y>first</y> is "
									+ " <y>NULL</y>.</li><br/><div id='appendDiv'></div></ul>";
							typing(".introjs-tooltiptext", text, function() {
								appendNextBtn('.introjs-tooltipbuttons', 'firstEqNull');
							});
						break;
						case 'firstNotEqNull' :
							$('.introjs-tooltip').removeClass('hide');
							text = "<ul><li>Let us assume <y>single linked list</y> can contains more than <y>one node</y>."
									+ "</li><br/><div id='appendDiv'></div></ul>";
							typing(".introjs-tooltiptext", text, function() {
								appendNextBtn('.introjs-tooltipbuttons', 'multipleNodes');
							});
						break;
						case 'thirdExample' :
							$('.introjs-tooltip').removeClass('hide');
							text = "<ul><li>Let us assume <y>single linked list</y> can contains more than <y>one node</y>."
									+ " Apply the beside conditions.</li><br/><div id='appendDiv'></div></ul>";
							typing(".introjs-tooltiptext", text, function() {
								$('#algorithmStepsDiv').addClass('z-index1000000');
								appendNextBtn('.introjs-tooltipbuttons', 'multipleNodes');
							});
						break;
					}
				break;
				case 'algorithmStepsDiv' :
					$('#algorithmStepsDiv').removeClass('opacity00');
					intro.refresh();
					var animateStep = intro._introItems[intro._currentStep].animateStep;
					switch(animateStep) {
						case 'condition1':
							$('#s1').addClass('opacity00');
							appendSteps(1);
							text = "<span id='l1'>If <g>first</g> is <brown>equal</brown> to <g>NULL</g>.</span><ol><li>"
									+ " <span id='l2'>Print <brown>List is empty, deletion is not possible</brown>.</span>"
									+ "<span id='btn'></span></li></ol>";
							$('#stepDes1').html(text);
							zoomInEffect('#s1', function() {
								stepCount++;
								introNextSteps('#animationDiv', 'firstNotEqNull');
								appendNextBtn('#btn', 'moveStep');
							});
						break;
						case 'condition2' :
							$('#s2').addClass('opacity00');
							appendSteps(2);
							if (lang == 'cpp') {
								text = "If <g>first</g> is <brown>not equal</brown> to <g>NULL</g>.<ol><li>"
									+ " <span id='l3'>Create a <g>Temp</g> node and store the <g>first</g> node value.</span></li>"
									+ "<li><span id='l4'>Store <g>first -> next</g> value to <g>first</g> node.</span></li>"
									+ "<li><span id='l5'>Print <brown>The deleted element (temp -> data) from SLL</brown></span></li>"
									+ "<li><span id='l6'>Now delete the <g>temp</g> node.</span><span id='btn'></span></li></ol>";
							} else if (lang == 'c') {
								text = "If <g>first</g> is <brown>not equal</brown> to <g>NULL</g>.<ol><li>"
									+ " <span id='l3'>Create a <g>Temp</g> node and store the <g>first</g> node value.</span></li>"
									+ "<li><span id='l4'>Store <g>first -> next</g> value to <g>first</g> node.</span></li>"
									+ "<li><span id='l5'>Print <brown>The deleted element (temp -> data) from SLL</brown></span></li>"
									+ "<li><span id='l6'>Now delete the <g>temp</g> node.</span></li>"
									+ "<li><span id='l7'>Return the <g>temp</g> node.</span><span id='btn'></span></li></ol>";
							}
							
							$('#stepDes2').html(text);
							zoomInEffect('#s2', function() {
								stepCount++;
								introNextSteps('#animationDiv', 'thirdExample');
								appendNextBtn('#btn', 'moveStep');
							});
						break;
					}
				break;
			}
		});
	});
	intro.start();
	$('.introjs-skipbutton, .introjs-prevbutton, .introjs-nextbutton').hide();
	text = " Here, we will learn <y>Delete At Begin Node in Singly Linked List</y>.";
	typing(".introjs-tooltiptext", text, function() {
		$('.introjs-nextbutton').show();
	});
}

function firstEqNull() {
	$('.user-btn, #btn').remove();;
	zoomInEffect('#firstNode', function() {
		text = '<li>Here <y>first</y> value (i.e <y>'+ $('#firstVal').text() +'</y>) is equal to <y>NULL</y>'
				+ ' means there in no node in the <y>list</y> so '
				+ 'deletion is not possible here.</li><br/><li> Print <y>List is empty, deletion is not possible</y></li>';
		typing('#appendDiv', text, function() {
			introNextSteps('#algorithmStepsDiv', 'condition1');
			$('.introjs-nextbutton').show();
		});
	});
}

function ifUserEnteredOne() {
	$('.user-btn, #btn').remove();
	text = '<li>Let us assume user want to <y>delete first</y> node in the <y>list</y></li>'+
			+ '<li>Here, the <y>condition 1</y> is evaluates to false because the '
			+ '<y>first</y> node contain the value (i.e <y>'+ $('#firstVal').text() +'</y>) is not equal to <y>NULL</y> means '
			+ 'list contains some nodes, so there is possible to <y>delete</y> the <y>node</y>.</li>';
	typing('#appendDiv', text, function() {
	
	});
}


function multipleNodes() {
	$('.user-btn, #btn').remove();
	$('#tempVal').text('');
	for (var i = 1; i < 4; i++ ) {
		createDynamicNodes(i);
	}
	$('#dynamicNodes .next-span:last').text('NULL');
	$('#dynamicNodes .next-span:first').text($('.data-address').eq(1).text());
	$('#dynamicNodes .next-span').eq(1).text($('.data-address').eq(2).text());
	regenerateArrows(true);
	setTimeout(function() {
		$('#firstVal').text($('.data-address:first').text());
		for (var i = 1; i <= $('#dynamicNodes .nodes').length; i++ ) {
			$('#data' + i).text(i+'0').removeClass('opacity00');
			$('#node'+ i).removeClass('opacity00');
			$('#line' + i).css('opacity', '1');
		}
		
		appendNextBtn('.introjs-tooltipbuttons', 'ifUserEnteredOne');
		//$('.introjs-tooltip').scrollTo('.user-btn', 500);
	},500);
}

function appendSteps(i) {
	$('#algorithmStepsDiv').append('<div class="col-xs-12 margin-top-5" id="s'+ i 
			+ '"><div class="col-xs-3 padding00" id="step'+ i +'"><blue>Condition '+ i 
			+ ' : </blue></div><div class="col-xs-9 padding00 position" id="stepDes'+ i +'"></div></div><br/>');
}

function regenerateArrows(flag) {
	for (var i = 1; i <= $('#dynamicNodes .nodes').length; i++) {
		if (i == 1) {
			svgAnimatingLineRightToLeft("#animationDiv", "#firstDiv", "#dataDiv1",
					"#svgId", "line"+ i +"", "arrow", flag);
		} else {
			svgAnimatingLineRightToLeft("#animationDiv", "#nextDiv"+ (i - 1) +"", "#dataDiv"+ (i) +"",
					"#svgId", "line"+ i +"", "arrow", flag);
		}
	}
}


function changeIds1(elementParent, idAttr) {
	$(elementParent).each(function(index) {
      	$(this).attr("id", idAttr + (index + 1));
    	
	});
}

function changeIdsAtBegin(callBackFunction) {
	$('#dynamicNodes .nodes').each(function(index) {
	      $(this).attr("id", "node"+ (index + 1));
	}); 
	changeIds1($("#dynamicNodes .data-nodes"), "nodeData");
	changeIds1($("#dynamicNodes .data-div"), "dataDiv");
	changeIds1($("#dynamicNodes .next-div"), "nextDiv");
	changeIds1($("#dynamicNodes .data-address"), "dataAddress");
	changeIds1($("#dynamicNodes .data-span"), "data");
	changeIds1($("#dynamicNodes .next-span"), "next");
	if (typeof callBackFunction === "function") {
		callBackFunction();
	}
}

function moveStep() {
	$('.user-btn, #btn').remove();
	intro.nextStep();
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
	intro.insertOption(intro._currentStep + 1, options);
	intro._options.steps.push({"element" : stepName});
}

function customIntroNxtStep(stepName, animatedStep, position) {
	introNextSteps(stepName, animatedStep, position);
	setTimeToIntroGoNextStep();
}

function setTimeToIntroGoNextStep() {
	setTimeout(function() {
		intro.nextStep();
	}, 1000);
}

function appendNextBtn(id, value) {
	$(id).append('<a class="introjs-button user-btn" onclick="' + value + '()">Next &#8594;</a>');
}

function getURLParameter(sParam) { //choose the language like c or cpp...etc 
	var sPageURL = window.location.search.substring(1);
	var sURLVariables = sPageURL.split('&');
	for (var i = 0; i < sURLVariables.length; i++) {
		var sParameterName = sURLVariables[i].split('=');
		if (sParameterName[0] == sParam) {
			return sParameterName[1];
		}
	}
}

function getRandomInt(min, max) { //generate dynamic memory location (address).
	min = Math.ceil(min);
	max = Math.floor(max);
	return Math.floor(Math.random() * (max - min)) + min;
}

function createDynamicNodes(nodeCount) { //Create data & next field div.
	var randomAddress = getRandomInt(1000, 5000);
	var x = '<div class="opacity00 col-xs-2 nodes" id="node' + nodeCount + '" style="top: 0px; width: auto;">'
						+ ' <div class="col-xs-12 padding00"><div class="col-xs-6 ct-blue-color ct-fonts padding00 text-center">'
						+ ' data</div><div class="ct-green-color ct-fonts text-center">next</div></div>'
						+ ' <div id="nodedata' + nodeCount + '" class="data-nodes"><div id="dataDiv' + nodeCount + '"'
						+ ' class="div-border left-radius col-xs-6 data-div"><span id="data' + nodeCount +'"'
						+ ' class="data-span position opacity00 ct-blue-color ct-fonts" style="top: 0px; left: 0px;"></span></div>'
						+ ' <div id="nextDiv' + nodeCount +'" class="position div-border right-radius col-xs-6 next-div">'
						+ ' <span id="next' + nodeCount +'" class="position next-span ct-green-color ct-fonts position"></span></div></div>'
						+ ' <div class="col-xs-12 padding00"><div class="col-xs-6 padding00 text-center">'
						+ ' <span id="dataAddress' + nodeCount + '" class="position data-address padding00 ct-brown-color ct-fonts">'+ randomAddress 
						+ '</span></div></div></div>';
	$('#dynamicNodes').append(x);
}

function declareNodesWhenFunctionCall(id1, id2, nodeName, nodeNameText, callBackFunction) {	//Temp node div declaration 
	$('#declareNodes').append('<div class="col-xs-2 col-xs-offset-1 extraNode opacity00 padding00" id=' + id1 + '>'
					+ '<div class="col-xs-12 box padding00 position"><span id=' + id2 + ' class="extrNodeVal ct-brown-color ct-fonts position"></span>'
					+ '</div><div class="text-center col-xs-12 padding00 ct-green-color" id=' + nodeName + '>' + nodeNameText + '</div></div> ');
	if (typeof callBackFunction === "function") {
		callBackFunction();
	}
}

function transferEffect(selector1, selector2, callBackFunction) {
	$(selector1).effect( "highlight",{color: 'blue'}, 500, function() {
		$(selector1).effect( "transfer", { to: $(selector2), className: "ui-effects-transfer" }, 1000 , function() {
			$(selector2).removeClass('opacity00');
			if (typeof callBackFunction === "function") {
				callBackFunction();
			}
		});
	});
}


function zoomInEffect(selector1, callBackFunction) {
	$(selector1).removeClass("opacity00").addClass('animated zoomIn').one('animationend', function() {
		$(selector1).removeClass("animated zoomIn");
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	});
}

function flipEffectWithTweenMax(selector, val, callBackFunction) {
	setTimeout(function(){
		TweenMax.to($(selector), 0.5, {rotationX : -90, onComplete:function() {
			$(selector).html(val);
			TweenMax.to($(selector), 0.5, {rotationX : 0, onComplete:function() {
				intro.refresh();
				if (typeof callBackFunction === "function") {
					callBackFunction();
				}
			}});
		}});
	},200);
}

function fromEffectWithTweenMax(id1, id2, val, callBackFunction) {
	var l1 = $(id2).offset();
	$(id1).html($(id2).text()).offset({
	  "top" : l1.top,
	  "left" : l1.left
	});
	TweenMax.to(id1, 1, {top : 0, left : 0, onComplete: function() {
		$(id1).text("" + val + "");
	  if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}


function fadeInBounceEffectWithTimelineMax(selector1, selector2, callBackFunction) {
	var timelineMax = new TimelineMax();
	$(selector1).parent().effect( "highlight",{color: 'blue'}, 500, function() {
		var l1 = $(selector1).offset();
		var l2 = $(selector2).offset();
		var topLength = l1.top - l2.top;
		var leftLength = l1.left - l2.left;
		$("body").append("<span id='dummy' class='ct-brown-color ct-fonts' style='position: relative;z-index: 9999999;'>" 
			+ $(selector2).text() + "</span>");
		$('#dummy').offset({
			"top": l2.top, 
			"left": l2.left
		});
		$(selector2).text($(selector1).text());
		timelineMax.from(selector2, 2, {ease: Bounce.easeOut, top: topLength, left: leftLength, onComplete: function() {
      $(selector2).removeAttr("style")
			if (typeof callBackFunction === "function") {
				callBackFunction();
			}
		}}).to('#dummy', 0.5, {opacity: 1, top: parseInt($('#dummy').css("top")) - 40, onComplete: function() {
      		$(selector2).text($(selector1).text());
			$("#animatinDiv").removeAttr("style");			
			$('#dummy').remove();
		}}, "-=0.5");
	});
}



function svgAppend(selector, svgId) {
	var code = '<svg class="svg-css" id="' + svgId + '"></svg>';
	$(selector).append(code);
}

function svgMarkerAppend(svgId, svgMarkerId, curve) {
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

function svgLineAppend(svgId, svgLineId, markerId, x1, y1, x2, y2, flag) {
	var line = document.createElementNS("http://www.w3.org/2000/svg", 'line');
	line.setAttribute("id", svgLineId);
	line.setAttribute("class", "svg-line lines");
	line.setAttribute("x1", x1);
	line.setAttribute("y1", y1);
	line.setAttribute("x2", x2);
	line.setAttribute("y2", y2);
	if (flag) {
		line.setAttribute("opacity", 0);
	}
	line.style.markerEnd = 'url("#' + markerId + '")';
	$(svgId).append(line);
}

function svgAnimatingLineRightToLeft(parentSelector, selector1, selector2, svgId, svgLineId, markerId, flag, callBackFunction) {
	var parentOffset = $(parentSelector).offset();
	var x1 = $(selector1).offset().left - parentOffset.left + $(selector1).outerWidth();
	var y1 = $(selector1).offset().top - parentOffset.top + $(selector1).outerHeight() / 2;
	var x2 = $(selector2).offset().left - parentOffset.left;
	var y2 = $(selector2).offset().top - parentOffset.top + $(selector2).outerHeight() / 2;
	svgLineAppend(svgId, svgLineId, markerId, x1, y1, x1, y1, flag);
	TweenMax.to($('#' + svgLineId).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function svgAnimatingLineTopToBottom(parentSelector, selector1, selector2, svgId, svgLineId, markerId, flag, callBackFunction) {
	var parentOffset = $(parentSelector).offset();
	var x1 = $(selector1).offset().left - parentOffset.left + $(selector1).outerWidth() / 2;
	var y1 = $(selector1).offset().top - parentOffset.top;
	var x2 = $(selector2).offset().left - parentOffset.left + $(selector2).outerWidth() / 2;
	var y2 = $(selector2).offset().top - parentOffset.top + $(selector2).outerHeight();
	svgLineAppend(svgId, svgLineId, markerId, x1, y1, x1, y1, flag);
	TweenMax.to($('#' + svgLineId).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function typing(typingId, typingContent, typingCallbackFunction) {
	$(typingId).typewriting(typingContent, {
		"typing_interval" : '5',
		"cursor_color" : 'white'
	}, function() {
		typingCallbackFunction();
		$('.introjs-tooltip').show();
	});
}