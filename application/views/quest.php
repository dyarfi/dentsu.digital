<?php if (!defined('BASEPATH')) exit('No direct script access allowed'); ?>
<div class="container">
    <!-- Page Content -->
    <div class="row-fluid">
        <div class="center-block">
            <div class="col-lg-12 text-center ostrich_sansblack">
                <div class="center-block clearfix main-handler">
                    <?php
                    /*
                    * This is when user already participated
                    */
                    if (count($questionnaire_user_answers) == $progress) { ?>
                    <?php
                    }
                    ?>

                    <div class="col-lg-12 col-md-12 col-xs-12">

                        <br/><br/>

                        <?php if($this->logged_in) { ?>
                        <div class="col-lg-12 col-md-12 col-xs-12 error-handler ostrich_sansblack">
                            <?php if (!empty($progress)) { ?>
                            <div class="col-md-12 center-block text-center">
                                <div class="second circle">
                                    <span class="clearfix">
                                        <strong></strong>
                                        <span><small>COMPLETED</small></span>
                                    </span>
                                </div>
                            </div>
                            <?php } ?>
                            <br/><br/>
                            <div class="clearfix"></div>
                            <?php echo validation_errors('<div class="alert alert-danger" role="alert"><span>', '</span></div>'); ?>
                        </div>
                        <div class="row-fluid">
                            <?php if ($questionnaires) { ?>
                                    <h3 class="quiz-head">Questions</h3>
                                    <div class="row">
                                    <!-- <h4>Questionnaires</h4> -->
                                    <?php echo form_open(base_url('quest'),['id'=>'form-questionnaire','class'=>'form-inline form-quiz-pocky','enctype'=>'multipart/form-data','role'=>'form','name'=>'questionnaire']);?>
                                    <ol class="text-left">
                                          <?php
                                          $i=1;
                                          foreach($questionnaires as $questionnaire) { ?>
                                           <li>
                                                <h3><?php echo $questionnaire->questionnaire_text;?></h3>
                                                <?php if ($questions) { ?>
                                                <ul class="list-inline qrid_<?php echo $questionnaire->id;?>">
                                                <?php foreach ($questions as $question) {
                                                  $j = 1;
                                                  if ($questionnaire->id === $question->questionnaire_id) { ?>
                                                  <li>
                                                    <div class="text-left">
                                                        <label for="qsid_<?php echo $question->id;?>">
                                                            <?php if ($question->file_name) {   ?>
                                                            <div class="center-block">
                                                                <a href="<?php echo base_url('uploads/questionnaire/'.$question->file_name);?>" rel="img-group" title="<?php echo strip_tags($questionnaire->questionnaire_text);?><?php echo ($question->name) ? ' ('.$question->name.') ' : ' ';?><?php echo preg_replace('/(\D+.\:)/','',strip_tags($question->question_text));?>">
                                                                    <img alt="<?php echo $question->subject;?>" style="height:160px;margin:0 auto 10px auto;" src="<?php echo base_url('uploads/questionnaire/'.$question->file_name);?>" class="img-thumbnail"/>
                                                                </a>
                                                            </div>
                                                            <?php } ?>
                                                            <input type="radio" <?php echo ($fields['qrid_'.$question->questionnaire_id] == 'qsid_'.$question->id ? 'checked="checked"' : '');?> name="qrid_<?php echo $questionnaire->id;?>" id="qsid_<?php echo $question->id;?>" value="qsid_<?php echo $question->id;?>" class="check_box"/>
                                                            <?php echo preg_replace('/(\D+.\:)/','',strip_tags($question->question_text));?>
                                                        </label>
                                                    </div>
                                                    <?php //echo $errors['qrid_'.$question->questionnaire_id]; ?>
                                                  </li>
                                                  <?php
                                                  }
                                                  $j++;
                                                } ?>
                                                </ul>
                                                <?php } ?>
                                            </li>
                                          <?php
                                          $i++;
                                          }
                                          ?>
                                        </ol>
                                        <div class="center-block submit-block">
                                            <button class="btn btn-default btn-lg" name="submit">Kirim</button>
                                        </div>
                                    <?php echo form_close();?>
                                    </div>
                                <?php } else { ?>
                                <div class="">
                                    <h1>Hooray, you're done!!!! <small>Thanks for participating!</small></h1>
                                    <a class="btn btn-success btn-md" href="<?php echo base_url('quest/gallery');?>">
                                        <span class="fa fa-users"> </span>
                                        Results
                                    </a>
                                </div>
                            <?php } ?>
                        </div>
                        <?php } else { ?>
                        <div class="row-fluid" style="margin:100px auto 100px auto; ">
                          <div class="center-block">
                            <div class="text-center main-block">
                              <div class="center-block clearfix main-box">
                                <?php echo form_open('',['class'=>'form-inline','id'=>'submit_email']);?>
                                <h3>Please Input your Email first...</h3>
                                <div class="form-group">
                                    <?php echo form_input(['name'=>'email','class'=>'form-control','placeholder'=>'email@email.com']);?>
                                </div>
                                <?php echo form_submit(['type'=>'submit', 'name'=>'submit', 'value'=>'Submit', 'class'=>'btn btn-primary']);?>
                                <div class="msg"></div>
                                <?php echo form_close();?>
                              </div>
                            </div>
                          </div>
                        </div>
                        <?php } ?>
                        <br/><br/><br/><br/><br/><br/>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- /.row -->
</div>
