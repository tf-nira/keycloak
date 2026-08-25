<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">

        <style>

            html, body {
                margin: 0 !important;
                padding: 0 !important;
            }

            #kc-header {
                display: none !important;
            }

            .login-pf-header {
                display: none !important;
            }

            .card-pf {
                max-width: 100% !important;
                width: 100% !important;
                margin: 0 !important;
                padding: 0 !important;
                box-shadow: none !important;
                border-top: 0 !important;
            }

            #kc-content,
            #kc-content-wrapper {
                width: 100% !important;
            }

            .login-pf-page {
                width: 100% !important;
                margin: 0 !important;
                padding: 0 !important;
            }

            .kc-pms-page {
                width: 100%;
                min-height: 100vh;
                background: #ffffff;
                box-sizing: border-box;
                padding: 16px 40px 40px 40px;
            }

            .kc-pms-header {
                display: flex;
                align-items: center;
                justify-content: flex-start;
                padding: 8px 0 4px 0;
            }

            .kc-pms-logo {
                height: 48px;
                display: block;
            }

            .kc-pms-title {
                font-size: 28px;
                font-weight: 700;
                color: #1a1a1a;
                margin: 12px 0 20px 0;
            }

            .kc-pms-section {
                border: 1px solid #e0e0e0;
                border-radius: 10px;
                padding: 20px 28px 6px 28px;
                margin-bottom: 16px;
                background: #ffffff;
            }

            .kc-pms-section .kc-pms-section-title {
                font-size: 18px;
                font-weight: 700;
                color: #1a1a1a;
                margin: 0 0 20px 0;
            }

            .kc-pms-grid {
                display: grid;
                grid-template-columns: repeat(3, 1fr);
                column-gap: 32px;
            }

            .kc-pms-grid .form-group {
                margin-bottom: 14px;
            }

            .kc-pms-grid .form-group label {
                font-weight: 700;
                font-size: 14px;
                color: #333333;
                margin-bottom: 6px;
                display: inline-block;
            }

            .kc-pms-grid .form-group input,
            .kc-pms-grid .form-group select {
                width: 100%;
                box-sizing: border-box;
                padding: 10px 12px;
                border: 1px solid #cccccc;
                border-radius: 6px;
                font-size: 14px;
                background-color: #ffffff;
            }

            .kc-pms-actions {
                display: flex;
                justify-content: flex-end;
                gap: 16px;
                margin-top: 8px;
            }

            .kc-pms-actions .kc-pms-btn-back {
                background: #ffffff;
                color: #d6006c;
                border: 1.5px solid #d6006c;
                border-radius: 6px;
                padding: 12px 28px;
                font-size: 15px;
                font-weight: 600;
                cursor: pointer;
                text-decoration: none;
                display: inline-flex;
                align-items: center;
            }

            .kc-pms-actions .kc-pms-btn-register {
                background: #d6006c;
                color: #ffffff;
                border: 1.5px solid #d6006c;
                border-radius: 6px;
                padding: 12px 32px;
                font-size: 15px;
                font-weight: 700;
                cursor: pointer;
            }

            .kc-pms-field-error {
                display: block;
                color: #cc0000;
                font-size: 12px;
                margin-top: 4px;
            }

            .kc-pms-grid .form-group input.kc-pms-input-error,
            .kc-pms-grid .form-group select.kc-pms-input-error {
                border-color: #cc0000;
            }

            #kc-content-wrapper > .alert,
            #kc-content-wrapper .alert,
            #kc-content > .alert,
            #kc-content .alert,
            .alert-error,
            .alert-warning,
            .alert-success,
            .alert-info,
            #kc-content-wrapper #kc-error-message,
            #kc-content #kc-error-message,
            .kc-feedback-text,
            #kc-content-wrapper .pf-c-alert,
            #kc-content .pf-c-alert {
                display: none !important;
            }

            #kc-form-options {
                display: none;
            }

            @media (max-width: 900px) {
                .kc-pms-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>

        <div class="kc-pms-page">

            <div class="kc-pms-header">
                <img class="kc-pms-logo" src="${url.resourcesPath}/img/nira_logo.png" alt="NIRA" />
            </div>

            <h2 class="kc-pms-title">Partner Registration</h2>

            <form id="kc-register-form" class="${properties.kcFormClass!}" action="${url.registrationAction}" method="post">

                <!-- Organization Information -->
                <div class="kc-pms-section">
                    <div class="kc-pms-section-title">Organization Information</div>
                    <div class="kc-pms-grid">

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('firstName',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="firstName" class="${properties.kcLabelClass!}">${msg("firstName")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="firstName" class="${properties.kcInputClass!}<#if messagesPerField.existsError('firstName')> kc-pms-input-error</#if>" name="firstName" value="${(register.formData.firstName!'')}" required pattern="[A-Za-z0-9]+" maxlength="50" title="Only alphanumeric characters are allowed" oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '')" />
                                <#if messagesPerField.existsError('firstName')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('firstName'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="lastName" class="${properties.kcInputClass!}<#if messagesPerField.existsError('lastName')> kc-pms-input-error</#if>" name="lastName" value="${(register.formData.lastName!'')}" required pattern="[A-Za-z0-9]+" maxlength="50" title="Only alphanumeric characters are allowed" oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '')" />
                                <#if messagesPerField.existsError('lastName')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('lastName'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('langCode',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="langCode" class="${properties.kcLabelClass!}">Language Code</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <select
                                    id="user.attributes.langCode"
                                    class="${properties.kcInputClass!}"
                                    name="user.attributes.langCode"
                                    value="${(register.formData['user.attributes.langCode']!'')}"
                                    required>
                                        <option value="eng" selected>English</option>
                                </select>
                                <#if messagesPerField.existsError('langCode')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('langCode'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('organizationName',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="organizationName" class="${properties.kcLabelClass!}">${msg("organizationName")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="organizationName" class="${properties.kcInputClass!}<#if messagesPerField.existsError('organizationName')> kc-pms-input-error</#if>" name="user.attributes.organizationName" value="${(register.formData['user.attributes.organizationName']!'')}" autocomplete="organizationName" required pattern="[A-Za-z0-9]+" maxlength="100" title="Only alphanumeric characters are allowed" oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '')" />
                                <#if messagesPerField.existsError('organizationName')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('organizationName'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="email" class="${properties.kcInputClass!}<#if messagesPerField.existsError('email')> kc-pms-input-error</#if>" name="email" value="${(register.formData.email!'')}" autocomplete="email" required />
                                <#if messagesPerField.existsError('email')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('email'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('phoneNumber',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="phoneNumber" class="${properties.kcLabelClass!}">${msg("phoneNumber")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="phoneNumber" class="${properties.kcInputClass!}<#if messagesPerField.existsError('phoneNumber')> kc-pms-input-error</#if>" name="user.attributes.phoneNumber" value="${(register.formData['user.attributes.phoneNumber']!'')}" autocomplete="phoneNumber" required pattern="[0-9]{9,11}" minlength="9" maxlength="11" inputmode="numeric" title="Phone number must contain 9 to 11 digits" oninput="this.value = this.value.replace(/[^0-9]/g, '').slice(0, 11)" />
                                <#if messagesPerField.existsError('phoneNumber')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('phoneNumber'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('address',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="address" class="${properties.kcLabelClass!}">${msg("address")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="address" class="${properties.kcInputClass!}<#if messagesPerField.existsError('address')> kc-pms-input-error</#if>" name="user.attributes.address" value="${(register.formData['user.attributes.address']!'')}" autocomplete="address" required />
                                <#if messagesPerField.existsError('address')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('address'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Partner Classification -->
                <div class="kc-pms-section">
                    <div class="kc-pms-section-title">Partner Classification</div>
                    <div class="kc-pms-grid">

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('partnerType',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="partnerType" class="${properties.kcLabelClass!}">${msg("partnerType")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <select
                                    id="user.attributes.partnerType"
                                    class="${properties.kcInputClass!}"
                                    name="user.attributes.partnerType"
                                    value="${(register.formData['user.attributes.partnerType']!)}"
                                    required>
                                        <option value=""></option>
                                        <option value="DEVICE_PROVIDER">Device Provider</option>
                                        <option value="FTM_PROVIDER">FTM Provider</option>
                                        <option value="AUTH_PARTNER">Authentication Partner</option>
                                        <option value="CREDENTIAL_PARTNER">Credential Partner or ISP</option>
                                        <option value="ABIS_PARTNER">ABIS Partner</option>
                                        <option value="SDK_PARTNER">SDK Partner</option>
                                </select>
                                <#if messagesPerField.existsError('partnerType')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('partnerType'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div id="partnerAuthTypeDiv" class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('partnerAuthType',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="partnerAuthType" class="${properties.kcLabelClass!}">NIRA Partner Type</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <select
                                    id="user.attributes.partnerAuthType"
                                    class="${properties.kcInputClass!}"
                                    name="user.attributes.partnerAuthType"
                                    value="${(register.formData['user.attributes.partnerAuthType']!)}"
                                    required>
                                        <option value=""></option>
                                        <option value="ACCESS">ACCESS</option>
                                        <option value="VERIFY">VERIFY</option>
                                </select>
                                <#if messagesPerField.existsError('partnerAuthType')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('partnerAuthType'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div id="partnerGroupDiv" class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('partnerGroup',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="partnerGroup" class="${properties.kcLabelClass!}">NIRA Partner Group</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <select
                                    id="user.attributes.partnerGroup"
                                    class="${properties.kcInputClass!}"
                                    name="user.attributes.partnerGroup"
                                    value="${(register.formData['user.attributes.partnerGroup']!)}"
                                    required>
                                        <option value=""></option>
                                        <option value="GOV">GOV</option>
                                        <option value="PRIVATE">PRIVATE</option>
                                        <option value="FOREIGN">FOREIGN</option>
                                </select>
                                <#if messagesPerField.existsError('partnerGroup')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('partnerGroup'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                    </div>
                </div>

                <!-- Account Information -->
                <div class="kc-pms-section">
                    <div class="kc-pms-section-title">Account Information</div>
                    <div class="kc-pms-grid">

                      <#if !realm.registrationEmailAsUsername>
                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('username',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="username" class="${properties.kcLabelClass!}">${msg("username")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="username" class="${properties.kcInputClass!}<#if messagesPerField.existsError('username')> kc-pms-input-error</#if>" name="username" value="${(register.formData.username!'')}" autocomplete="username" required pattern="[A-Za-z0-9]+" maxlength="50" title="Only alphanumeric characters are allowed" oninput="this.value = this.value.replace(/[^A-Za-z0-9]/g, '')" />
                                <#if messagesPerField.existsError('username')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('username'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>
                      </#if>

                        <#if passwordRequired??>
                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password" class="${properties.kcInputClass!}<#if messagesPerField.existsError('password')> kc-pms-input-error</#if>" name="password" autocomplete="new-password" required/>
                                <#if messagesPerField.existsError('password')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('password'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password-confirm" class="${properties.kcInputClass!}<#if messagesPerField.existsError('password-confirm')> kc-pms-input-error</#if>" name="password-confirm" required />
                                <#if messagesPerField.existsError('password-confirm')>
                                    <span class="kc-pms-field-error">${kcSanitize(messagesPerField.get('password-confirm'))?no_esc}</span>
                                </#if>
                            </div>
                        </div>
                        </#if>

                    </div>

                    <#if recaptchaRequired??>
                    <div class="form-group">
                        <div class="${properties.kcInputWrapperClass!}">
                            <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}"></div>
                        </div>
                    </div>
                    </#if>
                </div>

                <div class="${properties.kcFormGroupClass!}">
                    <div id="kc-form-options" class="${properties.kcFormOptionsClass!}">
                        <div class="${properties.kcFormOptionsWrapperClass!}">
                            <span><a href="${url.loginUrl}">${kcSanitize(msg("backToLogin"))?no_esc}</a></span>
                        </div>
                    </div>

                    <div id="kc-form-buttons" class="kc-pms-actions">
                        <a href="${url.loginUrl}" class="kc-pms-btn-back">Back to Login</a>
                        <input class="kc-pms-btn-register" type="submit" value="${msg("doRegister")}"/>
                    </div>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {

                    const partnerType = document.getElementById("user.attributes.partnerType");
                    const partnerAuthTypeDiv = document.getElementById("partnerAuthTypeDiv");
                    const partnerGroupDiv = document.getElementById("partnerGroupDiv");

                    const partnerAuthType = document.getElementById("user.attributes.partnerAuthType");
                    const partnerGroup = document.getElementById("user.attributes.partnerGroup");

                function togglePartnerFields() {

                    if (partnerType.value === "AUTH_PARTNER") {
                        partnerAuthTypeDiv.style.display = "";
                        partnerGroupDiv.style.display = "";
                        partnerAuthType.disabled = false;
                        partnerGroup.disabled = false;
                    } else {
                        partnerAuthTypeDiv.style.display = "none";
                        partnerGroupDiv.style.display = "none";
                        partnerAuthType.value = "";
                        partnerGroup.value = "";
                        partnerAuthType.disabled = true;
                        partnerGroup.disabled = true;
                    }
                }

                togglePartnerFields();
                partnerType.addEventListener("change", togglePartnerFields);

                });
                </script>
            </form>
        </div>
    </#if>
</@layout.registrationLayout>
