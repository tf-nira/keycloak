<#import "template.ftl" as layout>
<@layout.registrationLayout displayMessage=false; section>
<div <#if locale?exists && locale.currentLanguageTag == "eng">dir="ltr"</#if>>
    <#if section = "header">
        ${msg("errorTitle")}
    <#elseif section = "form">
        <div id="kc-error-message">
            <p class="instruction">${kcSanitize(msg("expiredActionTokenNoSessionMessage"))?no_esc}</p>
        </div>
    </#if>
</div>
</@layout.registrationLayout>