
<%@page import="com.hospital.dto.Doctor"%>
<%@page import="com.hospital.dto.Appoint"%>
<%@page import="java.util.List"%>
<%@page import="com.hospital.dao.DoctorDao"%>
<%@page import="com.hospital.service.DbConnect"%>
<%@page import="com.hospital.dao.AppointDao"%>
<%@page import="com.hospital.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="Component/css.jsp"%>


<style type="text/css">
.paint-card {
	box-shadow: 0 0 10px 0 rgba(0, 0, 0, 0.3);
}
.backImg {
	background: linear-gradient(rgba(0, 0, 0, .4), rgba(0, 0, 0, .4)),
		url("img/varun4.jpg");
	height: 20vh;
	width: 100%;
	background-size: 1400px 200px;
	background-repeat: no-repeat;
}
</style>

</head>
<body>

	 <%-- <c:if test="${empty userObj }">
		<c:redirect url="User.jsp"></c:redirect>
	</c:if>  --%>
	<%@include file="Component/navbar.jsp"%>
	
	<div class="container-fulid backImg p-5">
		<p class="text-center fs-2 text-white"></p>
	</div>
	<div class="container p-3">
		<div class="row">
			<div class="col-md-9">
				<div class="card paint-card">
					<div class="card-body">
						<p class="fs-4 fw-bold text-center text-success">Appointment
							List</p>
						<table class="table">
							<thead>
								<tr>
									<th scope="col">Full Name</th>
									<th scope="col">Gender</th>
									<th scope="col">Age</th>
									<th scope="col">Appoint Date</th>
									<th scope="col">Diseases</th>
									<th scope="col">Doctor Name</th>
									<th scope="col">Status</th>

								</tr>
							</thead>
							<tbody>
								<%
								User user = (User) session.getAttribute("userObj");
								AppointDao dao = new AppointDao(DbConnect.getConn());
								DoctorDao dao2 = new DoctorDao(DbConnect.getConn());
								List<Appoint> list = dao.getAllAppointmentByLoginUser(user.getId());
								for (Appoint ap : list) {
									Doctor d = dao2.getDoctorById(ap.getDoctorId());
								%>
								<tr>
									<th><%=ap.getFullName()%></th>
									<td><%=ap.getGender()%></td>
									<td><%=ap.getAge()%></td>
									<td><%=ap.getAppoinDate()%></td>
									<td><%=ap.getDiseases()%></td>
									<td><%=d.getFullname()%></td>
									<td>
										<%
										if ("Pending".equals(ap.getStatus())) {
										%> <a href="#" class="btn btn-sm btn-warning">Pending</a> <%
                } else {  %>
                             <%=ap.getStatus()%> 
                          
                          <% }  %>
									</td>
								</tr>
								<%
								}
								%>



							</tbody>
						</table>

					</div>
				</div>
			</div>

			<div class="col-md-3 p-0">
				<img alt="" src="img/doct.png">
			</div>
		</div>
	</div>
<%@include file="Component/foot.jsp"%>
</body>
</html>