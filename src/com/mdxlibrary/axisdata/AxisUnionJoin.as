package com.mdxlibrary.axisdata
{
	import com.mdxlibrary.interfaces.IAxisDataItem;
	import com.mdxlibrary.interfaces.IMDXAxisItem;
	
	public class AxisUnionJoin implements IAxisDataItem
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
		public function AxisUnionJoin()
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
				return "Union( " + this._values.join(", ") + " )";
			}
			return "";
		}
	}
}