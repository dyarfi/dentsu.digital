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
		
		//print_r($this->participant);

	}

	public function index() {

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
		$data['js_inline'] = "	if (document.getElementById('fileupload') != null) {
							        document.getElementById('fileupload').onchange = function handleImage(e) {
							          var reader = new FileReader();

							          reader.onload = function (event) { 

						               	  var elemts = document.querySelectorAll('.demo-container .rect');
						               	  
							              var dataURL = reader.result;
							              var img = document.getElementById('img_tracking');
							              img.src = dataURL;

							              $('.button-submit').show({duration:'260',easing:'easeInOutBack'});

							        	  var tracker = new tracking.ObjectTracker(['face']);

							        	  	tracker.setStepSize(1.7);
								        	tracking.track('#img_tracking', tracker);

									        tracker.on('track', function(event) {
							        		  
							        		  // Destroy all rectangle 
								              if (elemts != null) {
									          	var i;
												for (i = 0; i <	elemts.length; i++) {
												   	elemts[i].parentElement.removeChild(elemts[i]);
												}
								    			// console.log(elemts);
								    		  }	  

									          event.data.forEach(function(rect) {
									            window.plot(rect.x, rect.y, rect.width, rect.height);
									          });

									            if (event.data.length === 0) {

									              // No targets were detected in this frame.            
									              // Text information that displayed the information of the image tracking
									              // $('.handler-text h3').html();


									            } if (event.data.length === 3) {             

									              // Text information that displayed the information of the image tracking            
									              $('.handler-text h3').html('Thanks, you\'re good to go!').fancybox({'hideOnOverlayClick':true,'hideOnContentClick':true}).click();
									              //bootbox.alert('Thanks, you\'re good to go!');

									            } else {

									              // Text information that displayed the information of the image tracking
									              $('.handler-text h3').html('You no good to go, please upload other picture along with your friends..').fancybox({'hideOnOverlayClick':true,'hideOnContentClick':true}).click();
												  //bootbox.alert('You no good to go, please upload other picture along with your friends..');
									            	//$.fn.fancybox();
									            	//$(this).fancybox().html('Inline - modal window');

									              // console.log(event.data.length);
									              event.data.forEach(function(data) {
									                // Plots the detected targets here.
									              });

									            }
									          
								        	});

											window.plot = function(x, y, w, h) {
									          var rect = document.createElement('div');									          
									          document.querySelector('.demo-container').appendChild(rect);
									          rect.classList.add('rect');
									          rect.style.width = w + 'px';
									          rect.style.height = h + 'px';
									          rect.style.left = (img.offsetLeft + x) + 'px';
									          rect.style.top = (img.offsetTop + y) + 'px';
									        };

							              //init();
							              
							          }

							          reader.onloadend = function() {
							            // console.log(reader.error.message);

							          };
							          
							          reader.readAsDataURL(e.target.files[0]);
							        }
						      	}";

		// Load site template
		$this->load->view('template/public/template', $this->load->vars($data));	
			
	}

	public function upload_result() {
		
		// Detect if data sent by POST
		if ($this->input->server('REQUEST_METHOD') === 'POST') {
			
			// Get the data sent and replace unwanted string
			$base64img = str_replace('data:image/png;base64,', '', $this->input->post("str"));

			// Decode base64 data sent
			$result = base64_decode($base64img);

			// Generate unique image name 
			$file = 'uploads/gallery/' . uniqid() . '.png';

			// Put file to upload directory
	    	file_put_contents($file, $result);	

		}	

	}
}