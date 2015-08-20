<!---
   Copyright 2011-2015 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
   limitations under the License.
--->
<cfinclude template="plugin/config.cfm" />
<cfsavecontent variable="body">
<cfoutput>
<h2>#variables.pluginConfig.getName()#</h2>
<p>This is an alpha <a href="http://www.getmura.com">Mura CMS</a> plugin that enables Mura to use native named caches in both Adobe CF 9.0.1+ and <a href="http://lucee.org">Lucee</a>.</p>

<p>Requires Mura 5.4.4602+.</p>

<h3>Lucee Only</h3>
<p>In Lucee you will need to explicitly create two caches. One named <strong>data</strong> and another named <strong>output</strong> before installing the plugin.</p>

<p>Or, if you want each site to have it's own data and output cache you can create caches following the syntax for each site in your Mura instance:</p>

<pre>
  {SiteID}-data
  {SiteID}-output
</pre>

<p>So for the <strong>default</strong> site, the cache names would look like this:</p>

<pre>
  default-data
  default-output
</pre>
</cfoutput>
</cfsavecontent>
<cfoutput>
#application.pluginManager.renderAdminTemplate(body=body,pageTitle=variables.pluginConfig.getName())#
</cfoutput>

