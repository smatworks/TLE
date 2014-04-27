<%@page import="net.smartworks.rice.model.SensorReport"%>
<%@page import="net.smartworks.util.SmartUtil"%>
<%@page import="net.smartworks.common.Order"%>
<%@page import="net.smartworks.model.SortingField"%>
<%@page import="net.smartworks.rice.model.TestReport"%>
<%@page import="net.smartworks.rice.model.TestReportCond"%>
<%@page import="net.smartworks.rice.manager.IUiManager"%>
<%@page import="net.smartworks.factory.ManagerFactory"%>
<%@page import="net.smartworks.model.RequestParams"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%

	String reportId = request.getParameter("reportId");	
	IUiManager mgr = ManagerFactory.getInstance().getUiManager();
	TestReport report = mgr.getTestReportWithSensorReports(reportId);
%>

<div class="list_title_space" style="margin-top:20px">
	<div class="title">테스트 상세정보</div>
</div>
<div class="list_contents border" style="padding: 10px">
	<table>
		<tbody>
			<tr>
				<td width="30%" class="tl"><span style="color: #23579e;font-weight: bold;">로트 넘버 : </span><%=report.getLotNo() %></td>
				<td width="30%" class="tl"><span style="color: #23579e;font-weight: bold;">날짜/시간 : </span><%=SmartUtil.printDateTime(report.getDateTime()) %></td>
			</tr>
			<tr>
				<td width="30%" class="tl"><span style="color: #23579e;font-weight: bold;">검사 수량 : </span><%=report.getTotalTestCount() %></td>
				<td width="30%" class="tl"><span style="color: #23579e;font-weight: bold;">양품 수량 : </span><%=report.getFairQualityCount() %></td>
			</tr>
			<tr>
				<td width="30%" class="tl"><span style="color: #23579e;font-weight: bold;">불량 수량 : </span><%=report.getFaultCount() %></td>
				<td width="70%"></td>
			</tr>
		</tbody>
	</table>
	<!-- 목록 테이블 -->
	<table>
		<%	
		if (!SmartUtil.isBlankObject(report.getSensorReports())) {
		%>
		
			<tr class="tit_bg">
		 		<th class="r_line" style="border-top:none">센서</th>
		 		<th class="r_line" style="border-top:none">판정 코드</th>
		 		<th class="r_line" style="border-top:none">판정 내용</th>
		 		<th class="r_line" style="border-top:none">실내 온도</th>
		 		<th class="r_line" style="border-top:none">유리 온도</th>
		 		<th class="r_line" style="border-top:none">실내 습도</th>
		 		<th style="border-top:none">시리얼 넘버</th>
			</tr>	
		<%
			for (SensorReport sensorReport : report.getSensorReports()) {
			%>
				<tr>
					<td><%=sensorReport.getSensorNo() %></td>
					<td><%=sensorReport.getDecisionCode() %></td>
					<td><%=sensorReport.getDecisionCodeDesc() %></td>
					<td class="tr"><%=sensorReport.getIndoorTemperature() %></td>
					<td class="tr"><%=sensorReport.getGlassTemperature() %></td>
					<td class="tr"><%=sensorReport.getIndoorHumidity() %></td>
					<td><%=sensorReport.getSerialNo() %></td>
				</tr>
		<%
			}
		}else {
		%>
			<tr class="tit_bg">
		 		<th class="r_line" style="border-top:none">센서</th>
		 		<th class="r_line" style="border-top:none">판정 코드</th>
		 		<th class="r_line" style="border-top:none">판정 내용</th>
		 		<th class="r_line" style="border-top:none">실내 온도</th>
		 		<th class="r_line" style="border-top:none">유리 온도</th>
		 		<th class="r_line" style="border-top:none">실내 습도</th>
		 		<th style="border-top:none">시리얼 넘버</th>
			</tr>	
		<%
		}
		%>
	</table>
	<%
	if(SmartUtil.isBlankObject(report.getSensorReports())){
	%>
		<div class="tc mt5mb5">불량 데이터가 존재하지 않습니다.</div>
	<%
	}
	%>
</div>