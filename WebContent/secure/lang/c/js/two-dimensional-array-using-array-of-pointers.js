var introjs;
var typingInterval = 10;
var arr = [];
var m;
var n;


var twoDimensionalArrayUsingArrayOfPointersReady = function() {
	$('.introjs-nextbutton').keydown(function(e) {
		if (e.which == 13) {
			e.preventDefault();
		}
	});

	$('#restartBtn').click(function() {
		location.reload();
	});

	introJsFunction();
	
	var maxNumberOfInputs;
	var maxLengthOfInput;
	$('.output-scanf-line').on("keydown", function(e) {
		var id = $(this).attr('id');
		if (id == 'outputScanfLine1') {
			maxNumberOfInputs = 2;
			maxLengthOfInput = 1;
		} else {
			maxNumberOfInputs = m * n;
			maxLengthOfInput = 1;
		}
		if (arr.length == maxNumberOfInputs) {
			if (e.keyCode == 32) {
				e.preventDefault();
			}
		}
		if ($.inArray(e.keyCode, [46, 8, 9, 27, 32, 35, 36, 37, 39]) !== -1) {
			return;
		}
		if (((e.shiftKey) || (e.keyCode < 48 || e.keyCode > 57)) && ((e.keyCode < 96) || (e.keyCode > 105))) {
			e.preventDefault();
		}
	});
	
	$('.output-scanf-line').on("keyup", function(e) {
		var id = $(this).attr('id');
		if (id == 'outputScanfLine1') {
			maxNumberOfInputs = 2;
			maxLengthOfInput = 1;
		} else {
			maxNumberOfInputs = m * n;
			maxLengthOfInput = 1;
		}
		$('.length-error-text').remove();
		if ($(this).text() == "") {
			$('.introjs-tooltiptext').append("<span class='ct-code-b-red length-error-text'><br/>" + 
												"Please enter " + maxNumberOfInputs + " number and separate each with space.</span>");
		}
		var givenText = $(this).text();
		var splittedText = givenText.split(" ");
		arr = [];
		
		$.each(splittedText, function(idx, val) {
			if (val != '') {
				arr.push(val);
			}
		});
		
		if (arr.length < maxNumberOfInputs) {
			$(".introjs-nextbutton").hide();
		} else if (arr.length == maxNumberOfInputs) {
			$(".introjs-nextbutton").show();
		}
		
		$.each(arr, function(idx, val) {
			if ((val > 3 || val == 0) && id == 'outputScanfLine1') {
				$('.introjs-tooltiptext').append("<span class='ct-code-b-red length-error-text'><br/>" + 
														"Please limit the index " + idx + " number in between 1 and 3 .</span>");
				$(".introjs-nextbutton").hide();
			} else if ((val > 9 || val < 0) && id == 'outputScanfLine2') {
				$('.introjs-tooltiptext').append("<span class='ct-code-b-red length-error-text'><br/>" + 
														"Please limit the index " + idx + " number in between 0 and 9 .</span>");
				$(".introjs-nextbutton").hide();
			}
		});
	});
}

function typing(typingId, typingContent, typingInterval, cursorColor, typingCallbackFunction) {
	$(typingId).typewriting(typingContent, {
		"typing_interval": typingInterval,
		"cursor_color": cursorColor
	}, function() {
		$(typingId).removeClass('typingCursor');
		if (typeof typingCallbackFunction === "function") {
			typingCallbackFunction();
		}
	});
}

function introJsFunction() {
	introjs = introJs();
	introjs.setOptions({
		showStepNumbers: false,
		exitOnOverlayClick: false,
		showBullets: false,
		exitOnEsc: false,
		keyboardNavigation: false,
		steps : [ {
			element : "#preCode",
			intro : ""
		},
		{
			element : "#line1",
			intro : ""
		},
		{
			element : "#pArrayBox",
			intro : ""
		},
		{
			element : "#printf1",
			tooltipClass: "hide"
		},
		{
			element : "#outputBox",
			tooltipClass: "hide",
			outputStep: 'printf'
		},
		{
			element : "#scanf1",
			intro : ""
		},
		{
			element : "#outputBox",
			intro : "",
			outputStep: 'scanf'
		},
		{
			element : "#forPLine",
			intro : ""
		},
		{
			element : "#animationBox",
			intro : "",
			animateStep: 'pArrayBoxes'
		},
		{
			element : "#printf2",
			tooltipClass: "hide"
		},
		{
			element : "#outputBox",
			tooltipClass: "hide",
			outputStep: 'printf'
		},
		{
			element : "#forScanf",
			intro : ""
		},
		{
			element : "#outputBox",
			intro : "",
			outputStep: 'forScanf'
		},
		{
			element : "#animationBox",
			intro : "",
			tooltipClass: "hide",
			animateStep: 'arrayBoxValues'
		},
		{
			element : "#printf3",
			tooltipClass: "hide"
		},
		{
			element : "#outputBox",
			tooltipClass: "hide",
			outputStep: 'printf'
		},
		{
			element : "#forPrintf",
			intro : ""
		},
		{
			element : "#outputBox",
			tooltipClass: "hide",
			outputStep: 'forPrintf'
		},
		{
			element : "#restartBtn",
			intro : "Click to Restart",
			tooltipClass: "introjs-tooltip-min-width-custom",
			position : "right"
		}
		]});

	introjs.onafterchange(function(targetElement) {
		$('.introjs-nextbutton, .introjs-prevbutton, .introjs-skipbutton').hide();
		var elementId = targetElement.id;
		switch (elementId) {
		case "preCode":
			var typingContent = 'Let us learn how the <span class="ct-code-b-yellow">Two Dimensional Array using Array of Pointers</span> works in ' +
								'<span class="ct-code-b-yellow">C</span> using the above code.';
			typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
				$('.introjs-nextbutton').show();
			});
			break;
		case "line1":
			$('.introjs-helperLayer').one('transitionend', function () {
				var typingContent = 'Here, the <span class="ct-code-b-yellow">pointer</span> array <span class="ct-code-b-yellow">p</span> of size ' +
									'<span class="ct-code-b-yellow">3</span> and <span class="ct-code-b-yellow">int</span> variables ' +
									'<span class="ct-code-b-yellow">m</span>, <span class="ct-code-b-yellow">n</span>, ' +
									'<span class="ct-code-b-yellow">i</span>, <span class="ct-code-b-yellow">j</span> are declared but we are showing ' +
									'only <span class="ct-code-b-yellow">pointer</span> array <span class="ct-code-b-yellow">p</span> since you know ' +
									'about other variables.';
				typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
					$('.introjs-nextbutton').show();
				});
			});
			break;
		case "pArrayBox":
			$('.introjs-helperLayer').one('transitionend', function () {
				var typingContent = 'The <span class="ct-code-b-yellow">pointer</span> array <span class="ct-code-b-yellow">p</span> of size ' +
									'<span class="ct-code-b-yellow">3</span> is declared.';
				typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
					$('.introjs-tooltipbuttons').append("<a class='introjs-button introjs-duplicate-nextbutton' onclick='animationPArrayBox()'>" + 
															"Next &#8594;</a>");
				});
			});
			break;
		case "printf1":
		case "printf2":
		case "printf3":
			$('.introjs-helperLayer').one('transitionend', function () {
				setTimeout(function() {
					introjs.nextStep();
				}, 1000);
			});
			break;
		case "outputBox":
			$('.introjs-helperLayer').one('transitionend', function () {
				var outputStep = introjs._introItems[introjs._currentStep].outputStep;
				switch (outputStep) {
				case "printf":
					var selector = $('.output-console-body > .visibility-hidden').eq(0);
					var typingContent = selector.removeClass('visibility-hidden').html();
					typing(selector, typingContent, 30, 'white', function() {
						setTimeout(function() {
							introjs.nextStep();
						}, 1000);
					});
					break;
				case "scanf":
					var typingContent = 'Here enter <span class="ct-code-b-yellow">2</span> values and separate each with space.';
					typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
						$('#outputScanfLine1').attr({contenteditable: 'true', placeholder: 'Enter 2 values'});
						caretAtEnd(document.getElementById('outputScanfLine1'));
					});
					break;
				case "forScanf":
					var typingContent = 'Here enter <span class="ct-code-b-yellow">' + m * n + '</span> values and separate each with space.';
					typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
						$('#outputScanfLine2').attr({contenteditable: 'true', placeholder: 'Enter ' + m * n + ' values'});
						caretAtEnd(document.getElementById('outputScanfLine2'));
					});
					break;
				case "forPrintf":
					$('.arrayValue').addClass('z-index9999999');
					TweenMax.from($('.arrayValue'), 1, {ease: Power4.easeIn, backgroundColor: '#FFFFFF', onComplete: function() {
						$('.arrayValue').removeClass('z-index9999999');
						$('.printfValue').removeClass('visibility-hidden').addClass('opacity00');
						TweenMax.to($('.printfValue'), 1, {opacity: 1, onComplete: function() {
							setTimeout(function() {
								introjs.nextStep();
							}, 1000);
						}});
					}});
					break;
				}
			});
			break;
		case "scanf1":
			$('.introjs-helperLayer').one('transitionend', function () {
				var typingContent = 'Here <span class="ct-code-b-yellow">scanf()</span> method reads two number ' +
									'<span class="ct-code-b-yellow">m</span>, <span class="ct-code-b-yellow">n</span>.'
				typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
					$('.introjs-nextbutton').show();
				});
			});
			break;
		case "forPLine":
			$('.introjs-helperLayer').one('transitionend', function () {
				$('#outputScanfLine1').removeAttr('contenteditable placeholder');
				m = arr[0];
				n = arr[1];
				var typingContent = 'This <span class="ct-code-b-yellow">for</span> loop executes <span class="ct-code-b-yellow">' + m + '</span> ' +
									'times so each time <span class="ct-code-b-yellow">pointer</span> array <span class="ct-code-b-yellow">p</span> ' +
									'is assigned with <span class="ct-code-b-yellow">malloc()</span> method so that it created an ' +
									'<span class="ct-code-b-yellow">int</span> array of size <span class="ct-code-b-yellow">n</span> i.e (' +
									'<span class="ct-code-b-yellow">' + n + '</span>) and this dynamic memory is pointed to ' +
									'<span class="ct-code-b-yellow">p</span> respective to its indices.';
				typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
					$('.introjs-nextbutton').show();
				});
			});
			break;
		case "animationBox":
			$('.introjs-helperLayer').one('transitionend', function () {
				var animateStep = introjs._introItems[introjs._currentStep].animateStep;
				switch (animateStep) {
				case "pArrayBoxes":
					var typingContent = 'Here <span class="ct-code-b-yellow">(int *)malloc(n * sizeof(int))</span> is assigned to ' +
										'<span class="ct-code-b-yellow">m</span> different <span class="ct-code-b-yellow">p</span> indices i.e. ' + 
										'<span class="ct-code-b-yellow">' + m + '</span> number of indices, ' +  
										' <span class="ct-code-b-yellow">(int *)malloc(' + n + ' * size(int))</span> of a dynamic memory created and ' +
										'assigned to <span class="ct-code-b-yellow">p</span> with respective to indices.';
					typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
						$('.introjs-tooltipbuttons').append("<a class='introjs-button introjs-duplicate-nextbutton' onclick='animationArrayBoxes()'>" + 
																"Next &#8594;</a>");
					});
					break;
				case "arrayBoxValues":
					$('#outputScanfLine2').removeAttr('contenteditable placeholder');
					var splittedText = $('#outputScanfLine2').text().split(" ");
					$('#outputScanfLine2').html('');
					$.each(splittedText, function(idx, val) {
						if (val != '') {
							$('#outputScanfLine2').append('<span class="scanfValue">' + val + '</span> ');
							$('#outputPrintfLine').append('<span class="printfValue visibility-hidden">' + val + '</span> ');
							if ((idx % n) == (n - 1)) {
								$('#outputPrintfLine').append('<br/>');
							}
						} else {
							$('#outputScanfLine2').append(' ');
						}
					});
					$('.scanfValue').addClass('output-value-circle circle-css');
					TweenMax.fromTo($('.scanfValue'), 1, {backgroundColor: '#FFFFFF'}, {backgroundColor: 'inherit', onComplete: function() {
						$('.scanfValue').removeClass('output-value-circle circle-css');
						$.each(arr, function(idx, val) {
							$('.arrayValue').eq(idx).text(parseInt(val));
						});
						for (var i = 0; i < $('.scanfValue').length; i++) {
							if (i == ($('.scanfValue').length - 1)) {
								fromEffectWithTweenMax($('.scanfValue').eq(i), $('.arrayValue').eq(i), function() {
									$('.introjs-tooltip').removeClass('hide');
									var typingContent = 'Here <span class="ct-code-b-yellow">(p[i] + j)</span> returns the address of each ' +
														'element in the array since <span class="ct-code-b-yellow">p</span> has base address of array ' +
														'and <span class="ct-code-b-yellow">Scale Factor</span> is multipled with ' +
														'<span class="ct-code-b-yellow">i</span>, <span class="ct-code-b-yellow">j</span>.' +
														'<br/>For example: <span class="ct-code-b-yellow">(p[i] + j)</span> = (' + 
														'p[i * scale factor] + j * scale factor) = (p[0] + 0) = ' + 
														$('#pValue1').text() + ' and so on.' +
														'<br/><b>Note:</b> <span class="ct-code-b-yellow">Scale factor</span> is the size of the ' +
														'datatype which will be multiplied with ' +
														'index of the array by the system';
									typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
										$('.introjs-nextbutton').show();
									});
								});
							} else {
								fromEffectWithTweenMax($('.scanfValue').eq(i), $('.arrayValue').eq(i));
							}
						}
					}});
					break;
				}
			});
			break;
		case "forScanf":
			$('.introjs-helperLayer').one('transitionend', function () {
				var typingContent = 'Here we have two <span class="ct-code-b-yellow">for</span> loops' +
									'<ul><li>The outer <span class="ct-code-b-yellow">for</span> loop executes ' +
									'<span class="ct-code-b-yellow">' + m + '</span> times that represent number of rows</li>' +
									'<li>The inner <span class="ct-code-b-yellow">for</span> loop executes <span class="ct-code-b-yellow">'
									+ n + '</span> times that represent number of columns</li>' + 
									'<li>The <span class="ct-code-b-yellow">scanf()</span> with in the for loops executed ' + 
									'<span class="ct-code-b-yellow">' + m * n + '</span> times</li>' +
									'<li><span class="ct-code-b-yellow">(p[i] + j)</span> returns the address of the array index ' +
									'with respective to <span class="ct-code-b-yellow">i</span>, <span class="ct-code-b-yellow">j</span></li></ul>';
				typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
					$('.introjs-nextbutton').show();
				});
			});
			break;
		case "forPrintf":
			$('.introjs-helperLayer').one('transitionend', function () {
				var typingContent = 'Here we have two <span class="ct-code-b-yellow">for</span> loops' +
									'<ul><li>The outer <span class="ct-code-b-yellow">for</span> loop executes ' +
									'<span class="ct-code-b-yellow">' + m + '</span> times that represent number of rows</li>' +
									'<li>The inner <span class="ct-code-b-yellow">for</span> loop executes <span class="ct-code-b-yellow">'
									+ n + '</span> times that represent number of columns</li>' + 
									'<li>The <span class="ct-code-b-yellow">printf()</span> with in the for loops executed ' + 
									'<span class="ct-code-b-yellow">' + m * n + '</span> times</li>' +
									'<li><span class="ct-code-b-yellow">*(p[i] + j)</span> returns the value of the each element in the array ' +
									'with respective to indices <span class="ct-code-b-yellow">i</span>, <span class="ct-code-b-yellow">j</span></li></ul>' +
									'For example: <span class="ct-code-b-yellow">*(p[i] + j)</span> = ' + 
									'*(p[i * scale factor] + j * scale factor) = *(p[0] + 0) = *(' + 
									$('#pValue1').text() + ') = ' +
									$('#mallocTable0 .td-value-css span').eq(0).text() + ' and so on.';
				typing('.introjs-tooltiptext', typingContent, typingInterval, 'white', function() {
					$('.introjs-nextbutton').show();
				});
			});
			break;
		case "restartBtn":
			$('.introjs-helperLayer').one('transitionend', function () {
				$("#restartBtn").removeClass('visibility-hidden');
			});
			break;
		}
	});
	
	introjs.start();
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
	line.setAttribute("class", "svg-line");
	line.setAttribute("x1", x1);
	line.setAttribute("y1", y1);
	line.setAttribute("x2", x2);
	line.setAttribute("y2", y2);
	line.style.markerEnd = 'url("#' + markerId + '")';
	$(svgId).append(line);
}

function fromEffectWithTweenMax(selector1, selector2, callBackFunction) {
	var l1 = $(selector1).offset();
	var l2 = $(selector2).offset();
	var topLength = l1.top - l2.top;
	var leftLength = l1.left - l2.left;
	TweenMax.from($(selector2), 1, {top: topLength, left: leftLength, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}

function caretAtEnd(element) {
	element.focus();
	if (typeof window.getSelection != "undefined"&& typeof document.createRange != "undefined") {
		var range = document.createRange();
		range.selectNodeContents(element);
		range.collapse(false);
		var sel = window.getSelection();
		sel.removeAllRanges();
		sel.addRange(range);
	}    	   
}

function tableAppend(selector, tableId, tdAddressValue) {
	var code = '<div class="col-xs-12 padding-top-bottom">' +
					'<table align="center" id="' + tableId + '">' +
						'<tbody>' +
							'<tr></tr>' +
							'<tr></tr>' +
						'</tbody>' +
					'</table>' +
				'</div>';
	$(selector).append(code);
	for (var i = 0; i < n; i++) {
		$('#' + tableId + ' tr').eq(0).append('<td class="td-value-css"><span class="arrayValue"></span></td>');
		$('#' + tableId + ' tr').eq(1).append('<td class="color-gray"><span>' + tdAddressValue + '</span></td>');
		tdAddressValue += 2;
	}
}

function animationPArrayBox() {
	$('.introjs-duplicate-nextbutton').remove();
	$('#pTable').toggleClass('visibility-hidden animated zoomIn').one('animationend', function() {
		$('#pTable').removeClass('animated zoomIn');
		$('.introjs-nextbutton').show();
	});
}

function animationArrayBoxes() {
	$('.introjs-duplicate-nextbutton').remove();
	var address = 1024;
	for (var i = 0; i < m; i++) {
		tableAppend($('#mallocTablesDiv'), 'mallocTable' + i, address);
		address += 1000;
	}
	$('#mallocTablesDiv').toggleClass('animated zoomIn').one('animationend', function() {
		$('#mallocTablesDiv').removeClass('animated zoomIn');
		svgAppend($('#animationBox'), 'svg');
		svgMarkerAppend($('#svg'), 'arrowEnd');
		for (var i = 0; i < m; i++) {
			if (i == (m - 1)) {
				animatingTableBoxes(i, function() {
					$('.introjs-nextbutton').show();
				});
			} else {
				animatingTableBoxes(i);
			}
		}
	});
}

function animatingTableBoxes(index, callBackFunction) {
	var mallocTableAddress =  $('#mallocTable' + index + ' .color-gray').eq(0);
	var pElement = $('#pValue' + (index + 1));
	TweenMax.from(mallocTableAddress, 1, {backgroundColor: 'blue', onComplete: function() {
		pElement.text(mallocTableAddress.text());
		fromEffectWithTweenMax(mallocTableAddress, pElement, function() {
			svgAnimationBoxLine(index, $('#mallocTable' + index + ' .td-value-css').eq(0), pElement.parent(), callBackFunction);
		});
	}});
}

function svgAnimationBoxLine(index, mallocTableValue, pElementParent, callBackFunction) {
	var parentDiv = $('#animationBox').offset();
	var x1 = pElementParent.offset().left - parentDiv.left + pElementParent.outerWidth();
	var y1 = pElementParent.offset().top - parentDiv.top + pElementParent.outerHeight() / 2;
	var x2 = mallocTableValue.offset().left - parentDiv.left;
	var y2 = mallocTableValue.offset().top - parentDiv.top + mallocTableValue.outerHeight() / 2;
	svgLineAppend($('#svg'), 'svgLine' + index, 'arrowEnd', x1, y1, x1, y1);
	TweenMax.to($('#svgLine' + index).show(), 1, {attr: {x2: x2, y2: y2}, onComplete: function() {
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	}});
}