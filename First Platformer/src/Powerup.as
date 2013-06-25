package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author Brad Coker
	 */
	public class Powerup extends FlxSprite
	{
		public var type:Number;
		
		public function Powerup( X:Number, Y:Number, Type:Number ) 
		{
			super( X, Y );
			type = Type;
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}