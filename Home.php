<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Home page
 */
class Home extends MY_Controller {
	public function __construct()
	{
		parent::__construct();
		$this->lang->load('general_lang');
	}


	public function index()
	{
		$this->mViewData['offer_list']=
			$this->db->select('*')
				 ->from('courses_offer')
				 ->where('apply_end>=',date('Y-m-d'))
				 ->get()
				 ->result_array();
		$this->mViewData['course_type']=$this->lang->line('course_type');
		$this->render('home', 'full_width');
	}

	public function items($offerId){
		$this->mViewData['offer_item']=
			$this->db->select('*')
				 ->from('courses_offer')
				 ->where('id',$offerId)
				 ->get()
				 ->row_array();
		$this->mViewData['course_type']=$this->lang->line('course_type');
		$this->mViewData['teacher_group']=
		$this->db->select('t.name_c')
				->from('offers_teachers as ot')
				->join('teachers as t','t.id=ot.teacher_id')
				->where('ot.offer_id',$offerId)
				->get()->result_array();

		$this->render('offer_item', 'full_width');
	}
	public function class_schedule($offerId){

	}

}
