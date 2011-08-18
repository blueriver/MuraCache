component  extends="baseCache" output="false"
{
	property name="cacheName" 
		type="string" 
		getter="true" 
		setter="true" 
		default="data"
		hint="The name of the cache.";
	
	public any function init(){
		variables.cacheName=arguments.name;
		return this;	
	}
	
	public any function get(key){
		return cacheGet(id=arguments.key,throwWhenNotExist=true,cacheName=variables.cacheName);	
	}
	
	public any function getAll(){
		return cacheGetAll(filter="", cacheName=variables.cacheName);
	}
	
	public any function put(key,value,timespan=0,idleTime=0){
		
		if(arguments.timespan eq ""){
			arguments.timespan=0;
		}
		
		if(arguments.idleTime eq ""){
			arguments.idleTime=0;
		}
		
		cachePut(id=arguments.key, 
			value=arguments.value, 
			timespan=arguments.timespan, 
			idleTime=arguments.idleTime, 
			cacheName=variables.cacheName
		);
	}
	
	public any function has(key){
		return cacheKeyExists(key,variables.cacheName);
	}
	
	public any function purge(key){
		cacheRemove(ids=arguments.key,cacheName=variables.cacheName);
	}
	
	public any function purgeAll(){
		cacheClear("",variables.cacheName);
	}
	
	public any function size(){
		return cacheCount(variables.cacheName);
	}
	
}