var introjs;

var usageOfFputsAndFgets = function() {
	introGuide();
	$(".line").hide();
	
	$('#restart').click(function() {
		location.reload();
	});
	
	var x = Math.floor((Math.random() * 1024) + 1425);
	$(".value").text(x);
	fpAddress = Math.floor((Math.random() * 1086) + 2050);
}

function introGuide() {
	introjs = introJs();
	introjs.setOptions({
		showStepNumbers : false,
		exitOnOverlayClick : false,
		showBullets : false,
		exitOnEsc : false,
		keyboardNavigation : false,
		steps : [ {
					element: '#typingDiv',
					intro: '',
					tooltipClass: 'hide'
				}, {
					element: '#program',
					intro: '',
					position: 'right'
				}, {
					element: "#fileOperation",
					intro: ''
				}, {
					element: '#memory',
					intro: '',
					tooltipClass: 'hide',
					memoryStep: 'addressView'
				}, {
					element: '#charDec',
					intro: ''
				}, {
					element: '#memory',
					intro: '',
					tooltipClass: 'hide',
					memoryStep: 'tableShow'
				}, {
					element: '#openFile1',
					intro: '',
					tooltipClass: 'hide'
				}, {
					element: '#writeMode',
					intro: '',
				}, {
					element: '#wFileOpen',
					intro: ''
				}, {
					element: '#output',
					intro: '',
					tooltipClass: 'hide',
					outputStep: 'openTextFile'
				}, {
					element: '#putsPrintf',
					intro: ''
				}, {
					element: '#console',
					intro: '',
					tooltipClass: 'hide',
					consoleSteps: 'openConsole'
				}, {
					element: '#gets',
					intro: ''
				}, {
					element: '#console',
					intro: '',
					tooltipClass: 'hide',
					consoleSteps: 'enterText'
				}, {
					element: '#charAddress',
					intro: '',
					tooltipClass: 'hide'
				}, {
					element: '#fputsString',
					intro: ''
				}, {
					element: '#output',
					intro: '',
					tooltipClass: 'hide',
					outputStep: 'firstValue'
				}, {
					element: '#closeFile1',
					intro: ''
				}, {
					element: '#output',
					intro: '',
					tooltipClass: 'hide',
					outputStep: 'fileClose'
				}, {
					element: '#openFile2',
					intro: '',
					tooltipClass: 'hide'
				}, {
					element: '#readMode',
					intro: ''
				}, {
					element: '#rFileOpen',
					intro: ''
				}, {
					element: '#output',
					intro: '',
					tooltipClass: 'hide',
					outputStep: 'fileOpen'
				}, {
					element: '#getsPrintf',
					intro: ''
				}, {
					element: '#console',
					intro: '',
					tooltipClass: 'hide',
					consoleSteps: 'printStatement'
				}, {
					element: '#fgets',
					intro: ''
				}, {
					element: '#char1Address',
					intro: '',
					tooltipClass: 'hide'
				}, {
					element: '#output',
					intro: '',
					outputStep: 'printValue'
				}, {
					element: '#puts',
					intro: ''
				}, {
					element: '#console',
					intro: '',
					tooltipClass: 'hide',
					consoleSteps: 'nextText'
				}, {
					element: '#closeFile2',
					intro: '',
				}, {
					element: '#output',
					intro: '',
					tooltipClass: 'hide',
					outputStep: 'readFileClose'
				}, {
					element: '#restart',
					intro: 'Click to restart.',
					position: 'right'
				} ]
	});
	introjs.onafterchange(function(targetElement) {
		$('.introjs-nextbutton, .introjs-prevbutton, .introjs-skipbutton').hide();
		var elementId = targetElement.id;
		switch (elementId) {
		
			case "typingDiv":
				TweenMax.to($("#line1"), 0.5, {opacity: 1, onComplete: function() {
					TweenMax.to($("#line2"), 0.5, {opacity: 1, onComplete: function() {
						$('.introjs-tooltip').removeClass("hide");	
						var text = "The functions <b class='ct-code-b-yellow'>fputs()</b> and <b class='ct-code-b-yellow'>fgets()</b>"
									+ " are used for writing and reading strings <b>from / to</b> disk files.";
						typing('.introjs-tooltiptext', text, function() {
							$('.introjs-nextbutton').show();
						});
					}});
				}});
				break;
				
			case "program":
				$("#typingDiv").addClass("z-index");
				$('.introjs-helperLayer').one('transitionend', function() {
					$("#program").removeClass("opacity00");
					var text = "In this program we will learn how <span class='ct-code-b-yellow'>fputs()</span> and"
								+ " <span class='ct-code-b-yellow'>fgets()</span> functions will work.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "fileOperation":
				$('.introjs-tooltip').css({'min-width' : '250px'});
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>FILE</span> referred to as Stream. Stream means flow of data."
								+ " i.e., reading and writing of data.<br><br> <span class='ct-code-b-yellow'>fp</span> is a file pointer"
								+ " that contains the address of the structure FILE.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "charDec":
				$('.introjs-tooltip').css({'min-width' : '200px'});
				$("#fpAddressStorage, #memory").removeClass("z-index");
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "Here we declared two character arrays with the size 20.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "memory":
				$('.introjs-helperLayer').one('transitionend', function() {
					var memoryStep = introjs._introItems[introjs._currentStep].memoryStep;
					switch(memoryStep) {
						
						case "addressView":
							$("#memory").removeClass("opacity00");
							$('#fileOperation').addClass("z-index").effect( "highlight",{color: 'yellow'}, 800);
							$("#fileOperation").effect( "transfer", { to: $("#fpAddressStorage"), className: "ui-effects-transfer" }, 1000 , function() {
								$('#fileOperation').removeClass("z-index");
								$("#fpAddressStorage").removeClass("opacity00");
								setTimeout(function() {
									introjs.nextStep();
								}, 500);
							});
							break;
							
						case "tableShow":
							$("#charAddress, #char1Address").removeClass("opacity00");
							for (var i = 0; i < 20; i++) {
								$(".str-address, .str1-address").append('<td class="text-center">' + i + '</td>');
								$(".user-string, .str1-string").append('<td class="td-border"></td>');
							}
							setTime();
							break;
					}
				});
				break;
				
			case "openFile1":
			case "openFile2":
				$('.introjs-helperLayer').one('transitionend', function() {
					setTime();
				});
				break;
				
			case "writeMode":
				introjs.refresh();
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>write</span> mode, a file with specified name is created if the file"
								+ " does not exist; the contents are deleted if the file already exist.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "wFileOpen":
			case "rFileOpen":
				$('.introjs-helperLayer ').one('transitionend', function() {
					var text1 = "Here we open <span class='ct-code-b-yellow'>codetantra.txt</span> file in <span class='ct-code-b-yellow'>";
					if (introjs._currentStep == 8) {
						var text = text1 + "write</span> mode.";
					} else {
						var text = text1 + "read</span> mode.";
					} 
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "output":
				$('.introjs-helperLayer').one('transitionend', function() {
					var outputStep = introjs._introItems[introjs._currentStep].outputStep;
					switch(outputStep) {
						
					case "openTextFile":
						$("#output").removeClass("opacity00").addClass("animated zoomIn").one('animationend', function() {
							$("#output").removeClass("animated zoomIn");
							$(".ct-file-text").append('<input type="text" class="ct-text" />');
							$(".fa").removeClass("opacity00");
							$(".fp-address").text(fpAddress).removeClass("opacity00");
							$('.introjs-tooltip').removeClass("hide");
							var text = "Here the file structure base address is stored in the <span class='ct-code-b-yellow'>file pointer(fp)</span>.";
							typing('.introjs-tooltiptext', text, function() {
								$('.introjs-tooltipbuttons').append('<a class="introjs-button introjs-nextbutton" id="svgBtn"'
																+ ' onClick="arrowBtn()">Next &#8594;</a>');
							});
						});
						break;
						
					case "firstValue":
						$(".ct-text").val($("#enteredText").val());
						setTime();
						break;
						
					case "fileClose":
						$("#output").addClass("opacity00");
						$(".fp-address").hide();
						$("#output").addClass("animated zoomOut").addClass("opacity00").one('animationend', function() {
							$("#output").removeClass("animated zoomOut");
							$(".address").addClass("opacity00");
							setTime();
						});
						break;
						
					case "fileOpen":
						$("#output").removeClass("opacity00").addClass("animated zoomIn").one('animationend', function() {
							$("#output").removeClass("animated zoomIn");
							$(".fp-address").show();
							$("#fpAddressStorage").addClass("z-index");
							$(".address").removeClass("opacity00");
							setTimeout(function() {
								introjs.nextStep();
							}, 1000);
						});
						break;
						
					case "printValue":
						var text = "Get <span class='ct-code-b-yellow'> " + $(".ct-text").val() + " </span> from" 
									+ " <span class='ct-code-b-yellow'>fp (i.e., " + $(".fp-address").text() + ")</span>";
						typing('.introjs-tooltiptext', text, function() {
							$('.introjs-nextbutton').show();
						});	
						break;
						
					case "readFileClose":
						$("#output").addClass("animated zoomOut").addClass("opacity00").one('animationend', function() {
							$("#output").removeClass("animated zoomOut");
							$(".address").addClass("opacity00");
							setTime();
						});
						break;
					}
				});
				break;
				
			case "putsPrintf":
				$(".line").hide();
				$("#fpAddressStorage").removeClass("z-index");
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>printf()</span> function is used to"
								+ " print the data or user defined message on console</span>.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "console":
				$('.introjs-helperLayer').one('transitionend', function() {
					var consoleSteps = introjs._introItems[introjs._currentStep].consoleSteps;
					switch(consoleSteps) {
						
						case "openConsole":
							$("#console, #printStatmnt1").removeClass("opacity00");
							setTime();
							break;
							
						case "enterText":	
							$("#textEnter").append('<input type="text" class="input" maxlength="20" id="enteredText" />')
							$("#enteredText").effect("highlight", {color: 'yellow'}, 300);
							$("#enteredText").focus();
							$('.introjs-tooltip').removeClass("hide");
							var text = "Enter a string.";
							typing('.introjs-tooltiptext', text, function() {
								$("#enteredText").on("keyup", function(e) {
									if ($("#enteredText").val().length < 1	) {
										$('.introjs-nextbutton').hide();
									} else {
										$('.introjs-nextbutton').show();
									}
								});
							});
							break;
							
						case "printStatement":	
							$("#printStatmnt2").removeClass("opacity00");
							setTimeout(function() {
								introjs.nextStep();
							}, 1500);
							break;
							
						case "nextText":
							$("#userText").text($("#enteredText").val());
							setTime();
							break;
					}
				});
				break;
				
			case "charAddress":
				$("#enteredText").attr("disabled", true);
				$('.introjs-helperLayer').one('transitionend', function() {
					$.each($("#enteredText").val().split(""), function(index, value) {
				    	$(".user-string td").eq(index + 1).text(value);
					});
					setTime();
				});
				break;
				
			case "char1Address":
				$('.introjs-helperLayer').one('transitionend', function() {
					$.each($("#enteredText").val().split(""), function(index, value) {
				    	$(".str1-string td").eq(index + 1).text(value);
					});
					setTime();
				});
				break;
				
			case "gets":
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>gets()</span> function reads a line from stdin and"
								+ " <span class='ct-code-b-yellow'> stores</span> it into the string pointed to by str."
								+ " <br>It <span class='ct-code-b-yellow'>stops</span> when either"
								+ " the newline character is read or when the <span class='ct-code-b-yellow'>End-Of-File(EOF)</span> is reached.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "fputsString":
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>fputs()</span> function writes the given string into a"
								+ " <span class='ct-code-b-yellow'>file</span> pointed by <span class='ct-code-b-yellow'>fp</span>.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "closeFile1":
			case "closeFile2":
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>flocse(fp)</span> is used to close the file.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "readMode":
				introjs.refresh();
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>read</span> mode, the file is opened with the current contents safe if the file"
								+ " already exists; otherwise an error occurs.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "getsPrintf":
				$("#fpAddressStorage").removeClass("z-index");
				$('.introjs-helperLayer ').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>printf()</span> function is used to"
								+ " print the data or user defined message on console.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "fgets":
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>fgets()</span> function reads number of bytes from the"
								+ " <span class='ct-code-b-yellow'>file</span> pointed by"
								+ " <span class='ct-code-b-yellow'>fp</span> into the character array"
								+ " <span class='ct-code-b-yellow'>str1</span>.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "puts":
				$('.introjs-helperLayer').one('transitionend', function() {
					var text = "<span class='ct-code-b-yellow'>puts()</span> function is used to display"
								+ " a string on a standard output device.";
					typing('.introjs-tooltiptext', text, function() {
						$('.introjs-nextbutton').show();
					});
				});
				break;
				
			case "restart":
				$('.introjs-tooltip').css({'min-width' : '110px'});
				$(".introjs-helperLayer").one("transitionend", function() {
					$("#restart").removeClass("opacity00");
				});
				break;
		}
	});
	introjs.start();
}

function typing(typingId, typingContent,callBackFunction) {
	$(typingId).typewriting( typingContent , {
		"typing_interval": 5,
		"cursor_color": 'white',
	}, function() {
		$(typingId).removeClass('typingCursor');
		if (typeof callBackFunction === "function") {
			callBackFunction();
		}
	});
}

function arrowReveal(selector, x2, y2, duration, callbackFunction) {
	$(selector).show();
	TweenMax.to(selector, duration, {attr:{x2: x2, y2: y2}, onComplete: function(){
		if (typeof callbackFunction === "function") {
			callbackFunction();
		}
	}});
}

function setTime() {
	setTimeout(function() {
		introjs.nextStep();
	}, 800);
}

function arrowBtn() {
	$("#svgBtn").remove();
	arrowReveal("#arrow1", "78.8%", "73.4%", 0.5, function() {
		$("#arrow1").css({'marker-end': ''});
		arrowReveal("#arrow2", "78.8%", "24.7%", 0.5, function() {
			$("#arrow2").css({'marker-end': ''});
			arrowReveal("#arrow3", "81.7%", "24.7%", 0.5, function() {
				$("#fpAddressStorage").addClass("z-index");
				$(".address").text(fpAddress);
				$("#fpAddressStorage").removeClass("z-index");
				$('.introjs-nextbutton').show();
			});
		});
	});
}