(function ($) {

	jQuery(window).load(function() {
		jQuery("#preloader").delay(100).fadeOut("slow");
		jQuery("#load").delay(100).fadeOut("slow");
	});

    $('.col-md-6 .alert.alert-danger').fadeIn('slow');

	$('#container').imagesLoaded( function() {
		// images have loaded
		//alert("foobar");
	});

	//jQuery to collapse the navbar on scroll
	$(window).scroll(function() {
		if ($(".navbar").offset().top > 50) {
			$(".navbar-fixed-top").addClass("top-nav-collapse");
		} else {
			$(".navbar-fixed-top").removeClass("top-nav-collapse");
		}
	});

	//jQuery for page scrolling feature - requires jQuery Easing plugin
	$(function() {
		$('.navbar-nav li a').bind('click', function(event) {
			var $anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top
			}, 1500, 'easeInOutExpo');
			event.preventDefault();
		});
		$('.page-scroll a').bind('click', function(event) {
			var $anchor = $(this);
			$('html, body').stop().animate({
				scrollTop: $($anchor.attr('href')).offset().top
			}, 1500, 'easeInOutExpo');
			event.preventDefault();
		});
	});

	$('.handler-team').click(function() {
		//$('.box-team').toggleClass('hidden wow slideInRight');
	});

	$('.box-team').click(function(){
		//$(this).addClass('hidden');
	});
	/*
	$("#maps").gmap3({
		map:{
            options:{
			  animation:google.maps.Animation.DROP,
			  center:[-6.216222,106.807349],
              zoom: 14
            }
          },
          marker:{
            values:[{address:"Plaza Bapindo, Jakarta 12190 Indonesia",id:"1",data:"<div><strong>Dentsu Digital Division</strong></div><di>Mandiri Tower Plaza Bapindo, 22nd Floor, Jl. Jend. Sudirman Kav. 54-55 Jakarta 12190, Indonesia P: (021) 299-501-10 / (021) 526-0286 </div>",options:{"icon":base_URL + "assets/public/img/maps.png","animation":"google.maps.Animation.DROP"}}],
			options:{
				draggable: false,
				animation:google.maps.Animation.DROP,
				zoom: 14
			},
			events:{
				mouseover: function(marker, event, context){
				  //marker.setAnimation(google.maps.Animation.BOUNCE);
				  var map = $(this).gmap3("get"),
					infowindow = $(this).gmap3({get:{name:"infowindow"}});
				  if (infowindow){
					infowindow.open(map, marker);
					infowindow.setContent(context.data);
				  } else {
					$(this).gmap3({
					  infowindow:{
						anchor:marker,
						options:{content: context.data}
					  }
					});
				  }
				},
				mouseout: function(){
				  //marker.setAnimation(null);
				  var infowindow = $(this).gmap3({get:{name:"infowindow"}});
				  if (infowindow){
					infowindow.close();
				  }
				},
				click: function(marker, event, context){
					//markerSelected(context.id);
					marker.setAnimation(google.maps.Animation.BOUNCE);
					setTimeout(function(){
						marker.setAnimation(null);
					},1500);
				}
			  }
		  }
	  });
	*/
	//$('#vacancy-form').submit(function() {
		//alert('asdf');
	//});

	$(".apply-btn").click(function() {
		var title = $(this).parent().find('.service-desc h5').text();
		//alert(title);
		$('.vacancy-list-holder').hide({duration:'220',easing:'easeOutExpo'});
		$(".vacancy-form-holder").show({duration:'220',easing:'easeOutExpo'}).find('.vacancy-title').text(title);
		return false;
	});

	$('a.back').click(function(){
		$(".vacancy-form-holder").hide({duration:'220',easing:'easeOutExpo'});
		$('.vacancy-list-holder').show({duration:'220',easing:'easeOutExpo'});
		return false;
	});

	/*
		$(".apply-btn").fancybox({
			maxWidth	: 800,
			maxHeight	: 600,
			fitToView	: false,
			width		: '70%',
			height		: '70%',
			autoSize	: false,
			closeClick	: false,
			openEffect	: 'none',
			closeEffect	: 'none',
			helpers: {
				overlay: {
				  locked: false
				}
			}
		});
	*/

//	$("#about").vide({
//            'mp4': base_URL + 'assets/public/media/Gatwick_Airport_1Videvo_1'//,
//            'webm': base_URL + 'assets/public/media/Gatwick_Airport_1Videvo_1',
//            'ogv': base_URL + 'assets/public/media/Gatwick_Airport_1Videvo_1',
//            'poster': base_URL + 'assets/public/media/Gatwick_Airport_1Videvo_1'
//    });

    $('.reload_captcha').click(function() {
        var url	= $(this).attr('rel');
        $.ajax({
            type: "POST",
            url: url,
            cache: false,
            async: false,
            success: function(msg){
                $('.reload_captcha').empty().html(msg);
                // Need random for browser recache
                img = $('.reload_captcha').find('img');
                src = img.attr('src');
                ran	= img.fadeOut(50).fadeIn(50).attr('src', src + '?=' + Math.random());
            },
            complete: function(msg) {},
            error: function(msg) {}
        });
        return false;
    });

    if(typeof $.fn.fileupload == 'function') {

    	$('#fileuploadsssss').fileupload({
		    url: $(this).attr('data-url'),
		    dataType: 'json',
		    //acceptFileTypes: /(\.|\/)(gif|jpe?g|png)$/i,
		    //maxFileSize:2000000, // 2000 KB
		    sequentialUploads: false,
		    add: function (e, data) {
		        var uploadErrors = [];
		        //var acceptFileTypes = /\/(pdf|xml)$/i;
		        var acceptFileTypes = /(\.|\/)(gif|jpe?g|png)$/i;
		        if(data.originalFiles[0]['type'].length && !acceptFileTypes.test(data.originalFiles[0]['type'])) {
		            uploadErrors.push('Invalid file type, aborted');
		        }
		        //console.log(data.originalFiles[0]['size']) ;
		        if(data.originalFiles[0]['size'] > 5000000) {
		            uploadErrors.push('Filesize is too big');
		        }
		        if(uploadErrors.length > 0) {
		            alert(uploadErrors.join("\n"));
		        } else {
		            //data.context = $('<p/>').text('Subiendo...').appendTo('.img_holder_xhr');
		            data.submit();
		        }
		    },
		    done: function (e, data) {
		        e.preventDefault();
		        $.each(data.result.files, function (index, file) {
		            //alert(file.error);
		            $('.img-thumbnail a.colorbox')
		            .prop('href',base_URL + file.url).empty()
		            .html('<img src="'+base_URL + file.thumbnailUrl+'"//>');
		            $('input[name="image_temp"]').attr('value',file.name);
		        });
		        $('.progress').hide();
		        $('.button-submit').show({duration:'260',easing:'easeInOutBack'});
		    },
		    progressall: function (e, data) {
		        e.preventDefault();
		        var progress = parseInt(data.loaded / data.total * 100, 10);
		        $('.progress').show();
		        $('.progress .progress-bar').css(
		            'width',
		            progress + '%'
		        ).html(progress+'% Sedang mengunggah, mohon menunggu..');
		        $('.button-submit').hide({duration:'260',easing:'easeInOutBack'});
		    }
		})
		.on('fileuploadfail', function (e, data) {
		    $.each(data.files, function (index) {
		        var error = $('<span class="text-danger"/>').text('File upload failed.');
		        $(data.context.children()[index])
		            .append('<br>')
		            .append(error);
		        //console.log(files);
		    });
		})
		.prop('disabled', !$.support.fileInput)
		.parent().addClass($.support.fileInput ? undefined : 'disabled');
		$('#fileupload').bind('fileuploadprogress', function (e, data) {
		    // Log the current bitrate for this upload:
		    //console.log(data.bitrate);
		});
	}


	$('#msform').submit(function(e) {

		e.preventDefault();
		// default form var
		var userform = $(this);
        // process the form
		$.ajax({
			type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
            //url       : 'process.php', // the url where we want to POST
			data        : $(this).serialize(), // our data object
			dataType    : 'json', // what type of data do we expect back from the server
			encode      : true,
            //beforeSend: function(){
            	//userform.find('input').prop(\"disabled\", true);
            //},
			complete: function(message) {
				var msg = message.responseJSON;
				userform.find('.msg').empty();
				userform.find('.msg')
				.html('<div class="alert alert-danger msg">'
					+'<button class="close" data-close="alert"></button>'
					+msg.result.text+'</div>');
					if (msg.result.code === 1) {
						userform.find('input').prop("disabled", true);
						setTimeout(function() {
													// Do something after 5 seconds
							window.location.href = base_URL + 'user';
						}, 2000);
					} else {
						userform.find('input').prop("disabled", false);
					}

				// userform.find('input').prop("disabled", false);

				// $('.reload_captcha').click();
				// alert(msg.result);
				// console.log(msg.result);
			},
			error: function(x,message,t) {
				if(message==="timeout") {
					alert('got timeout');
				} else {
					//alert(message);
				}
			}
			}).always(function() {
				userform.find('input').prop("disabled", true);
		});

		return false;

	});


	if(typeof $.fn.colorbox == 'function') {
		if ($(".colorbox").attr('href') !== '#') {
		    $(".colorbox").colorbox({
		        rel: 'nofollow',
		        width:'640',
		        maxWidth:'640px',
		        innerWidth:'640px',
		        preloading:false
		    });
		}
	}

})(jQuery);

$(document).ready(function(){
	jQuery.jqplot.config.enablePlugins = true;
	$('#index_quest').change(function() {
		var inti = new Array();
		inti.push([0, 0, 0]);
		var plot2 = $.jqplot('chart2', inti, null);
		plot2.destroy();
		var quest_id   = $(this).val();
		var quest_text = $('option:selected').attr('data-rel');

		// Our ajax data renderer which here retrieves a text file.
		// it could contact any source and pull data, however.
		// The options argument isn't used in this renderer.
		  var ajaxDataRenderer = function(url, plot, options) {
		  var ret = null;
		  $.ajax({
			// have to use synchronous here, else the function
			// will return before the data is fetched
			async: false,
			url: url,
			dataType:"json",
			sortData:true,
			success: function(data) {
			  ret = data;
			}
		  });
		  return ret;
		};

		// The url for our json data
		var jsonurl = base_URL + 'quest/gallery/' + quest_id;

		// passing in the url string as the jqPlot data argument is a handy
		// shortcut for our renderer.  You could also have used the
		// "dataRendererOptions" option to pass in the url.
		/*
		var plot2 = $.jqplot('chart2', jsonurl,{
		  title: "AJAX JSON Data Renderer",
		  dataRenderer: ajaxDataRenderer,
		  dataRendererOptions: {
			unusedOptionalUrl: jsonurl
		  }
		});
		*/
		//jQuery.jqplot('chart2').replot();
		//var plot0 = jQuery.jqplot('chart2',jsonurl);
		//plot0.destroy();

		var plot1 = jQuery.jqplot('chart2',jsonurl,
		  {
		  /*
			seriesColors: [ "#4bb2c5", "#c5b47f", "#EAA228", "#579575", "#839557", "#958c12",
		  "#953579", "#4b5de4", "#d8b83f", "#ff5800", "#0085cc"],  // colors that will
		   // be assigned to the series.  If there are more series than colors, colors
		   // will wrap around and start at the beginning again.
		   */
			  title: quest_text,
			  dataRenderer: ajaxDataRenderer,
			  grid: {
				drawBorder: false,
				drawGridlines: false,
				background: '#ffffff',
				shadow:false
			  },
			  seriesDefaults: {
				shadow: false,
				renderer: jQuery.jqplot.PieRenderer,
				rendererOptions: { padding: 2, sliceMargin: 2, startAngle: -90, showDataLabels: true},
			  },
			  legend: { show:true, location: 'w', rowSpacing:2, placement:"outsideGrid", border:"0px",fontSize:'1.0em'}
		  }
		);
	});
});

function popupCenter(url, title, w, h) {
    var left = (screen.width/2)-(w/2);
    var top = (screen.height/2)-(h/2);
    return window.open(url, title, 'toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=no, resizable=no, copyhistory=no, width='+w+', height='+h+', top='+top+', left='+left);
}
