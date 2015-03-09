<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// Model Class Object for ServerLogs
class ServerLogs Extends CI_Model {
	// Table name for this model
	public $table = 'server_logs';
	
	public function __construct(){
	    // Call the Model constructor
	    parent::__construct();
			
	    // Set default db
	    $this->db = $this->load->database('default', true);		
	    // Set default table
	    $this->table = $this->db->dbprefix($this->table);			
				
	}
	public function install() {
		
		$insert_data	= FALSE;

		if (!$this->db->table_exists($this->table)) {
		    $insert_data	= TRUE;

		    $sql            = 'CREATE TABLE IF NOT EXISTS `'.$this->table.'` ('
				    . '`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,'
			   	    . '`session_id` VARCHAR(42) NULL, '
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
                    if ($sql) $this->db->query($sql);
		}

		return $this->db->table_exists($this->table);
		
	}
	
	public function getCount($status = null){
		$data = array();
		$options = array('status' => $status);
		$this->db->where($options,1);
		$this->db->from('users');
		$data = $this->db->count_all_results();
		return $data;
	}
	
	public function getServerLog($id = null){
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
	
	public function getAllServerLog($admin=null){
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
	
	public function setServerLog($object=null){
		
		// Set ServerLog data
		$data = array(
			'username'	=> $object['username'],
			'email'		=> $object['email'],			
			'password'	=> sha1($object['username'].$object['password']),	
			'group_id'	=> @$object['group_id'],			
			'added'		=> time(),	
			'status'	=> $object['status']
		);
		
		// Insert ServerLog data
		$this->db->insert('users', $data);
		
		// Return last insert id primary
		$insert_id = $this->db->insert_id();
			
		// Check if last is existed
		if ($insert_id) {
				
			// Unset previous data
			unset($data);
			
			// Set ServerLog Profile data
			$data = array(
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
					'status'	=> 1);
			
			// Insert ServerLog Profile 
			$this->db->insert('user_profiles', $data);
					
		}
			
		// Return last insert id primary
		return $insert_id;
		
	}	
	
	public function deleteServerLog($id) {
		
		// Check log id
		return $this->db->where('id', $id);
		
	}
	
	public function truncate(){
	    // Set data to be emptied
	    $result = $this->db->query("TRUNCATE TABLE `".$this->table."`");

	    // Data emptied return will be 0 zero
	    return !$result;
	}
}
