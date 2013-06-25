package  
{
	/**
	 * ...
	 * @author Brad Coker
	 */
	public class DoubleJump extends Powerup
	{
		
		[Embed( source = '../assets/powerup.png' )] private var powerupPNG:Class;
		
		public function DoubleJump( X:Number, Y:Number ) 
		{
			super( X, Y, 0 );
			
			//Load powerup sprite
			loadGraphic( powerupPNG, true, true, 15, 15, true );
			
			//Add animation
			addAnimation( "float", [0, 3, 4, 3, 0, 1, 2, 1], 5, true );
			addAnimation( "obtained", [4], 0, false );
			play( "float" );
		}
		
	}

}