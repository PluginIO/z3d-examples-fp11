package z3d.examples 
{
	import flash.display.Sprite;
	import flash.display.Stage3D;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.utils.getTimer;
	import z3d.context.Context3DContext;
	import z3d.context.StageContext;
	import z3d.controllers.CameraController;
	import z3d.renderer.Renderer;
	import z3d.scenegraph.Camera;
	import z3d.scenegraph.CameraNode;
	import z3d.scenegraph.Node;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class ExampleBase extends Sprite
	{
		
		protected var _scene: Node;
		protected var _lastTime: int;
		protected var _renderer: Renderer;
		
		public function ExampleBase() 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			// entry point
			
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			
			StageContext.context = stage;
			
			stage.stage3Ds[0].addEventListener(Event.CONTEXT3D_CREATE, onContext3DCreate );
			stage.stage3Ds[0].requestContext3D();
			
		}
		
		protected function onInitialize(): void
		{
			
		}
		
		protected function onContext3DCreate( e: Event ): void
		{
			stage.stage3Ds[0].removeEventListener(Event.CONTEXT3D_CREATE, onContext3DCreate );
			
			var stage3D: Stage3D = e.target as Stage3D;
			Context3DContext.context = stage3D.context3D;
			
			var camera: Camera = new Camera();
			_renderer = new Renderer( camera );
			
			var cameraNode: CameraNode = new CameraNode( camera );
			cameraNode.addController( new CameraController() );
			
			_scene = new Node();
			_scene.addChild( cameraNode );
			
			onInitialize();
			
			addEventListener( Event.ENTER_FRAME, onEnterFrame );
		}
		
		protected function onEnterFrame( e: Event ): void
		{
			var dt: int = getTimer() - _lastTime;
			_lastTime = getTimer();
			
			_scene.update( dt );
			_renderer.render();
		}
		
	}

}