package com.mdxlibrary.axisdata
{
	import com.mdxlibrary.interfaces.IAxisDataItem;
	import com.mdxlibrary.interfaces.IMDXAxisItem;
	
	public class AxisCrossJoin implements IAxisDataItem
	{
		//---------------------------
		// Variables
		//---------------------------
		private var _values:Vector.<String>;
		
		//---------------------------
		// Constructor
		//---------------------------
		/**
		 * Constructor
		 */
		public function AxisCrossJoin()
		{
			this._values = new Vector.<String>();
		}
		
		//---------------------------
		// Public methods
		//---------------------------
		/**
		 * @inheritDoc
		 */
		public function addAxisItem(value:IMDXAxisItem):void {
			if ( value != null ) {
				this.add(value.generate());
			}
		}
		
		/**
		 * @inheritDoc
		 */
		public function add(value:String):void
		{
			if ( value == null || value == "" ) {
				return;
			}
			this._values.push(value);
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():String
		{
			if ( this._values.length > 1 ) {
				return "CrossJoin( " + this._values.join(", ") + " )";
			}
			return "";
		}
	}
}