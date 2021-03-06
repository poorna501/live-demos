var lang;
var queueLinkedListReady = function() {
	lang = getURLParameter("lang");
	initIntroJS();
	
	if (lang == 'cpp') {
		$('#enqueueElsePrintf').text('cout >> "Successfully inserted.";');
		$("#dequeueElsePrintf").html('cout >> "Deleted value = "\n\t\t" %d.", temp -> next;);');
		$('#displayElsePrintf').text('cout >> "Elements are : ";');
		$('#displayWhilePrintf').html('cout >> temp -&gt; info)');
		$('#displayIfPrintf').text('cout >> "Queue is empty.";');
		$('#dequeueIfPrintf').text('cout >> "Queue is underflow.";');
		$('#enqueueIfPrintf').text('cout >> "Queue is overflow.";');
		
	}
	
	$("#enqueueText").on("keydown", function(e) {
		if ($.inArray(e.keyCode, [46, 8, 9, 27]) !== -1 || (e.keyCode >= 37 && e.keyCode <= 39)) {
			return;
		}
		if (((e.shiftKey) || (e.keyCode < 48 || e.keyCode > 57)) && ((e.keyCode < 96) || (e.keyCode > 105))) {
			e.preventDefault();
		}
	});
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

var insertedVal, flag = false; 

function initIntroJS() {
	introjs = introJs();
	introjs.setOptions({
		steps : [{
			element : "#queueInit",
			intro : "",
			position : "right",
			tooltipClass: "hide"
		},{
			element: "#strcutSpan",
			intro : "",
			position : "right"
		},{
			element: "#typeDefDec",
			intro : "",
			position : "right",
			tooltipClass : "hide",
		},{
			element: "#declareFirstAndRearNode",
			intro : "",
			position : "right",
			tooltipClass : "hide",
		},{
			element : "#animationDiv",
			intro : "",
			position : "left",
			tooltipClass : "hide",
		},{
			element : "#btnsDiv",
			intro : "",
			position : "left"
		}]
	});
	introjs.onafterchange(function(targetElement) {
		var elementId = targetElement.id;
		switch (elementId) {
		case "queueInit":
			$(".introjs-nextbutton").addClass("introjs-disabled")
			setTimeout(function() {
				introjs.nextStep();
			},1500);
			break;
		case "strcutSpan" :
			$(".introjs-nextbutton").hide();
			$(".introjs-helperLayer").one("transitionend", function() {
				var text = "This is the declaration of a new <y>struct</y> type <y>queue</y>.<br><br>"
					+ "<ul><li><y>info</y> field is used to hold the <y>data</y> inside the linked list.</li>"
					+ "<li><y>next</y> field is used to keep the <y>address</y> of <y>next</y> node.</li></ul>";
				typing($(".introjs-tooltiptext"), text, function() {
					$(".introjs-nextbutton").show();
				});
			});
		break;
		case 'typeDefDec':
			$(".introjs-nextbutton").hide();
			$(".introjs-helperLayer").one("transitionend", function() {
				$(".introjs-tooltip").removeClass('hide');
				text = 'The <y>typedef</y> creates an <y>alias</y> name as a <y>node</y> to the <y>struct queue</y> which is a <y>pointer</y>'
				typing(".introjs-tooltiptext", text, function() {
					$('.introjs-nextbutton').show();
				});
			});
		break;
		case 'declareFirstAndRearNode':
			$(".introjs-nextbutton").hide();
			$(".introjs-helperLayer").one("transitionend", function() {
				$('.introjs-tooltip').removeClass('hide');
				text = "Here, we are declaring and initializing struct pointers <y>front</y> and <y>rear</y> to <y>NULL</y>";
				typing('.introjs-tooltiptext', text, function() {
					$('.introjs-nextbutton').show();
				});
			});
		break;
		case "btnsDiv":
			$('#enqueueText').val("");
			$("#enqueueText").attr("disabled", false);
			$(".arrow").remove();
			$(".introjs-nextbutton").hide();
			$(".background-color-yellow").removeAttr("style").removeClass("background-color-yellow");
			if ($("#enqueueText").is(":disabled")) {
				doPlayPause();
			}
			$("#btnsDiv [disabled]").removeAttr("disabled");
			$(".introjs-helperLayer").one("transitionend", function() {
				if (introjs._currentStep == 5) {
					var text = "Provide a number to be inserted.";
					typing(".introjs-tooltiptext", text, function() {
						$("#enqueueText").focus();
					});
				} else {
					var text = "Please choice any operation.";
					typing(".introjs-tooltiptext", text, function() {
						doPlayPause();
					});
				}
			});
			break;
			
		case "lastCall":
			introjs.refresh();
			$(".introjs-nextbutton").hide();
			$(".introjs-helperLayer").one("transitionend", function() {
				setTimeout(function() {
					doPlayPause();
					
				}, 200);
			});
			break;
			
		case "enqueueFun":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".introjs-helperLayer").one("transitionend", function() {
				var text = "Here, we are <y>inserting</y> the given element (<y>"+ queue[queue.length - 1] 
							+"</y>) into the <y>queue</y> at <y>rear</y>.";
				typing(".introjs-tooltiptext", text, function() {
					$(".introjs-tooltiptext").append("<ul style='font-family: monospace;'><li><span>int element</span></li></ul>");
					travel("#enqueueParameter", $(".introjs-tooltiptext ul li:last-child span"), function () {
						insertedVal = $("#enqueueText").val();
						arrow("#enqueueTempDef", "#enqueueTempDef", function() {
							$(".introjs-tooltiptext ul li:last-child span").append(" = <span><y>" + insertedVal + "</y></span>");
							$("#enqueueParameter").css("background-color", "");
							$(".introjs-tooltiptext ul li *").removeAttr("id");
							$("#enqueueTempDef, #initTemp").addClass("background-color-yellow");
							$(".introjs-tooltiptext ul").append("<li></li>");
							var text = "Create and allocate memory for struct variable <y>temp</y>";
							typing($(".introjs-tooltiptext ul li:last"), text, function() {
								arrow("#enqueueTempDef", "#initTemp", function() {
									getIntrojsStep("#animationDiv", "", "", "hide");
									$(".introjs-nextbutton").removeClass("introjs-disabled").show();
								});
							});
						});
					});
				});
			});
			break;
			
		case "enqueueBlk1":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".background-color-yellow").removeClass("background-color-yellow");
			$(".introjs-helperLayer").one("transitionend", function() {
				$(".introjs-tooltiptext").append("<ul></ul>");
				arrow("#initTemp", "#enqueueIf", function() {
					enqueueStep1();
				});
			});
			break;
			
		case "enqueueElseIfElseBlk":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".background-color-yellow").removeClass("background-color-yellow");
			$(".introjs-helperLayer").one("transitionend", function() {
				arrow("#tempNextInit", "#enqueueElseIf", function() {
					$(".introjs-tooltiptext").append("<ul></ul>");
					$(".introjs-tooltiptext ul li *").removeAttr("id");
					$(".introjs-tooltiptext ul").append("<li>" 
							+ "<span id='tooltipCndtn' style='font-family: monospace; font-weight: bold;'><span  id='tooltipFront'>front</span>" 
							+ " == NULL</span></li>");
					travel("#enqueueSecondIfCndtn", $(".introjs-tooltiptext ul li:last-child span"), function () {
						flip("#tooltipFront", queue.length == 1 ? "NULL" : address[0], function() {
							var text = "";
							if (queue.length == 1) {
								text = "Since it evaluates to <y>true</y>, so the control enters into <y>if-block</y>."
							} else {
								text = "Since it evaluates to <r>false</r>."
							}
							$(".introjs-tooltiptext ul li:last-child").append("<div></div>");
							typing($(".introjs-tooltiptext ul li:last-child div").last(), text, function() {
								if (queue.length == 1) {
									fromId = "#enqueueFrontInit";
									$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='enqueueElseIfBlk()'>Next &#8594;</a>")
								} else {
									fromId = "#enqueueRearNextInit"
									$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='enqueueElseIfElseBlk()'>Next &#8594;</a>")
								}
							});
						});
					});
				});
			});
			break;
			
		case "queueElsePrintfBlk":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".background-color-yellow").removeClass("background-color-yellow");
			$(".introjs-helperLayer").one("transitionend", function() {
				arrow(fromId, "#enqueueRearInit", function() {
					$("#enqueueRearInit").addClass("background-color-yellow");
					var text = "<ul><li>The <y>address</y> contained in the <y>temp</y> (<y>"+ address[address.length - 1] 
								+"</y>) is assigned to the <y>rear</y> node.</li></ul>"
					typing(".introjs-tooltiptext", text, function() {
						$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='changeRearNext()'>Next &#8594;</a>")
					});
				});
			});
			break;
			
		case "dequeueFun":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".introjs-helperLayer").one("transitionend", function() {
				var text = "By using this code we are <y>removing</y> the element from the <span class='ct-code-b-yellow'>queue</span>.";
				typing(".introjs-tooltiptext", text, function() {
					arrow("#dequeueTempDef", "#dequeueTempDef", function() {
						$("#dequeueTempDef").addClass("background-color-yellow");
						$(".introjs-tooltiptext").append("<ul><li></li></ul>");
						var text = "Create a new temporary <y>struct</y> variable <y>temp</y> with value <y>NULL</y>.";
						typing($(".introjs-tooltiptext ul li:last"), text, function() {
							flag = true;
							getIntrojsStep("#animationDiv", "", "", "hide");
							$(".introjs-nextbutton").removeClass("introjs-disabled").show();
							
							//$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='dequeueStep1()'>Next &#8594;</a>")
						});
					});
				});
			});
			break;
		case "dequeueBlk1" :
			dequeueStep1();
		break;
		case "dequeueElseIfElseBlk":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".introjs-helperLayer").one("transitionend", function() {
				$("#dequeueTempInit").removeClass("background-color-yellow").removeAttr("style");
				$("#dequeuElseIfCndtn").addClass("background-color-yellow");
				arrow("#dequeueTempInit", "#dequeueElseIf", function() {
					$(".introjs-tooltiptext").append("<ul></ul>");
					$(".introjs-tooltiptext ul").append("<li><span id='tooltipCndtn' style='font-family: monospace; font-weight: bold;'>" 
							+ "<span id='tooltipFront'>front</span> == " 
							+ "<span id='tooltipRear'>rear</span></span></li>");
					travel("#dequeuElseIfCndtn", $(".introjs-tooltiptext ul li:last-child span"), function () {
						flip("#tooltipFront", address[0], function() {
							flip("#tooltipRear", address[address.length - 1], function() {
								var text = "";
								if (address[address.length - 1] == address[0]) {
									text = "Since it evaluates to <y>true</y>, the control enters into <y>if-block</y>."
								} else {
									text = "Since it evaluates to <r>false</r>, the control enters into <y>else-block</y>."
								}
								$(".introjs-tooltiptext ul li:last-child").append("<div></div>");
								typing($(".introjs-tooltiptext ul li:last-child div").last(), text, function() {
									if (address[queue.length - 1] == address[0]) {
										$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='dequeueElseIfBlk()'>Next &#8594;</a>")
									} else {
										$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='dequeueElseIfElseBlk()'>Next &#8594;</a>")
									}
								});
							});
						});
					});
				});
			});
			break;
			
		case "dequeueElsePrintfBlk":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".introjs-helperLayer").one("transitionend", function() {
				arrow("#dequeueElsePrintf", "#dequeueRemoveTemp");
				$(".background-color-yellow").removeClass("background-color-yellow");
				$("#dequeueElsePrintf, #dequeueRemoveTemp").addClass("background-color-yellow");
				var text = "Finally print deleted element <y>"+ queue[0] +"</y> and <y>remove</y> the <y>temp</y>.";
				typing(".introjs-tooltiptext", text, function() {
					$("#output").append("<div class='opacity00'>Deleted value = " + queue.splice(0, 1) + ".</div>");
						rearVal--;
						address.splice(0, 1);
					getIntrojsStep("#outputDiv", "", "", "hide");
					$(".introjs-nextbutton").removeClass("introjs-disabled").show();

				});
			});
			break;
			
		case "displayFun":
			$(".introjs-nextbutton").hide();
			$(".introjs-helperLayer").one("transitionend", function() {
				var text = "By using this code we are <y>print</y> the elements in the <y>Queue</y>.";
				typing(".introjs-tooltiptext", text, function() {
					arrow("#displayIf", "#displayIf", function() {
						$(".introjs-tooltiptext").append("<ul><li><span style='font-family: monospace; font-weight: bold;'> <span id='tooltipFront'>front</span> == NULL </span></li></ul>");
						travel("#displayIfCndtn", $(".introjs-tooltiptext ul li:last-child span"), function() {
							flip("#tooltipFront", queue.length == 0 ? "NULL" : address[0], function() {
								var text;
								if (queue.length == 0) {
									text = "Evaluates to <y>true</y>, the control enters into the <y>if-block</y>.";
								} else {
									text = "Evaluates to <r>false</r>, the control enters into the <y>else-block</y>.";
								}
								$(".introjs-tooltiptext ul li:last-child").append("<div></div>");
								typing($(".introjs-tooltiptext ul li:last-child div:last"), text, function() {
									if (queue.length == 0) {
										$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='displayIfPart()'>Next &#8594;</a>");
									} else {
										$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='displayElsePart()'>Next &#8594;</a>");
									}
								});
							});
						});
					});
				});
			});
			break;
			
		case "displayBlk2":
			$(".introjs-nextbutton").hide();
			introjs.refresh();
			$(".background-color-yellow").removeClass("background-color-yellow");
			$(".introjs-helperLayer").one("transitionend", function() {
				arrow("#displayElsePrintf", "#displayWhile", function() {
					$('#displayWhilePrintf, #displayTempNext, #displayWhile, #doLoop').addClass("background-color-yellow");
					var text = "This <y>do while-loop</y> is repeated untill the <y>temp</y> value is not <y>first</y>.";
					typing(".introjs-tooltiptext", text, function() {
						$(".introjs-tooltiptext").append("<ul><li></li></ul>");
						var text = "It prints the <y>info</y> value of each <y>member</y>.";
						typing($(".introjs-tooltiptext ul li:last"), text, function() {
							$(".introjs-tooltiptext ul").append("<li></li>");
							var text = "Next traverse the <y>temp</y> to the <y>next node</y>.";
							typing($(".introjs-tooltiptext ul li:last"), text, function() {
								getIntrojsStep("#animationDiv", "", "", "hide");
								$(".introjs-nextbutton").removeClass("introjs-disabled").show();
								var text = "";
								for (var i = 0; i < queue.length; i++) {
									text = text + queue[i] + " "; 
								}
								$("#output").append("<div class='opacity00' style='display:inline-block;'>" + text + "<br/></div>");
							});
						});
					});
				});
			});
			break;
			
		case "animationDiv":
			$(".introjs-nextbutton").hide();
			$("#btnsDiv .btn").attr("disabled", "disabled");
			$(".introjs-helperLayer").one("transitionend", function() {
				$('#canvas').removeClass('opacity00');
				if (introjs._currentStep == 4) {
					setTimeout(function() {
						introjs.nextStep();
					}, 800);
				} else if (introjs._introItems[introjs._currentStep].tooltipClass == "hide") {
						doPlayPause();
				} else {
					doPlayPause();
					setTimeout(function() {
						var text = "Successfully clear the <y>queue</y>.";
						typing(".introjs-tooltiptext", text, function() {
						});
					}, 1000);
				}
			});
			break;
			
		case "outputDiv":
			$("#outputDiv, #ele").removeClass("opacity00");
			$(".introjs-helperLayer").one("transitionend", function() {
				$(".output-console-body").scrollTo($("#output > div:last-child()"), 500, function() {
					$("#output > div:last-child()").removeClass("opacity00").hide().fadeIn(1000, function() {
						if($("#output > div:last-child() *").length == 1) {
							$("#output").append("<br/>");
						}
						doPlayPause();
					});
				});
			});
			break;
		}
	});
	
	introjs.setOption('showStepNumbers', false);
	introjs.setOption('exitOnOverlayClick', false);
	introjs.setOption('exitOnEsc', false);
	introjs.setOption('keyboardNavigation', false);
	introjs.start();
	$('.introjs-prevbutton').hide();
	$('.introjs-skipbutton').hide();
	$('.introjs-bullets').hide();
}


function enqueueStep1() {
	$(".user-btn").remove();
	$(".background-color-yellow").removeClass("background-color-yellow");
	$("#enqueueFirstIfCndtn").addClass("background-color-yellow");
	$(".introjs-tooltiptext ul").append("<li></li>");
	$(".introjs-tooltiptext ul li:last-child").append("<span id='tooltipCndtn' style='font-family: monospace; font-weight: bold;'>" 
			+ "<span id='tooltipTemp'>temp</span> == NULL</span>");
	travel("#enqueueFirstIfCndtn", "#tooltipCndtn", function () {
		flip("#tooltipTemp", (address[address.length - 1]), function() {
			$(".introjs-tooltiptext ul li:last-child").append("<div></div>");
			var text = "Evaluates to <r>false</r>, so the control enters into the <y>else-block</y>.";
			typing($(".introjs-tooltiptext ul li:last-child > div:last"), text, function() {
				$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='enqueueStep2()'>Next &#8594;</a>")
			});
		});
	});
}


function enqueueStep2() {
	$(".user-btn").remove();
	$("#enqueueFirstIfCndtn").removeClass("background-color-yellow").removeAttr("style");
	arrow("#enqueueIf", "#tempInfoInit", function() {
		$("#tempInfoInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "Here, integer value <y>element</y> (<y>"+ insertedVal +"</y>) is stored in the <y>info</y> field of <y>temp</y>.";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			arrow("#tempInfoInit", "#tempNextInit", function() {
				$("#tempNextInit").addClass("background-color-yellow");
				$(".introjs-tooltiptext ul").append("<li></li>");
				var text = "Set the <y>next</y> field of <y>temp</y> into the <y>NULL</y>.";
				typing($(".introjs-tooltiptext ul li:last"), text, function() {
					getIntrojsStep("#animationDiv", "", "", "hide");
					$(".introjs-nextbutton").removeClass("introjs-disabled").show();
				});
			});
		});
	});
}

function enqueueElseIfBlk() {
	$(".user-btn").remove();
	$("#enqueueSecondIfCndtn").removeAttr("style");
	arrow("#enqueueElseIf", "#enqueueFrontInit", function() {
		$("#enqueueFrontInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "The <y>address</y> contained in <y>temp</y> (<y>"+ address[address.length - 1] +"</y>) is assigned to <y>front</y> node";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			getIntrojsStep("#animationDiv", "", "", "hide");
			$(".introjs-nextbutton").removeClass("introjs-disabled").show();
		});
	});
}

function enqueueElseIfElseBlk() {
	$(".user-btn").remove();
	$("#enqueueSecondIfCndtn").removeAttr("style");
	arrow("#enqueueElseIf", "#enqueueRearNextInit", function() {
		$("#enqueueRearNextInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "Store the <y>address</y> contained in <y>temp</y> (<y>"+ address[address.length - 1]
					+"</y>) into the <y>next</y> field of <y>rear</y> node.";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			getIntrojsStep("#animationDiv", "", "", "hide");
			$(".introjs-nextbutton").removeClass("introjs-disabled").show();
		});
	});
}

function changeRearNext() {
	$(".user-btn").remove();
	arrow("#enqueueRearInit", "#enqueueRearNextFirstInit", function() {
		$("#enqueueRearNextFirstInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "store the <y>address</y> contained in <y>front</y> (<y>"+ address[0] 
					+"</y>) into the <y>next</y> field of <y>rear</y> node."
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			arrow("#enqueueRearNextFirstInit", "#enqueueElsePrintf", function() {
				$("#enqueueElsePrintf").addClass("background-color-yellow");
				$(".introjs-tooltiptext ul li:last").append("<li></li>");
				var text = "Display the message in the console <y>Successfully inserted</y>.";
				typing($(".introjs-tooltiptext ul li:last"), text, function() {
					$("#output").append("<div class='opacity00'>Successfully inserted.</div>");
					rearVal++;
					getIntrojsStep("#animationDiv", "", "", "hide");
					$(".introjs-nextbutton").removeClass("introjs-disabled").show();
				});
			});
		});
	});
}

function dequeueStep1() {
	$(".user-btn").remove();
	$("#dequeueTempDef").removeClass("background-color-yellow");
	arrow("#dequeueTempDef", "#dequeueIf", function() {
		$("#dequeuIfCndtn").addClass("background-color-yellow");
		$(".introjs-tooltiptext").append("<ul></ul>");
		$(".introjs-tooltiptext ul").append("<li><span id='tooltipCndtn' style='font-family: monospace; font-weight: bold'>" 
				+ "<span id='tooltipFront'>front</span> == NULL</span></li>");
		travel("#dequeuIfCndtn", $(".introjs-tooltiptext ul"), function () {
			flip("#tooltipFront", queue.length == 0 ? "NULL" : address[0], function() {
				var text = "";
				if (queue.length == 0) {
					text = "Since it evaluates to <y>true</y>, the control enters into <y>if-block</y>."
				} else {
					text = "Since it evaluates to <r>false</r>, the control enters into <y>else-block</y>."
				}
				$(".introjs-tooltiptext ul li:last-child").append("<div></div>");
				typing($(".introjs-tooltiptext ul li div").last(), text, function() {
					if (queue.length == 0) {
						$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='dequeueIfBlk()'>Next &#8594;</a>")
					} else {
						$(".introjs-tooltipbuttons").append("<a class='introjs-button user-btn' onclick='dequeueElseBlk()'>Next &#8594;</a>")
					}
				});
			});
		});
	});
}

function dequeueIfBlk() {
	$(".user-btn").remove();
	$("#dequeuIfCndtn").removeClass("background-color-yellow").removeAttr("style");
	arrow("#dequeueIf", "#dequeueIfPrintf", function() {
		$("#dequeueIfPrintf").addClass("background-color-yellow");
		$("#output").append("<div class='opacity00'>Queue is underflow.</div>");
		getIntrojsStep("#outputDiv", "", "", "hide");
		$(".introjs-nextbutton").removeClass("introjs-disabled").show();
	});
}

function dequeueElseBlk() {
	$(".user-btn").remove();
	$("#dequeuIfCndtn").removeClass("background-color-yellow").removeAttr("style");
	arrow("#dequeueIf", "#dequeueTempInit", function() {
		$("#dequeueTempInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "The <y>address</y> contained in the <y>front</y> (<y>"+ address[0] 
					+"</y>) is assigned to <y>temp</y> node.";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			getIntrojsStep("#animationDiv", "", "", "hide");
			$(".introjs-nextbutton").removeClass("introjs-disabled").show();
		});
	});
}

function dequeueElseIfBlk() {
	$(".user-btn").remove();
	$("#dequeuElseIfCndtn").removeClass("background-color-yellow").removeAttr("style");
	arrow("#dequeueElseIf", "#dequeuRearFrontInit", function() {
		$("#dequeuRearFrontInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "Here, we initialize the <y>front</y> and <y>rear</y> into <y>NULL</y>.";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			getIntrojsStep("#animationDiv", "", "", "hide");
			$(".introjs-nextbutton").removeClass("introjs-disabled").show();
		});
	});
}

function dequeueElseIfElseBlk() {
	$(".user-btn").remove();
	$("#dequeuElseIfCndtn").removeClass("background-color-yellow").removeAttr("style");
	arrow("#dequeueElseIf", "#dequeueFrontInit", function() {
		$("#dequeueFrontInit").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "Store the <y>address</y> contained in <y>next</y> field of <y>front</y> into <y>front</y> node";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			getIntrojsStep("#animationDiv", "", "", "hide");
			$(".introjs-nextbutton").removeClass("introjs-disabled").show();
		});
	});
}

function displayIfPart() {
	$(".user-btn").remove();
	$("#displayIfCndtn").removeAttr("style");
	arrow("#displayIf", "#displayIfPrintf", function() {
		$("#displayIfPrintf").addClass("background-color-yellow");
		$("#output").append("<div class='opacity00'>Queue is empty.</div>");
		getIntrojsStep("#outputDiv", "", "", "hide");
		$(".introjs-nextbutton").removeClass("introjs-disabled").show();
	});
}

function displayElsePart() {
	$(".user-btn").remove();
	$("#displayIfCndtn").removeAttr("style");
	arrow("#displayIf", "#displayFrontToTemp", function() {
		$("#displayFrontToTemp").addClass("background-color-yellow");
		$(".introjs-tooltiptext ul").append("<li></li>");
		var text = "The <y>address</y> contained in <y>front</y> (<y>"+ address[0] +"</y>) is assigned to <y>temp</y> node.";
		typing($(".introjs-tooltiptext ul li:last"), text, function() {
			arrow("#displayFrontToTemp", "#displayElsePrintf", function() {
				$("#displayElsePrintf").addClass("background-color-yellow");
				$("#output").append("<div class='opacity00' style='display: inline-block;' id='ele'>Elements are : </div>");
				getIntrojsStep("#animationDiv", "", "", "hide");
				$(".introjs-nextbutton").removeClass("introjs-disabled").show();
			});
			
		});
	});
}