/*
	Copyright 2011-2015 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
*/
component  extends="cacheBase" output="false"
{

	property name="cacheName" 
		type="string" 
		getter="true" 
		setter="true" 
		default="data"
		hint="The name of the cache.";
	
	public any function init(){
		variables.cacheName=arguments.siteID & "-" &arguments.name;

		if( Val(ListFirst(server.coldfusion.productversion)) >= 10 
			&& !cacheRegionExists(variables.cacheName) ) {
				cacheRegionNew(variables.cacheName);
		}

		return this;	
	}
	
	public any function get(key){
		return cacheGet(arguments.key,variables.cacheName);	
	}
	
	public any function getAll(){
		return CacheGetAllIds(variables.cacheName);
	}
	
	public any function put(key,value,timespan=1,idleTime=1){
		
		if(arguments.timespan eq ""){
			arguments.timespan=1;
		}
		
		if(arguments.idleTime eq ""){
			arguments.idleTime=1;
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
		var cache=cacheGetSession(variables.cacheName, true);
		
		if(!isNull(cache)){
			cache.removeAll();
		}

	}
	
	public any function size(){
		return arrayLen(CacheGetAllIds(variables.cacheName));
	}
	
}
