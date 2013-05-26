package z3d.examples.models 
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import z3d.geometry.TriMesh;
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class BisectionPlane extends TriMesh
	{
		
		[Embed(source="../atf/crate.atf", mimeType="application/octet-stream")]
		private const ATFTexture: Class;
		
		public function BisectionPlane() 
		{
			setTexture();
			setVertexString();
			setFragmentString();
			setVertexBuffer();
			setIndexBuffer();
			
			initResources();
		}
		
		private function setTexture(): void
		{
			_texture = new ATFTexture();
		}
		
		private function setVertexString(): void
		{
			_vertexString = "m44 op, va0, vc0 \n" +
							"mov v0, va1";
		}
		
		private function setFragmentString(): void
		{
			_fragmentString = "mov ft0, v0 \n" +
							  "tex ft1, ft0, fs1 <2d,clamp,linear,miplinear> \n" +
							  "mov oc, ft1";
		}
		
		private function setVertexBuffer(): void
		{
			_vertexBuffer = new ByteArray();
			_vertexBuffer.endian = Endian.LITTLE_ENDIAN;
			
			var geom: Array =
			[  
				// section 1
				// x, y, z, 	u, v, 		
				-1.0, -0.5, 0, 	0, 0,
				 0.0, -0.5, 0, 	1, 0,
			     0.0,  0.5, 0, 	1, 1,
			    -1.0,  0.5, 0, 	0, 1,
			   
			    // section 2
			     0.0, -0.5, 0, 	0, 0,
				 1.0, -0.5, 0, 	1, 0,
			     1.0,  0.5, 0, 	1, 1,
			     0.0,  0.5, 0, 	0, 1
			];
			
			for each( var val: Number in geom )
			{
				_vertexBuffer.writeFloat( val );
			}
		}
		
		private function setIndexBuffer(): void
		{
			_indexBuffer = new ByteArray();
			_indexBuffer.endian = Endian.LITTLE_ENDIAN;
			
			// triangle 1
			_indexBuffer.writeShort( 0 );
			_indexBuffer.writeShort( 1 );
			_indexBuffer.writeShort( 2 );
			
			// triangle 2
			_indexBuffer.writeShort( 0 );
			_indexBuffer.writeShort( 2 );
			_indexBuffer.writeShort( 3 );
			
			// triangle 3
			_indexBuffer.writeShort( 4 );
			_indexBuffer.writeShort( 5 );
			_indexBuffer.writeShort( 6 );
			
			// triangle 4
			_indexBuffer.writeShort( 4 );
			_indexBuffer.writeShort( 6 );
			_indexBuffer.writeShort( 7 );
			
		}
		
	}

}