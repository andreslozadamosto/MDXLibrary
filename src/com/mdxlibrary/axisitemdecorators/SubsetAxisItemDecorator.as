package com.mdxlibrary.axisitemdecorators
{
	import com.mdxlibrary.interfaces.IMDXAxisItem;
	
	public class SubsetAxisItemDecorator extends AbstractMDXAxisItemDecorator
	{
		//--------------------------------
		// Variables
		//--------------------------------
		/**
		 * Minimun value of subset.
		 * @default 0
		 */
		public var minValue:Number = 0;
		/**
		 * Maximun value of subset.
		 * @default 9999999
		 */
		public var maxValue:Number = 9999999;
		
		//--------------------------------
		// Constructor
		//--------------------------------
		/**
		 * Constructor
		 */
		public function SubsetAxisItemDecorator(axisItem:IMDXAxisItem)
		{
			super(axisItem);
		}
		
		//-----------------------------
		// Public methods
		//-----------------------------
		/**
		 * @inheritDoc
		 */
		override public function generate():String {
			var s:String = super.generate();
			var min:String = (isNaN(minValue) || minValue < 0)?"0": minValue.toString();
			var max:String = (isNaN(maxValue))?"9999999":maxValue.toString();
			
			return "SUBSET ( " + s + ", "+min+", "+max+" )";
		}
	}
}