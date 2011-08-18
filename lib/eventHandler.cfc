component  extends="mura.plugin.pluginGenericEventHandler" output="false"
{

	public void function onApplicationLoad($){
	  getBean("settingsManager").injectMethod("createCacheFactory",createCacheFactory);	
	}
	
	public any function createCacheFactory(){
		return new cacheFactory(argumentCollection=arguments); 
	}	
	


}