<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.rapid-framework.org.cn/rapid" prefix="rapid" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:set var="ctx" value="${pageContext.request.contextPath}" />
<c:set var="rs" value="${ctx}/resources" />
<rapid:override name="title">jqgrid</rapid:override>
<rapid:override name="content">
<div id="wrapper">

                        <form class="form-horizontal" id="userForm" method="post">
                           <div class="form-group">
													<label class="col-md-2 control-label">Name: <span class="required">
													* </span>
													</label>
													<div class="col-md-10">
														<input type="text" placeholder="" name="product[name]" class="form-control">
													</div>
							</div>
							
							
							
							<div class="form-group">
													<label class="col-md-2 control-label">Short Description: <span class="required">
													* </span>
													</label>
													<div class="col-md-10">
														<textarea name="product[short_description]" class="form-control"></textarea>
														<span class="help-block">
														shown in product listing </span>
													</div>
												</div>
												
												
<div class="form-group">
													<label class="col-md-2 control-label">Description: <span class="required">
													* </span>
													</label>
													<div class="col-md-10">
														<textarea name="product[description]" class="form-control"></textarea>
													</div>
												</div>		
												
												
												<div class="form-group">
													<label class="col-md-2 control-label">Tax Class: <span class="required">
													* </span>
													</label>
													<div class="col-md-10">
														<select name="product[tax_class]" class="table-group-action-input form-control input-medium">
															<option value="">Select...</option>
															<option value="1">None</option>
															<option value="0">Taxable Goods</option>
															<option value="0">Shipping</option>
															<option value="0">USA</option>
														</select>
													</div>
												</div>
												
												
													<input  type="text" id="fbsj_start" name="fbsj_start" readonly onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	-<input  type="text" id="fbsj_end" name="fbsj_end" readonly onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"/>
	
	
	<div class="form-group">
													<label class="col-md-2 control-label">Meta Description:</label>
													<div class="col-md-10">
														<textarea maxlength="255" name="product[meta_description]" rows="8" class="form-control maxlength-handler"></textarea>
														<span class="help-block">
														max 255 chars </span>
													</div>
												</div>


<div class="alert alert-danger">
								<strong>Error!</strong> The daily cronjob has failed.
							</div>
							
<div class="note note-danger">
								<h4 class="block">Danger! Some Header Goes Here</h4>
								<p>
									 Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit mattis consectetur purus sit amet.\ Cras mattis consectetur purus sit amet fermentum.
								</p>
							</div>
							
							
<div class="clearfix">
													<h4 class="block">Metronic Style Buttons</h4>
													<button class="btn default" type="button">Default</button>
													<button class="btn red" type="button">Red</button>
													<button class="btn blue" type="button">Blue</button>
													<button class="btn green" type="button">Green</button>
													<button class="btn yellow" type="button">Yellow</button>
													<button class="btn purple" type="button">Purple</button>
													<button class="btn dark" type="button">Dark</button>
												</div>
												
<div class="clearfix">
															<h4 class="block">Default Buttons</h4>
															<a class="btn default" href="javascript:;">
															Default <i class="fa fa-user"></i>
															</a>
															<a class="btn red" href="javascript:;">
															Red <i class="fa fa-edit"></i>
															</a>
															<a class="btn blue" href="javascript:;">
															<i class="fa fa-file-o"></i> Blue </a>
															<a class="btn green" href="javascript:;">
															Green <i class="fa fa-font"></i>
															</a>
															<a class="btn yellow" href="javascript:;">
															Yellow <i class="fa fa-search"></i>
															</a>
															<a class="btn purple" href="javascript:;">
															<i class="fa fa-times"></i> Purple </a>
															<a class="btn green" href="javascript:;">
															Green <i class="fa fa-plus"></i>
															</a>
															<a class="btn grey-cascade" href="javascript:;">
															Dark <i class="fa fa-link"></i>
															</a>
														</div>
														
																										
																			

<a href="javascript:;" class="btn red">
									Do this </a>
																
<a href="javascript:;" class="btn blue">
									Cancel </a>
																
<a href="javascript:;" class="btn green">
									Do this </a>
									
<a href="javascript:;" class="btn purple">
									Do this </a>																
							
							
<div class="portlet-body">
							<h4>Click on below buttons to check it out.</h4>
							<!-- Button to trigger modal -->
							<a data-toggle="modal" class="btn blue" role="button" href="#myModal1">
							Modal Dialog </a>
							<a data-toggle="modal" class="btn red" role="button" href="#myModal2">
							Alert </a>
							<a data-toggle="modal" class="btn yellow" role="button" href="#myModal3">
							Confirm </a>
							<!-- Modal -->
							<div aria-hidden="true" aria-labelledby="myModalLabel1" role="dialog" tabindex="-1" class="modal fade" id="myModal1">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal" class="close" type="button"></button>
											<h4 class="modal-title">Modal title</h4>
										</div>
										<div class="modal-body">
											<p>
												 Body goes here...
											</p>
										</div>
										<div class="modal-footer">
											<button aria-hidden="true" data-dismiss="modal" class="btn default">Close</button>
											<button class="btn yellow">Save</button>
										</div>
									</div>
								</div>
							</div>
							<div aria-hidden="true" aria-labelledby="myModalLabel2" role="dialog" tabindex="-1" class="modal fade" id="myModal2">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal" class="close" type="button"></button>
											<h4 class="modal-title">Alert Header</h4>
										</div>
										<div class="modal-body">
											<p>
												 Body goes here...
											</p>
										</div>
										<div class="modal-footer">
											<button class="btn green" data-dismiss="modal">OK</button>
										</div>
									</div>
								</div>
							</div>
							<div aria-hidden="true" aria-labelledby="myModalLabel3" role="dialog" tabindex="-1" class="modal fade" id="myModal3">
								<div class="modal-dialog">
									<div class="modal-content">
										<div class="modal-header">
											<button aria-hidden="true" data-dismiss="modal" class="close" type="button"></button>
											<h4 class="modal-title">Confirm Header</h4>
										</div>
										<div class="modal-body">
											<p>
												 Body goes here...
											</p>
										</div>
										<div class="modal-footer">
											<button aria-hidden="true" data-dismiss="modal" class="btn default">Close</button>
											<button class="btn blue" data-dismiss="modal">Confirm</button>
										</div>
									</div>
								</div>
							</div>
						</div>							
							
<div class="panel panel-info">
									<div class="panel-heading">
										<h3 class="panel-title">Info Panel</h3>
									</div>
									<div class="panel-body">
										 Panel content
									</div>
								</div>							
							
			<div class="clearfix">
													<h4 class="block">Default Bootstrap Style</h4>
													<div class="btn-group">
														<button type="button" class="btn btn-default">Default</button>
														<button aria-expanded="false" type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="javascript:;">
																Action </a>
															</li>
															<li>
																<a href="javascript:;">
																Another action </a>
															</li>
															<li>
																<a href="javascript:;">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="javascript:;">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-primary">Primary</button>
														<button type="button" class="btn btn-primary dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="javascript:;">
																Action </a>
															</li>
															<li>
																<a href="javascript:;">
																Another action </a>
															</li>
															<li>
																<a href="javascript:;">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="javascript:;">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-success">Success</button>
														<button type="button" class="btn btn-success dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="javascript:;">
																Action </a>
															</li>
															<li>
																<a href="javascript:;">
																Another action </a>
															</li>
															<li>
																<a href="javascript:;">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="javascript:;">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-info">Info</button>
														<button type="button" class="btn btn-info dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="javascript:;">
																Action </a>
															</li>
															<li>
																<a href="javascript:;">
																Another action </a>
															</li>
															<li>
																<a href="javascript:;">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="javascript:;">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-warning">Warning</button>
														<button type="button" class="btn btn-warning dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="javascript:;">
																Action </a>
															</li>
															<li>
																<a href="javascript:;">
																Another action </a>
															</li>
															<li>
																<a href="javascript:;">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="javascript:;">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
													<div class="btn-group">
														<button type="button" class="btn btn-danger">Danger</button>
														<button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown"><i class="fa fa-angle-down"></i></button>
														<ul class="dropdown-menu" role="menu">
															<li>
																<a href="javascript:;">
																Action </a>
															</li>
															<li>
																<a href="javascript:;">
																Another action </a>
															</li>
															<li>
																<a href="javascript:;">
																Something else here </a>
															</li>
															<li class="divider">
															</li>
															<li>
																<a href="javascript:;">
																Separated link </a>
															</li>
														</ul>
													</div>
													<!-- /btn-group -->
												</div>
							


<div class="form-group form-md-checkboxes">
									<label>Checkboxes</label>
									<div class="md-checkbox-list">
										<div class="md-checkbox">
											<input type="checkbox" class="md-check" id="checkbox1">
											<label for="checkbox1">
											<span class="inc"></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 1 </label>
										</div>
										<div class="md-checkbox">
											<input type="checkbox" checked="" class="md-check" id="checkbox2">
											<label for="checkbox2">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 2 </label>
										</div>
										<div class="md-checkbox">
											<input type="checkbox" class="md-check" id="checkbox3">
											<label for="checkbox3">
											<span class="inc"></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 3 </label>
										</div>
										<div class="md-checkbox">
											<input type="checkbox" class="md-check" disabled="" id="checkbox4">
											<label for="checkbox4">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Disabled </label>
										</div>
									</div>
								</div>
								
<div class="form-group form-md-checkboxes">
									<label>Checkboxes</label>
									<div class="md-checkbox-list">
										<div class="md-checkbox has-success">
											<input type="checkbox" class="md-check" id="checkbox9">
											<label for="checkbox9">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 1 </label>
										</div>
										<div class="md-checkbox has-error">
											<input type="checkbox" checked="" class="md-check" id="checkbox10">
											<label for="checkbox10">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 2 </label>
										</div>
										<div class="md-checkbox has-warning">
											<input type="checkbox" class="md-check" id="checkbox11">
											<label for="checkbox11">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 3 </label>
										</div>
										<div class="md-checkbox has-info">
											<input type="checkbox" class="md-check" disabled="" id="checkbox12">
											<label for="checkbox12">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Disabled </label>
										</div>
									</div>
								</div>								
														
							
<div class="portlet light">
						<div class="portlet-title">
							<div class="caption font-red-sunglo">
								<i class="icon-drop font-red-sunglo"></i>
								<span class="caption-subject bold uppercase"> Radios</span>
							</div>
							<div class="actions">
								<a href="javascript:;" class="btn btn-circle btn-icon-only blue">
								<i class="icon-cloud-upload"></i>
								</a>
								<a href="javascript:;" class="btn btn-circle btn-icon-only green">
								<i class="icon-wrench"></i>
								</a>
								<a href="javascript:;" class="btn btn-circle btn-icon-only red">
								<i class="icon-trash"></i>
								</a>
								<a title="" data-original-title="" href="javascript:;" class="btn btn-circle btn-icon-only btn-default fullscreen">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form role="form">
								<div class="form-group form-md-radios">
									<label>Checkboxes</label>
									<div class="md-radio-list">
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" name="radio1" id="radio1">
											<label for="radio1">
											<span class="inc"></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 1 </label>
										</div>
										<div class="md-radio">
											<input type="radio" checked="" class="md-radiobtn" name="radio1" id="radio2">
											<label for="radio2">
											<span class="inc"></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 2 </label>
										</div>
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" name="radio1" id="radio3">
											<label for="radio3">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 3 </label>
										</div>
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" disabled="" name="radio1" id="radio5">
											<label for="radio5">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Disabled </label>
										</div>
									</div>
								</div>
								<div class="form-group form-md-radios">
									<label>Checkboxes</label>
									<div class="md-radio-inline">
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" name="radio2" id="radio6">
											<label for="radio6">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 1 </label>
										</div>
										<div class="md-radio">
											<input type="radio" checked="" class="md-radiobtn" name="radio2" id="radio7">
											<label for="radio7">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 2 </label>
										</div>
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" name="radio2" id="radio8">
											<label for="radio8">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 3 </label>
										</div>
									</div>
								</div>
								<div class="form-group form-md-radios">
									<label>Checkboxes</label>
									<div class="md-radio-list">
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" name="radio1" id="radio9">
											<label for="radio9">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 1 </label>
										</div>
										<div class="md-radio has-error">
											<input type="radio" checked="" class="md-radiobtn" name="radio1" id="radio10">
											<label for="radio10">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 2 </label>
										</div>
										<div class="md-radio has-warning">
											<input type="radio" class="md-radiobtn" name="radio1" id="radio11">
											<label for="radio11">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 3 </label>
										</div>
										<div class="md-radio has-success">
											<input type="radio" class="md-radiobtn" disabled="" name="radio1" id="radio13">
											<label for="radio13">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Disabled </label>
										</div>
									</div>
								</div>
								<div class="form-group form-md-radios">
									<label>Checkboxes</label>
									<div class="md-radio-inline">
										<div class="md-radio">
											<input type="radio" class="md-radiobtn" name="radio2" id="radio14">
											<label for="radio14">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 1 </label>
										</div>
										<div class="md-radio has-error">
											<input type="radio" checked="" class="md-radiobtn" name="radio2" id="radio15">
											<label for="radio15">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 2 </label>
										</div>
										<div class="md-radio has-warning">
											<input type="radio" class="md-radiobtn" name="radio2" id="radio16">
											<label for="radio16">
											<span></span>
											<span class="check"></span>
											<span class="box"></span>
											Option 3 </label>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>							
							


<div class="portlet light">
						<div class="portlet-title">
							<div class="caption font-green-haze">
								<i class="icon-settings font-green-haze"></i>
								<span class="caption-subject bold uppercase"> Horizontal Form</span>
							</div>
							<div class="actions">
								<a href="javascript:;" class="btn btn-circle btn-icon-only blue">
								<i class="icon-cloud-upload"></i>
								</a>
								<a href="javascript:;" class="btn btn-circle btn-icon-only green">
								<i class="icon-wrench"></i>
								</a>
								<a href="javascript:;" class="btn btn-circle btn-icon-only red">
								<i class="icon-trash"></i>
								</a>
								<a title="" data-original-title="" href="javascript:;" class="btn btn-circle btn-icon-only btn-default fullscreen">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form class="form-horizontal" role="form">
								<div class="form-body">
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Regular input</label>
										<div class="col-md-10">
											<input type="text" placeholder="Enter your name" id="form_control_1" class="form-control">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Input with hint</label>
										<div class="col-md-10">
											<input type="text" placeholder="Enter your email" id="form_control_1" class="form-control">
											<div class="form-control-focus">
											</div>
											<span class="help-block">Some help goes here...</span>
										</div>
									</div>
									<div class="form-group form-md-line-input has-success">
										<label for="form_control_1" class="col-md-2 control-label">Success Input</label>
										<div class="col-md-10">
											<input type="text" placeholder="Success state" id="form_control_1" class="form-control">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input has-warning">
										<label for="form_control_1" class="col-md-2 control-label">Warning Input</label>
										<div class="col-md-10">
											<input type="text" placeholder="Warning state" id="form_control_1" class="form-control">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input has-error">
										<label for="form_control_1" class="col-md-2 control-label">Error State</label>
										<div class="col-md-10">
											<input type="text" placeholder="Error state" id="form_control_1" class="form-control">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Dropdown Input</label>
										<div class="col-md-10">
											<select id="form_control_1" class="form-control">
												<option value=""></option>
												<option value="">Option 1</option>
												<option value="">Option 2</option>
												<option value="">Option 3</option>
												<option value="">Option 4</option>
											</select>
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input has-success">
										<label for="form_control_1" class="col-md-2 control-label">Textarea</label>
										<div class="col-md-10">
											<textarea placeholder="Enter more text" rows="3" class="form-control"></textarea>
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Disabled</label>
										<div class="col-md-10">
											<input type="text" placeholder="Placeholder..." id="form_control_1" disabled="" class="form-control">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Readonly</label>
										<div class="col-md-10">
											<input type="text" placeholder="Placeholder..." id="form_control_1" value="Some value" readonly="" class="form-control">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Readonly</label>
										<div class="col-md-10">
											<div class="form-control form-control-static">
												email@example.com
											</div>
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Small</label>
										<div class="col-md-10">
											<input type="text" placeholder=".input-sm" id="form_control_1" class="form-control input-sm">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
									<div class="form-group form-md-line-input">
										<label for="form_control_1" class="col-md-2 control-label">Large</label>
										<div class="col-md-10">
											<input type="text" placeholder=".input-lg" id="form_control_1" class="form-control input-lg">
											<div class="form-control-focus">
											</div>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-2 col-md-10">
											<button class="btn default" type="button">Cancel</button>
											<button class="btn blue" type="button">Submit</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>							
							
							
<div class="portlet box green ">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i> Horizontal Form
							</div>
							<div class="tools">
								<a class="collapse" href="" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="" data-original-title="" title="">
								</a>
								<a class="remove" href="" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form role="form" class="form-horizontal">
								<div class="form-body">
									<div class="form-group">
										<label class="col-md-3 control-label">Block Help</label>
										<div class="col-md-9">
											<input type="text" placeholder="Enter text" class="form-control">
											<span class="help-block">
											A block of help text. </span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Inline Help</label>
										<div class="col-md-9">
											<input type="text" placeholder="Enter text" class="form-control input-inline input-medium">
											<span class="help-inline">
											Inline help. </span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Input Group</label>
										<div class="col-md-9">
											<div class="input-inline input-medium">
												<div class="input-group">
													<span class="input-group-addon">
													<i class="fa fa-user"></i>
													</span>
													<input type="email" placeholder="Email Address" class="form-control">
												</div>
											</div>
											<span class="help-inline">
											Inline help. </span>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Email Address</label>
										<div class="col-md-9">
											<div class="input-group">
												<span class="input-group-addon">
												<i class="fa fa-envelope"></i>
												</span>
												<input type="email" placeholder="Email Address" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Password</label>
										<div class="col-md-9">
											<div class="input-group">
												<input type="password" placeholder="Password" class="form-control">
												<span class="input-group-addon">
												<i class="fa fa-user"></i>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Left Icon</label>
										<div class="col-md-9">
											<div class="input-icon">
												<i class="fa fa-bell-o"></i>
												<input type="text" placeholder="Left icon" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Right Icon</label>
										<div class="col-md-9">
											<div class="input-icon right">
												<i class="fa fa-microphone"></i>
												<input type="text" placeholder="Right icon" class="form-control">
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Icon Input in Group Input</label>
										<div class="col-md-9">
											<div class="input-group">
												<div class="input-icon">
													<i class="fa fa-lock fa-fw"></i>
													<input type="text" placeholder="password" name="password" class="form-control" id="newpassword">
												</div>
												<span class="input-group-btn">
												<button type="button" class="btn btn-success" id="genpassword"><i class="fa fa-arrow-left fa-fw"></i> Random</button>
												</span>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Input With Spinner</label>
										<div class="col-md-9">
											<input type="password" placeholder="Password" class="form-control spinner">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Static Control</label>
										<div class="col-md-9">
											<p class="form-control-static">
												 email@example.com
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Disabled</label>
										<div class="col-md-9">
											<input type="password" disabled="" placeholder="Disabled" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Readonly</label>
										<div class="col-md-9">
											<input type="password" readonly="" placeholder="Readonly" class="form-control">
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Dropdown</label>
										<div class="col-md-9">
											<select class="form-control">
												<option>Option 1</option>
												<option>Option 2</option>
												<option>Option 3</option>
												<option>Option 4</option>
												<option>Option 5</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Multiple Select</label>
										<div class="col-md-9">
											<select class="form-control" multiple="">
												<option>Option 1</option>
												<option>Option 2</option>
												<option>Option 3</option>
												<option>Option 4</option>
												<option>Option 5</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Textarea</label>
										<div class="col-md-9">
											<textarea rows="3" class="form-control"></textarea>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label" for="exampleInputFile">File input</label>
										<div class="col-md-9">
											<input type="file" id="exampleInputFile">
											<p class="help-block">
												 some help text here.
											</p>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Checkboxes</label>
										<div class="col-md-9">
											<div class="checkbox-list">
												<label>
												<div class="checker"><span><input type="checkbox"></span></div> Checkbox 1 </label>
												<label>
												<div class="checker"><span><input type="checkbox"></span></div> Checkbox 1 </label>
												<label>
												<div class="checker disabled"><span><input type="checkbox" disabled=""></span></div> Disabled </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Inline Checkboxes</label>
										<div class="col-md-9">
											<div class="checkbox-list">
												<label class="checkbox-inline">
												<div class="checker" id="uniform-inlineCheckbox21"><span><input type="checkbox" value="option1" id="inlineCheckbox21"></span></div> Checkbox 1 </label>
												<label class="checkbox-inline">
												<div class="checker" id="uniform-inlineCheckbox22"><span><input type="checkbox" value="option2" id="inlineCheckbox22"></span></div> Checkbox 2 </label>
												<label class="checkbox-inline">
												<div class="checker disabled" id="uniform-inlineCheckbox23"><span><input type="checkbox" disabled="" value="option3" id="inlineCheckbox23"></span></div> Disabled </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Radio</label>
										<div class="col-md-9">
											<div class="radio-list">
												<label>
												<div class="radio" id="uniform-optionsRadios22"><span><input type="radio" checked="" value="option1" id="optionsRadios22" name="optionsRadios"></span></div> Option 1 </label>
												<label>
												<div class="radio" id="uniform-optionsRadios23"><span><input type="radio" checked="" value="option2" id="optionsRadios23" name="optionsRadios"></span></div> Option 2 </label>
												<label>
												<div class="radio disabled" id="uniform-optionsRadios24"><span><input type="radio" disabled="" value="option2" id="optionsRadios24" name="optionsRadios"></span></div> Disabled </label>
											</div>
										</div>
									</div>
									<div class="form-group">
										<label class="col-md-3 control-label">Inline Radio</label>
										<div class="col-md-9">
											<div class="radio-list">
												<label class="radio-inline">
												<div class="radio" id="uniform-optionsRadios25"><span><input type="radio" checked="" value="option1" id="optionsRadios25" name="optionsRadios"></span></div> Option 1 </label>
												<label class="radio-inline">
												<div class="radio" id="uniform-optionsRadios26"><span class="checked"><input type="radio" checked="" value="option2" id="optionsRadios26" name="optionsRadios"></span></div> Option 2 </label>
												<label class="radio-inline">
												<div class="radio disabled" id="uniform-optionsRadios27"><span><input type="radio" disabled="" value="option3" id="optionsRadios27" name="optionsRadios"></span></div> Disabled </label>
											</div>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn green" type="submit">Submit</button>
											<button class="btn default" type="button">Cancel</button>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>							
							
							
							
<div class="portlet box yellow">
									<div class="portlet-title">
										<div class="caption">
											<i class="fa fa-gift"></i>Form Actions On Top &amp; Bottom
										</div>
										<div class="tools">
											<a class="collapse" href="javascript:;" data-original-title="" title="">
											</a>
											<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
											</a>
											<a class="reload" href="javascript:;" data-original-title="" title="">
											</a>
											<a class="remove" href="javascript:;" data-original-title="" title="">
											</a>
										</div>
									</div>
									<div class="portlet-body form">
										<!-- BEGIN FORM-->
										<form class="form-horizontal" action="#">
											<div class="form-actions top">
												<div class="row">
													<div class="col-md-offset-3 col-md-9">
														<button class="btn green" type="submit">Submit</button>
														<button class="btn default" type="button">Cancel</button>
													</div>
												</div>
											</div>
											<div class="form-body">
												<div class="form-group">
													<label class="col-md-3 control-label">Text</label>
													<div class="col-md-4">
														<input type="text" placeholder="Enter text" class="form-control">
														<span class="help-block">
														A block of help text. </span>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Email Address</label>
													<div class="col-md-4">
														<div class="input-group">
															<span class="input-group-addon">
															<i class="fa fa-envelope"></i>
															</span>
															<input type="email" placeholder="Email Address" class="form-control">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Password</label>
													<div class="col-md-4">
														<div class="input-group">
															<input type="password" placeholder="Password" class="form-control">
															<span class="input-group-addon">
															<i class="fa fa-user"></i>
															</span>
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Left Icon</label>
													<div class="col-md-4">
														<div class="input-icon">
															<i class="fa fa-bell-o"></i>
															<input type="text" placeholder="Left icon" class="form-control">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Right Icon</label>
													<div class="col-md-4">
														<div class="input-icon right">
															<i class="fa fa-microphone"></i>
															<input type="text" placeholder="Right icon" class="form-control">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="col-md-3 control-label">Input With Spinner</label>
													<div class="col-md-4">
														<input type="password" placeholder="Password" class="form-control spinner">
													</div>
												</div>
												<div class="form-group last">
													<label class="col-md-3 control-label">Static Control</label>
													<div class="col-md-4">
														<p class="form-control-static">
															 email@example.com
														</p>
													</div>
												</div>
											</div>
											<div class="form-actions fluid">
												<div class="row">
													<div class="col-md-offset-3 col-md-9">
														<button class="btn green" type="submit">Submit</button>
														<button class="btn default" type="button">Cancel</button>
													</div>
												</div>
											</div>
										</form>
										<!-- END FORM-->
									</div>
								</div>							
							
							
							
<div class="col-md-12">
					<div id="form_wizard_1" class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i> Form Wizard - <span class="step-title">
								Step 1 of 4 </span>
							</div>
							<div class="tools hidden-xs">
								<a class="collapse" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="remove" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<form method="POST" id="submit_form" class="form-horizontal" action="#" novalidate="novalidate">
								<div class="form-wizard">
									<div class="form-body">
										<ul class="nav nav-pills nav-justified steps">
											<li class="active">
												<a class="step" data-toggle="tab" href="#tab1" aria-expanded="true">
												<span class="number">
												1 </span>
												<span class="desc">
												<i class="fa fa-check"></i> Account Setup </span>
												</a>
											</li>
											<li>
												<a class="step" data-toggle="tab" href="#tab2">
												<span class="number">
												2 </span>
												<span class="desc">
												<i class="fa fa-check"></i> Profile Setup </span>
												</a>
											</li>
											<li>
												<a class="step active" data-toggle="tab" href="#tab3">
												<span class="number">
												3 </span>
												<span class="desc">
												<i class="fa fa-check"></i> Billing Setup </span>
												</a>
											</li>
											<li>
												<a class="step" data-toggle="tab" href="#tab4">
												<span class="number">
												4 </span>
												<span class="desc">
												<i class="fa fa-check"></i> Confirm </span>
												</a>
											</li>
										</ul>
										<div role="progressbar" class="progress progress-striped" id="bar">
											<div class="progress-bar progress-bar-success" style="width: 25%;">
											</div>
										</div>
										<div class="tab-content">
											<div class="alert alert-danger display-none">
												<button data-dismiss="alert" class="close"></button>
												You have some form errors. Please check below.
											</div>
											<div class="alert alert-success display-none">
												<button data-dismiss="alert" class="close"></button>
												Your form validation is successful!
											</div>
											<div id="tab1" class="tab-pane active">
												<h3 class="block">Provide your account details</h3>
												<div class="form-group">
													<label class="control-label col-md-3">Username <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="username" class="form-control">
														<span class="help-block">
														Provide your username </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Password <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="password" id="submit_form_password" name="password" class="form-control">
														<span class="help-block">
														Provide your password. </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Confirm Password <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="password" name="rpassword" class="form-control">
														<span class="help-block">
														Confirm your password </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Email <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="email" class="form-control">
														<span class="help-block">
														Provide your email address </span>
													</div>
												</div>
											</div>
											<div id="tab2" class="tab-pane">
												<h3 class="block">Provide your profile details</h3>
												<div class="form-group">
													<label class="control-label col-md-3">Fullname <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="fullname" class="form-control">
														<span class="help-block">
														Provide your fullname </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Phone Number <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="phone" class="form-control">
														<span class="help-block">
														Provide your phone number </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Gender <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<div class="radio-list">
															<label>
															<div class="radio"><span><input type="radio" data-title="Male" value="M" name="gender"></span></div>
															Male </label>
															<label>
															<div class="radio"><span><input type="radio" data-title="Female" value="F" name="gender"></span></div>
															Female </label>
														</div>
														<div id="form_gender_error">
														</div>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Address <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="address" class="form-control">
														<span class="help-block">
														Provide your street address </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">City/Town <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="city" class="form-control">
														<span class="help-block">
														Provide your city or town </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Country</label>
													<div class="col-md-4">
														<div class="select2-container form-control" id="s2id_country_list"><a tabindex="-1" class="select2-choice select2-default" href="javascript:void(0)">   <span class="select2-chosen" id="select2-chosen-1">Select</span><abbr class="select2-search-choice-close"></abbr>   <span role="presentation" class="select2-arrow"><b role="presentation"></b></span></a><label class="select2-offscreen" for="s2id_autogen1"></label><input type="text" role="button" aria-haspopup="true" class="select2-focusser select2-offscreen" aria-labelledby="select2-chosen-1" id="s2id_autogen1"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label class="select2-offscreen" for="s2id_autogen1_search"></label>       <input type="text" aria-autocomplete="list" aria-expanded="true" role="combobox" class="select2-input" spellcheck="false" autocapitalize="off" autocorrect="off" autocomplete="off" aria-owns="select2-results-1" id="s2id_autogen1_search" placeholder="">   </div>   <ul role="listbox" class="select2-results" id="select2-results-1">   </ul></div></div><select class="form-control select2-offscreen" id="country_list" name="country" tabindex="-1" title="">
															<option value=""></option>
															<option value="AF">Afghanistan</option>
															<option value="AL">Albania</option>
															<option value="DZ">Algeria</option>
															<option value="AS">American Samoa</option>
															<option value="AD">Andorra</option>
															<option value="AO">Angola</option>
															<option value="AI">Anguilla</option>
															<option value="AR">Argentina</option>
															<option value="AM">Armenia</option>
															<option value="AW">Aruba</option>
															<option value="AU">Australia</option>
															<option value="AT">Austria</option>
															<option value="AZ">Azerbaijan</option>
															<option value="BS">Bahamas</option>
															<option value="BH">Bahrain</option>
															<option value="BD">Bangladesh</option>
															<option value="BB">Barbados</option>
															<option value="BY">Belarus</option>
															<option value="BE">Belgium</option>
															<option value="BZ">Belize</option>
															<option value="BJ">Benin</option>
															<option value="BM">Bermuda</option>
															<option value="BT">Bhutan</option>
															<option value="BO">Bolivia</option>
															<option value="BA">Bosnia and Herzegowina</option>
															<option value="BW">Botswana</option>
															<option value="BV">Bouvet Island</option>
															<option value="BR">Brazil</option>
															<option value="IO">British Indian Ocean Territory</option>
															<option value="BN">Brunei Darussalam</option>
															<option value="BG">Bulgaria</option>
															<option value="BF">Burkina Faso</option>
															<option value="BI">Burundi</option>
															<option value="KH">Cambodia</option>
															<option value="CM">Cameroon</option>
															<option value="CA">Canada</option>
															<option value="CV">Cape Verde</option>
															<option value="KY">Cayman Islands</option>
															<option value="CF">Central African Republic</option>
															<option value="TD">Chad</option>
															<option value="CL">Chile</option>
															<option value="CN">China</option>
															<option value="CX">Christmas Island</option>
															<option value="CC">Cocos (Keeling) Islands</option>
															<option value="CO">Colombia</option>
															<option value="KM">Comoros</option>
															<option value="CG">Congo</option>
															<option value="CD">Congo, the Democratic Republic of the</option>
															<option value="CK">Cook Islands</option>
															<option value="CR">Costa Rica</option>
															<option value="CI">Cote d'Ivoire</option>
															<option value="HR">Croatia (Hrvatska)</option>
															<option value="CU">Cuba</option>
															<option value="CY">Cyprus</option>
															<option value="CZ">Czech Republic</option>
															<option value="DK">Denmark</option>
															<option value="DJ">Djibouti</option>
															<option value="DM">Dominica</option>
															<option value="DO">Dominican Republic</option>
															<option value="EC">Ecuador</option>
															<option value="EG">Egypt</option>
															<option value="SV">El Salvador</option>
															<option value="GQ">Equatorial Guinea</option>
															<option value="ER">Eritrea</option>
															<option value="EE">Estonia</option>
															<option value="ET">Ethiopia</option>
															<option value="FK">Falkland Islands (Malvinas)</option>
															<option value="FO">Faroe Islands</option>
															<option value="FJ">Fiji</option>
															<option value="FI">Finland</option>
															<option value="FR">France</option>
															<option value="GF">French Guiana</option>
															<option value="PF">French Polynesia</option>
															<option value="TF">French Southern Territories</option>
															<option value="GA">Gabon</option>
															<option value="GM">Gambia</option>
															<option value="GE">Georgia</option>
															<option value="DE">Germany</option>
															<option value="GH">Ghana</option>
															<option value="GI">Gibraltar</option>
															<option value="GR">Greece</option>
															<option value="GL">Greenland</option>
															<option value="GD">Grenada</option>
															<option value="GP">Guadeloupe</option>
															<option value="GU">Guam</option>
															<option value="GT">Guatemala</option>
															<option value="GN">Guinea</option>
															<option value="GW">Guinea-Bissau</option>
															<option value="GY">Guyana</option>
															<option value="HT">Haiti</option>
															<option value="HM">Heard and Mc Donald Islands</option>
															<option value="VA">Holy See (Vatican City State)</option>
															<option value="HN">Honduras</option>
															<option value="HK">Hong Kong</option>
															<option value="HU">Hungary</option>
															<option value="IS">Iceland</option>
															<option value="IN">India</option>
															<option value="ID">Indonesia</option>
															<option value="IR">Iran (Islamic Republic of)</option>
															<option value="IQ">Iraq</option>
															<option value="IE">Ireland</option>
															<option value="IL">Israel</option>
															<option value="IT">Italy</option>
															<option value="JM">Jamaica</option>
															<option value="JP">Japan</option>
															<option value="JO">Jordan</option>
															<option value="KZ">Kazakhstan</option>
															<option value="KE">Kenya</option>
															<option value="KI">Kiribati</option>
															<option value="KP">Korea, Democratic People's Republic of</option>
															<option value="KR">Korea, Republic of</option>
															<option value="KW">Kuwait</option>
															<option value="KG">Kyrgyzstan</option>
															<option value="LA">Lao People's Democratic Republic</option>
															<option value="LV">Latvia</option>
															<option value="LB">Lebanon</option>
															<option value="LS">Lesotho</option>
															<option value="LR">Liberia</option>
															<option value="LY">Libyan Arab Jamahiriya</option>
															<option value="LI">Liechtenstein</option>
															<option value="LT">Lithuania</option>
															<option value="LU">Luxembourg</option>
															<option value="MO">Macau</option>
															<option value="MK">Macedonia, The Former Yugoslav Republic of</option>
															<option value="MG">Madagascar</option>
															<option value="MW">Malawi</option>
															<option value="MY">Malaysia</option>
															<option value="MV">Maldives</option>
															<option value="ML">Mali</option>
															<option value="MT">Malta</option>
															<option value="MH">Marshall Islands</option>
															<option value="MQ">Martinique</option>
															<option value="MR">Mauritania</option>
															<option value="MU">Mauritius</option>
															<option value="YT">Mayotte</option>
															<option value="MX">Mexico</option>
															<option value="FM">Micronesia, Federated States of</option>
															<option value="MD">Moldova, Republic of</option>
															<option value="MC">Monaco</option>
															<option value="MN">Mongolia</option>
															<option value="MS">Montserrat</option>
															<option value="MA">Morocco</option>
															<option value="MZ">Mozambique</option>
															<option value="MM">Myanmar</option>
															<option value="NA">Namibia</option>
															<option value="NR">Nauru</option>
															<option value="NP">Nepal</option>
															<option value="NL">Netherlands</option>
															<option value="AN">Netherlands Antilles</option>
															<option value="NC">New Caledonia</option>
															<option value="NZ">New Zealand</option>
															<option value="NI">Nicaragua</option>
															<option value="NE">Niger</option>
															<option value="NG">Nigeria</option>
															<option value="NU">Niue</option>
															<option value="NF">Norfolk Island</option>
															<option value="MP">Northern Mariana Islands</option>
															<option value="NO">Norway</option>
															<option value="OM">Oman</option>
															<option value="PK">Pakistan</option>
															<option value="PW">Palau</option>
															<option value="PA">Panama</option>
															<option value="PG">Papua New Guinea</option>
															<option value="PY">Paraguay</option>
															<option value="PE">Peru</option>
															<option value="PH">Philippines</option>
															<option value="PN">Pitcairn</option>
															<option value="PL">Poland</option>
															<option value="PT">Portugal</option>
															<option value="PR">Puerto Rico</option>
															<option value="QA">Qatar</option>
															<option value="RE">Reunion</option>
															<option value="RO">Romania</option>
															<option value="RU">Russian Federation</option>
															<option value="RW">Rwanda</option>
															<option value="KN">Saint Kitts and Nevis</option>
															<option value="LC">Saint LUCIA</option>
															<option value="VC">Saint Vincent and the Grenadines</option>
															<option value="WS">Samoa</option>
															<option value="SM">San Marino</option>
															<option value="ST">Sao Tome and Principe</option>
															<option value="SA">Saudi Arabia</option>
															<option value="SN">Senegal</option>
															<option value="SC">Seychelles</option>
															<option value="SL">Sierra Leone</option>
															<option value="SG">Singapore</option>
															<option value="SK">Slovakia (Slovak Republic)</option>
															<option value="SI">Slovenia</option>
															<option value="SB">Solomon Islands</option>
															<option value="SO">Somalia</option>
															<option value="ZA">South Africa</option>
															<option value="GS">South Georgia and the South Sandwich Islands</option>
															<option value="ES">Spain</option>
															<option value="LK">Sri Lanka</option>
															<option value="SH">St. Helena</option>
															<option value="PM">St. Pierre and Miquelon</option>
															<option value="SD">Sudan</option>
															<option value="SR">Suriname</option>
															<option value="SJ">Svalbard and Jan Mayen Islands</option>
															<option value="SZ">Swaziland</option>
															<option value="SE">Sweden</option>
															<option value="CH">Switzerland</option>
															<option value="SY">Syrian Arab Republic</option>
															<option value="TW">Taiwan, Province of China</option>
															<option value="TJ">Tajikistan</option>
															<option value="TZ">Tanzania, United Republic of</option>
															<option value="TH">Thailand</option>
															<option value="TG">Togo</option>
															<option value="TK">Tokelau</option>
															<option value="TO">Tonga</option>
															<option value="TT">Trinidad and Tobago</option>
															<option value="TN">Tunisia</option>
															<option value="TR">Turkey</option>
															<option value="TM">Turkmenistan</option>
															<option value="TC">Turks and Caicos Islands</option>
															<option value="TV">Tuvalu</option>
															<option value="UG">Uganda</option>
															<option value="UA">Ukraine</option>
															<option value="AE">United Arab Emirates</option>
															<option value="GB">United Kingdom</option>
															<option value="US">United States</option>
															<option value="UM">United States Minor Outlying Islands</option>
															<option value="UY">Uruguay</option>
															<option value="UZ">Uzbekistan</option>
															<option value="VU">Vanuatu</option>
															<option value="VE">Venezuela</option>
															<option value="VN">Viet Nam</option>
															<option value="VG">Virgin Islands (British)</option>
															<option value="VI">Virgin Islands (U.S.)</option>
															<option value="WF">Wallis and Futuna Islands</option>
															<option value="EH">Western Sahara</option>
															<option value="YE">Yemen</option>
															<option value="ZM">Zambia</option>
															<option value="ZW">Zimbabwe</option>
														</select>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Remarks</label>
													<div class="col-md-4">
														<textarea name="remarks" rows="3" class="form-control"></textarea>
													</div>
												</div>
											</div>
											<div id="tab3" class="tab-pane">
												<h3 class="block">Provide your billing and credit card details</h3>
												<div class="form-group">
													<label class="control-label col-md-3">Card Holder Name <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="card_name" class="form-control">
														<span class="help-block">
														</span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Card Number <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="card_number" class="form-control">
														<span class="help-block">
														</span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">CVC <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="card_cvc" class="form-control" placeholder="">
														<span class="help-block">
														</span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Expiration(MM/YYYY) <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<input type="text" name="card_expiry_date" class="form-control" maxlength="7" placeholder="MM/YYYY">
														<span class="help-block">
														e.g 11/2020 </span>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Payment Options <span class="required" aria-required="true">
													* </span>
													</label>
													<div class="col-md-4">
														<div class="checkbox-list">
															<label>
															<div class="checker"><span><input type="checkbox" data-title="Auto-Pay with this Credit Card." value="1" name="payment[]"></span></div> Auto-Pay with this Credit Card </label>
															<label>
															<div class="checker"><span><input type="checkbox" data-title="Email me monthly billing." value="2" name="payment[]"></span></div> Email me monthly billing </label>
														</div>
														<div id="form_payment_error">
														</div>
													</div>
												</div>
											</div>
											<div id="tab4" class="tab-pane">
												<h3 class="block">Confirm your account</h3>
												<h4 class="form-section">Account</h4>
												<div class="form-group">
													<label class="control-label col-md-3">Username:</label>
													<div class="col-md-4">
														<p data-display="username" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Email:</label>
													<div class="col-md-4">
														<p data-display="email" class="form-control-static">
														</p>
													</div>
												</div>
												<h4 class="form-section">Profile</h4>
												<div class="form-group">
													<label class="control-label col-md-3">Fullname:</label>
													<div class="col-md-4">
														<p data-display="fullname" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Gender:</label>
													<div class="col-md-4">
														<p data-display="gender" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Phone:</label>
													<div class="col-md-4">
														<p data-display="phone" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Address:</label>
													<div class="col-md-4">
														<p data-display="address" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">City/Town:</label>
													<div class="col-md-4">
														<p data-display="city" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Country:</label>
													<div class="col-md-4">
														<p data-display="country" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Remarks:</label>
													<div class="col-md-4">
														<p data-display="remarks" class="form-control-static">
														</p>
													</div>
												</div>
												<h4 class="form-section">Billing</h4>
												<div class="form-group">
													<label class="control-label col-md-3">Card Holder Name:</label>
													<div class="col-md-4">
														<p data-display="card_name" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Card Number:</label>
													<div class="col-md-4">
														<p data-display="card_number" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">CVC:</label>
													<div class="col-md-4">
														<p data-display="card_cvc" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Expiration:</label>
													<div class="col-md-4">
														<p data-display="card_expiry_date" class="form-control-static">
														</p>
													</div>
												</div>
												<div class="form-group">
													<label class="control-label col-md-3">Payment Options:</label>
													<div class="col-md-4">
														<p data-display="payment" class="form-control-static">
														</p>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="form-actions">
										<div class="row">
											<div class="col-md-offset-3 col-md-9">
												<a class="btn default button-previous disabled" href="javascript:;" style="display: none;">
												<i class="m-icon-swapleft"></i> Back </a>
												<a class="btn blue button-next" href="javascript:;">
												Continue <i class="m-icon-swapright m-icon-white"></i>
												</a>
												<a class="btn green button-submit" href="javascript:;" style="display: none;">
												Submit <i class="m-icon-swapright m-icon-white"></i>
												</a>
											</div>
										</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>							
							
<div class="col-md-12">
					<!-- BEGIN VALIDATION STATES-->
					<div class="portlet box purple">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-gift"></i>Basic Validation
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="remove" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body form">
							<!-- BEGIN FORM-->
							<form class="form-horizontal" id="form_sample_1" action="#" novalidate="novalidate">
								<div class="form-body">
									<div class="alert alert-danger display-hide">
										<button data-close="alert" class="close"></button>
										You have some form errors. Please check below.
									</div>
									<div class="alert alert-success display-hide">
										<button data-close="alert" class="close"></button>
										Your form validation is successful!
									</div>
									<div class="form-group has-error">
										<label class="control-label col-md-3">Name <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" data-required="1" name="name" aria-required="true" aria-invalid="true" aria-describedby="name-error"><span id="name-error" class="help-block help-block-error">This field is required.</span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Email <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="email">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">URL <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="url">
											<span class="help-block">
											e.g: http://www.demo.com or http://demo.com </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Number <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="number">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Digits <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="digits">
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Credit Card <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="creditcard">
											<span class="help-block">
											e.g: 5500 0000 0000 0004 </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Occupation&nbsp;&nbsp;</label>
										<div class="col-md-4">
											<input type="text" class="form-control" name="occupation">
											<span class="help-block">
											optional field </span>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Select <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<select name="select" class="form-control">
												<option value="">Select...</option>
												<option value="Category 1">Category 1</option>
												<option value="Category 2">Category 2</option>
												<option value="Category 3">Category 5</option>
												<option value="Category 4">Category 4</option>
											</select>
										</div>
									</div>
									<div class="form-group">
										<label class="control-label col-md-3">Multi Select <span class="required" aria-required="true">
										* </span>
										</label>
										<div class="col-md-4">
											<select multiple="" name="select_multi" class="form-control">
												<option value="Category 1">Category 1</option>
												<option value="Category 2">Category 2</option>
												<option value="Category 3">Category 3</option>
												<option value="Category 4">Category 4</option>
												<option value="Category 5">Category 5</option>
											</select>
											<span class="help-block">
											select max 3 options, min 1 option </span>
										</div>
									</div>
								</div>
								<div class="form-actions">
									<div class="row">
										<div class="col-md-offset-3 col-md-9">
											<button class="btn green" type="submit">Submit</button>
											<button class="btn default" type="button">Cancel</button>
										</div>
									</div>
								</div>
							</form>
							<!-- END FORM-->
						</div>
					</div>
					<!-- END VALIDATION STATES-->
				</div>							
							
							
<div class="portlet light">
				<div class="portlet-body">
					<div class="row">
						<div class="col-md-12">
							<div class="note note-danger">
								<p>
									 File Upload widget with multiple file selection, drag&amp;drop support, progress bars and preview images for jQuery.<br>
									 Supports cross-domain, chunked and resumable file uploads and client-side image resizing.<br>
									 Works with any server-side platform (PHP, Python, Ruby on Rails, Java, Node.js, Go etc.) that supports standard HTML form file uploads.
								</p>
							</div>
							<form enctype="multipart/form-data" method="POST" action="../../assets/global/plugins/jquery-file-upload/server/php/" id="fileupload" class="">
								<!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
								<div class="row fileupload-buttonbar">
									<div class="col-lg-7">
										<!-- The fileinput-button span is used to style the file input field as button -->
										<span class="btn green fileinput-button">
										<i class="fa fa-plus"></i>
										<span>
										Add files... </span>
										<input type="file" multiple="" name="files[]">
										</span>
										<button class="btn blue start" type="submit">
										<i class="fa fa-upload"></i>
										<span>
										Start upload </span>
										</button>
										<button class="btn warning cancel" type="reset">
										<i class="fa fa-ban-circle"></i>
										<span>
										Cancel upload </span>
										</button>
										<button class="btn red delete" type="button">
										<i class="fa fa-trash"></i>
										<span>
										Delete </span>
										</button>
										<input type="checkbox" class="toggle">
										<!-- The global file processing state -->
										<span class="fileupload-process">
										</span>
									</div>
									<!-- The global progress information -->
									<div class="col-lg-5 fileupload-progress fade">
										<!-- The global progress bar -->
										<div aria-valuemax="100" aria-valuemin="0" role="progressbar" class="progress progress-striped active">
											<div style="width:0%;" class="progress-bar progress-bar-success">
											</div>
										</div>
										<!-- The extended global progress information -->
										<div class="progress-extended">
											 &nbsp;
										</div>
									</div>
								</div>
								<!-- The table listing the files available for upload/download -->
								<table class="table table-striped clearfix" role="presentation">
								<tbody class="files">
								</tbody>
								</table>
							</form>
							<div class="panel panel-success">
								<div class="panel-heading">
									<h3 class="panel-title">Demo Notes</h3>
								</div>
								<div class="panel-body">
									<ul>
										<li>
											 The maximum file size for uploads in this demo is <strong>5 MB</strong> (default file size is unlimited).
										</li>
										<li>
											 Only image files (<strong>JPG, GIF, PNG</strong>) are allowed in this demo (by default there is no file type restriction).
										</li>
										<li>
											 Uploaded files will be deleted automatically after <strong>5 minutes</strong> (demo setting).
										</li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>							
							
							
<div class="portlet box red">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Basic Bootstrap 3.0 Responsive Table
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="remove" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-responsive">
								<table class="table">
								<thead>
								<tr>
									<th>
										 #
									</th>
									<th>
										 Table heading
									</th>
									<th>
										 Table heading
									</th>
									<th>
										 Table heading
									</th>
									<th>
										 Table heading
									</th>
									<th>
										 Table heading
									</th>
									<th>
										 Table heading
									</th>
								</tr>
								</thead>
								<tbody>
								<tr>
									<td>
										 1
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
								</tr>
								<tr>
									<td>
										 2
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
								</tr>
								<tr>
									<td>
										 3
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
									<td>
										 Table cell
									</td>
								</tr>
								</tbody>
								</table>
							</div>
						</div>
					</div>							
							
<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box grey-cascade">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-globe"></i>Managed Table
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="remove" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										<div class="btn-group">
											<button class="btn green" id="sample_editable_1_new">
											Add New <i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="col-md-6">
										<div class="btn-group pull-right">
											<button data-toggle="dropdown" class="btn dropdown-toggle">Tools <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right">
												<li>
													<a href="javascript:;">
													Print </a>
												</li>
												<li>
													<a href="javascript:;">
													Save as PDF </a>
												</li>
												<li>
													<a href="javascript:;">
													Export to Excel </a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div id="sample_1_wrapper" class="dataTables_wrapper no-footer"><div class="row"><div class="col-md-6 col-sm-12"><div class="dataTables_length" id="sample_1_length"><label>  <select name="sample_1_length" aria-controls="sample_1" class="form-control input-xsmall input-inline"><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="-1">All</option></select> records</label></div></div><div class="col-md-6 col-sm-12"><div id="sample_1_filter" class="dataTables_filter"><label>My search: <input type="search" class="form-control input-small input-inline" placeholder="" aria-controls="sample_1"></label></div></div></div><div class="table-scrollable"><table id="sample_1" class="table table-striped table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="sample_1_info">
							<thead>
							<tr role="row"><th class="table-checkbox sorting_disabled" rowspan="1" colspan="1" style="width: 24px;" aria-label="
									
								">
									<div class="checker"><span class="checked"><input type="checkbox" data-set="#sample_1 .checkboxes" class="group-checkable"></span></div>
								</th><th class="sorting_desc" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" style="width: 172px;" aria-label="
									 Username
								: activate to sort column ascending" aria-sort="descending">
									 Username
								</th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 292px;" aria-label="
									 Email
								">
									 Email
								</th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 105px;" aria-label="
									 Points
								">
									 Points
								</th><th class="sorting" tabindex="0" aria-controls="sample_1" rowspan="1" colspan="1" style="width: 152px;" aria-label="
									 Joined
								: activate to sort column ascending">
									 Joined
								</th><th class="sorting_disabled" rowspan="1" colspan="1" style="width: 165px;" aria-label="
									 Status
								">
									 Status
								</th></tr>
							</thead>
							<tbody>
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							
							<tr class="gradeX odd active" role="row">
								<td>
									<div class="checker"><span class="checked"><input type="checkbox" value="1" class="checkboxes"></span></div>
								</td>
								<td class="sorting_1">
									 weep
								</td>
								<td>
									<a href="mailto:userwow@gmail.com">
									good@gmail.com </a>
								</td>
								<td>
									 20
								</td>
								<td class="center">
									 19.11.2010
								</td>
								<td>
									<span class="label label-sm label-success">
									Approved </span>
								</td>
							</tr><tr class="gradeX even active" role="row">
								<td>
									<div class="checker"><span class="checked"><input type="checkbox" value="1" class="checkboxes"></span></div>
								</td>
								<td class="sorting_1">
									 weep
								</td>
								<td>
									<a href="mailto:userwow@gmail.com">
									good@gmail.com </a>
								</td>
								<td>
									 20
								</td>
								<td class="center">
									 15.11.2011
								</td>
								<td>
									<span class="label label-sm label-default">
									Blocked </span>
								</td>
							</tr><tr class="gradeX odd" role="row">
								<td>
									<div class="checker"><span><input type="checkbox" value="1" class="checkboxes"></span></div>
								</td>
								<td class="sorting_1">
									 weep
								</td>
								<td>
									<a href="mailto:userwow@gmail.com">
									good@gmail.com </a>
								</td>
								<td>
									 20
								</td>
								<td class="center">
									 15.11.2011
								</td>
								<td>
									<span class="label label-sm label-success">
									Approved </span>
								</td>
							</tr><tr class="gradeX even" role="row">
								<td>
									<div class="checker"><span><input type="checkbox" value="1" class="checkboxes"></span></div>
								</td>
								<td class="sorting_1">
									 wap
								</td>
								<td>
									<a href="mailto:userwow@gmail.com">
									test@gmail.com </a>
								</td>
								<td>
									 20
								</td>
								<td class="center">
									 12.12.2012
								</td>
								<td>
									<span class="label label-sm label-success">
									Approved </span>
								</td>
							</tr><tr class="gradeX odd" role="row">
								<td>
									<div class="checker"><span><input type="checkbox" value="1" class="checkboxes"></span></div>
								</td>
								<td class="sorting_1">
									 vopl
								</td>
								<td>
									<a href="mailto:userwow@gmail.com">
									good@gmail.com </a>
								</td>
								<td>
									 20
								</td>
								<td class="center">
									 19.11.2010
								</td>
								<td>
									<span class="label label-sm label-success">
									Approved </span>
								</td>
							</tr></tbody>
							</table></div><div class="row"><div class="col-md-5 col-sm-12"><div class="dataTables_info" id="sample_1_info" role="status" aria-live="polite">Showing 1 to 5 of 25 entries</div></div><div class="col-md-7 col-sm-12"><div class="dataTables_paginate paging_bootstrap_full_number" id="sample_1_paginate"><ul class="pagination" style="visibility: visible;"><li class="prev disabled"><a title="First" href="#"><i class="fa fa-angle-double-left"></i></a></li><li class="prev disabled"><a title="Prev" href="#"><i class="fa fa-angle-left"></i></a></li><li class="active"><a href="#">1</a></li><li><a href="#">2</a></li><li><a href="#">3</a></li><li><a href="#">4</a></li><li><a href="#">5</a></li><li class="next"><a title="Next" href="#"><i class="fa fa-angle-right"></i></a></li><li class="next"><a title="Last" href="#"><i class="fa fa-angle-double-right"></i></a></li></ul></div></div></div></div>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>							
							


<div class="col-md-12">
					<!-- BEGIN EXAMPLE TABLE PORTLET-->
					<div class="portlet box blue">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-edit"></i>Editable Table
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="remove" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="table-toolbar">
								<div class="row">
									<div class="col-md-6">
										<div class="btn-group">
											<button class="btn green" id="sample_editable_1_new">
											Add New <i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
									<div class="col-md-6">
										<div class="btn-group pull-right">
											<button data-toggle="dropdown" class="btn dropdown-toggle">Tools <i class="fa fa-angle-down"></i>
											</button>
											<ul class="dropdown-menu pull-right">
												<li>
													<a href="javascript:;">
													Print </a>
												</li>
												<li>
													<a href="javascript:;">
													Save as PDF </a>
												</li>
												<li>
													<a href="javascript:;">
													Export to Excel </a>
												</li>
											</ul>
										</div>
									</div>
								</div>
							</div>
							<div id="sample_editable_1_wrapper" class="dataTables_wrapper no-footer"><div class="row"><div class="col-md-6 col-sm-12"><div class="dataTables_length" id="sample_editable_1_length"><label> <div class="select2-container form-control input-xsmall input-inline" id="s2id_autogen1"><a tabindex="-1" class="select2-choice" href="javascript:void(0)">   <span class="select2-chosen" id="select2-chosen-2">&nbsp;</span><abbr class="select2-search-choice-close"></abbr>   <span role="presentation" class="select2-arrow"><b role="presentation"></b></span></a><label class="select2-offscreen" for="s2id_autogen2"></label><input type="text" role="button" aria-haspopup="true" class="select2-focusser select2-offscreen" aria-labelledby="select2-chosen-2" id="s2id_autogen2"><div class="select2-drop select2-display-none select2-with-searchbox">   <div class="select2-search">       <label class="select2-offscreen" for="s2id_autogen2_search"></label>       <input type="text" aria-autocomplete="list" aria-expanded="true" role="combobox" class="select2-input" spellcheck="false" autocapitalize="off" autocorrect="off" autocomplete="off" aria-owns="select2-results-2" id="s2id_autogen2_search" placeholder="">   </div>   <ul role="listbox" class="select2-results" id="select2-results-2">   </ul></div></div><select name="sample_editable_1_length" aria-controls="sample_editable_1" class="form-control input-xsmall input-inline select2-offscreen" tabindex="-1" title=""><option value="5">5</option><option value="15">15</option><option value="20">20</option><option value="-1">All</option></select> records</label></div></div><div class="col-md-6 col-sm-12"><div id="sample_editable_1_filter" class="dataTables_filter"><label>Search:<input type="search" class="form-control input-small input-inline" placeholder="" aria-controls="sample_editable_1"></label></div></div></div><div class="table-scrollable"><table id="sample_editable_1" class="table table-striped table-hover table-bordered dataTable no-footer" role="grid" aria-describedby="sample_editable_1_info">
							<thead>
							<tr role="row"><th class="sorting_asc" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 175px;" aria-sort="ascending" aria-label="
									 Username
								: activate to sort column ascending">
									 Username
								</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 220px;" aria-label="
									 Full Name
								: activate to sort column ascending">
									 Full Name
								</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 118px;" aria-label="
									 Points
								: activate to sort column ascending">
									 Points
								</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 152px;" aria-label="
									 Notes
								: activate to sort column ascending">
									 Notes
								</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 84px;" aria-label="
									 Edit
								: activate to sort column ascending">
									 Edit
								</th><th class="sorting" tabindex="0" aria-controls="sample_editable_1" rowspan="1" colspan="1" style="width: 120px;" aria-label="
									 Delete
								: activate to sort column ascending">
									 Delete
								</th></tr>
							</thead>
							<tbody>
							
							
							
							
							
							
							<tr role="row" class="odd">
								<td class="sorting_1">
									 alex
								</td>
								<td>
									 Alex Nilson
								</td>
								<td>
									 1234
								</td>
								<td class="center">
									 power user
								</td>
								<td>
									<a href="javascript:;" class="edit">
									Edit </a>
								</td>
								<td>
									<a href="javascript:;" class="delete">
									Delete </a>
								</td>
							</tr><tr role="row" class="even">
								<td class="sorting_1">
									 gist124
								</td>
								<td>
									 Nick Roberts
								</td>
								<td>
									 62
								</td>
								<td class="center">
									 new user
								</td>
								<td>
									<a href="javascript:;" class="edit">
									Edit </a>
								</td>
								<td>
									<a href="javascript:;" class="delete">
									Delete </a>
								</td>
							</tr><tr role="row" class="odd">
								<td class="sorting_1">
									 goldweb
								</td>
								<td>
									 Sergio Jackson
								</td>
								<td>
									 132
								</td>
								<td class="center">
									 elite user
								</td>
								<td>
									<a href="javascript:;" class="edit">
									Edit </a>
								</td>
								<td>
									<a href="javascript:;" class="delete">
									Delete </a>
								</td>
							</tr><tr role="row" class="even">
								<td class="sorting_1">
									 lisa
								</td>
								<td>
									 Lisa Wong
								</td>
								<td>
									 434
								</td>
								<td class="center">
									 new user
								</td>
								<td>
									<a href="javascript:;" class="edit">
									Edit </a>
								</td>
								<td>
									<a href="javascript:;" class="delete">
									Delete </a>
								</td>
							</tr><tr role="row" class="odd">
								<td class="sorting_1"><input type="text" value="nick12" class="form-control input-small"></td>
								<td><input type="text" value="Nick Roberts" class="form-control input-small"></td>
								<td><input type="text" value="232" class="form-control input-small"></td>
								<td class="center"><input type="text" value="power user" class="form-control input-small"></td>
								<td><a href="" class="edit">Save</a></td>
								<td><a href="" class="cancel">Cancel</a></td>
							</tr><tr role="row" class="even">
								<td class="sorting_1">
									 webriver
								</td>
								<td>
									 Antonio Sanches
								</td>
								<td>
									 462
								</td>
								<td class="center">
									 new user
								</td>
								<td>
									<a href="javascript:;" class="edit">
									Edit </a>
								</td>
								<td>
									<a href="javascript:;" class="delete">
									Delete </a>
								</td>
							</tr></tbody>
							</table></div><div class="row"><div class="col-md-5 col-sm-12"><div class="dataTables_info" id="sample_editable_1_info" role="status" aria-live="polite">Showing 1 to 6 of 6 entries</div></div><div class="col-md-7 col-sm-12"><div class="dataTables_paginate paging_simple_numbers" id="sample_editable_1_paginate"><ul class="pagination"><li class="paginate_button previous disabled" aria-controls="sample_editable_1" tabindex="0" id="sample_editable_1_previous"><a href="#"><i class="fa fa-angle-left"></i></a></li><li class="paginate_button active" aria-controls="sample_editable_1" tabindex="0"><a href="#">1</a></li><li class="paginate_button next disabled" aria-controls="sample_editable_1" tabindex="0" id="sample_editable_1_next"><a href="#"><i class="fa fa-angle-right"></i></a></li></ul></div></div></div></div>
						</div>
					</div>
					<!-- END EXAMPLE TABLE PORTLET-->
				</div>




<div class="row">
													<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
														<div class="dashboard-stat blue">
															<div class="visual">
																<i class="fa fa-comments"></i>
															</div>
															<div class="details">
																<div class="number">
																	 1349
																</div>
																<div class="desc">
																	 New Feedbacks
																</div>
															</div>
															<a href="javascript:;" class="more">
															View more <i class="m-icon-swapright m-icon-white"></i>
															</a>
														</div>
													</div>
													<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
														<div class="dashboard-stat blue">
															<div class="visual">
																<i class="fa fa-shopping-cart"></i>
															</div>
															<div class="details">
																<div class="number">
																	 549
																</div>
																<div class="desc">
																	 New Orders
																</div>
															</div>
															<a href="javascript:;" class="more">
															View more <i class="m-icon-swapright m-icon-white"></i>
															</a>
														</div>
													</div>
													<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
														<div class="dashboard-stat blue">
															<div class="visual">
																<i class="fa fa-globe"></i>
															</div>
															<div class="details">
																<div class="number">
																	 +89%
																</div>
																<div class="desc">
																	 Brand Popularity
																</div>
															</div>
															<a href="javascript:;" class="more">
															View more <i class="m-icon-swapright m-icon-white"></i>
															</a>
														</div>
													</div>
													<div class="col-lg-3 col-md-3 col-sm-6 col-xs-12">
														<div class="dashboard-stat blue">
															<div class="visual">
																<i class="fa fa-bar-chart-o"></i>
															</div>
															<div class="details">
																<div class="number">
																	 12,5M$
																</div>
																<div class="desc">
																	 Total Profit
																</div>
															</div>
															<a href="javascript:;" class="more">
															View more <i class="m-icon-swapright m-icon-white"></i>
															</a>
														</div>
													</div>
												</div>


<div class="portlet green-meadow box">
						<div class="portlet-title">
							<div class="caption">
								<i class="fa fa-cogs"></i>Checkable Tree
							</div>
							<div class="tools">
								<a class="collapse" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="config" data-toggle="modal" href="#portlet-config" data-original-title="" title="">
								</a>
								<a class="reload" href="javascript:;" data-original-title="" title="">
								</a>
								<a class="remove" href="javascript:;" data-original-title="" title="">
								</a>
							</div>
						</div>
						<div class="portlet-body">
							<div class="tree-demo jstree jstree-2 jstree-default jstree-checkbox-selection" id="tree_2" role="tree" aria-activedescendant="j2_1"><ul class="jstree-container-ul jstree-children jstree-wholerow-ul jstree-no-dots"><li role="treeitem" aria-expanded="true" id="j2_1" class="jstree-node  jstree-open" aria-selected="true"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor" href="#"><i class="jstree-icon jstree-checkbox jstree-undetermined"></i><i class="jstree-icon jstree-themeicon fa fa-folder icon-state-warning icon-lg jstree-themeicon-custom"></i>Same but with checkboxes</a><ul role="group" class="jstree-children"><li role="treeitem" id="j2_2" class="jstree-node  jstree-leaf"><div unselectable="on" class="jstree-wholerow jstree-wholerow-clicked">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor  jstree-clicked" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-folder icon-state-warning icon-lg jstree-themeicon-custom"></i>initially selected</a></li><li role="treeitem" id="j2_3" class="jstree-node  jstree-leaf"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-warning icon-state-danger jstree-themeicon-custom"></i>custom icon</a></li><li role="treeitem" aria-expanded="true" id="j2_4" class="jstree-node  jstree-open"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-folder icon-state-default jstree-themeicon-custom"></i>initially open</a><ul role="group" class="jstree-children"><li role="treeitem" id="j2_5" class="jstree-node  jstree-leaf jstree-last"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-folder icon-state-warning icon-lg jstree-themeicon-custom"></i>Another node</a></li></ul></li><li role="treeitem" id="j2_6" class="jstree-node  jstree-leaf"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-warning icon-state-warning jstree-themeicon-custom"></i>custom icon</a></li><li role="treeitem" id="j2_7" class="jstree-node  jstree-leaf jstree-last"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor  jstree-disabled" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-check icon-state-success jstree-themeicon-custom"></i>disabled node</a></li></ul></li><li role="treeitem" id="j2_8" class="jstree-node  jstree-leaf jstree-last"><div unselectable="on" class="jstree-wholerow">&nbsp;</div><i class="jstree-icon jstree-ocl"></i><a class="jstree-anchor" href="#"><i class="jstree-icon jstree-checkbox"></i><i class="jstree-icon jstree-themeicon fa fa-folder icon-state-warning icon-lg jstree-themeicon-custom"></i>And wholerow selection</a></li></ul></div>
						</div>
					</div>











































							
							
							
							
							
																								
												
                        </form>
</rapid:override>
<rapid:override name="script">
<script src="${rs}/js/jquery.form.js"></script>
<script src="${rs}/js/plugins/validate/jquery.validate.min.js"></script>
<script src="${rs}/js/plugins/validate/messages_zh.min.js"></script>
<!-- Page-Level Scripts -->
<script type="text/javascript">
    
    $().ready(function () {
        $("#userForm").validate({
            submitHandler: function(form){
            	$("#userForm").ajaxSubmit({
                    url:'${ctx}/users/addUser',
                    dataType:'json',
                    type:'post',
                    success:function(data){
                        var code = data.code;
                        if(code == 0){
                            //toastr.success('用户新增成功');
                            form.reset();
                        }else{
                            toastr.error(data.msg);
                        }
                    },
                    error:function(html){
                        alert("提交数据失败，代码:" +html.status+ "，请稍候再试");
                  
                    }
                });

                return false; //不刷新页面 
            },
            rules: {
                USERCODE: { required: true },
                USERNAME: { required: true }
                
            },
            messages: {
            	USERCODE: { required: "请输入您的用户名" },
            	USERNAME: { required: "请输入您的姓名" }
            }
        });
    });

</script>
</rapid:override>
<%@ include file="../template/base.jsp"  %>