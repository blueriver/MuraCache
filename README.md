#MuraCache Plugin
This is an alpha [Mura CMS](http://www.getmura.com) plugin that enables Mura to use native named caches in both Adobe CF 9.0.1+ and [Lucee](http://lucee.org). 

Requires Mura 5.4.4602+.

##Instance Name
It may be that you have multiple instances of Mura on a server which share SiteIDs - for example, you may have more than one multi-lingual website, each of which has SiteIDs of "en" and "de".

Normally, caches for these sites would clash as they would have the same name; however, if you go into the plugin settings you can optionally assign a name to each instance, allowing each site's cache to be properly segregated.

##Lucee Only
In Lucee you will need to explicitly create two caches. One named **data** and another named **output** before installing the plugin.

Or, if you want each site to have it's own data and output cache you can create caches following the syntax for each site in your Mura instance:

  ```
  {SiteID}-data
  {SiteID}-output
  ```

So for the **default** site, the cache names would look like this:

  ```
  default-data
  default-output
  ```

If you have specified an instance name in the plugin options, the cache name syntax would be:

  ```
  {InstanceName}-{SiteID}-data
  {InstanceName}-{SiteID}-output
  ```

So for the **default** site on an instance named "myInstance", the cache names would look like this:

  ```
  myInstance-default-data
  myInstance-default-output
  ```
