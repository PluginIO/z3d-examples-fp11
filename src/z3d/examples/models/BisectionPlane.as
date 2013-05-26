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
			_vertexString = "mov vt0.w, vc12.x \n" +
							"mov vt0, va0 \n" +
							
							// for bone 1
							"m44 vt1, va0, vc[va3.x] \n" +
							"mul vt1.xyz, vt1.xyz, va2.xxx \n" +
							"add vt0.xyz, vt0.xyz, vt1.xyz \n" +
							
							// for bone 2
							"m44 vt1, va0, vc[va3.y] \n" +
							"mul vt1.xyz, vt1.xyz, va2.yyy \n" +
							"add vt0.xyz, vt0.xyz, vt1.xyz \n" +
							
							// Output
							"m44 op, vt0, vc0 \n" +
							
							// Give fragment tex coords
							"mov v0, va1";
		}
		
		private function setFragmentString(): void
		{
			_fragmentString = "mov ft0, v0 \n" +
							  "tex ft1, ft0, fs0 <2d,clamp,linear,miplinear> \n" +
							  "mov oc, ft1";
		}
		
		private function setVertexBuffer(): void
		{
			_vertexBuffer = new ByteArray();
			_vertexBuffer.endian = Endian.LITTLE_ENDIAN;
			
			var geom: Array =
			[
				// section 1
				// x, y, z, 	u, v, 		w1, w2, 	bi1, bi2
				-1.0, -0.5, 0, 	0, 0,		0, 1,	4,	8,
				 0.0, -0.5, 0, 	1, 0,		0, 1,	4,	8,
				 0.0,  0.5, 0, 	1, 1,		0, 1,	4,	8,
				-1.0,  0.5, 0, 	0, 1,		0, 1,	4,	8,
				
				// section 2
				 0.0, -0.5, 0, 	0, 0,		0, 0,	4,	8,
				 1.0, -0.5, 0, 	1, 0,		0, 0,	4,	8,
				 1.0,  0.5, 0, 	1, 1,		0, 0,	4,	8,
				 0.0,  0.5, 0, 	0, 1, 		0, 0,	4,	8
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