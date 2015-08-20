#MuraCache Plugin
This is an alpha [Mura CMS](http://www.getmura.com) plugin that enables Mura to use native named caches in Adobe CF 9.0.1+, Railo, and Lucee. 

Requires Mura 5.4.4602 or greater.

##RAILO/LUCEE ONLY
In Railo and/or Lucee you will need to explicitly create two caches. One named "data" and another named "output" before installing the plugin.

Or, if you want each site to have it's own data and output cache you can create caches following the syntax for each site in your Mura instance:

```
{siteID}-data
{siteID}-output
```

So for the default site the cache names would look like this:

```
default-data
default-output
```