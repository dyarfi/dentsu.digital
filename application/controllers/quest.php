<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Quest extends Public_Controller {
	
	public function __construct() {
		parent::__construct();
		
		// Load User related model in admin module
		$this->load->model('page/Pagemenus');
		$this->load->model('page/Pages');	

		// Load Participant related model 
		$this->load->model('participant/Participants');
        $this->load->model('questionnaire/Questionnaires');
        $this->load->model('questionnaire/QuestionnaireCompleted');
		$this->load->model('questionnaire/QuestionnaireUserAnswers');
        $this->load->model('questionnaire/QuestionRules');

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
		
	}

	public function index() {
			// DATA MAIN SETUP
			$questionnaire_done 	= $this->QuestionnaireCompleted->getUserCompletedQuestionnaire($this->participant->id);
		    
		    // Load session id
		    $data['participant'] 	= base64_encode($this->session->userdata('session_id'));

		    // Load Questionaires data
		    $data['questions'] 		= $this->Questionnaires->get_all_questions(1000,0);

		    // Load Questionaires data
		    $data['questionnaires']	= $this->Questionnaires->get_all_questionnaires_checked('1000',0,'','',$questionnaire_done);

		    // Load Questionnaire count
		    $questionnaire_count = $this->Questionnaires->get_count_questionnaires();
		    $data['questionnaire_count'] = $questionnaire_count;

		    $progress_only_one  = !$questionnaire_done ? '0' : count($questionnaire_done['questionnaire_id']);
		    
		    // Set main template
		    $data['main'] 			= 'quest';

		    // Set site title page with module menu
		    $data['page_title'] 	= 'Questionnaiers';

			// Default data setup
		    $fields	= array();
		    $valids	= array();
		    
		    $i = 0;
		    foreach ($data['questionnaires'] as $val) {
				$fields['qrid_'.$val->id] = '';
				$valids[$i]['field'] = 'qrid_'.$val->id;
				$valids[$i]['label'] = 'Pertanyaan No. '.$val->id;
				$valids[$i]['rules'] = 'required';
				$i++;
		    }
		    
		    // Set default error value
		    $errors = $fields;
		    
		    // Set form validation
		    $this->form_validation->set_rules($valids);
		
		    // Set default progress
		    $progress = 0;
			
			// Check if post is requested
		    if ($_SERVER['REQUEST_METHOD'] == 'POST') {
		    	

			    // Validation form checks
			    if ($this->form_validation->run() == FALSE)
			    {

					// Set error fields
					$error = array();

					$int = 0;
					foreach(array_keys($fields) as $error) {
					    $errors[$error] = form_error($error);
					    if (form_error($error) != '') { 
						$int += count(form_error($error));
					    }
					}

					// Show progress
					$progress = count($fields) - $int;

					// Set previous post merge to default
					$fields = array_merge($fields, $this->input->post());

			    }
			    else
			    {

		    		$result = array();
			    	foreach ($this->input->post() as $post => $value) {		

		    		   
			    		if($post != 'submit') {	
			    			$post 	= str_replace('qrid_', '', $post);
			    			$value 	= str_replace('qsid_', '', $value);
			    			$result['participant_id']   		= $this->participant->id;
					    	$result['questionnaire_id'][$post]	= $value;
				    	}
			    	}


			    	// Set data to return
			    	$insert_ids['questionnaire_id'] = $this->QuestionnaireUserAnswers->setUserAnswer($result);
			    	$insert_ids['participant_id'] 	= $this->participant->id;
			    	$completed  = $this->QuestionnaireCompleted->setUserCompletedQuestionnaire($insert_ids);
			    	
			    	// exit;
					// Set data to add to database
					//$this->Users->setUser($this->input->post());

					// Set message
					//$this->session->set_flashdata('message','User created!');

					// Redirect after add
					//redirect('admin/user');				

					redirect('quest','refresh');

		   		}

			}
			
			// Load Questionaires post errors
			$data['errors'] 		= $errors;
			
			// Load progress number
			$progress = $progress ? $progress : $progress_only_one;
			$data['progress']		= $progress;
		
			// Load Questionaires data
			$data['fields'] 		= $fields;	    

			// Load css jquery plot for graph
			$data['css_files'] = ['quest'=>
									[ 
								      "public/js/jquery.jqplot.1.0.8/jquery.jqplot.min.css"
									]
								];

			// Load js jquery plot for graph
			$data['js_files'] = ['quest'=>
									[ 
								      "public/js/jquery.jqplot.1.0.8/jquery.jqplot.min.js",
								      "public/js/jquery.jqplot.1.0.8/plugins/jqplot.pieRenderer.min.js",
								      "public/js/jquery.jqplot.1.0.8/plugins/jqplot.json2.min.js",
								      "public/js/circle-progress.js"
									]
								];
		
			// Load js execution
			$data['js_inline'] = "/*
								   * Example 2:
								   *   - default gradient
								   *   - listening to `circle-animation-progress` event and display the animation progress: from 0 to 100%
							   	   */			
								    $('.second.circle').circleProgress({
								      value: '".($progress == $questionnaire_count ? '1' : '0.'.round($progress * 100 / $questionnaire_count) )."'
								    }).on('circle-animation-progress', function(event, progress) {
								      $(this).find('strong').html(parseInt(".($progress ? $progress : 0)." * 100 / ". ($questionnaire_count ? $questionnaire_count : 0) .") + '<i>%</i>');
								    });

								    jQuery.jqplot.config.enablePlugins = true;
								    
								    $('#index_quest').change(function() {      

								          var inti = new Array();
								          inti.push([0, 0, 0]);
								          var plot2 = $.jqplot('chart2', inti, null);
								          plot2.destroy();

								          var quest_id   = $(this).val();
								          var quest_text = $('option:selected').attr('data-rel');
								          
								          if (quest_id) {
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
								              dataType:'json',
								              sortData:true,
								              success: function(data) {
								                ret = data;
								              }
								            });
								            return ret;
								          };

								          // The url for our json data
								          var jsonurl = '".base_url('quest')."/gallery/' + quest_id;

								          // passing in the url string as the jqPlot data argument is a handy
								          // shortcut for our renderer.  You could also have used the
								          // 'dataRendererOptions' option to pass in the url.
								          /*
								          var plot2 = $.jqplot('chart2', jsonurl,{
								            title: 'AJAX JSON Data Renderer',
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
								            // seriesColors: [ '#4bb2c5', '#c5b47f', '#EAA228', '#579575', '#839557', '#958c12',
								            // '#953579', '#4b5de4', '#d8b83f', '#ff5800', '#0085cc'],  // colors that will
								            // be assigned to the series.  If there are more series than colors, colors
								            // will wrap around and start at the beginning again.								            
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
								                legend: { show:true, location: 'w', rowSpacing:2, placement:'outsideGrid', border:'0px',fontSize:'1.0em'}
								            }
								          );
								        }
								      });";
			
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