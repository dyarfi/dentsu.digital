<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Tracking extends Public_Controller {

	var $attachment = '';

	public function __construct() {
		parent::__construct();

		// Load User related model in admin module
		$this->load->model('page/Pagemenus');
		$this->load->model('page/Pages');

        // Check if session was made
		if ($this->participant) {

			// Set temporary data
			$this->_participant = $this->Participants->getParticipant($this->participant->id);

			// Unset data from session
			unset($this->participant);

			// Set new data and to session
			$this->participant = $this->_participant;
			$this->session->set_userdata('participant',$this->participant);

		}

		// Get participant attachment by type
		$this->attachment = $this->Attachments->getParticipantAttachmentByType($this->participant->id, 'tracking');

		//print_r($this->attachment);
		//exit;

		//print_r($this->participant);
		//exit;
	}

	public function index() {

		// Check if attachment is already existed
		if ($this->attachment) {

			// Redirect Participant already participated
			redirect('tracking/participated');

		}

		if ($this->input->is_ajax_request()) {

			// Define initialize result
			$result['result'] = '';

			// Default data setup
			$fields	= array(
				'email' => '',
				);

			// Fill error with default fields
			$errors	= $fields;

			// Set validation rules
			$this->form_validation->set_rules('email', 'Email','trim|valid_email|required|min_length[5]|max_length[36]|callback_match_email|xss_clean');

			// Check if post is requested
			if ($_SERVER['REQUEST_METHOD'] == 'POST') {

				// Validation form checks
				if ($this->form_validation->run() == FALSE)
				{
					 // Send errors to JSON text
					$result['result']['code'] = 0;
					$result['result']['text'] = validation_errors();
				}
				else
				{

					// Set default participant data
					$participant = $this->Participants->getByEmail($this->input->post('email'));

					// Set participant data to session
					$this->session->set_userdata('participant', $participant);

					// Send success update password result
					$result['result']['code'] = 1;
					$result['result']['text'] = 'Thank you, wait for a moment please...';

				}

			}

			// Return data esult
			$data['json'] = $result;

			// Load data into view
			$this->load->view('json', $this->load->vars($data));

		}

		// Set Gallery data to display
	    $data['gallery'] 		= $this->Attachments->getAllAttachment('tracking');

 		// Set main template
	    $data['main'] 			= 'tracking';

	    // Set site title page with module menu
	    $data['page_title'] 	= 'Tracking Face';

		// Load tracking js code
		$data['js_files'] = ['tracker'=>
								[
									'admin/plugins/tracking.js/tracking-min.js',
									'admin/plugins/tracking.js/data/face-min.js'
									// 'assets/admin/plugins/tracking.js/data/eye-min.js',
									// 'assets/admin/plugins/tracking.js/data/mouth-min.js',
								]
							];

		// Load js execution
		$data['js_inline'] = "// Variable to catch file upload id
							  var fileupload = document.getElementById('fileupload');

							  // Tracker new object on face detection
							  var tracker = new tracking.ObjectTracker(['face']);

							  // Variable to get id of filereader
							  var reader = new FileReader();

							  // Variable to get img tracking id
							  var img = document.getElementById('img_tracking');

							  // Add event listener
							  if (fileupload != null) {
							  	fileupload.addEventListener('change', handleFiles, false);
						  	  }

							  // Function for handling files
							  function handleFiles() {

							      var fileList = this.files; /* now you can work with the file list */

							      // Elements rectangle
							      var elemts = document.querySelectorAll('.demo-container .rect');

							      // Destroy all rectangle
							      if (elemts != null && elemts.length !== 0) {
							        var i;
							        for (i = 0; i < elemts.length; i++) {
							            elemts[i].parentElement.removeChild(elemts[i]);
							        }
							        console.log(elemts.length);
							      }

							      reader.addEventListener('loadend',function loadEndImage(event) {

							          reader.removeEventListener('loadend',loadEndImage,false);

							      });

							      reader.addEventListener('load',function loadImage(event) {

							          var dataURL = reader.result;
							          img.src = dataURL;

							          if(navigator.userAgent.toLowerCase().indexOf('firefox') > -1) {
							            // There is a tweak on firefox and i don't know why
							            setTimeout(function(){
							                readerFileReturn();
							            },500);

							          } else {
							            readerFileReturn();
							          }

							          reader.removeEventListener('load',loadImage,false);
							      });

							      reader.readAsDataURL(fileList[0]);

							}

							function readerFileReturn() {

							      tracker.setStepSize(1.7);
							      var trackerTask = tracking.track('#img_tracking', tracker);

							      tracker.on('track', function trackFace(event) {

							            if (event.data.length === 0) {

							              // No targets were detected in this frame.
							              // Text information that displayed the information of the image tracking
							              // $('.handler-text h3').html();
							              // setRectangle(img);

							            }
										console.log(event.data.length);
							            if (event.data.length > 1) {

							              setRectangle(event, img);

							              // Text information that displayed the information of the image tracking
							              $('.handler-text h3').html('Thanks, you\'re good to go!').fancybox({'hideOnOverlayClick':true,'hideOnContentClick':true}).click();

							              document.getElementById('submit-button').style.display=\"block\";

							            } else {

							              // Text information that displayed the information of the image tracking
							              $('.handler-text h3').html('<div class=\"text-center\">You no good to go, <br/> please upload other picture <br/>along with your friends..</div>').fancybox({'hideOnOverlayClick':true,'hideOnContentClick':true}).click();

							              //event.data.forEach(function(data) {
							                // Plots the detected targets here.
							              //});

							            }

							      });

							      trackerTask.stop();
							}

							function setRectangle(event, img) {

							  //img.addEventListener('track', function(event) {
							      event.data.forEach(function(rect) {
							        plotRectangle(rect.x, rect.y, rect.width, rect.height, img);
							      });
							  //});
							}

							function plotRectangle(x, y, w, h, img) {
							    var rect = document.createElement('div');
							    document.querySelector('.demo-container').appendChild(rect);
							    rect.classList.add('rect');
							    rect.style.width = w + 'px';
							    rect.style.height = h + 'px';
							    rect.style.left = (img.offsetLeft + x) + 'px';
							    rect.style.top = (img.offsetTop + y) + 'px';
							}

							$('#send_image').click(function(e) {
							    // Prevent own default clicking
							    e.preventDefault();

							    // default form var
							    var userform = $(this).next('.msg');

							    // canvas.discardActiveGroup();
							    // canvas.discardActiveObject();
							    // canvas.renderAll();

							      $.ajax({
							         url: 'upload/upload_result?type=tracking',
							         type: 'POST',
							         dataType : 'json', // what type of data do we expect back from the server
							         data: {
							            data: document.getElementById(\"img_tracking\").src,
							            csrf_token: $.cookie('csrf_cookie')
							         },
							         complete: function(data, status) {
							          var msg = data.responseJSON;

							            console.log(msg);

							            //userform.find('.msg').empty();
							            //userform.find('.msg')

							            userform.empty();
							            userform
							            .html('<div class=\"alert alert-danger msg\">'
							            +'<button class=\"close\" data-close=\"alert\"></button>'
							            +msg.result.text+'</div>');

							            if (msg.result.code === 1) {
							              setTimeout(function() {
							                // Do something after 5 seconds
							                window.location.href = base_URL + 'tracking';
							              }, 2000);
							            }

							            if(status=='success') {
							                alert('saved!');
							            }
							            // alert('Error has been occurred');
							         }
							      });
							   });
							   $('#submit_email').submit(function(e) {
								   	e.preventDefault();
								   	// default form var
								   	var userform = $(this);
								   	// process the form
								   	$.ajax({
									   type        : 'POST', // define the type of HTTP verb we want to use (POST for our form)
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
										   .html('<div class=\"alert alert-danger msg\">'
											   +'<button class=\"close\" data-close=\"alert\"></button>'
											   +msg.result.text+'</div>');

										   if (msg.result.code === 1) {
											   userform.find('input').prop(\"disabled\", true);
											   setTimeout(function() {
																		   // Do something after 5 seconds
												   window.location.href = base_URL + 'tracking';
												   }, 2000);
											   } else {
												   userform.find('input').prop(\"disabled\", false);
											   }

											   // userform.find('input').prop(\"disabled\", false);

											   // $('.reload_captcha').click();
											   // alert(msg.result);
											   // console.log(msg.result);
									   	},
									   	error: function(x,message,t) {
										   if(message===\"timeout\") {
											   alert('got timeout');
										   } else {
																   //alert(message);
										   }
									   	}
									   	}).always(function() {
										   userform.find('input').prop(\"disabled\", true);
									   	});

								   	return false;
							   });

							// https://davidwalsh.name/demo/convert-canvas-image.php

							/* add this to your html
				            <div id=\"canvasHolder\" style=\"display:none\"></div>
				            <div id=\"pngHolder\"></div>
				            */

							/* add this to your html
								wo = window.onload;
								window.onload = function() {
									wo && wo.call(null);

									// Get the image
									var sampleImage = document.getElementById(\"img_tracking\"),
										canvas = convertImageToCanvas(sampleImage);

									// Actions
									document.getElementById(\"canvasHolder\").appendChild(canvas);
									document.getElementById(\"pngHolder\").appendChild(convertCanvasToImage(canvas));

									// Converts image to canvas; returns new canvas element
									function convertImageToCanvas(image) {
										var canvas = document.createElement(\"canvas\");
										canvas.width = image.width;
										canvas.height = image.height;
										canvas.getContext(\"2d\").drawImage(image, 0, 0);

										return canvas;
									}

									// Converts canvas to an image
									function convertCanvasToImage(canvas) {
										var image = new Image();
										image.src = canvas.toDataURL(\"image/png\");
										return image;
									}
								};
							*/
							";

		// Load site template
		$this->load->view('template/public/template', $this->load->vars($data));

	}

	// Redirect if particpant already participated
	public function participated () {

		// Check if attachment is already existed
		if (!$this->attachment) {

			// Redirect Participant already participated
			redirect('tracking');

		}

		// Set Gallery Data
	    $data['gallery'] 		= $this->Attachments->getAllAttachment('tracking');

		// Set Participated Data
	    $data['attachment'] 	= $this->attachment;

		// Set main template
	    $data['main'] 			= 'tracking';

	    // Set site title page with module menu
	    $data['page_title'] 	= 'Tracking Gallery';

	    // Load qr code js execution
		$data['js_inline'] 		= "$('#fancybox').fancybox();
								 $('.li-participated').hover(function(e){
								 	e.preventDefault();
								    $(this).find('.participated').show();
								 },function(e){
								 	e.preventDefault();
								    $(this).find('.participated').hide();
								 })";

		// Load site template
		$this->load->view('template/public/template', $this->load->vars($data));

	}


	// -------------- CALLBACK METHODS -------------- //

    // Match Email post to Database // Reverse Mode
    public function match_email($email) {

		// Check email if empty
		if ($email == '') {
			$this->form_validation->set_message('match_email', 'The %s can not be empty.');
			return false;
		}
		// Check email if match
		else if ($this->Participants->getByEmail($email) == 1) {

			$this->form_validation->set_message('match_email', 'The %s is already taken.');

			return true;

		} else {
			$this->form_validation->set_message('match_email', 'Use valid email please.');
			return false;
		}

    }
}
