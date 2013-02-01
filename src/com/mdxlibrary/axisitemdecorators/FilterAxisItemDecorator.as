package com.mdxlibrary.axisitemdecorators
{
	import com.mdxlibrary.interfaces.IMDXAxisItem;

	/**
	 * 
	 * Decorator for filter item.
	 * 
	 */
	public class FilterAxisItemDecorator extends AbstractMDXAxisItemDecorator
	{
		//--------------------------------
		//
		// Variabels
		//
		//--------------------------------
		/**
		 * String comparator
		 * @example
		 * <code>[Measures].[D7RRRWELMB061LZKKAFEK1KLBD80PYZV1XEFTRHXFZ9YSB9U3H] > 0</code>
		 */
		public var compartor:String;
		//--------------------------------
		//
		// Constructor
		//
		//--------------------------------
		public function FilterAxisItemDecorator(item:IMDXAxisItem) {
			super(item);
		}
		
		//-----------------------------
		//
		// Public methods
		//
		//-----------------------------
		/**
		 * @inheritDoc
		 */
		override public function generate():String {
			var s:String = super.generate();
			
			return  "FILTER(" + s + ", " + this.compartor + ")";
		}
	}
}