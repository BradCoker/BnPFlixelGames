package  
{
	import org.flixel.*;
	
	/**
	 * ...
	 * @author Brad Coker
	 */
	[SWF( width = "640", height = "480", backgroundColor = "#00ffff" )]
	[Frame(factoryClass="Preloader")]
	public class FirstPlatformer extends FlxGame
	{
		
		public function FirstPlatformer() 
		{
			super( 320, 240, MenuState, 2 );
			forceDebugger = true;
		}
		
	}

}