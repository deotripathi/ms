
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<meta name="layout" content="custom" />
	<g:set var="entityName" value="${message(code: 'shipment.label', default: 'Shipment')}" />
	<title><g:message code="default.show.label" args="[entityName]" /></title>        
	<!-- Specify content to overload like global navigation links, page titles, etc. -->
	<content tag="pageTitle">Show Shipment</content>
</head>

<body>    
	<div class="body">
		<g:if test="${flash.message}">
			<div class="message">${flash.message}</div>
		</g:if>
				
		<table>
			<tr>
				<td width="75%">
					<g:form action="deleteShipment" method="post">				
						<fieldset>
							<g:render template="summary"/>						
							<g:hiddenField name="id" value="${shipmentInstance?.id}" />
							<g:hiddenField name="version" value="${shipmentInstance?.version}" />

							<div id="details" class="section">
								<table cellspacing="5" cellpadding="5">
									<tbody>
										<tr class="prop">
											<td valign="top" class="name"><label><g:message
												code="shipment.name.label" default="Shipment Number" /></label>
											</td>
											<td colspan="3" valign="top"
												class="value ${hasErrors(bean: shipmentInstance, field: 'name', 'errors')}">
												<span style="line-height: 1.5em">${shipmentInstance?.shipmentNumber}</span>
											</td>
										</tr>
										<tr class="prop">
											<td valign="middle" class="name"><label><g:message
												code="shipment.shipmentType.label" default="Type" /></label></td>
											<td valign="middle" class="value" nowrap="nowrap">
												${shipmentInstance?.shipmentType?.name}
											</td>
										</tr>							
										<tr class="prop">
											<td valign="top" class="name"><label><g:message
												code="shipment.name.label" default="Nickname" /></label>
											</td>
											<td colspan="3" valign="top"
												class="value ${hasErrors(bean: shipmentInstance, field: 'name', 'errors')}">
												${shipmentInstance?.name}
											</td>
										</tr>									
										<tr class="prop">
											<td class="name"></td>
											<td class="value">
												Are you sure you want to delete this shipment?
												<div class="buttons">
													<button type="submit" class="positive"><img
													src="${createLinkTo(dir:'images/icons/silk',file:'tick.png')}"
													alt="Save" /> Delete</button>
													
													<g:link controller="shipment" action="showDetails" id="${shipmentInstance.id}">
														<img src="${createLinkTo(dir:'images/icons/silk',file:'cancel.png')}"
														alt="Cancel" /> Cancel</g:link>
													
												</div>
												
											</td>
										</tr>
									</tbody>
								</table>
							</div>
						</fieldset>
					</g:form>
				</td>		
				<td width="20%">				
					<g:render template="sidebar" />
				</td>	
			</tr>
		</table>
	</div>
</body>
</html>