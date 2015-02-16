<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// Model Class Object for ServerLogs
class ServerLogs Extends CI_Model {
	
	public $table = 'tbl_server_logs';
	
	protected $_model_vars;
	
	public function __construct(){
		// Call the Model constructor
		parent::__construct();
		
		$this->_model_vars	= array('id'		  => 0,
						'url'		  => '',
						'user_id'	  => 0,
						'status_code' => 0,
						'bytes_served'  => 0,
						'ip_address'	=> '',
						'http_code'	  => '',
						'referrer'	  => '',									
						'user_agent'  => '',
						'status'	  => '',	
						'added'		  => 0,
						'modified'	  => 0);
				
		$this->db = $this->load->database('default', true);		
				
	}
	public function install() {
		
		$insert_data	= FALSE;

		if (!$this->db->table_exists($this->table)) {
		    $insert_data	= TRUE;

		    $sql            = 'CREATE TABLE IF NOT EXISTS `'.$this->table.'` ('
				    . '`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,'
				    . '`url` VARCHAR(255) NULL, '
				    . '`user_id` INT(11) UNSIGNED NULL, '
				    . '`status_code` VARCHAR(160) NULL, '
				    . '`bytes_served` INT(11) UNSIGNED NOT NULL, '
				    . '`ip_address` INT(11) NULL DEFAULT 0, '
				    . '`http_code` INT(11) UNSIGNED NOT NULL, '
				    . '`referrer` VARCHAR(255) NULL, '
				    . '`user_agent` VARCHAR(255) NULL, '
				    . '`status` INT(1) UNSIGNED NOT NULL,'
				    . '`added` INT(11) UNSIGNED NOT NULL, '
				    . '`modified` INT(11) UNSIGNED NOT NULL, '
				    . 'INDEX (`url`, `user_id`) '
				    . ') ENGINE=MYISAM';
		    
		    $this->db->query($sql);
		}
		
		
        if(!$this->db->query('SELECT * FROM `'.$this->table.'` LIMIT 0, 1;'))
			$insert_data	= TRUE;
		
		if ($insert_data) {
			$sql	= '';

			$this->db->query($sql);
		}

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
			$object			= new Logs;

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
	
	public function getCount($status = null){
		$data = array();
		$options = array('status' => $status);
		$this->db->where($options,1);
		$this->db->from('users');
		$data = $this->db->count_all_results();
		return $data;
	}
	
	public function getLog($id = null){
		if(!empty($id)){
			$data = array();
			$options = array('id' => $id);
			$Q = $this->db->get_where('users',$options,1);
			if ($Q->num_rows() > 0){
				foreach ($Q->result_object() as $row)
				$data = $row;
			}
			$Q->free_result();
			return $data;
		}
	}
	
	public function getAllLog($admin=null){
		$data = array();
		$this->db->order_by('added');
		$Q = $this->db->get($this->table);
			if ($Q->num_rows() > 0){
				//foreach ($Q->result_object() as $row){
					//$data[] = $row;
				//}
				$data = $Q->result_object();
			}
		$Q->free_result();
		return $data;
	}
	
	public function setLog($object=null){
		
		// Set Log data
		$data = array(
			'username'	=> $object['username'],
			'email'		=> $object['email'],			
			'password'	=> sha1($object['username'].$object['password']),	
			'group_id'	=> @$object['group_id'],			
			'added'		=> time(),	
			'status'	=> $object['status']
		);
		
		// Insert Log data
		$this->db->insert('users', $data);
		
		// Return last insert id primary
		$insert_id = $this->db->insert_id();
			
		// Check if last is existed
		if ($insert_id) {
				
			// Unset previous data
			unset($data);
			
			// Set Log Profile data
			$data = array(
					'user_id'		=> $insert_id,
					'gender'		=> !empty($object['gender']) ? $object['gender'] : NULL,
					'first_name'	=> !empty($object['first_name']) ? $object['first_name'] : NULL,
					'last_name'		=> !empty($object['last_name']) ? $object['last_name'] : NULL,
					'birthday'		=> !empty($object['birthday']) ? $object['birthday'] : NULL,
					'phone'			=> !empty($object['phone']) ? $object['phone'] : NULL,	
					'mobile_phone'	=> !empty($object['mobile_phone']) ? $object['mobile_phone'] : NULL,
					'fax'			=> !empty($object['fax']) ? $object['fax'] : NULL,
					'website'		=> !empty($object['website']) ? $object['website'] : NULL,
					'about'			=> !empty($object['about']) ? $object['about'] : NULL,
					'division'		=> !empty($object['division']) ? $object['division'] : NULL,
					'added'		=> time(),	
					'status'	=> 1);
			
			// Insert Log Profile 
			$this->db->insert('user_profiles', $data);
					
		}
			
		// Return last insert id primary
		return $insert_id;
		
	}	
	
	public function deleteLog($id) {
		
		// Check user id
		$this->db->where('id', $id);
		
		// Delete user form database
		if ($this->db->delete('users')) {
			
			// Check user profile id
			$this->db->where('user_id', $id);
			
			// Delete user profile form database		
			return $this->db->delete('user_profiles');
			
		}		
	}	
}
