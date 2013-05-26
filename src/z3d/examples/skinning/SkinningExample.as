package z3d.examples.skinning 
{
	import flash.events.Event;
	import z3d.examples.ExampleBase;
	import z3d.examples.models.BisectionPlane;
	import z3d.examples.models.CrateModel;
	import z3d.scenegraph.Node;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class SkinningExample extends ExampleBase
	{
		
		public function SkinningExample()
		{
		}
		
		override protected function onInitialize():void 
		{
			var bisectionPlane: BisectionPlane
			
			for ( var i: int = 0; i < 20; ++i )
			{
				bisectionPlane = new BisectionPlane();
				bisectionPlane.localTransform.appendTranslation( (Math.random() * 50 ) - 25, 0, (Math.random() * 50 ) - 25 );
				_scene.addChild( bisectionPlane );
			
				_renderer.addRenderable( bisectionPlane );
			}
			
		}
	}

}