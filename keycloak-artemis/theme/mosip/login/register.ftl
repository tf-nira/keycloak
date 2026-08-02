<#import "template.ftl" as layout>
<@layout.registrationLayout bodyClass="register-page"; section>

<#if section="header"> <div class="page-container"> <div class="main-title">Partner Registration System</div> </div>

<#elseif section="form">

<style>
/* FIX: Apply width to outer card only for registration */
.register-page .login-pf-page .card-pf {
    max-width: 1400px !important;
    width: 1400px !important;
}

/* Your layout styles */
.page-container {
    max-width: 1400px;
    margin: 0 auto;
    padding: 20px;
}

.button-container {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 20px;
}

.left-btn a {
    text-decoration: none;
    color: #0066cc;
    font-weight: 500;
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

.section-title {
    font-size: 16px;
    font-weight: 600;
    margin-bottom: 15px;
}

.form-row {
    display: flex;
    gap: 20px;
    margin-bottom: 15px;
}

.form-col {
    flex: 1;
    display: flex;
    flex-direction: column;
}

.form-col input,
.form-col select {
    width: 100%;
    padding: 6px;
}

.hidden {
    visibility: hidden;
}
</style>

<div class="page-container">

<form id="kc-register-form" action="${url.registrationAction}" method="post">

<!-- PERSONAL -->

<div class="section-box">
    <div class="section-title">Personal Information</div>

<div class="form-row">
    <div class="form-col">
        <label>${msg("firstName")}</label>
        <input type="text" name="firstName" value="${(register.formData.firstName!'')}" />
    </div>

    <div class="form-col">
        <label>${msg("lastName")}</label>
        <input type="text" name="lastName" value="${(register.formData.lastName!'')}" />
    </div>

    <div class="form-col"></div>
</div>

</div>

<!-- ORGANIZATION -->

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
        <select name="user.attributes.partnerAuthType">
            <option value=""></option>
            <option value="ACCESS">ACCESS</option>
            <option value="VERIFY">VERIFY</option>
        </select>
    </div>
</div>

<div class="form-row">
    <div id="partnerGroupDiv" class="form-col">
        <label>Partner Group</label>
        <select name="user.attributes.partnerGroup">
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

<!-- CONTACT -->

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

<!-- ACCOUNT -->

<div class="section-box">
    <div class="section-title">Account Setup</div>

<div class="form-row">
    <div class="form-col">
        <label>${msg("username")}</label>
        <input type="text" name="username" value="${(register.formData.username!'')}" />
    </div>

    <div class="form-col">
        <label>${msg("password")}</label>
        <input type="password" name="password" />
    </div>

    <div class="form-col">
        <label>${msg("passwordConfirm")}</label>
        <input type="password" name="password-confirm" />
    </div>
</div>

</div>

<div class="button-container">
    <div class="left-btn">
        <a href="${url.loginUrl}">${msg("backToLogin")}</a>
    </div>

    <div id="kc-form-buttons" class="${properties.kcFormButtonsClass!}">
                    <input class="${properties.kcButtonClass!} ${properties.kcButtonPrimaryClass!} ${properties.kcButtonBlockClass!} ${properties.kcButtonLargeClass!}" type="submit" value="${msg("doRegister")}"/>
                </div>

</div>

</form>
</div>

<script>
document.addEventListener("DOMContentLoaded", function () {
    const partnerType = document.getElementById("user.attributes.partnerType");
    const authDiv = document.getElementById("partnerAuthTypeDiv");
    const groupDiv = document.getElementById("partnerGroupDiv");

    function toggle() {
        if (partnerType.value === "AUTH_PARTNER") {
            authDiv.classList.remove("hidden");
            groupDiv.classList.remove("hidden");
        } else {
            authDiv.classList.add("hidden");
            groupDiv.classList.add("hidden");
        }
    }

    toggle();
    partnerType.addEventListener("change", toggle);
});
</script>

</#if>
[/@layout.registrationLayout](mailto:/@layout.registrationLayout)
