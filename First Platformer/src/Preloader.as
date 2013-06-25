package 
{
	import flash.display.DisplayObject;
	import flash.display.MovieClip;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.IOErrorEvent;
	import flash.events.ProgressEvent;
	import flash.events.TextEvent;
	import flash.text.TextField;
	import flash.utils.getDefinitionByName;
	import org.flixel.FlxG;
	import org.flixel.FlxText;
	
	import MenuState;
	
	/**
	 * ...
	 * @author Brad Coker
	 */
	public class Preloader extends MovieClip 
	{
		private var progressText:TextField = null;
		private var title:TextField = null;
		private var stopped:Boolean = false;
		
		public function Preloader() 
		{
			if (stage) {
				stage.scaleMode = StageScaleMode.NO_SCALE;
				stage.align = StageAlign.TOP_LEFT;
			}
			//Add progress text
			progressText = new TextField();
			progressText.x = 100;
			progressText.y = 100;
			addChild( progressText );
			
			//Add extra stuff
			title = new TextField();
			title.text = "Game Title";
			title.x = 0;
			title.y = 16;
			addChild( title );
			
			addEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.addEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.addEventListener(Event.COMPLETE, loadingFinished);
			loaderInfo.addEventListener(IOErrorEvent.IO_ERROR, ioError);
			
			// TODO show loader
			trace("Created!");
		}
		
		private function ioError(e:IOErrorEvent):void 
		{
			trace(e.text);
		}
		
		private function progress(e:ProgressEvent):void 
		{
			// TODO update loader
			progressText.text = String( Math.floor( (e.bytesLoaded / e.bytesTotal) * 100 ) );
			trace("Updating progress");
		}
		
		private function checkFrame(e:Event):void 
		{
			trace("Checking frame");
			if (currentFrame == totalFrames) 
			{
				if( !stopped )
				{
					trace("Stopped movie clip");
					stopped = true;
					stop();
				}
			}
		}
		
		private function loadingFinished(e:Event):void 
		{
			trace("Loading done!");
			//Remove event listeners
			removeEventListener(Event.ENTER_FRAME, checkFrame);
			loaderInfo.removeEventListener(ProgressEvent.PROGRESS, progress);
			loaderInfo.removeEventListener(IOErrorEvent.IO_ERROR, ioError);
			loaderInfo.removeEventListener(Event.COMPLETE, loadingFinished);
			
			// TODO hide loader
			startup();
		}
		
		private function startup():void 
		{
			var mainClass:Class = getDefinitionByName("Main") as Class;
			addChild( (new mainClass()) as DisplayObject);
		}
		
	}
	
}