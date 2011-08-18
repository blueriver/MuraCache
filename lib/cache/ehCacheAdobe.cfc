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
		return cacheGet(arguments.key,variables.cacheName);	
	}
	
	public any function getAll(){
		return CacheGetAllIds(variables.cacheName);
	}
	
	public any function put(key,value,timespan=0,idleTime=0){
		
		if(arguments.timespan eq ""){
			arguments.timespan=0;
		}
		
		if(arguments.idleTime eq ""){
			arguments.idleTime=0;
		}
			
		cachePut(arguments.key, 
			arguments.value, 
			arguments.timespan, 
			arguments.idleTime, 
			variables.cacheName);
	}
	
	public any function has(key){
		return !isNull(cacheGet(key,variables.cacheName));
	}
	
	public any function purge(key){
		cacheRemove(arguments.key,false,variables.cacheName);
	}
	
	public any function purgeAll(){
		cacheGetSession(variables.cacheName, true).removeAll();

	}
	
	public any function size(){
		return arrayLen(CacheGetAllIds(variables.cacheName));
	}
	
}