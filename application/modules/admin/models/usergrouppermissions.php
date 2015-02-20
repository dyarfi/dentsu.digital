<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// Class for User Permission
class UserGroupPermissions Extends CI_Model {
	
	public $table = 'tbl_group_permissions';
	public $permission;
	
	public function __construct(){
		// Call the Model constructor
		parent::__construct();
		
		$this->load->model('Users');
		$this->load->model('UserGroups');
		
		$this->db = $this->load->database('default', true);		

	}
	public function install () {
		$insert_data	= FALSE;

		if (!$this->db->table_exists($this->table)) {
			$insert_data	= TRUE;

			$sql	= 'CREATE TABLE IF NOT EXISTS `'. $this->table .'` ('
					. '`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,'
					. '`permission_id` INT(11) NOT NULL,'
					. '`level_id` INT(11) NOT NULL,'
					. '`value` SMALLINT(1) NOT NULL,'
					. '`added` INT(11) NOT NULL,'	
					. '`modified` INT(11) NOT NULL,'	
					. 'INDEX (`id`) '
					. ') ENGINE=MYISAM';
	
			$this->db->query($sql);
			
		}
		
		// Check if table exists
		if(!$this->db->query('SELECT * FROM `'.$this->table.'` LIMIT 0 , 1;')) {
			// Set insert data to TRUE
			$insert_data	= TRUE;
		}	
		/*
		// Set insert data if TRUE
		if ($insert_data) {
			$sql	= 'INSERT INTO `'.$this->table.'` '
					. '(`id`, `permission_id`, `level_id`, `value`, `added`, `modified`) '
					. 'VALUES '
					. '(NULL, \'superadmin\', \'356a192b7913b04c54574d18c28d46e6395428ab\', \'Super Administrator\', 1, 1, '.time().', \'active\', '.time().', 0), '
					. '(NULL, \'administrator\', \'12506e739378348ec662bb015bfd2288362dcc1c\', \'Administrator\', 2, 1, '.time().', \'active\', '.time().', 0), '
					. '(NULL, \'user@testing.com\', \'12506e739378348ec662bb015bfd2288362dcc1c\', \'User\', 99, 0, '.time().', \'active\', '.time().', 0)';

			$this->db->query('INSERT',$sql);
		}
		*/
        return $this->db->table_exists($this->table);
	}
	public function find ($where_cond = '', $order_by = '', $limit = '', $offset = '') {
		/** Build where query **/

		if ($where_cond != '') {
			if (is_array($where_cond) && count($where_cond) != 0) {
				$buffers	= array();

				$operators	= array('LIKE',
									'IN',
									'!=',
									'>=',
									'<=',
									'>',
									'<',
									'=');
                                
				foreach ($where_cond as $field => $value) {
					$operator	= '=';

					if (strpos($field, ' ') != 0)
						list($field, $operator)	= explode(' ', $field);

					if (in_array($operator, $operators)) {
						$field		= '`'.$field.'`';

						if ($operator == 'IN' && is_array($value))
							$buffers[]	= $field.' '.$operator.' (\''.implode('\', \'', $value).'\')';
						else
							$buffers[]	= $field.' '.$operator.' \''.$value.'\'';
					} else if (is_numeric($field)) {
						$buffers[]	= $value;
					} else {
						$buffers[]	= $field.' '.$operator.' \''.$value.'\'';
					}
				}                
				$where_cond	= implode(' AND ', $buffers);                   
			}
		}

		$sql_order = ''; 
		if ($order_by != '') {
			$sql_order = ' ORDER BY '; 
			$i 	   = 1;
			foreach ($order_by as $order => $val) {
				$split = ($i > 1) ? ', ' : ''; 
				$sql_order .= ' '. $split .' `'. $order.'` '.$val.' ';
				$i++;
			}
			$order_by  = $sql_order;
		}
		
		$sql_limit = ''; 
		if ($limit != '' && $offset != '') {
			$offset    = $offset . ','; 
			$sql_limit = 'LIMIT '. $offset . $limit; 
		}
		else if ($limit != '') {
			$sql_limit = 'LIMIT '. $limit; 
		}
		$limit = $sql_limit;
		
		if ($where_cond != '') {
			$rows = $this->db->query('SELECT * FROM `'.$this->table.'` WHERE '. $where_cond . $order_by . $limit, TRUE)->result();
		}
		else {
			$rows = $this->db->query('SELECT * FROM `'.$this->table.'`' . $order_by . $limit, TRUE)->result();
		}

		$returns	= array();
                
		foreach ($rows as $row) {
			$object			= new UserGroupPermissions;

			$object_vars	= get_object_vars($row);
			
			foreach ($object_vars as $var => $val) {
				$object->$var	= $val;
			}

			unset($object->table,$object->_model_vars,$object->db);

			$returns[]		= $object;

			unset($object, $vars);
		}
				
		return $returns;
	}
	
	public function getModuleList($id=null){
		$data = array('id'=>$id);
		$result = '';
		$Q = $this->db->get_where('module_lists',$data);
			if ($Q->num_rows() > 0){
				//print_r($Q->result_object());
				//exit;
				foreach ($Q->result_object() as $row){
					$result[] = $row;
				}
			}
		$Q->free_result();
		return $result;
	}
	
	public function getModulePermissions($id=null){
		$data = array('id'=>$id);
		$result = '';
		$Q = $this->db->get_where('module_permissions',$data);
			if ($Q->num_rows() > 0){
				//print_r($Q->result_object());
				//exit;
				foreach ($Q->result_object() as $row){
					$result[] = $row;
				}
			}
		$Q->free_result();
		return $result;
	}
	
	public function getUserGroupPermissions($user_group=null){
		$data = array('group_id'=>$user_group,'value'=>1);
		$result = '';		
		$Q = $this->db->get_where('group_permissions',$data);
			if ($Q->num_rows() > 0){				
				foreach ($Q->result_object() as $row){
					$result[] = $row;
				}
			}
		$Q->free_result();
		return $result;
	}
	
	public function getAllUserGroupPermissions($user_group=null){
		$data = array('group_id'=>$user_group);
		$result = '';
		$Q = $this->db->get_where('group_permissions',$data);
			if ($Q->num_rows() > 0){
				foreach ($Q->result_object() as $row){
					$data[] = $row;
				}
			}
		$Q->free_result();
		return $result;
	}
	
	public function setUserGroupPermissions($object=null) {
	
		
	}
	
	public function updateUserGroupPermission($array=null) {	
	    if (!empty($array) && !empty($array['value'])) {
		// Update Setting data             
		$this->db->where('id', $array['id']);      
		// Return last insert id primary
		$update = $this->db->update($this->table, $array);					
		// Return last insert id primary
		return $update;
	    } else {
		// Return nothing
		return false;
	    }
	    
	}
	
	public function setUserGroupPages($pages=null,$allowed_groups=null) {
		if (is_array($allowed_groups) && is_array($pages)) {
			$user_group = $allowed_groups;
			$uri = array();
			for($i=0;$i<$this->uri->total_segments();$i++) {
				//print_r($this->uri->segment($i + 1)); //exit();
				if(empty($uri[0])) $uri[0] = 'index';
				$uri[$i] = $this->uri->segment($i + 1);
				
				//print_r($this->uri->segment($i + 1));
				//print_r($uri[$i]);

				if(in_array($uri[$i],$pages)){
					//Checking user auth
					$this->isAuthorized($user_group);
				} else {
					//Go to home if false
					//$this->session->set_flashdata('auth_message', 'You do not have that authorization.');
					//redirect($uri[0]);
					//return false;
				}
			}
		}
		return true;
	}
	
	public function isAuthorized($user_group=null) {
		if ($this->permission && in_array($this->permission, $user_group)) {
			//Set true if exists
			return true;
		} 
	}
	
	public function getModuleFunction($group_id = '') {
		
		// Check initialize level id
		if($group_id == '') {
			// Return blank array
			return array();
		}	
		
		// Set default loaded modules
		$modules			= array();
		
		// Check admin url
		$where_cond			= array('id'	=> $group_id);
		
		// Set user permissions
		$user_permission	= $this->db->get_where('user_groups', $where_cond, 1)->result();

		// Check backend permission
		if(!$user_permission[0]->backend_access) {
			// Set flash alert to session
			$this->session->set_flashdata('flashdata', 'You have no access');
			// Redirect if have no access to backend / admin-panel
			redirect(ADMIN . 'authenticate/noaccess');
		}
		
		// Load user admin menu modules
		$item = $this->load->config('modules', TRUE);		
		$modules['Admin']		= $item['admin_list.module_function'];
		
		// Check full backend permission
		if ($user_permission[0]->full_backend_access) {
			// Set admin neccesary module functions
			$modules['Module']	= $item['module_list.module_function'];
		}
		
		// Set default return
		$return_object	= TRUE;

		// Check for level id
		if ($group_id == '') {
			// Set FALSE if level id not found
			$return_object	= FALSE;
		}
		
		// List all user level permissions
		$user_permissions = $this->db->get_where($this->table, array('group_id'=>$group_id,'value'=>1))->result();
		// Temp of array
		$buffers = array();
		
		// Loops for user_permission data 
		foreach ($user_permissions as $key) {
			
			// List all module_permissions based on permission id at user_level_permission
			//$module_functions = Model_ModulePermission::instance()->find(array('id'=>$key->permission_id));
			$module_functions = $this->db->get_where('module_permissions', array('id'=>$key->permission_id))->result();
			
			// Loops for module_functions data 
			foreach ($module_functions as $val) {
				// List all module_list based on module id at module_permission
				//$class_names		= Model_ModuleList::instance()->find(array('id'=>$val->module_id));
				$class_names		= $this->db->get_where('module_lists', array('id'=>$val->module_id))->result();
	
				// Loops for module_names data 
				foreach($class_names as $module) {
					// Set temporary data in place
					$buffers[ucfirst($module->module_name)][$val->module_link] = $val->module_name;
				}
								
				// Return all computed data of array permissions and module lists available 
				$modules	= array_merge($modules,$buffers);
								
			}
			
		}	
				
		unset($buffers);
		
		return $modules;
	}
}