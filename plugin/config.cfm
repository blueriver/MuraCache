<cfsilent> 
<cfif not isDefined("pluginConfig")>
	<cfset package=listFirst(listGetat(getDirectoryFromPath(getCurrentTemplatePath()),listLen(getDirectoryFromPath(getCurrentTemplatePath()),application.configBean.getFileDelim())-1,application.configBean.getFileDelim()),"_")>
	<cfset pluginConfig=application.pluginManager.getConfig(package)>
	<cfset hasPluginConfig=false>
<cfelse>
	<cfset hasPluginConfig=true>
</cfif>

<cfif not hasPluginConfig and not isUserInRole('S2')>
    <cfif not structKeyExists(session,"siteID") or not application.permUtility.getModulePerm(pluginConfig.getValue('moduleID'),session.siteID)>
        <cflocation url="#application.configBean.getContext()#/admin/" addtoken="false">
    </cfif> 
</cfif>
<cfif not isDefined("$")>
	<cfset $=application.serviceFactory.getBean("muraScope").init(session.siteid)> 
</cfif>
</cfsilent>

