var swap_id = "#id_swap_1";
var LB_id = "";

var _height_;
var _width_;

var header_height = 0;

var MAX_SLIDER_HEIGHT = 350;
var MIN_WIDTH = 640;
var MAX_WIDTH = 1800;
var win_width = 0;

var magicLine;

function submitSearch()
{
	document.forms["formSearch"].submit();
}

function func_adjustWidth()
{

    var wid = $(document.body).width();
    var swid = (wid - 1000) / 2;
    //alert(swid)
    $('.paging').css('width', swid);
    $('.subpattern').css('right', 0);
	var new_height = win_width / 3;
	var new_height2  = win_width / 3.64;
	var new_height3  = (new_height2>380?380:new_height2)-$(".boutiCon").height();
	if(new_height3<=0)
		new_height3=0;
	new_height3=new_height3/2;
	/*$(".bouti-link-intro").css("width", (win_width > MAX_WIDTH ? MAX_WIDTH : win_width));*/
	/*$(".bouti-tit").css("width", (win_width > MAX_WIDTH ? MAX_WIDTH : win_width));*/
	$(".bouti-tit").css("height", (new_height2>380?380:new_height2));
	$(".boutiCon").css("top", new_height3);
	$(".boutiConBg").css("top", new_height3);
	if(win_width>1000)
	{
	    $(".boutiCon").css("left", (win_width - 1000) / 2);
		$(".boutiConBg").css("left", (win_width-1000)/2);
	}
	else{
		$(".boutiCon").css("left", 0);
		$(".boutiConBg").css("left", 0);
	}
	if (new_height > MAX_SLIDER_HEIGHT)
	{
		new_height = MAX_SLIDER_HEIGHT;
	}
	$(".iosSliderDemo").css("padding-bottom", new_height);
	$(".fluidHeight").height(new_height);
	$(".sliderContainer").css("max-height", new_height);

        if (win_width >= MIN_WIDTH)
	{
		/*$(".mainWrap02").removeAttr("style");*/
		$("#mobileNav").slideUp(0);
		$("#nav").removeAttr("style");
		$("#example-one").removeAttr("style");
		$("#example-two").removeAttr("style");
	}

	if (magicLine.length > 0)
	{
		magicLine.width($(".secNav .cur").width());
		magicLine.css("left", $(".secNav .cur a").position().left);
	}
}


var title = "";

$(document).ready(function()
{
	magicLine = $("#magic-line");
        
	$(".cls_swap_data").css("display", "none");
	$(swap_id).addClass("current");
	$(swap_id + "_data").css("display", "inline");
	title = $(swap_id + " .cls_swap").html();
	$(".cls_swap").click(function()
	{
		var _swap_id_ = "#" + $(this).parent().attr("id");

		if (swap_id != _swap_id_)
		{
			title = $(this).html();

			if (parseInt(_swap_id_.substr(9)) > 0)
			{
				$(swap_id).removeClass("current");
			}
			$(swap_id + "_data").css("display", "none");
			$(_swap_id_).addClass("current");
			$(_swap_id_ + "_data").css("display", "inline");
			swap_id = _swap_id_;
		}
		return false;
	});


	header_height = $(".header").height();
	$("#header_placeholder").height(header_height);

	win_width = $(window).width();
	func_adjustWidth();

	$(window).resize(function() {
		_height_ = $(".header").height();
		if (header_height != _height_)
		{
			header_height = _height_;
			$("#header_placeholder").height(header_height);
		}

		_height_ = $(window).height();
		_width_ = $(window).width();
		if (win_width != _width_)
		{
			win_width = _width_;
			func_adjustWidth();
		}
	});
})
