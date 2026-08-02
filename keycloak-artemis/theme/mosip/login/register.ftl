<#import "template.ftl" as layout>
    <@layout.registrationLayout; section>

        <#if section="header">
            <div class="page-container">
                <div class="main-title">Partner Registration</div>
            </div>

            <#elseif section="form">

                <div class="register-page">

                    <div class="page-container">

                        <form id="kc-register-form" action="${url.registrationAction}" method="post">

                            <style>
                                .register-page .card-pf {
                                    max-width: 1400px !important;
                                    width: 100% !important;
                                }

                                .register-page #kc-content-wrapper {
                                    max-width: 100% !important;
                                }

                                .register-page #kc-content {
                                    width: 100% !important;
                                }

                                /* YOUR CONTAINER */
                                .register-page .page-container {
                                    max-width: 1400px;
                                    margin: 0 auto;
                                    padding: 20px;
                                }

                                .button-container {
                                    display: flex;
                                    justify-content: space-between;
                                    /* LEFT + RIGHT */
                                    align-items: center;
                                    margin-top: 20px;
                                }

                                .left-btn a {
                                    text-decoration: none;
                                    color: #0066cc;
                                    font-weight: 500;
                                }

                                .right-btn input {
                                    min-width: 150px;
                                }

                                .main-title {
                                    font-size: 24px;
                                    font-weight: 700;
                                    margin-bottom: 25px;
                                    color: #2c3e50;
                                }

                                .section-box {
                                    border: 2px solid #dcdcdc;
                                    border-radius: 10px;
                                    padding: 20px;
                                    margin-bottom: 25px;
                                    background: #fafafa;
                                }

                                /* SECTION TITLE */
                                .section-title {
                                    font-size: 16px;
                                    font-weight: 600;
                                    margin-bottom: 15px;
                                    color: #2c3e50;
                                }

                                /* ROW */
                                .form-row {
                                    display: flex;
                                    gap: 20px;
                                    margin-bottom: 15px;
                                }

                                /* COLUMN */
                                .form-col {
                                    flex: 1;
                                    display: flex;
                                    flex-direction: column;
                                }

                                /* INPUT */
                                .form-col input,
                                .form-col select {
                                    width: 100%;
                                    padding: 6px;
                                }

                                /* HIDE WITHOUT BREAKING LAYOUT */
                                .hidden {
                                    visibility: hidden;
                                }
                            </style>

                            <!-- ================= PERSONAL INFO ================= -->
                            <div class="section-box">
                                <div class="section-title">Personal Information</div>

                                <div class="form-row">
                                    <div class="form-col">
                                        <label>${msg("firstName")}</label>
                                        <input type="text" name="firstName"
                                            value="${(register.formData.firstName!'')}" />
                                    </div>

                                    <div class="form-col">
                                        <label>${msg("lastName")}</label>
                                        <input type="text" name="lastName" value="${(register.formData.lastName!'')}" />
                                    </div>

                                    <div class="form-col"></div>
                                </div>
                            </div>

                            <!-- ================= ORGANIZATION INFO ================= -->
                            <div class="section-box">
                                <div class="section-title">Organization Information</div>

                                <div class="form-row">

                                    <div class="form-col">
                                        <label>${msg("organizationName")}</label>
                                        <input type="text" name="user.attributes.organizationName"
                                            value="${(register.formData['user.attributes.organizationName']!'')}" />
                                    </div>

                                    <div class="form-col">
                                        <label>${msg("partnerType")}</label>
                                        <select id="user.attributes.partnerType" name="user.attributes.partnerType">
                                            <option value=""></option>
                                            <option value="DEVICE_PROVIDER">Device Provider</option>
                                            <option value="FTM_PROVIDER">FTM Provider</option>
                                            <option value="AUTH_PARTNER">Authentication Partner</option>
                                            <option value="CREDENTIAL_PARTNER">Credential Partner</option>
                                            <option value="ABIS_PARTNER">ABIS Partner</option>
                                            <option value="SDK_PARTNER">SDK Partner</option>
                                        </select>
                                    </div>

                                    <div id="partnerAuthTypeDiv" class="form-col">
                                        <label>Partner Auth Type</label>
                                        <select id="user.attributes.partnerAuthType"
                                            name="user.attributes.partnerAuthType">
                                            <option value=""></option>
                                            <option value="ACCESS">ACCESS</option>
                                            <option value="VERIFY">VERIFY</option>
                                        </select>
                                    </div>

                                </div>

                                <!-- SAME ROW CONTINUATION -->
                                <div class="form-row">

                                    <div id="partnerGroupDiv" class="form-col">
                                        <label>Partner Group</label>
                                        <select id="user.attributes.partnerGroup" name="user.attributes.partnerGroup">
                                            <option value=""></option>
                                            <option value="GOV">GOV</option>
                                            <option value="PRIVATE">PRIVATE</option>
                                            <option value="FOREIGN">FOREIGN</option>
                                        </select>
                                    </div>

                                    <div class="form-col"></div>
                                    <div class="form-col"></div>

                                </div>

                            </div>

                            <!-- ================= CONTACT INFO ================= -->
                            <div class="section-box">
                                <div class="section-title">Contact Information</div>

                                <div class="form-row">

                                    <div class="form-col">
                                        <label>${msg("address")}</label>
                                        <input type="text" name="user.attributes.address"
                                            value="${(register.formData['user.attributes.address']!'')}" />
                                    </div>

                                    <div class="form-col">
                                        <label>${msg("email")}</label>
                                        <input type="text" name="email" value="${(register.formData.email!'')}" />
                                    </div>

                                    <div class="form-col">
                                        <label>${msg("phoneNumber")}</label>
                                        <input type="text" name="user.attributes.phoneNumber"
                                            value="${(register.formData['user.attributes.phoneNumber']!'')}" />
                                    </div>

                                </div>

                            </div>

                            <!-- ================= ACCOUNT SETUP ================= -->
                            <div class="section-box">
                                <div class="section-title">Account Setup</div>

                                <div class="form-row">

                                    <div class="form-col">
                                        <label>Language</label>
                                        <select name="user.attributes.langCode">
                                            <option value="eng">English</option>
                                        </select>
                                    </div>

                                    <div class="form-col">
                                        <label>${msg("username")}</label>
                                        <input type="text" name="username" value="${(register.formData.username!'')}" />
                                    </div>

                                    <div class="form-col"></div>

                                </div>

                                <div class="form-row">

                                    <div class="form-col">
                                        <label>${msg("password")}</label>
                                        <input type="password" name="password" />
                                    </div>

                                    <div class="form-col">
                                        <label>${msg("passwordConfirm")}</label>
                                        <input type="password" name="password-confirm" />
                                    </div>

                                    <div class="form-col"></div>

                                </div>

                            </div>

                            <#if recaptchaRequired??>
                                <div class="form-group">
                                    <div class="${properties.kcInputWrapperClass!}">
                                        <div class="g-recaptcha" data-size="compact" data-sitekey="${recaptchaSiteKey}">
                                        </div>
                                    </div>
                                </div>
                            </#if>

                            <div class="button-container">

                                <!-- LEFT -->
                                <div class="left-btn">
                                    <a href="${url.loginUrl}">
                                        ${kcSanitize(msg("backToLogin"))?no_esc}
                                    </a>
                                </div>

                                <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                                    <input
                                        class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}"
                                        type="submit" value="${msg(" doRegister")}" />
                                </div>

                            </div>

                        </form>
                    </div>
                </div>

                <script>
                    document.addEventListener("DOMContentLoaded", function () {

                        const partnerType = document.getElementById("user.attributes.partnerType");
                        const partnerAuthTypeDiv = document.getElementById("partnerAuthTypeDiv");
                        const partnerGroupDiv = document.getElementById("partnerGroupDiv");

                        function togglePartnerFields() {
                            if (partnerType.value === "AUTH_PARTNER") {
                                partnerAuthTypeDiv.classList.remove("hidden");
                                partnerGroupDiv.classList.remove("hidden");
                            } else {
                                partnerAuthTypeDiv.classList.add("hidden");
                                partnerGroupDiv.classList.add("hidden");
                            }
                        }

                        togglePartnerFields();
                        partnerType.addEventListener("change", togglePartnerFields);
                    });
                </script>

        </#if>
        </@layout.registrationLayout>
