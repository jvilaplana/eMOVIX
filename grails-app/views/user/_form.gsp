<%@ page import="com.jordiv.emovix.core.User"%>

<div class="form-group ${hasErrors(bean: userInstance, field: 'username', 'error')} required">
	<label for="username">Email address <span class="required-indicator">*</span></label> <input type="email"
		class="form-control" id="username" name="username" required="" value="${userInstance?.username}"
		placeholder="Enter email">
</div>
<div class="form-group ${hasErrors(bean: userInstance, field: 'fullName', 'error')} required">
	<label for="fullName">Full name <span class="required-indicator">*</span></label> <input type="text"
		class="form-control" id="fullName" name="fullName" placeholder="Enter your full name" required=""
		value="${userInstance?.fullName}">
</div>
<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password">Password <span class="required-indicator">*</span></label> <input type="password"
		class="form-control" id="password" name="password" placeholder="Password" required=""
		value="${userInstance?.password}">
</div>
<div class="form-group ${hasErrors(bean: userInstance, field: 'password', 'error')} required">
	<label for="password2">Repeat password <span class="required-indicator">*</span></label> <input type="password"
		class="form-control" id="password2" name="password2" placeholder="Repeat password" required="">
</div>
