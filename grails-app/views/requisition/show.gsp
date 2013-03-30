
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
        <meta name="layout" content="custom" />
        <g:set var="entityName" value="${warehouse.message(code: 'requisition.label', default: 'Requisition').toLowerCase()}" />
        <title><warehouse:message code="default.view.label" args="[entityName]" /></title>
    </head>
    <body>
        <div class="body">
            <g:if test="${flash.message}">
	            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
            
                <g:render template="summary" model="[requisition:requisition]"/>


                <div class="yui-gd">
                    <div class="yui-u first">
                        <g:render template="header" model="[requisition:requisition]"/>
                    </div>
                    <div class="yui-u">
                        <div id="tabs-details">
                            <div class="box">
                                <h3><warehouse:message code="requisition.show.label"/></h3>
                                <table>
                                    <thead>
                                        <tr class="odd">
                                            <th><warehouse:message code="requisition.progressBar.label" /></th>
                                            <th><warehouse:message code="requisition.progressPercentage.label" /></th>
                                            <th><warehouse:message code="product.label" /></th>
                                            <th class="right"><warehouse:message code="requisition.quantity.label" /></th>
                                            <th class="right"><warehouse:message code="picklist.quantity.label" /></th>
                                            <th class="right"><warehouse:message code="requisitionItem.quantityCanceled.label" /></th>
                                            <th class="right"><warehouse:message code="requisition.quantityRemaining.label" /></th>
                                            <th><warehouse:message code="product.uom.label" /></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <g:if test="${requisition?.requisitionItems?.size() == 0}">
                                            <tr class="prop odd">
                                                <td colspan="8" class="center"><warehouse:message
                                                        code="requisition.noRequisitionItems.message" /></td>
                                            </tr>
                                        </g:if>
                                        <g:each var="requisitionItem"
                                            in="${requisition?.requisitionItems}" status="i">
                                            <g:set var="quantityRemaining"
                                                value="${(requisitionItem?.quantity?:0)-(requisitionItem?.calculateQuantityPicked()?:0)}" />
                                            <tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
                                                <td>
                                                    <g:set var="value" value="${((requisitionItem?.calculateQuantityPicked()?:0)+(requisitionItem?.quantityCanceled?:0))/(requisitionItem?.quantity?:1) * 100 }" />
                                                    <div id="progressbar-${requisitionItem?.id }" class="progressbar" style="width: 100px;"></div>
                                                    <script type="text/javascript">
                                                        $(function() {
                                                            $( "#progressbar-${requisitionItem?.id }" ).progressbar({value: ${value}});
                                                        });
                                                    </script>
                                                </td>
                                                <td>
                                                    ${value }
                                                </td>
                                                <td class="product">
                                                    <g:link controller="inventoryItem" action="showStockCard" id="${requisitionItem?.product?.id }">
                                                    <format:metadata
                                                        obj="${requisitionItem?.product?.name}" /></g:link>

                                                    <g:if test="${requisitionItem?.productPackage}"></g:if>
                                                    ${requisitionItem?.productPackage}
                                                </td>
                                                <td class="quantity right">
                                                    ${requisitionItem?.quantity}
                                                </td>
                                                <td class="quantityPicked right">
                                                    ${requisitionItem?.calculateQuantityPicked()?:0}
                                                </td>
                                                <td class="quantityCanceled right">
                                                    ${requisitionItem?.quantityCanceled?:0}
                                                </td>
                                                <td class="quantityRemaining right">
                                                    ${quantityRemaining }
                                                </td>
                                                <td>
                                                    ${requisitionItem?.product.unitOfMeasure?:"EA" }
                                                </td>
                                            </tr>
                                        </g:each>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="clear"></div>
                        <div class="buttons">
                            <div class="center">
                                <g:link controller="requisition" action="list" class="button">
                                    <warehouse:message code="default.button.back.label"/>
                                </g:link>

                                <g:link controller="requisition" action="edit" id="${requisition.id }" class="button">
                                    <warehouse:message code="default.button.next.label"/>
                                </g:link>
                            </div>
                        </div>
                    </div>
                </div>
			</div>
		</div>
         
    </body>
</html>
