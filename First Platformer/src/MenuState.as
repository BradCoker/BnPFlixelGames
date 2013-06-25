package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Brad Coker
	 */
	public class MenuState extends FlxState
	{
		
		public function MenuState() 
		{
			super( );
			var text:FlxText = new FlxText( 20, 20, 100, "Press Space to begin" );
			text.setFormat( null, 7, 0xFFFFFF, "center", 0 );
			add( text );
		}
		
		override public function update():void
		{
			if ( FlxG.keys.justPressed( "SPACE" ) )
			{
				FlxG.switchState( new PlayState );
			}
		}
		
	}

}