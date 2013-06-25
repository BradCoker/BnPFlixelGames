package  
{
	/**
	 * ...
	 * @author Brad Coker
	 */
	public class HighJump extends Powerup
	{
		
		[Embed( source = '../assets/powerup2.png' )] private var powerupPNG:Class;
		
		public function HighJump( X:Number, Y:Number ) 
		{
			super( X, Y, 1 );
			
			//Load powerup sprite
			loadGraphic( powerupPNG, true, true, 15, 15, true );
			
			//Add animation
			addAnimation( "float", [0, 3, 4, 3, 0, 1, 2, 1], 5, true );
			addAnimation( "obtained", [4], 0, false );
			play( "float" );
		}
		
	}

}