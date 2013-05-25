package z3d.models 
{
	import flash.utils.ByteArray;
	import flash.utils.Endian;
	import z3d.geometry.TriMesh;
	
	/**
	 * ...
	 * @author Gary Paluk - http://www.plugin.io
	 */
	public class CrateModel extends TriMesh 
	{
		
		[Embed(source="../../../lib/atf/crate.atf", mimeType="application/octet-stream")]
		private const ATFTexture: Class;
		
		public function CrateModel() 
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
				//front
				0.5, -0.5, -0.5, 	0, 0,
				0.5,  0.5, -0.5, 	1, 0,
			   -0.5,  0.5, -0.5, 	1, 1,
			   -0.5, -0.5, -0.5, 	0, 1,
				//back
				0.5, -0.5, 0.5, 	0, 0,
				0.5,  0.5, 0.5, 	1, 0,
			   -0.5,  0.5, 0.5, 	1, 1,
			   -0.5, -0.5, 0.5, 	0, 1,
			   //right
				0.5, -0.5, -0.5, 	0, 0,
				0.5,  0.5, -0.5, 	1, 0,
				0.5,  0.5,  0.5, 	1, 1,
				0.5, -0.5,  0.5, 	0, 1,
			   //left
			   -0.5, -0.5,  0.5, 	0, 0,
			   -0.5,  0.5,  0.5, 	1, 0,
			   -0.5,  0.5, -0.5, 	1, 1,
			   -0.5, -0.5, -0.5, 	0, 1
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
			
			
			// triangle 5
			_indexBuffer.writeShort( 8 );
			_indexBuffer.writeShort( 9 );
			_indexBuffer.writeShort( 10 );
			
			// triangle 6
			_indexBuffer.writeShort( 8 );
			_indexBuffer.writeShort( 10 );
			_indexBuffer.writeShort( 11 );
			
			// triangle 7
			_indexBuffer.writeShort( 12 );
			_indexBuffer.writeShort( 13 );
			_indexBuffer.writeShort( 14 );
			
			// triangle 8
			_indexBuffer.writeShort( 12 );
			_indexBuffer.writeShort( 14 );
			_indexBuffer.writeShort( 15 );
		}
		
	}

}