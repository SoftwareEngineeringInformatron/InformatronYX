<%-- 
    Document   : superadminModals
    Created on : Oct 12, 2015, 9:56:54 AM
    Author     : Ted Ian Osias
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Mass Super Admin Action -->
        <!-- All Account Action -->
        <div id="allAccountMass" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected admin account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="demoteAdmins()"><i class="icon-large icon-arrow-down default"></i> Demote Admin(s)</button>        
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#changeFunctionMass" data-toggle="modal" data-dismiss="modal"><i class="icon-edit icon-large default"></i> Change Admin(s) Function</button>          
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmins()"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Change Function Action -->
        <div id="changeFunctionMass" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">Please choose a function:
                                <select ng-model="ftype">
                                        <option value="0" selected>--Choose function type--</option>
                                        <option value="2">Approval Admin</option>
                                        <option value="3">Metering Admin</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="changeFunctionTypeAdmins(ftype)"><i class="icon-edit icon-large default"></i> Change Function</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Block Account Action for Inactive -->
        <div id="inactiveMass" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected expired account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmins()"><i class="icon-ban-circle icon-large default"></i> Block Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unblock Account  for Blocked-->
        <div id="blockMass" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with the selected blocked account(s)?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockAdmins()"><i class="icon-check icon-large default"></i> Unblock Account(s)</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        
        
        
        
        
        
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
        <!-- Admin Actions -->

        <!-- All Account Action -->
        <div id="allAccount" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this admin account?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="demoteAdmin()"><i class="icon-large icon-arrow-down default"></i> Demote Admin</button>        
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" class="btn btn-primary" href="#changeFunction" data-toggle="modal" data-dismiss="modal"><i class="icon-edit icon-large default"></i> Change Admin Function</button>          
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmin()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Change Function Action -->
        <div id="changeFunction" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">Please choose a function:
                                <select ng-model="ftype">
                                    <option value="0" selected>--Choose function type--</option>
                                        <option value="2">Approval Admin</option>
                                        <option value="3">Metering Admin</option>
                                </select>
                            </label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="changeFunctionTypeAdmin(ftype)"><i class="icon-edit icon-large default"></i> Change Function</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Block Account Action for Inactive -->
        <div id="inactive" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this expired account?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="blockAdmin()"><i class="icon-ban-circle icon-large default"></i> Block Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Unblock Account  for Blocked-->
        <div id="block" class="modal hide fade" tabindex="-1" data-width="760">
            <div class="modal-center">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                    <span class="popup">Super Admin Action</span>
                </div>
                <div class="modal-body">
                    <div class="row-fluid">
                        <div class="span10 offset1">
                            <label class="file-action">What would you like to do with this blocked account?</label>
                        </div>
                    </div>
                </div>
                <div class="modal-footer">
                    <div class="row-fluid">
                        <div class="span9 offset2">
                            <button type="button" data-dismiss="modal" class="btn btn-primary" ng-click="unblockAdmin()"><i class="icon-check icon-large default"></i> Unblock Account</button>
                            <button type="button" data-dismiss="modal" class="btn btn-cancel"></i> Cancel</button>
                            <input type="hidden" id="selectedIndex" name="index" value="0"/>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <!-- Add Account Action -->
        <div id="addAccount" class="modal hide fade" tabindex="-1" data-width="760">
            <form name="addAcc">
                <div class="modal-center">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-hidden="true">×</button>
                        <span class="popup">Add Account</span>
                    </div>
                    <div class="modal-body">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <label class="file-action">Please fill in the textfields<br>
                                <br><input type="text" size="20" placeholder="First Name" required ng-model="userInfo.firstName">
                                <br><input type="text" size="20" placeholder="Last Name" required ng-model="userInfo.lastName">
                                <br><select ng-model="userInfo.functionType">
                                        <option value="0" selected>--Choose function type--</option>
                                        <option value="2">Approval Admin</option>
                                        <option value="3">Metering Admin</option>
                                        <option value="4">Super Administrator</option>
                                    </select>
                                <div class="divider"></div>
                                <br><input type="text" size="20" placeholder="Username" required ng-model="userInfo.username">
                                <br><input type="password" size="20" placeholder="Password" required ng-model="userInfo.password">
                                <br><input type="password" size="20" placeholder="Confirm Password" required ng-model="confirmPassword">
                                    <h6 ng-if="errorList.length > 0">Error(s)</h6>
                                    <ul>
			            	<li ng-repeat = "error in errorList">{{error}}</li>
			            </ul>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="modal-footer">
                        <div class="row-fluid">
                            <div class="span10 offset1">
                                <button ng-disabled="error.length > 0" type="submit" class="btn btn-primary" ng-click="addUser()"><i class="icon-plus-sign-alt icon-large default"></i> Add</button>
                                <button type="button" data-dismiss="modal" class="btn btn-cancel"> Cancel</button>
                            </div>
                        </div>
                    </div>
                </div>
            </form>
        </div>