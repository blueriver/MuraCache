/*Copyright 2011 Blue River Interactive

   Licensed under the Apache License, Version 2.0 (the "License");
   you may not use this file except in compliance with the License.
   You may obtain a copy of the License at

       http://www.apache.org/licenses/LICENSE-2.0

   Unless required by applicable law or agreed to in writing, software
   distributed under the License is distributed on an "AS IS" BASIS,
   WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
   See the License for the specific language governing permissions and
*/
component  extends="mura.Factory" output="false"
{
	
	public any function init(){
		if (server.coldfusion.productname eq "Railo"){
			variables.collection=new cache.ehCacheRailo(argumentCollection=arguments);
		} else {
			variables.collection=new cache.ehCacheAdobe(argumentCollection=arguments);
		}
		variables.map=variables.collection;
		variables.isSoft=false;
		return this;
	}
	
	public any function put(key,obj,isSoft=variables.isSoft,timespan=""){
		var softRef = "";
		var hashedKey = getHashKey( arguments.key );
		var cacheData={};
		var expires=0;
		
		if(isDate(arguments.timespan)){
			cacheData.expires=now() + arguments.timespan;
			expires=cacheData.expires;
		} else {
			cacheData.expires=dateAdd("d",1,now());
		}
		
		//check to see if this should be a soft reference
		if(arguments.isSoft){
			//create the soft reference
			cacheData.object = createObject( "java", "java.lang.ref.SoftReference" ).init( arguments.obj );
		} else {
			//assign object to main collection
			cacheData.object =arguments.obj;
		}
		
		//assign object to main collection
		variables.collection.put( hashedKey, cacheData, expires, 0 );
			
	}
	
	public any function get(key,context,isSoft=variables.isSoft,timespan=""){
	
		
		//if the key cannot be found and context is passed then push it in
		if(NOT has( arguments.key ) AND isDefined("arguments.context")){		
			set( key, arguments.context, arguments.isSoft, arguments.timespan );
		}
		
		//if the key cannot be found then throw an error
		if(NOT has( arguments.key )){
			throw(message="Context not found for '#arguments.key#'");
		}

		//return cached context		
		return super.get( key );
	}
	
	public any function purge(key){
		variables.collection.purge(getHashKey( arguments.key ));	
	}
	
	public any function purgeAll(){
		variables.collection.purgeAll();	
	}
	
	public any function getAll(){
		return variables.collection.getAll();	
	}
	
	public any function keyExists(key){
		return variables.collection.has( arguments.key );	
	}
	
	public any function getCollection(){
		return variables.collection;	
	}
	
	
}