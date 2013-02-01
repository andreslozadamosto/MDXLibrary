package com.mdxlibrary.axisdata
{
	import com.mdxlibrary.interfaces.IAxisDataItem;
	import com.mdxlibrary.interfaces.IMDXAxisItem;

	public class AxisDataItem implements IAxisDataItem
	{
		//---------------------------
		// Variables
		//---------------------------
		private var _value:String;
		
		//---------------------------
		// Constructor
		//---------------------------
		/**
		 * Constructor
		 */
		public function AxisDataItem()
		{
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
		public function add(value:String):void {
			this._value = value;
		}
		
		/**
		 * @inheritDoc
		 */
		public function generate():String {
			return this._value;
		}
	}
}