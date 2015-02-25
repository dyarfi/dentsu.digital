<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Applicant extends Admin_Controller {

    /**
     * Index Page for this controller.
     *
     * Maps to the following URL
     * 		http://example.com/index.php/welcome
     *	- or -  
     * 		http://example.com/index.php/welcome/index
     *	- or -
     * Since this controller is set as the default controller in 
     * config/routes.php, it's displayed at http://example.com/
     *
     * So any other public methods not prefixed with an underscore will
     * map to /index.php/welcome/<method_name>
     * @see http://codeigniter.com/user_guide/general/urls.html
     */

    public function __construct() {
	    parent::__construct();

	    // Load Careers model
	    $this->load->model('Careers');

	    // Load Division model
	    $this->load->model('Divisions');

	    // Load Applicant model
	    $this->load->model('Applicants');

             // Load Grocery CRUD
            $this->load->library('grocery_CRUD');

    }
	
    public function index() {
        try {
	    // Set our Grocery CRUD
            $crud = new grocery_CRUD();
            // Set tables
            $crud->set_table('tbl_applicants');
            // Set CRUD subject
            $crud->set_subject('Applicant');                            
            // Set table relation
            $crud->set_relation('career_id', 'tbl_careers', 'subject');
	    // Set new action
	    $crud->add_action('Set To Employee', '', '','fa fa-arrow-circle-left',array($this,'_callback_set_applicant_to_employee'));
            // Set column
            $crud->columns('name','email','gender','photo','cv_file','career_id','status');			
            // Set column display 
            $crud->display_as('career_id','Career Applied');
            // Set custom field display for gender
            $crud->field_type('gender','dropdown',array('1' => 'Male', '0' => 'Female'));  
            // Set upload field
	    $crud->set_field_upload('cv_file','uploads/applicants');
	    $crud->set_field_upload('photo','uploads/applicants');
            $this->load($crud, 'applicants');
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    
    public function _callback_set_applicant_to_employee($primary_key , $row) {
	return base_url(ADMIN).'/employee/set/'.$row->id;
    }
    
    public function _callback_total_image($value, $row) {
        $total = $this->user_model->total_image_submitted($row->participant_id);
        return $total;
    }
    
    private function load($crud, $nav) {
        $output = $crud->render();
        $output->nav = $nav;
        if ($crud->getState() == 'list') {
            // Set Page Title 
            $output->page_title = 'Applicant Listings';
            // Set Main Template
            $output->main       = 'template/admin/metronix';
            // Set Primary Template
            $this->load->view('template/admin/admin_template.php', $output);
        } else {
            $this->load->view('template/admin/popup.php', $output);
        }    
    }
}

/* End of file applicant.php */
/* Location: ./application/module/career/controllers/applicant.php */