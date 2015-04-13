<?php if (!defined('BASEPATH')) exit('No direct script access allowed');

// Model Class Object for Participants
class Participants Extends CI_Model {
    
    // Table name for this model
    protected $table = 'participants';

    public function __construct(){
	// Call the Model constructor
	parent::__construct();

	$this->db = $this->load->database('default', true);

	// Set default table
	$this->table = $this->db->dbprefix($this->table);

    }

    public function install() {

		$insert_data	= FALSE;

		if (!$this->db->table_exists($this->table)) 
		$insert_data	= FALSE;

		$sql	= 'CREATE TABLE IF NOT EXISTS `'.$this->table.'` ('
				. '`id` INT(11) UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY, '
				. '`part_id` INT(11) UNSIGNED NULL, '
				. '`id_number` VARCHAR(32) NULL, '
				. '`name` VARCHAR(255) NULL, '
				. '`gender` VARCHAR(12) NULL, '
				. '`age` TINYINT(2) NULL, '
				. '`address` VARCHAR(512) NULL, '
				. '`email` VARCHAR(255) NULL, '
				. '`phone_number` VARCHAR(255) NULL, '
				. '`oshi_favorite` VARCHAR(32) NULL, '
				. '`twitter` VARCHAR(255) NULL, '
				. '`fb_id` VARCHAR(255) NULL, '
				. '`fb_pic_url` VARCHAR(512) NULL, '
				. '`file_name` VARCHAR(512) NULL, '
				. '`completed` TINYINT(1) NOT NULL, '
				. '`join_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, '
				. 'INDEX (`part_id`, `name`) '
				. ') ENGINE=MYISAM DEFAULT CHARSET=utf8;';

		$this->db->query($sql);

		if(!$this->db->query('SELECT * FROM `'.$this->table.'` LIMIT 0 , 1;'))
			$insert_data	= TRUE;

		if ($insert_data) {
			$sql	= '';
			$this->db->query($sql);
		}

		return $this->db->table_exists($this->table);

    }

    public function getCount($status = null){
		$data = array();
		$options = array();
		if ($status) {
			$options = array('status' => $status);
		}
		$this->db->where($options,1);
		$this->db->from($this->table);
		$data = $this->db->count_all_results();
		return $data;
    }

    public function getParticipant($id = null){
		if(!empty($id)){
			$data = array();
			$options = array('id' => $id);
			$Q = $this->db->get_where($this->table,$options,1);
			if ($Q->num_rows() > 0){
				foreach ($Q->result_object() as $row)
				$data = $row;
			}
			$Q->free_result();
			return $data;
		}
    }	

    public function getAllParticipant($admin=null){
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

    public function setParticipant($object=null){

		// Set Participant data
		$data = array(			
			'part_id'	=> $object['part_id'],
			'name'		=> $object['name'],
			'address'	=> $object['address'],
			'email'		=> $object['email'],
			'phone_number'	=> $object['phone_number'],
			'twitter'	=> $object['twitter'],
			'fb_id'		=> $object['fb_id'],
			'fb_pic_url'	=> $object['fb_pic_url'],
			'join_date'	=> $object['join_date']
		);

		// Insert Participant data
		$this->db->insert($this->table, $data);

		// Return last insert id primary
		$insert_id = $this->db->insert_id();

		// Return last insert id primary
		return $insert_id;

    }	

    // Delete page
    public function deleteParticipant($id) {

		// Check page id
		$this->db->where('id', $id);

		// Delete page form database
		return $this->db->delete($this->table);		
    }	
	
	// Get all Participants Join stats by join_date
	public function getJoinStats() {
	    
		/* SELECT count(`part_id`) `total_join`, date(`join_date`) `join_date` FROM `tbl_participants` WHERE date(`join_date`) >= '2014-10-25' AND date(`join_date`) <= '2015-03-25' GROUP BY date(`join_date`) ORDER BY `join_date` ASC */
		
	    $sql = 'SELECT count(`part_id`) `total_join`, date(`join_date`) `join_date` '
                    .'FROM `'. $this->table .'`'
                    .'WHERE date(`join_date`) >= \''.date('Y-m-d',strtotime("-5 month", time())).'\' '
                    .'AND date(`join_date`) <= \''.date('Y/m/d').'\' '
                    .'GROUP BY date(`join_date`) ORDER BY `join_date` ASC';
	    
	    $query = $this->db->query($sql);
            
	    return $query->result_object();
	}
}
