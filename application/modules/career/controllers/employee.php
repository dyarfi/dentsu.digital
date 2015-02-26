<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class Employee extends Admin_Controller {

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

	    // Load User model
	    $this->load->model('admin/Users');
	    
	    // Load User Profiles model
	    $this->load->model('admin/UserProfiles');
	    
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
	    //$crud->set_theme('flexigrid');
	    //$crud->unset_jquery();
	    // Set query for employee
	    $crud->where('group_id','100');
	    $crud->where('tbl_users.status','1');
            // Set tables
            $crud->set_table('tbl_users');
            // Set CRUD subject
            $crud->set_subject('Employee'); 
	    // Set table relation	    
	    $crud->set_relation('group_id', 'tbl_user_groups', 'name');
            // Set column
            $crud->columns('username','group_id','email','profile_id','gender');			
            // Set column display 
            $crud->display_as('group_id','Group');
	    // Set column display 
            $crud->display_as('profile_id','Full Name');
	    
	    // Set custom field display for gender
            $crud->field_type('gender','dropdown',array('1' => 'Male', '0' => 'Female'));  
            // Set upload field
	    $crud->set_field_upload('cv_file','uploads/applicants');
	    $crud->set_field_upload('photo','uploads/applicants');
            $this->load($crud, 'employees');
        } catch (Exception $e) {
            show_error($e->getMessage() . ' --- ' . $e->getTraceAsString());
        }
    }
    
    public function set($id=null) {
	if (!empty($id)) {
	    $objects = $this->Applicants->getApplicant($id);
	    if($objects) {
		
		$objects->password = '';
		$objects->password = 'Password1';
		
		/*
		 * 'username'	=> $object['username'],
		    'email'	=> $object['email'],			
		    'password'	=> sha1($object['username'].$object['password']),	
		    'group_id'	=> @$object['group_id'],			
		    'added'	=> time(),	
		    'status'	=> $object['status']
		  
		 * 
		    'user_id'	=> $insert_id,
		    'gender'	=> !empty($object['gender']) ? $object['gender'] : NULL,
		    'first_name'	=> !empty($object['first_name']) ? $object['first_name'] : NULL,
		    'last_name'	=> !empty($object['last_name']) ? $object['last_name'] : NULL,
		    'birthday'	=> !empty($object['birthday']) ? $object['birthday'] : NULL,
		    'phone'		=> !empty($object['phone']) ? $object['phone'] : NULL,	
		    'mobile_phone'	=> !empty($object['mobile_phone']) ? $object['mobile_phone'] : NULL,
		    'fax'		=> !empty($object['fax']) ? $object['fax'] : NULL,
		    'website'	=> !empty($object['website']) ? $object['website'] : NULL,
		    'about'		=> !empty($object['about']) ? $object['about'] : NULL,
		    'division'	=> !empty($object['division']) ? $object['division'] : NULL,
		    'added'		=> time(),	
		    'status'	=> 1)
		 */
		
		print_r($objects);
		
		//$this->Users->setUser($object);
	    }
	}
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
            $output->page_title = 'Employee Listings';
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