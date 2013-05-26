package z3d.examples.skinning.constants 
{
	import flash.geom.Matrix3D;
	import flash.geom.Vector3D;
	import flash.utils.getTimer;
	import z3d.geometry.TriMesh;
	import z3d.scenegraph.Camera;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class RotatingMatrixConstant 
	{
		protected var _mesh: TriMesh;
		protected var _camera: Camera;
		
		public function RotatingMatrixConstant( mesh: TriMesh, camera: Camera ) 
		{
			_mesh = mesh;
			_camera = camera;
		}
		
		public function get data(): Matrix3D
		{
			var m: Matrix3D = new Matrix3D();
			m.appendRotation( getTimer() * (Math.PI / 180), new Vector3D( 0, 1, 0 ) );
			
			return m;
		}
		
	}

}