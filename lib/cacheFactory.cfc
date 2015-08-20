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
component extends="mura.Factory" output="false"
{
	
	public any function init() {
		if ( ListFindNoCase('Railo,Lucee',  server.coldfusion.productname) ) {
			variables.collection=new cache.cacheLucee(argumentCollection=arguments);
		} else {
			variables.collection=new cache.cacheAdobe(argumentCollection=arguments);
		}
		variables.map=variables.collection;
		return this;
	}
	
	public any function set(key,context,timespan=1,idleTime=1) {
		
		variables.collection.put( getHashKey( arguments.key ), arguments.context, arguments.timespan, arguments.idleTime );
			
	}
	
	public any function get(key,context,timespan=1,idleTime=1) {
		
		if ( !has( arguments.key ) && isDefined("arguments.context") ) {	
			set( arguments.key, arguments.context,arguments.timespan,arguments.idleTime );
		}

		if ( !has( arguments.key ) && hasParent() && getParent().has( arguments.key ) ) {
			return getParent().get( arguments.key );
		}

		if ( has( arguments.key ) ) {
			return variables.collection.get(getHashKey( arguments.key ));
		}

		if ( isDefined("arguments.context") ) {
			return arguments.context;
		} else {
			throw(message="Context not found for '#arguments.key#'");
		}
	}
	
	public any function purge(key) {
		variables.collection.purge(getHashKey( arguments.key ));	
	}
	
	public any function purgeAll() {
		variables.collection.purgeAll();	
	}
	
	public any function getAll() {
		return variables.collection.getAll();	
	}
	
	public any function has(key) {
		return variables.collection.has(getHashKey( arguments.key ) );	
	}
	
	public any function getCollection() {
		return variables.collection;	
	}
	
	
}
