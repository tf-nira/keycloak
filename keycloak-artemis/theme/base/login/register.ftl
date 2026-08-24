<#import "template.ftl" as layout>
<@layout.registrationLayout; section>
    <#if section = "header">
        ${msg("registerTitle")}
    <#elseif section = "form">

        <style>
            /* ==========================================================
               Everything below is scoped to the Partner Registration
               page only (this <style> tag only renders when register.ftl
               is rendered). Selectors that reuse the shared theme's ids/
               classes (#kc-header, .card-pf, .login-pf-header, etc.) are
               marked !important so they win regardless of what login.css
               currently contains — but because this block only exists on
               this page, the login page / other Keycloak flows that don't
               include this template are completely unaffected.
               New elements introduced by this page all use a "kc-pms-"
               prefix so they never collide with the shared theme classes.
               ========================================================== */

            html, body {
                margin: 0 !important;
                padding: 0 !important;
            }

            /* Hide the shared "MOSIP" wordmark header */
            #kc-header {
                display: none !important;
            }

            /* Hide the shared "Register" page title */
            .login-pf-header {
                display: none !important;
            }

            /* Un-cap the shared card container so this page fills the screen,
               regardless of the max-width currently set in login.css */
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

            /* ---- Partner Registration page-specific layout ---- */

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

            /* Hide the theme's default duplicate "Back to Login" link;
               we render our own styled one in .kc-pms-actions below */
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
                                <input type="text" id="firstName" class="${properties.kcInputClass!}" name="firstName" value="${(register.formData.firstName!'')}" />
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('lastName',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="lastName" class="${properties.kcLabelClass!}">${msg("lastName")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="lastName" class="${properties.kcInputClass!}" name="lastName" value="${(register.formData.lastName!'')}" />
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
                                    value="${(register.formData['user.attributes.langCode']!'')}">
                                        <option value="eng" selected>English</option>
                                </select>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('organizationName',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="organizationName" class="${properties.kcLabelClass!}">${msg("organizationName")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="organizationName" class="${properties.kcInputClass!}" name="user.attributes.organizationName" value="${(register.formData['user.attributes.organizationName']!'')}" autocomplete="organizationName" />
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('email',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="email" class="${properties.kcLabelClass!}">${msg("email")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="email" class="${properties.kcInputClass!}" name="email" value="${(register.formData.email!'')}" autocomplete="email" />
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('phoneNumber',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="phoneNumber" class="${properties.kcLabelClass!}">${msg("phoneNumber")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="phoneNumber" class="${properties.kcInputClass!}" name="user.attributes.phoneNumber" value="${(register.formData['user.attributes.phoneNumber']!'')}" autocomplete="phoneNumber" />
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('address',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="address" class="${properties.kcLabelClass!}">${msg("address")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="text" id="address" class="${properties.kcInputClass!}" name="user.attributes.address" value="${(register.formData['user.attributes.address']!'')}" autocomplete="address" />
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
                                    value="${(register.formData['user.attributes.partnerType']!)}">
                                        <option value=""></option>
                                        <option value="DEVICE_PROVIDER">Device Provider</option>
                                        <option value="FTM_PROVIDER">FTM Provider</option>
                                        <option value="AUTH_PARTNER">Authentication Partner</option>
                                        <option value="CREDENTIAL_PARTNER">Credential Partner or ISP</option>
                                        <option value="ABIS_PARTNER">ABIS Partner</option>
                                        <option value="SDK_PARTNER">SDK Partner</option>
                                </select>
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
                                    value="${(register.formData['user.attributes.partnerAuthType']!)}">
                                        <option value=""></option>
                                        <option value="ACCESS">ACCESS</option>
                                        <option value="VERIFY">VERIFY</option>
                                </select>
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
                                    value="${(register.formData['user.attributes.partnerGroup']!)}">
                                        <option value=""></option>
                                        <option value="GOV">GOV</option>
                                        <option value="PRIVATE">PRIVATE</option>
                                        <option value="FOREIGN">FOREIGN</option>
                                </select>
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
                                <input type="text" id="username" class="${properties.kcInputClass!}" name="username" value="${(register.formData.username!'')}" autocomplete="username" />
                            </div>
                        </div>
                      </#if>

                        <#if passwordRequired??>
                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password" class="${properties.kcLabelClass!}">${msg("password")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password" class="${properties.kcInputClass!}" name="password" autocomplete="new-password"/>
                            </div>
                        </div>

                        <div class="${properties.kcFormGroupClass!} ${messagesPerField.printIfExists('password-confirm',properties.kcFormGroupErrorClass!)}">
                            <div class="${properties.kcLabelWrapperClass!}">
                                <label for="password-confirm" class="${properties.kcLabelClass!}">${msg("passwordConfirm")}</label>
                            </div>
                            <div class="${properties.kcInputWrapperClass!}">
                                <input type="password" id="password-confirm" class="${properties.kcInputClass!}" name="password-confirm" />
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
