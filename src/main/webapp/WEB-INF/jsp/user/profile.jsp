<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tagLib.jsp"%>

<div class="container">
	<div class="m-grid__item m-grid__item--fluid m-wrapper">
		<div class="m-subheader ">
			<div class="d-flex align-items-center">
				<div class="mr-auto">
					<h3 class="m-subheader__title">
						My Profile
					</h3>
				</div>
			</div>
		</div>
		<div class="m-content">
			<div class="row">
				<div class="col-xl-12">
					<div class="m-portlet m-portlet--full-height">
						<form class="m-form m-form--fit m-form--label-align-right">
							<div class="m-portlet__body">
								<div class="form-group m-form__group row">
									<div class="col-9 ml-auto">
										<h3 class="m-form__section">
											1. Personal Details
										</h3>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										Full Name
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="Mark Andre">
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										Occupation
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="CTO">
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										Company Name
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="Keenthemes">
										<span class="m-form__help">
											If you want your invoices addressed to a company. Leave blank to use your full name.
										</span>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										Phone No.
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="+456669067890">
									</div>
								</div>
								<div class="m-form__seperator m-form__seperator--dashed m-form__seperator--space-2x"></div>
								<div class="form-group m-form__group row">
									<div class="col-9 ml-auto">
										<h3 class="m-form__section">
											2. Address
										</h3>
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										Address
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="L-12-20 Vertex, Cybersquare">
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										City
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="San Francisco">
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										State
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="California">
									</div>
								</div>
								<div class="form-group m-form__group row">
									<label for="example-text-input" class="col-3 col-form-label">
										Postcode
									</label>
									<div class="col-6">
										<input class="form-control m-input" type="text" value="45000">
									</div>
								</div>
							</div>
							<div class="m-portlet__foot m-portlet__foot--fit">
								<div class="m-form__actions text-center"> 
									<button type="reset" class="btn btn-accent m-btn m-btn--air m-btn--custom">
										Save changes
									</button>
									&nbsp;&nbsp;
									<button type="reset" class="btn btn-secondary m-btn m-btn--air m-btn--custom">
										Cancel
									</button>
								</div>
							</div>
						</form>		
					</div>
				</div>
			</div>
		</div>
	</div>
</div>