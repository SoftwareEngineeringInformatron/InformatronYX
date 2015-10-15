<%-- 
    Document   : mainPageModals
    Created on : 10 15, 15, 11:55:11 AM
    Author     : ian
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<div id="message" class="modal hide fade" tabindex="-1" data-width="760">
                    <div class="modal-center">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                            <span class="popup">Error Message</span>
                        </div>
                        <div class="modal-body">
                            <div class="row-fluid">
                                <div class="span10 offset1">
                                    <label class="file-action">
                                    </label>
                                </div>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <div class="row-fluid">
                                <div class="span10 offset1">
                                    <button type="button" data-dismiss="modal" class="btn btn-primary">&nbsp;&nbsp;Ok&nbsp;&nbsp;</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--  evaluation -->
                
                <div id="purchase" class="modal hide fade" tabindex="-1" data-width="1000" >
    <div class="modal-center">
        <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
            <span class="popup">Purchase LO</span>
        </div>
        <div class="modal-body">
            <div class="row-fluid">
                <div class="">
                    <div class="few-details">
                        <h5>LO Title:</h5> <p ng-model="lotitle">{{lotitle}}</p>
                        <h5>LO ID:</h5> <p ng-model="loid">{{loid}}</p>
                        <h5>LO Description:</h5> <p ng-model="lodescription">{{lodescription}}</p>
                        <h5>LO Price:</h5> <p ng-model="loprice">{{loprice}}</p>                                
                    </div>                            
                </div>
            </div>
        </div>
        <div class="modal-footer">
            <div class="row-fluid">
                <div class="span10 offset1">
                    <button type="button" data-dismiss="modal" class="btn btn-primary" href="download" ng-click="purchaseLO()">&nbsp;&nbsp;Ok&nbsp;&nbsp;</button>
                </div>
            </div>
        </div>
    </div>
</div>
